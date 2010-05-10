From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:39:50 +0200
Subject: [Buildroot] [PATCH 4/5] netplug: disable -Werror to fix build
	failure
In-Reply-To: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <75d008f9aea93d3dcdb9afa1526bfcaa8517c740.1273527584.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netplug uses nested functions, and gcc generates a warning that
is turned into an error:

cc1: warnings being treated as errors
if_info.c: In function 'ifsm_scriptdone':
if_info.c:289: error: generating trampoline in object (requires executable stack)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netplug/netplug-1.2.9-disable-werror.patch |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/netplug/netplug-1.2.9-disable-werror.patch

diff --git a/package/netplug/netplug-1.2.9-disable-werror.patch b/package/netplug/netplug-1.2.9-disable-werror.patch
new file mode 100644
index 0000000..d8a3e15
--- /dev/null
+++ b/package/netplug/netplug-1.2.9-disable-werror.patch
@@ -0,0 +1,22 @@
+netplug uses nested functions, and gcc generates a warning that
+is turned into an error:
+
+cc1: warnings being treated as errors
+if_info.c: In function 'ifsm_scriptdone':
+if_info.c:289: error: generating trampoline in object (requires executable stack)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: netplug-1.2.9/Makefile
+===================================================================
+--- netplug-1.2.9.orig/Makefile	2010-05-09 21:07:40.000000000 +0200
++++ netplug-1.2.9/Makefile	2010-05-09 21:09:32.000000000 +0200
+@@ -9,7 +9,7 @@
+ 
+ install_opts :=
+ 
+-CFLAGS += -Wall -Werror -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
++CFLAGS += -Wall -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
+ 	-DNP_SCRIPT_DIR='"$(scriptdir)"' -ggdb3 -O3 -DNP_VERSION='"$(version)"'
+ 
+ netplugd: config.o netlink.o lib.o if_info.o main.o
-- 
1.6.3.3
