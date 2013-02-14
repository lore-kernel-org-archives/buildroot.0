From: Joe Halpin <jhalpin@luminatorusa.com>
Date: Thu, 14 Feb 2013 09:08:46 -0600
Subject: [Buildroot] [PATCH] add pre-build scrip. Patch V2
In-Reply-To: <511C1281.5040502@mind.be>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
Message-ID: <05255DE50A102443A25D42F2CCAC151FA58C2A@LUMEXCH.luminatorusa.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's a resend of the patch, I think I got it right this time.
Arnout, please ignore my last reply about CONFIG_DIR, I was thinking
about my own world and missed what you were trying to tell me. I'm
passing CONFIG_DIR in the patch now, which is probably the best place to
start from.


Add a pre-build script that can be used to setup directories, scripts
etc.

This allows scripts which may change .config. CONFIG_DIR is passed as
the
target directory for this reason.

Signed-off-by Joe Halpin jhelpin at luminatorusa.com
---
Correction to the original patch

diff --git a/Makefile b/Makefile
index 3f967b2..29d3bd6 100644
--- a/Makefile
+++ b/Makefile
@@ -393,6 +393,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf:
$(BUILDROOT_CONFI\
G)
        $(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)"
HOSTCXX="$(HOSTCXX\
_NOCCACHE)" silentoldconfig

 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
+ifneq ($(BR2_ROOTFS_PRE_BUILD_SCRIPT),"")
+       @$(call MESSAGE,"Executing pre-build script\(s\)")
+       @$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
+               $(s) $(CONFIG_DIR)$(sep))
+endif
+

 toolchain: prepare dirs dependencies $(BASE_TARGETS)

diff --git a/system/Config.in b/system/Config.in
index 1e4fff3..df9e5ce 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -260,6 +260,19 @@ config BR2_ROOTFS_OVERLAY
          They are copied as-is into the rootfs, excluding files ending
with
          ~ and .git, .svn and .hg directories.

+config BR2_ROOTFS_PRE_BUILD_SCRIPT
+       string "Custom scripts to run before starting the build"
+       default ""
+       help
+         Specify a space-separated list of scripts to be run before the
build
+         has started.
+
+         This gives users the oportunity to do board-specific
preparation.
+
+         These scripts are called with $(CONFIG_DIR) as first and
+         only argument. Make sure the exit code of those scripts are 0,
+         otherwise make will stop after calling them.
+
 config BR2_ROOTFS_POST_BUILD_SCRIPT
        string "Custom scripts to run before creating filesystem images"
        default ""


-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: Wednesday, February 13, 2013 4:24 PM
To: Joe Halpin
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] add pre-build script

On 13/02/13 14:54, Joe Halpin wrote:
> This is a patch to add a pre-build script, which runs before the build
> starts. This lets us setup symlinks and such before the build starts,
> which makes things easier and cleaner for us. Maybe it will for other
> people too. This was made from the 20.12.11 release.

  Could you clarify a bit more what the use case is? Then we can
consider 
if there are maybe better ways to achieve it.


  Also, a properly formatted patch has a commit message which is 
formatted as follows: a single summary line of max. 80 characters, an 
empty line, one or more paragraphs explaining why the patch is
necessary, 
your Signed-off-by line, a line containing three dashes, the patch 
changelog (if you resubmit it). Look at other patches on the list for 
examples. And you should send the patch with git send-email or similar, 
so that whitespace is retained and we can comment in-line.


  Regarding the patch itself: why do you pass $(TARGET_DIR) as an 
argument? Since the 'dirs' step comes after the 'prepare' step, 
$(TARGET_DIR) doesn't exist yet...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
