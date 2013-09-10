From: john <john.osullivan@cloudiumsystems.com>
Date: Tue, 10 Sep 2013 11:59:03 +0100
Subject: [Buildroot] Adding svn repo option to uboot
Message-ID: <1378810743.20848.8.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to add an option to build uboot code from an svn repository
in buildroot-2013.05.
This is what I have done so far in 
boot/uboot I modified Config.In as follows:

===================================================================
--- Config.in	(revision 22)
+++ Config.in	(working copy)
@@ -31,6 +31,12 @@
 config BR2_TARGET_UBOOT_CUSTOM_GIT
 	bool "Custom Git repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_SVN
+	bool "Custom SVN tree"
+	help
+	  This option allows Buildroot to get the UBoot source
+	  code from a SVN repository.
+
 endchoice
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
@@ -50,6 +56,7 @@
 	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if
BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if
BR2_TARGET_UBOOT_CUSTOM_GIT
+	default $BR2_TARGET_UBOOT_CUSTOM_SVN_VERSION if
BR2_TARGET_UBOOT_CUSTOM_SVN
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
@@ -70,6 +77,22 @@
 
 endif
 
+
+if BR2_TARGET_UBOOT_CUSTOM_SVN
+
+config BR2_TARGET_UBOOT_CUSTOM_SVN_REPO_URL
+	string "URL of custom SVN repository"
+
+
+config BR2_TARGET_UBOOT_CUSTOM_SVN_VERSION
+	string "Custom SVN version"
+	default "HEAD"
+	help
+	  SVN revision to use in the format used by SVN rev-parse,
+	  E.G. a sha id, a tag, branch, ..
+
+endif
+
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN



And the uboot.mk file as follows

===================================================================
--- uboot.mk	(revision 22)
+++ uboot.mk	(working copy)
@@ -19,6 +19,9 @@
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE        = $(call qstrip,
$(BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL))
 UBOOT_SITE_METHOD = git
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
+LINUX_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_SVN_REPO_URL))
+LINUX_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot


When I try this I get:
>>> uboot HEAD Downloading
/uboot-HEAD.tar.gz: Scheme missing.
--2013-09-10 11:52:31--  http://sources.buildroot.net//uboot-HEAD.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|
176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-09-10 11:52:31 ERROR 404: Not Found.

Any suggestions on what else i may need to do or how I could get more
visibility on why this is not working. I was able to do this
successfully for the linux kernel by adding similar rules.
