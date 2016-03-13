From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:38:44 +0100
Subject: [Buildroot] [PATCH 1/1] Add SVN support for kernel and u-boot
In-Reply-To: <CAGC_hNkOAuAHUSMy-KdNpYv65kpfKUGPd1ybsocNe=4iJNMnuQ@mail.gmail.com>
 (Pauli Sundberg's message of "Sun, 13 Mar 2016 20:15:05 +0200")
References: <CAGC_hNkOAuAHUSMy-KdNpYv65kpfKUGPd1ybsocNe=4iJNMnuQ@mail.gmail.com>
Message-ID: <87oaaif6zv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pauli" == Pauli Sundberg <susundberg@gmail.com> writes:

 > Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
 > ---
 >  boot/uboot/Config.in |  7 +++++--
 >  boot/uboot/uboot.mk  |  4 +++-
 >  linux/Config.in      | 11 +++++++++--
 >  linux/linux.mk       |  3 +++
 >  4 files changed, 20 insertions(+), 5 deletions(-)

Thanks, can you please split this up in two patches - One for u-boot and
one for the Linux kernel?

I cannot apply the patch. It seems like your mailer has converted tabs
to spaces. Please verify that you mailer doesn't corrupt patches by
sending them to yourself and checking that they can be applied.


 > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 > index 4a6dc56..888ee38 100644
 > --- a/boot/uboot/Config.in
 > +++ b/boot/uboot/Config.in
 > @@ -51,6 +51,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 >  config BR2_TARGET_UBOOT_CUSTOM_GIT
 >      bool "Custom Git repository"

 > +config BR2_TARGET_UBOOT_CUSTOM_SVN
 > +    bool "Custom SVN repository"
 > +
 >  config BR2_TARGET_UBOOT_CUSTOM_HG
 >      bool "Custom Mercurial repository"

Please keep this alphabetically sorted, so _SVN after _HG.


 > @@ -64,7 +67,7 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 >      string "URL of custom U-Boot tarball"
 >      depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL

 > -if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 > +if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG ||
 > BR2_TARGET_UBOOT_CUSTOM_SVN

 >  config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
 >      string "URL of custom repository"
 > @@ -88,7 +91,7 @@ config BR2_TARGET_UBOOT_VERSION
 >          if BR2_TARGET_UBOOT_CUSTOM_VERSION
 >      default "custom"    if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 >      default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 > -        if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 > +        if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 > || BR2_TARGET_UBOOT_CUSTOM_SVN

Please also update the _CUSTOM_REPO_VERSION help text with svn info.


 >  config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 >      string "custom patch dir"
 > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
 > index d539b31..b22db1c 100644
 > --- a/boot/uboot/uboot.mk
 > +++ b/boot/uboot/uboot.mk
 > @@ -3,7 +3,6 @@
 >  # uboot
 >  #
 >  ################################################################################
 > -
 >  UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))

Please don't add unrelated changes.



>  UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))

 > @@ -21,6 +20,9 @@ BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 >  else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 >  UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 >  UBOOT_SITE_METHOD = git
 > +else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
 > +UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 > +UBOOT_SITE_METHOD = svn
 >  else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)

Please also keep this in the same order as Config.in, so _SVN after _HG.


>  UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 >  UBOOT_SITE_METHOD = hg
 > diff --git a/linux/Config.in b/linux/Config.in
 > index 6dfc9fe..3cd3c70 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -69,8 +69,15 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 >        This option allows Buildroot to get the Linux kernel source
 >        code from a local directory.

 > +config BR2_LINUX_KERNEL_CUSTOM_SVN
 > +    bool "Custom SVN repository"
 > +    help
 > +      This option allows Buildroot to get the Linux kernel source
 > +      code from a SVN repository.
 > +

This should go after the _CUSTOM_HG option.

Please add svn info to the _CUSTOM_REPO_VERSION option.


> +++ b/linux/linux.mk
 > @@ -20,6 +20,9 @@ LINUX_SITE_METHOD = local
 >  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 >  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 >  LINUX_SITE_METHOD = git
 > +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 > +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 > +LINUX_SITE_METHOD = svn
 >  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 >  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 >  LINUX_SITE_METHOD = hg

Please put the _SVN logic after _HG.


-- 
Bye, Peter Korsgaard
