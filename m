From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Fri, 13 Sep 2013 15:47:51 +0800
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <20130913091048.0423cf51@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <52322C4D.4060202@mind.be> <20130913054850.4e618f01@skate>
 <CAEvN+1jveAKCG0d9fY_YKwhnpJ38PsObZ=ahKp8AFSc3jnhf0Q@mail.gmail.com>
 <20130913091048.0423cf51@skate>
Message-ID: <CAEvN+1hsLucZZmfW=PPkKs_HGxOGP1tmeSphuG6hc_G7sLbG3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 13, 2013 at 3:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Tzu-Jung Lee,
>
> On Fri, 13 Sep 2013 14:43:11 +0800, Tzu-Jung Lee wrote:
>
>> >>   I'm not really convinced by the principle. The external.mk is exactly
>> >> the same as the local override .mk; the Config.in appears at the very end
>> >> of the top-level menu. Instead, I think we should enforce the buildroot
>> >> hierarchy in the external dir, i.e.
>> >>
>> >> source <path-to-external-dir>/package/Config.in
>> >>
>> >> at the top of package/Config.in, and
>> >>
>> >> -include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
>> >>
>> >> in the top-level Makefile.
>> >
>> > This is what I had originally done, but it seemed to me that the
>> > external stuff may wish to add other Kconfig options than just
>> > packages. That said, I've done this BR2_EXTERNAL stuff mainly for
>> > packages, so if people think that we should restrict this to packages,
>> > I'm fine with that.
>> >
>>
>> We do want to support the absolute paths for both Config.in and *.mk.
>>
>> As a "buildroot overlay", we have similar structures in overlay/ like
>> the buildroot/,
>> such as configs, fs, packages, etc.
>>
>> This requires the buildroot to support only only the *.mk and
>> Config.in in the top
>> level over overlay/, but also those in their sub directories.
>>
>> The *.mk case may be get rid of with Arnount's suggestion.
>> But I'm wondering could we solve the Config.in case in a less trickier way?
>
> I am not sure what you mean here. What do you mean by "support the
> absolute paths for both Config.in and *.mk" ?
>
>> The overlay/Makefile plays a trick, which allows us to work under overlay/ as we
>> work under buildroot/
>>
>> Suppose we have the following configs,
>>
>>   overlay/configs/foo_defconfig
>>
>> Our build sequence will be:
>>
>>   $ cd overlay
>>   $ make O=../output/foo foo_defconfig
>>   $ make O=../output/foo
>>
>> With either Thomas's patch or our local patch, other targets supported by
>> buildroot, such as menuconfig, help, etc also works under overlay/ as they do
>> under buildroot/.
>>
>> ##### overlay/Makefile #######
>> EXTERNAL_OVERLAY       ?= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
>> export EXTERNAL_OVERLAY
>>
>> BUILDROOT_TOP           = ../buildroot
>>
>> all:
>>         ln -fs ../overlay $(BUILDROOT_TOP)
>>         make -C $(BUILDROOT_TOP)
>>
>> %:
>>         ln -fs ../overlay $(BUILDROOT_TOP)
>>         make -C $(BUILDROOT_TOP) $(MAKECMDGOALS)
>>
>> ##### overlay/local.mk #######
>> -include overlay/package/*/*.mk
>> -include overlay/package/*/*/*.mk
>>
>> -include overlay/cust/*/*.mk
>> -include overlay/cust/*/*/*.mk
>>
>> -include overlay/linux/*.mk
>>
>> ###### overlay/Config.in ######
>> source "overlay/package/Config.in"
>> source "overlay/cust/Config.in"
>>
>> ###### overlay/package/Config.in ######
>> source "overlay/package/xxx/Config.in"
>
> This is what BR2_EXTERNAL allows. Of course, doing a
> BR2_EXTERNAL/Makefile that allows to run Buildroot from the external
> (overlay) directory is something left for the person who creates the
> overlay, I believe.


By the absolute path, I mean the paths of sub Config.in included by the
BR2_EXTERNAL/Config.in, not the path of itself.

For example, suppose we have private packages in the overlay

  overlay/Config.in
  overlay/packages/foo/Config.in
  overlay/packages/bar/Config.in

The overlay/Config.in can't include them without support of absolute paths

  source "overlay/packages/foo/Config.in"
  source "overlay/packages/bar/Config.in"

In ths case, Buildroot tries to include them from the

  myproj/buildroot/overlay/packages/foo/Config.in

instead of

  myproj/overlay/packages/foo/Config.in

Thanks.

Roy
