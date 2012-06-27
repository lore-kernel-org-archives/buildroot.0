From: Joerg Rebenstorf <Joerg.Rebenstorf@GiN.de>
Date: Wed, 27 Jun 2012 14:41:27 +0200
Subject: [Buildroot] Avahi build failed with BR2_STRIP_none=y and
	BR2_ENABLE_DEBUG=n
Message-ID: <1340800887.3122.113.camel@jr-ThinkCentre-A57>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just want to let the community know that I've found a bug and fixed it
in buildroot-2009.11.

Bugfix: Fix avahi build breakage with BR2_STRIP_none=y and
BR2_ENABLE_DEBUG=n 
The fix works like this:
Look at BR2_STRIP_none to decide whether to strip avahi binaries.
This avoids bad quoting in avahi Makefile.in when $STRIP is set to:
true Not_stripping

Index: /usr/cross/GL4200/buildroot-2009.11/package/avahi/avahi.mk
===================================================================
--- /usr/cross/GL4200/buildroot-2009.11/package/avahi/avahi.mk	(revision
7)
+++ /usr/cross/GL4200/buildroot-2009.11/package/avahi/avahi.mk	(working
copy)
@@ -16,6 +16,12 @@
 AVAHI_INSTALL_STAGING = YES
 AVAHI_INSTALL_TARGET = YES
 
+ifeq ($(BR2_STRIP_none),y)
+AVAHI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
+else
+AVAHI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
+endif
+
 AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \

Without this fix you get the following output:

>>> libdaemon 0.13 Installing to target
/usr/bin/make -j8
DESTDIR=/usr/cross/GL4200/buildroot-2009.11/output/target  install-strip
-C /usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/
make[1]: Entering directory
`/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
/usr/bin/make
INSTALL_PROGRAM="/bin/bash /usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/install-sh -c -s" \

install_sh_PROGRAM="/bin/bash /usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/install-sh -c -s" INSTALL_STRIP_FLAG=-s \
	  `test -z 'true Not_stripping' || \
	    echo "INSTALL_PROGRAM_ENV=STRIPPROG='true Not_stripping'"` install
make[2]: *** make[2]: Entering directory
`/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
No rule to make target `Not_stripping''.  Stop.
make[2]: Leaving directory
`/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
make[1]: *** [install-strip] Error 2
make[1]: Leaving directory
`/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13'
make: ***
[/usr/cross/GL4200/buildroot-2009.11/output/build/libdaemon-0.13/.stamp_target_installed] Error 2


Any comments are welcome.

Cheers,
J?rg

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120627/e8ae1e5c/attachment.asc>
