From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 01 Feb 2016 22:05:17 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
 <87mvrkcsvm.fsf@dell.be.48ers.dk>
Message-ID: <dtt4ocxf5l.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 01 Feb 2016 17:11:57 +0100 schrieb Peter Korsgaard:

> I now spent some quality time (!) with gettext.m4 and figured out what
> we really going on here with musl and libintl.h, and I've pushed a
> simpler / more complete patch fixing the issue.
> 
> I have therefore marked this patch as superseeded.
> 
> I've also reverted the madplay fix now that it is handled globally in
> TARGET_CONFIGURE_ARGS.

Hi Peter,

there is still a problem left, binutils contains its own intl library 
with a GNU libintl.h, similar to the one provided by gettext. It changes 
function names in libbfd.so, this leads to a link error at least with 
dropwatch:

http://autobuild.buildroot.net/results/c90/
c90f7688b3b2e07f3232db163dc747c954604442//

/home/test/autobuild/instance-2/output/host/usr/x86_64-buildroot-linux-
musl/sysroot/usr/lib/../lib64/libbfd.so: undefined reference to 
`libintl_dgettext'

This situation is still present today after your commit:

output/host/usr/bin/x86_64-linux-readelf -a output/staging/usr/lib64/
libbfd-2.24.so | grep gettext
0000002e4d50  012400000007 R_X86_64_JUMP_SLO 0000000000000000 
libintl_dgettext + 0
   292: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND 
libintl_dgettext
  1275: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND 
libintl_dgettext

Again I hacked a bit to get the problem solved in a way you will never 
accept it ;)

$ cat package/binutils/2.24/200-musl-gettext.patch
diff -uNr binutils-2.24.org/Makefile.in binutils-2.24/Makefile.in
--- binutils-2.24.org/Makefile.in	2013-12-02 10:31:21.000000000 
+0100
+++ binutils-2.24/Makefile.in	2016-02-01 21:54:49.286655138 +0100
@@ -16938,6 +16938,7 @@
 	esac; \
 	srcdiroption="--srcdir=$${topdir}/intl"; \
 	libsrcdir="$$s/intl"; \
+	gt_cv_func_gnugettext1_libc=yes \
 	$(SHELL) $${libsrcdir}/configure \
 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
 	  --target=${target_alias} $${srcdiroption}  \

Using this patch libbfd-2.24.so will look like this:

$ output/host/usr/bin/x86_64-linux-readelf -a output/staging/usr/lib64/
libbfd-2.24.so | grep gettext
0000002e4be0  00bb00000007 R_X86_64_JUMP_SLO 0000000000000000 dgettext + 0
   187: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND dgettext
  1171: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND dgettext

and dropwatch will compile fine. I tried to get the content of our 
$gt_cv_func_gnugettext1_libc variable from Makefile.in down to binutils/
intl/configure and failed :( I hope this will help anyway.

Regards, Bernd
