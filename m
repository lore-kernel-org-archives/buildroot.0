From: Zachary P. Landau <kapheine@gmail.com>
Date: Thu, 29 Mar 2007 10:36:27 -0400
Subject: [Buildroot] GCC version detection in toolchain/gcc/Makefile.in
Message-ID: <a04f56da0703290736x257e4f8aqb968db9a2402e06c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I think there may be a problem in the GCC version detection code
inside of toolchain/gcc/Makefile.in, but I wanted to verify it with
people before filing a bug.  I am looking at the latest checkin of
Makefile.in (revision 17836).

Inside of that file, it uses the line: "ifeq ($(findstring
3.4.,$(GCC_VERSION)),3.4.)" to detect gcc version 3.4.X.  But then a
few lines down, in a separate ifeq, it uses the line: "ifeq
($(findstring 4.,$(GCC_VERSION)),4.)".  I believe this is supposed to
detect version "4.X.X" of GCC.  But it also seems to match 3.4.X
(because that also has '4.' in it.

This caused an issue for me when trying to compile openssl with gcc
3.4.6.  The incorrect TARGET_SOFT_FLOAT option was being used because
the "4." detection was overwriting the correct value detected a few
lines above.

Am I right that this is an issue, or am I missing something?

-- 
Zachary P. Landau <kapheine@gmail.com>
