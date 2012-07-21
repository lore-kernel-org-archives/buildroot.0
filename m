From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 20 Jul 2012 21:19:23 -0400
Subject: [Buildroot] [PATCH] Add package linux-pam (resending,
 fixed indentation, mentioned website)
In-Reply-To: <20120720224538.189830cc@skate>
References: <1342647267-20745-1-git-send-email-golubovsky@gmail.com>
 <20120720224538.189830cc@skate>
Message-ID: <CADiAo4LmN0eWpTfasuD9UdnVwLv36ggNuqDJsMzTcmbL4gBP5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Apart from the comment regarding config.h patching (this is a separate
undertaking):

On Fri, Jul 20, 2012 at 4:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> linux-pam is a library, so it should rather go in Libraries -> Other in
> the menuconfig.

Agree, will move it over there.

>> --- a/package/busybox/busybox.mk
>> +++ b/package/busybox/busybox.mk
>> @@ -11,6 +11,9 @@ else
>>  BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
>>  BUSYBOX_SITE = http://www.busybox.net/downloads
>>  endif
>> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>> +BUSYBOX_DEPENDENCIES += linux-pam
>> +endif
>>  BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
>>  BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
>
> This Busybox change should be part of a separate patch (so your patch
> series should have two patches: one adding the linux-pam package, one
> tweaking Busybox to use linux-pam).

Well, I thought about splitting the patch into two, but both parts can
only be applied together then.

>
> Also, shouldn't you ensure that CONFIG_PAM is enabled in the Busybox
> configuration in that case?

IMHO these things are orthogonal.

If BR2_PACKAGE_LINUX_PAM is selected, it will be built before busybox
- what's the difference? If BR2_PACKAGE_LINUX_PAM is not selected,
busybox.mk extra dependencies are not in effect - correct?

If CONFIG_PAM is not selected in busybox, it is not affected by PAM
other than the fact that PAM will be built earlier. The only situation
when bad outcome is possible:  CONFIG_PAM is selected in busybox, and
BR2_PACKAGE_LINUX_PAM is not selected. But this will be obvious to the
user, why busybox does not build.

I don't really want to force PAM support in busybox as a consequence
of user selection of BR2_PACKAGE_LINUX_PAM alone. The reverse makes
more sense: I may add a sub-item in busybox config which enables PAM
in both buildroot an busybox.

Please let me know if this is acceptable.

>
> No, see
> http://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages.
>

I probably missed this, will fix.

For the rest of your comment (fixing config.h  post-configure) I need
a closer look and some more time.

Thanks for your feedback.

-- 
Dmitry Golubovsky

Anywhere on the Web
