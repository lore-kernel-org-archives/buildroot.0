From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 8 Jul 2008 17:10:48 +1000
Subject: [Buildroot] query about change to $(MAKE) definition
Message-ID: <20080708071048.GA23482@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Can you explain the rationale behind the following change to 
package/Makefile.in you made last week?

It's causing my kernel builds to be very noisy now. I have a custom
makefile for my kernel build, and I'm now getting a ton of

make[5]: warning: -jN forced in submake: disabling jobserver mode.

warnings from it, because $(MAKE) has changed from
'/usr/bin/make -j2' to: '/usr/bin/make MAKE=/usr/bin/make -j2'.

So now -j2 is passed to every submake instance, rather than letting make
itself do the right thing. I'm guessing other builds that do anything
tricky might also suffer.

Thanks
Hamish

Index: package/Makefile.in
===================================================================
--- package/Makefile.in	(revision 22589)
+++ package/Makefile.in	(revision 22590)
@@ -6,15 +6,14 @@
 endif
 HOSTMAKE :=$(shell $(CONFIG_SHELL) -c "which $(HOSTMAKE)" || type -p $(HOSTMAKE) || echo make)
 
-MAKE1:=$(HOSTMAKE) MAKE="$(firstword $(HOSTMAKE)) -j1"
-MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
-
 # honor silent mode
 ifeq (s,$(findstring s,$(MAKEFLAGS)))
-MAKE1+= -s
-MAKE+= -s
+MAKESILENT:=-s
 endif
 
+MAKE1:=$(HOSTMAKE) MAKE='$(firstword $(HOSTMAKE)) -j1 $(MAKESILENT)'
+MAKE:=$(HOSTMAKE) MAKE='$(firstword $(HOSTMAKE)) -j$(BR2_JLEVEL) $(MAKESILENT)'
+
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION=-O0
 endif


-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
