From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Fri, 13 Sep 2013 14:43:11 +0800
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <20130913054850.4e618f01@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <52322C4D.4060202@mind.be> <20130913054850.4e618f01@skate>
Message-ID: <CAEvN+1jveAKCG0d9fY_YKwhnpJ38PsObZ=ahKp8AFSc3jnhf0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout, and all,

It's been a while... Arnout has a good memory :-)
And yes we have been using similar approach since then.

Thomas's patch is comprehensive, and we'd like to switch to the official
one whenever possible.

On Fri, Sep 13, 2013 at 11:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 12 Sep 2013 23:04:13 +0200, Arnout Vandecappelle wrote:
>
>>   There is one small issue with this: I don't think that all the use
>> cases support relative paths. Ideally, the Makefile should be smart
>> enough to prepend $(TOPDIR) if it doesn't start with a /.
>
> So far the cases I've tested did support relative paths, but I agree
> that turning it into an absolute path within the Makefile is probably
> safer.

>> >   (2) To store external package or makefile logic, since the
>> >       BR2_EXTERNAL/external.mk file is automatically included by the
>> >       Makefile logic, and the BR2_EXTERNAL/Config.in file is
>> >       automatically included, and appears in the top-level menu. The
>> >       typical usage would be to create a BR2_EXTERNAL/package/
>> >       directory to contain package definitions.
>>
>>   I'm not really convinced by the principle. The external.mk is exactly
>> the same as the local override .mk; the Config.in appears at the very end
>> of the top-level menu. Instead, I think we should enforce the buildroot
>> hierarchy in the external dir, i.e.
>>
>> source <path-to-external-dir>/package/Config.in
>>
>> at the top of package/Config.in, and
>>
>> -include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
>>
>> in the top-level Makefile.
>
> This is what I had originally done, but it seemed to me that the
> external stuff may wish to add other Kconfig options than just
> packages. That said, I've done this BR2_EXTERNAL stuff mainly for
> packages, so if people think that we should restrict this to packages,
> I'm fine with that.
>

We do want to support the absolute paths for both Config.in and *.mk.

As a "buildroot overlay", we have similar structures in overlay/ like
the buildroot/,
such as configs, fs, packages, etc.

This requires the buildroot to support only only the *.mk and
Config.in in the top
level over overlay/, but also those in their sub directories.

The *.mk case may be get rid of with Arnount's suggestion.
But I'm wondering could we solve the Config.in case in a less trickier way?

The following is the approach I've been used locally.

The overlay/Makefile plays a trick, which allows us to work under overlay/ as we
work under buildroot/

Suppose we have the following configs,

  overlay/configs/foo_defconfig

Our build sequence will be:

  $ cd overlay
  $ make O=../output/foo foo_defconfig
  $ make O=../output/foo

With either Thomas's patch or our local patch, other targets supported by
buildroot, such as menuconfig, help, etc also works under overlay/ as they do
under buildroot/.

##### overlay/Makefile #######
EXTERNAL_OVERLAY       ?= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
export EXTERNAL_OVERLAY

BUILDROOT_TOP           = ../buildroot

all:
        ln -fs ../overlay $(BUILDROOT_TOP)
        make -C $(BUILDROOT_TOP)

%:
        ln -fs ../overlay $(BUILDROOT_TOP)
        make -C $(BUILDROOT_TOP) $(MAKECMDGOALS)

##### overlay/local.mk #######
-include overlay/package/*/*.mk
-include overlay/package/*/*/*.mk

-include overlay/cust/*/*.mk
-include overlay/cust/*/*/*.mk

-include overlay/linux/*.mk

###### overlay/Config.in ######
source "overlay/package/Config.in"
source "overlay/cust/Config.in"

###### overlay/package/Config.in ######
source "overlay/package/xxx/Config.in"


Thanks.

Roy
