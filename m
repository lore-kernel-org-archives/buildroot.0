From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 08 Jul 2007 06:35:39 +0200
Subject: [Buildroot] [/bin/sh which ar]  should be [/bin/sh -c "which ar"]
Message-ID: <1183869339.5714.5.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the host tools are determined in the top Makefile
(every time make us run) 
this fails 5 times with the error message:

/usr/bin/which: /usr/bin/which: cannot execute binary file

What happens inside the Makefile is that a command is run:
$ /bin/sh which ar
and the bash shell does not like this on my OpenSuSE 10.2 system
$ /bin/sh -c "which ar"
will do what we want, so I would like to apply the following patch
Any comments?

Index: Makefile
===================================================================
--- Makefile    (revision 19026)
+++ Makefile    (arbetskopia)
@@ -78,11 +78,11 @@
 ifndef HOSTLD
 HOSTLD:=ld
 endif
-HOSTAR:=$(shell $(CONFIG_SHELL) which $(HOSTAR) || type -p $(HOSTAR) ||
echo ar)
-HOSTAS:=$(shell $(CONFIG_SHELL) which $(HOSTAS) || type -p $(HOSTAS) ||
echo as)
-HOSTCC:=$(shell $(CONFIG_SHELL) which $(HOSTCC) || type -p $(HOSTCC) ||
echo gcc)
-HOSTCXX:=$(shell $(CONFIG_SHELL) which $(HOSTCXX) || type -p $(HOSTCXX)
|| echo g++)
-HOSTLD:=$(shell $(CONFIG_SHELL) which $(HOSTLD) || type -p $(HOSTLD) ||
echo ld)
+HOSTAR :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)"  || type -p
$(HOSTAR)  || echo ar)
+HOSTAS :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)"  || type -p
$(HOSTAS)  || echo as)
+HOSTCC :=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)"  || type -p
$(HOSTCC)  || echo gcc)
+HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p
$(HOSTCXX) || echo g++)
+HOSTLD :=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)"  || type -p
$(HOSTLD)  || echo ld)
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif

Best Regards
Ulf Samuelsson
