From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jul 2014 06:58:01 +0200
Subject: [Buildroot] [PATCH] Add local directory support for uboot
In-Reply-To: <201407310914.16450.manningc2@actrix.gen.nz>
References: <1406505484-19123-1-git-send-email-cdhmanning@gmail.com>
 <CAAXf6LUJJrSFq40GjbFipM0NBzrV=RgOOdEVxb0jw7zYC-wrBQ@mail.gmail.com>
 <201407310914.16450.manningc2@actrix.gen.nz>
Message-ID: <143ea5b3-3ff3-4f10-ba10-6de14329f191@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles Manning <cdhmanning@gmail.com> schreef:
>On Tuesday 29 July 2014 20:39:09 you wrote:
>> Hi Charles,
>>
>> On Mon, Jul 28, 2014 at 1:58 AM, Charles Manning <cdhmanning@gmail.com> 
>wrote:
>> > Signed-off-by: Charles Manning <cdhmanning@gmail.com>
>> > ---
>> >  boot/uboot/Config.in |   12 ++++++++++++
>> >  boot/uboot/uboot.mk  |    3 +++
>> >  2 files changed, 15 insertions(+)
>> >
>> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>> > index 46d1109..b489fae 100644
>> > --- a/boot/uboot/Config.in
>> > +++ b/boot/uboot/Config.in
>> > @@ -34,6 +34,12 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
>> >  config BR2_TARGET_UBOOT_CUSTOM_HG
>> >         bool "Custom Mercurial repository"
>> >
>> > +config BR2_TARGET_UBOOT_CUSTOM_LOCAL
>> > +       bool "Local directory"
>> > +       help
>> > +         This option allows Buildroot to get the u-boot source
>> > +         code from a local directory.
>> > +
>> >  endchoice
>> >
>> >  config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
>> > @@ -70,6 +76,12 @@ config BR2_TARGET_UBOOT_VERSION
>> >         default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
>> >                 if BR2_TARGET_UBOOT_CUSTOM_GIT ||
>> > BR2_TARGET_UBOOT_CUSTOM_HG
>> >
>> > +config BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH
>> > +       string "Path to the local directory"
>> > +       depends on BR2_TARGET_UBOOT_CUSTOM_LOCAL
>> > +       help
>> > +         Path to the local directory with the u-boot source code.
>> > +
>> >  config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>> >         string "custom patch dir"
>> >         help
>> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> > index 532ac8b..2ae7d87 100644
>> > --- a/boot/uboot/uboot.mk
>> > +++ b/boot/uboot/uboot.mk
>> > @@ -23,6 +23,9 @@ UBOOT_SITE_METHOD = git
>> >  else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
>> >  UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
>> >  UBOOT_SITE_METHOD = hg
>> > +else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_LOCAL),y)
>> > +LINUX_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_LOCAL_PATH))
>> > +LINUX_SITE_METHOD = local
>>
>> This cannot be write: you're overwriting LINUX variables from uboot.mk.
>
>Thanks
>
>You are correct. I sent the wrong patch!
>
>>
>> Note that there already exist mechanisms to achieve this.
>> For development work, we have the _OVERRIDE_SRCDIR mechanism. See
>> http://buildroot.uclibc.org/downloads/manual/manual.html#_using_buildroot_d
>>uring_development
>>
>> If this is for a real project, you typically have buildroot under
>> version control, and the local.mk file used for the _OVERRIDE_SRCDIR
>> mechanism is not really intended to be placed under version control.
>> However, using arbitrary contents of a directory is not a good idea
>> anyway, so in this case you are better to placing the u-boot sources
>> in a git or mercurial repository, and specify this repository with a
>> given revision in the buildroot configuration.
>
>Excellent.
>
>Thanks for teaching me this.
>

Please keep the list in copy, then other developers are aware of this conclusion...

Best regards,
Thomas
