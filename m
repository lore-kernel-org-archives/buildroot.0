From: <bogus@does.not.exist.com>
Date: Wed, 23 Apr 2008 14:39:25 -0000
Subject: No subject
Message-ID: <mailman.8.1213863099.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/config/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-06-19 07:24:59 UTC (rev 22448)
+++ trunk/buildroot/Makefile	2008-06-19 08:11:35 UTC (rev 22449)
@@ -170,6 +170,8 @@
 HOST_EXEEXT:=.exe
 HOST_LIBEXT:=.lib
 HOST_SHREXT:=.dll
+HOST_LOADLIBES="-lcurses -lintl"
+export HOST_LOADLIBES
 endif
 ifneq ($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
 HOST_EXEEXT:=.exe

Modified: trunk/buildroot/package/config/Makefile
===================================================================
--- trunk/buildroot/package/config/Makefile	2008-06-19 07:24:59 UTC (rev 22448)
+++ trunk/buildroot/package/config/Makefile	2008-06-19 08:11:35 UTC (rev 22449)
@@ -17,10 +17,10 @@
 host-cobjs := $(sort $(foreach m,$(__hostprogs),$($(m)-objs)))
 
 $(host-csingle): %: %.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(HOST_LOADLIBES) $< -o $@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $@
 
 $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(HOST_LOADLIBES) $($@-objs) -o $@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) -o $@
 
 $(host-cobjs): %.o: %.c
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $< -o $@
