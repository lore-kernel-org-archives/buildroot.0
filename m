From: Giuseppe Marocchio <giuseppe@marocchio.com>
Date: Fri, 06 Mar 2015 12:24:16 +0100
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: Add the option
 to	download via git
Message-ID: <54F98E60.3050007@marocchio.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Tested-by: Giuseppe Marrocchio  giuseppe at marocchio.com

Works fine,
gm

2015-02-16 10:12 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com  <http://lists.busybox.net/mailman/listinfo/buildroot>>:
>/  Hello All,
/>/
/>/  Any news on this one?
/>/
/>/  Staiyng to this comment on at91bootstrap git tree [1] there is no
/>/  infrastructure in place to add third parties boards.
/>/
/>/  Personally, I need this option cause I'm in the process to prepare a
/>/  comprehensive board support for Acmesystems' products and ask for
/>/  inclusion in the near future.
/>/
/>/  Thanks!
/>/
/>/  Sincerely, Angelo
/>/
/>/  [1]https://github.com/linux4sam/at91bootstrap/pull/2#issuecomment-27954225
/>/
/>/  2015-01-30 17:52 GMT+01:00 Angelo Compagnucci <angelo.compagnucci@gmail.com  <http://lists.busybox.net/mailman/listinfo/buildroot>>:
/>>/  Adding support for git downloading of a custom repository.
/>>/
/>>/  Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com  <http://lists.busybox.net/mailman/listinfo/buildroot>>
/>>/  ---
/>>/   boot/at91bootstrap3/Config.in         | 35 +++++++++++++++++++++++++++++++++++
/>>/   boot/at91bootstrap3/at91bootstrap3.mk |  8 +++++++-
/>>/   2 files changed, 42 insertions(+), 1 deletion(-)
/>>/
/>>/  diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
/>>/  index 8ac40ed..6f2f7db 100644
/>>/  --- a/boot/at91bootstrap3/Config.in
/>>/  +++ b/boot/at91bootstrap3/Config.in
/>>/  @@ -8,8 +8,43 @@ config BR2_TARGET_AT91BOOTSTRAP3
/>>/            - Peripheral drivers such as PIO, PMC or SDRAMC...
/>>/            - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
/>>/
/>>/  +
/>>/   if BR2_TARGET_AT91BOOTSTRAP3
/>>/
/>>/  +choice
/>>/  +
/>>/  +       prompt "AT91 Bootstrap 3 version"
/>>/  +
/>>/  +config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
/>>/  +       bool "3.7.1"
/>>/  +
/>>/  +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
/>>/  +       bool "Custom Git repository"
/>>/  +       help
/>>/  +         This option allows Buildroot to get the AT91 Bootstrap 3 source
/>>/  +         code from a Git repository.
/>>/  +
/>>/  +endchoice
/>>/  +
/>>/  +if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
/>>/  +
/>>/  +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
/>>/  +       string "URL of custom repository"
/>>/  +
/>>/  +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
/>>/  +       string "Custom repository version"
/>>/  +       help
/>>/  +         Revision to use in the typical format used by Git
/>>/  +         E.G. a sha id, a tag, branch, ..
/>>/  +
/>>/  +endif
/>>/  +
/>>/  +config BR2_TARGET_AT91BOOTSTRAP3_VERSION
/>>/  +       string
/>>/  +       default "v3.7.1" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
/>>/  +       default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
/>>/  +               if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
/>>/  +
/>>/   config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
/>>/          string "custom patch dir"
/>>/          help
/>>/  diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
/>>/  index 098e7bf..39f2365 100644
/>>/  --- a/boot/at91bootstrap3/at91bootstrap3.mk
/>>/  +++ b/boot/at91bootstrap3/at91bootstrap3.mk
/>>/  @@ -4,8 +4,14 @@
/>>/   #
/>>/   ################################################################################
/>>/
/>>/  -AT91BOOTSTRAP3_VERSION = v3.7.1
/>>/  +AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
/>>/  +
/>>/  +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
/>>/  +AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
/>>/  +AT91BOOTSTRAP3_SITE_METHOD = git
/>>/  +else
/>>/   AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
/>>/  +endif
/>>/
/>>/   AT91BOOTSTRAP3_INSTALL_IMAGES = YES
/>>/   AT91BOOTSTRAP3_INSTALL_TARGET = NO
/>>/  --
/>>/  1.9.1
/>>/
/>/
/>/
/>/
/>/  --
/>/  Profile:http://it.linkedin.com/in/compagnucciangelo/

-- 
Giuseppe Marocchio
Tel: +39.3477365087
Tel: +39.0458538888
skype: giuseppe.marocchio

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150306/916426ff/attachment.html>
