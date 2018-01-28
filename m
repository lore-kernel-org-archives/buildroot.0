From: Sam <samiswt@gmail.com>
Date: Sat, 27 Jan 2018 17:46:44 -0800
Subject: [Buildroot] daq-2.2.2 patch issue: weird files and subdirectories
 ownership
Message-ID: <CAPi4xiXT+6PZ0h4Vh4qqOCGseRLYdp5SbiF2ibyiLS4TpWJGLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm trying to build daq-2.2.2 on my Raspberry Pi 3B.

The files and subdirectories inside `daq-2.2.2` have been changed ownership
to sam:samgrp. User `sam` is default user of my host, but the samgrp hasn't
existed before daq got compiled. Anyway, the problem is:
1). Buildroot firstly copied Makefile.in(644 sam:samgrp) to
Makefile.in.orig(644 root:root), which I suspect where the error is from.
2). Buildroot rejected to modify Makefile.in because it's ownership is
sam:samgrp.

I didn't set up any ownership configuration in my daq.mk and I don't know
why Buildroot uncompressed daq-2.2.2.tar.gz with ownership sam:samgrp which
only happened inside of daq-2.2.2 directory. No matter what ownership of my
buildroot root directory and subdirectories is, sam:samgrp or root:root,
nothing changed, still the same problem.

I'm sorry for the previous thread. I'm unaware of ignoring attached files
in Mailing list.

1. patch file:
--- daq-2.2.2/sfbpf/Makefile.in.orig 2018-01-19 21:32:51.000000000 +0200
+++ daq-2.2.2/sfbpf/Makefile.in 2018-01-19 15:47:07.654945651 +0200
@@ -783,3 +783,3 @@
- sf_scanner.c: $(srcdir)/scanner.l
+ sf_scanner.c: $(srcdir)/scanner.l ${builddir}/tokdefs.h
        @rm -f $(srcdir)/sf_scanner.c
        $(srcdir)/runlex.sh $(V_LEX) -osf_scanner.c $(srcdir)/scanner.l

2. build.log

WARNING: no hash file for daq-2.2.2.tar.gz
^[[7m>>> daq 2.2.2 Extracting^[[27m
gzip -d -c /usr/local/buildroot/dl/daq-2.2.2.tar.gz | tar
--strip-components=1 -C /usr/local/buildroot/output/build/daq-2.2.2   -xf -
^[[7m>>> daq 2.2.2 Patching^[[27m

Applying 0001-correct-the-location-of-unistd.h.patch using patch:
patching file os-daq-modules/daq_ipfw.c

Applying 0002-disable-run-test-program-while-cross-compiling.patch using
patch:
patching file m4/sf.m4

Applying 0003-cross-compile-test.patch using patch:
patching file configure

Applying 0004-sfbpf-Makefile-tokdefs-h-nonexist.patch using patch:
patching file sfbpf/Makefile.in
Hunk #1 FAILED at 783.
1 out of 1 hunk FAILED -- saving rejects to file sfbpf/Makefile.in.rej
make: *** [package/pkg-generic.mk:215:
/usr/local/buildroot/output/build/daq-2.2.2/.stamp_patched] Error 1


Thank you very much,


Tao
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/6dbae3a2/attachment.html>
