From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 22:32:27 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-QXrljJXbj4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #6 from Peter Seiderer <ps.report@gmx.net> ---
The following patch/hack fixed the problem for my testcase:

--- openssh-8.4p1/sandbox-seccomp-filter.c_orig 2021-03-23 23:15:02.131964000
+0100
+++ openssh-8.4p1/sandbox-seccomp-filter.c      2021-03-23 23:24:24.388408285
+0100
@@ -189,6 +189,11 @@
 #ifdef __NR_clock_gettime
        SC_ALLOW(__NR_clock_gettime),
 #endif
+
+#ifndef __NR_clock_gettime64
+#define __NR_clock_gettime64 403
+#endif
+
 #ifdef __NR_clock_gettime64
        SC_ALLOW(__NR_clock_gettime64),
 #endif
@@ -252,6 +257,11 @@
 #ifdef __NR_clock_nanosleep
        SC_ALLOW(__NR_clock_nanosleep),
 #endif
+
+#ifndef __NR_clock_nanosleep_time64
+#define __NR_clock_nanosleep_time64 407
+#endif
+
 #ifdef __NR_clock_nanosleep_time64
        SC_ALLOW(__NR_clock_nanosleep_time64),
 #endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
