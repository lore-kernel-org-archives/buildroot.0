From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 22:52:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ttcp
Message-ID: <20090114225232.851F976C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 22:52:31 +0000 (Wed, 14 Jan 2009)
New Revision: 24846

Log:
Update deprecated bmove to memmove in ttcp

Added:
   trunk/buildroot/package/ttcp/ttcp-bcopy.patch

Modified:
   trunk/buildroot/package/ttcp/ttcp.mk


Changeset:
Added: trunk/buildroot/package/ttcp/ttcp-bcopy.patch
===================================================================
--- trunk/buildroot/package/ttcp/ttcp-bcopy.patch	                        (rev 0)
+++ trunk/buildroot/package/ttcp/ttcp-bcopy.patch	2009-01-14 22:52:31 UTC (rev 24846)
@@ -0,0 +1,12 @@
+diff -urN ttcp-0rig/ttcp.c ttcp/ttcp.c
+--- ttcp-0rig/ttcp.c	1993-05-17 00:00:00.000000000 +0200
++++ ttcp/ttcp.c	2009-01-14 23:46:19.000000000 +0100
+@@ -241,7 +241,7 @@
+ 			if ((addr=gethostbyname(host)) == NULL)
+ 				err("bad hostname");
+ 			sinhim.sin_family = addr->h_addrtype;
+-			bcopy(addr->h_addr,(char*)&addr_tmp, addr->h_length);
++			memmove((char*)&addr_tmp, addr->h_addr, addr->h_length);
+ #if defined(cray)
+ 			sinhim.sin_addr = addr_tmp;
+ #else

Modified: trunk/buildroot/package/ttcp/ttcp.mk
===================================================================
--- trunk/buildroot/package/ttcp/ttcp.mk	2009-01-14 22:11:13 UTC (rev 24845)
+++ trunk/buildroot/package/ttcp/ttcp.mk	2009-01-14 22:52:31 UTC (rev 24846)
@@ -15,6 +15,7 @@
 $(TTCP_BUILD_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
 	-mkdir $(TTCP_BUILD_DIR)
 	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_BUILD_DIR)
+	toolchain/patch-kernel.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
 	touch $(TTCP_BUILD_DIR)/.unpacked
 
 $(TTCP_BUILD_DIR)/.configured: $(TTCP_BUILD_DIR)/.unpacked
