From: Arguin, Christopher P     UTAS <Christopher.Arguin@utas.utc.com>
Date: Fri, 16 Sep 2016 01:08:01 +0000
Subject: [Buildroot] Kernel compilation, tools/endian.h, and HOSTCFLAGS
Message-ID: <34C69F44FE4EA4498813EAECDBF40C1623AA77E5@GUSALE0B.na.utcmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm basically leaving this here for the next person who runs into it...

Ever since we started using buildroot we've had a failure during the kernel compilation. This is using a Linux 3.19 kernel targeting an x86_64 board:

    HOSTCC  Documentation/watchdog/src/watchdog-test
    HOSTLD  Documentation/vDSO/vdso_standalone_test_x86
  Documentation/mic/mpssd/mpssd.c:44:26: fatal error: tools/endian.h: No such file or directory
  compilation terminated.

We've been working around this, but I finally decided to tackle it.

tools/endian.h is part of the kernel distribution, and should be included because of this line in Documentation/mic/mpssd/Makefile:
   HOSTCFLAGS += -I$(objtree)/usr/include -I$(srctree)/tools/include

I finally discovered that during compilation buildroot invokes the kernel's make with HOSTCFLAGS="". If I remove that, the build succeeds. Add that, and the build fails with this error. It seems as if setting HOSTCFLAGS prevents the kernel from adding to it, although I don't understand that mechanism yet. Setting HOSTCFLAGS="-Wall" also fails, so the easy way out won't work.

Interestingly, back in 2008 it looks like there was a buildroot patch to stop setting HOSTCFLAGS for Linux 2.6 for the same basic reason (http://lists.busybox.net/pipermail/buildroot/2008-October/023217.html), but I don't think that patch made it into the code base. I don't see many other references in the history or the mailing list. 

The latest version of the Documentation/mic/mpssd/Makefile is wrapped in an "ifndef CROSS_COMPILE" which prevents the issue, although not really fixing it. Changing the makefile to set HOST_EXTRACFLAGS is the fix I went with, but I'm not really sure if that is correct either.

-- 
Christopher Arguin - Software Architect - ISR Systems
UTC AEROSPACE SYSTEMS
7 Technology Park Drive, Westford, MA 01886
Tel: +1 978 490 2278  Mobile: +1 978 495 2542  Fax: +1 978 490 2806
christopher.arguin at utas.utc.com  www.utcaerospacesystems.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or privileged information of UTC Aerospace Systems and its affiliated companies. If you are not the intended recipient please 1) do not disclose, copy, distribute or use this message or its contents, 2) advise the sender by return e-mail, and 3) delete all copies (including all attachments) from your computer. Your cooperation is greatly appreciated.
