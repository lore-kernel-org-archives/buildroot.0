From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:50:18 +0100
Subject: [Buildroot] [git commit] package/iputils: patch ping to link
	against libm
Message-ID: <20160220145025.54C0E7FFAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f41db8f9ac4c5c50b32c6e2315aa1e6aa72afb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ping fails to compile with uClibc based toolchains with the error

undefined reference to `__finite'

Add a patch to link ping against libm to resolve the math library function
finite().

Note, this error is not seen with glibc based toolchains because finite
seems to be resolved in both libm and libc.

Fixes:
http://autobuild.buildroot.net/results/08f7386f75c881bc582b338824f8ccd509b2921e/
http://autobuild.buildroot.net/results/5aeef61fbd399dd78dc72b9e7cce978e6f1f58b4/

A pull request has been sent to fix this issue upstream, see
https://github.com/iputils/iputils/pull/42

Signed-off-by: Martin Bark <martin@barkynet.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/0001-ping-link-against-libm.patch | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/iputils/0001-ping-link-against-libm.patch b/package/iputils/0001-ping-link-against-libm.patch
new file mode 100644
index 0000000..d151c5b
--- /dev/null
+++ b/package/iputils/0001-ping-link-against-libm.patch
@@ -0,0 +1,29 @@
+From 8d189e73e660a637ae3f5a604448103ea42e397d Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Fri, 12 Feb 2016 16:52:19 +0000
+Subject: [PATCH] ping: link against libm
+
+This commit links ping against libm because ping.c calls the math library
+function finite().
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8b37c42..fb80f6f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -156,7 +156,7 @@ LIB_clockdiff = $(LIB_CAP)
+ DEF_ping_common = $(DEF_CAP) $(DEF_IDN)
+ DEF_ping6_common = $(DEF_CAP) $(DEF_IDN)
+ DEF_ping  = $(DEF_CAP) $(DEF_IDN) $(DEF_WITHOUT_IFADDRS)
+-LIB_ping  = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV)
++LIB_ping  = $(LIB_CAP) $(LIB_IDN) $(LIB_RESOLV) -lm
+ 
+ ping: ping_common.o ping6_common.o
+ ping.o ping_common.o ping6_common.o: ping.h in6_flowlabel.h
+-- 
+2.7.0
+
