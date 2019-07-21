From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Jul 2019 19:16:39 +0000
Subject: [Buildroot] [Bug 11766] Console (getty) issues with systemd
In-Reply-To: <bug-11766-163@https.bugs.busybox.net/>
References: <bug-11766-163@https.bugs.busybox.net/>
Message-ID: <bug-11766-163-dF0SzFUubn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11766

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
Enabling hardware flow control for a 3-wire serial line (without
the extra wires for the hardware flow control) seems strange, and I believe is
not the solution...

diff -u ~/Downloads/console-getty.service_comparison.txt
~/Downloads/console-getty.fixed.txt 
--- /home/seiderer/Downloads/console-getty.service_comparison.txt      
2019-04-09 19:02:33.570689557 +0200
+++ /home/seiderer/Downloads/console-getty.fixed.txt    2019-07-21
21:03:18.299974466 +0200
@@ -32,7 +32,7 @@
     # The '-o' option value tells agetty to replace 'login' arguments with an
     # option to preserve environment (-p), followed by '--' for safety, and
then
     # the entered username.
-    ExecStart=-/sbin/getty -L %I 115200 vt100
+    ExecStart=-/sbin/getty -h %I 115200 vt100
     Type=idle
     Restart=always
     UtmpIdentifier=%I

You seem to have fixed the already working file (marked by you with
'console-getty.service from Buildroot 2018.11 (Working):' and not the one
marked by your with 'console-getty.service from Buildroot 2019.02.1 (Not
working):'.

The real diff between the two versions is:

-    ExecStart=-/sbin/getty -L %I 115200 vt100
+    ExecStart=-/sbin/getty -L console 115200 vt100

Can you check which console/%I the working version is using on a running
system?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
