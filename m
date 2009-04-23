From: Will Newton <will.newton@gmail.com>
Date: Thu, 23 Apr 2009 11:21:00 +0100
Subject: [Buildroot] [PATCH] Update config.sub even if we called autoreconf
Message-ID: <87a5b0800904230321q7ba4ba27ge6a4f7d8b491af7f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

If a package asks for autoreconf to be called and the user has also
asked for the config.{sub,guess} to be updated then the
config.{sub,guess} will be copied but overwritten by the autoreconf.
This patch does a second copy after the autoreconf to make sure the
user preference is preserved. I think this is safe to do because
nothing in the autoreconf directly depends upon the contents of
config.sub.

--- package/Makefile.autotools.in       21 Apr 2009 10:42:40 -0000      1.1.1.2
+++ package/Makefile.autotools.in       23 Apr 2009 10:14:44 -0000
@@ -232,6 +232,13 @@
                toolchain/patch-kernel.sh $${i%/*} package
buildroot-libtool.patch; \
                done \
        fi
+ifeq ($(BR2_UPDATE_CONFIG),y)
+       $(Q)(for file in config.guess config.sub; do \
+               for i in $$(find $(@D) -name $$file); do \
+                       cp package/gnuconfig/$$file $$i; \
+               done; \
+       done)
+endif
        $(Q)touch $@

 # Configuring
-------------- next part --------------
A non-text attachment was scrubbed...
Name: autotools-config-update.patch
Type: application/octet-stream
Size: 501 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090423/8c10b766/attachment.obj>
