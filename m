From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 12 Oct 2014 14:06:05 +0000
Subject: [Buildroot] [PATCH 03/11] gdb: Patch for "unrecognized
 real-time	signal" bug
In-Reply-To: <1396558881-29631-3-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>,
 <1396558881-29631-3-git-send-email-paul@crapouillou.net>
Message-ID: <38121FAB319C3344930C920E7B51831320FD487B@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

this commit should fix the problem:

http://git.buildroot.net/buildroot/commit/?id=54ba2704b07cacacb9247540a660c667fd5ffdd5

Best regards,

--
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
________________________________________
From: buildroot-bounces@busybox.net [buildroot-bounces at busybox.net] on behalf of Paul Cercueil [paul at crapouillou.net]
Sent: 03 April 2014 22:01
To: buildroot at busybox.net
Cc: Maarten ter Huurne
Subject: [Buildroot] [PATCH 03/11] gdb: Patch for "unrecognized real-time       signal" bug

From: Maarten ter Huurne <maarten@treewalker.org>

This avoids the following error at GDB startup:

GDB bug: target.c (gdb_signal_from_host): unrecognized real-time signal

For details, see:
  http://sourceware.org/bugzilla/show_bug.cgi?id=14523

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
Acked-By: Paul Cercueil <paul@crapouillou.net>
---
 package/gdb/7.4.1/signal-128.patch | 15 +++++++++++++++
 package/gdb/7.5.1/signal-128.patch | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/gdb/7.4.1/signal-128.patch
 create mode 100644 package/gdb/7.5.1/signal-128.patch

diff --git a/package/gdb/7.4.1/signal-128.patch b/package/gdb/7.4.1/signal-128.patch
new file mode 100644
index 0000000..ea56372
--- /dev/null
+++ b/package/gdb/7.4.1/signal-128.patch
@@ -0,0 +1,15 @@
+diff -ru gdb-7.4.1.org/gdb/common/signals.c gdb-7.4.1/gdb/common/signals.c
+--- gdb-7.4.1.org/gdb/common/signals.c 2012-01-06 05:43:33.000000000 +0100
++++ gdb-7.4.1/gdb/common/signals.c     2012-08-29 22:40:56.000000000 +0200
+@@ -346,6 +346,11 @@
+       else if (64 <= hostsig && hostsig <= 127)
+       return (enum target_signal)
+         (hostsig - 64 + (int) TARGET_SIGNAL_REALTIME_64);
++      else if (hostsig == 128)
++      /* Some platforms, such as Linux MIPS, have NSIG == 128, in which case
++         signal 128 is the highest realtime signal. There is no constant for
++         that though. */
++      return TARGET_SIGNAL_UNKNOWN;
+       else
+       error (_("GDB bug: target.c (target_signal_from_host): "
+              "unrecognized real-time signal"));
diff --git a/package/gdb/7.5.1/signal-128.patch b/package/gdb/7.5.1/signal-128.patch
new file mode 100644
index 0000000..b46489e
--- /dev/null
+++ b/package/gdb/7.5.1/signal-128.patch
@@ -0,0 +1,15 @@
+diff -ru gdb-7.5.org/gdb/common/signals.c gdb-7.5/gdb/common/signals.c
+--- gdb-7.5.org/gdb/common/signals.c   2012-05-24 18:51:37.000000000 +0200
++++ gdb-7.5/gdb/common/signals.c       2012-08-29 22:32:07.000000000 +0200
+@@ -346,6 +346,11 @@
+       else if (64 <= hostsig && hostsig <= 127)
+       return (enum gdb_signal)
+         (hostsig - 64 + (int) GDB_SIGNAL_REALTIME_64);
++      else if (hostsig == 128)
++      /* Some platforms, such as Linux MIPS, have NSIG == 128, in which case
++         signal 128 is the highest realtime signal. There is no constant for
++         that though. */
++      return GDB_SIGNAL_UNKNOWN;
+       else
+       error (_("GDB bug: target.c (gdb_signal_from_host): "
+              "unrecognized real-time signal"));
--
1.9.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
