From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Apr 2020 19:51:14 +0000
Subject: [Buildroot] [Bug 12811] bootstrap stuck and no login prompt
In-Reply-To: <bug-12811-163@https.bugs.busybox.net/>
References: <bug-12811-163@https.bugs.busybox.net/>
Message-ID: <bug-12811-163-KUHN3lX4P4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12811

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
- you switched the init system to systemd, needs a change of the kernel
commandline (otherwise your get two gettys running on the serial console and
none on the HDMI console):

  diff -u cmdline.txt_orig cmdline.txt
  --- cmdline.txt_orig
  +++ cmdline.txt
  @@ -1 +1 @@
  -root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
  +root=/dev/mmcblk0p2 rootwait console=ttyAMA0,115200 console=tty1

- the default /etc/ssh/sshd_config contains the following lines:

  #PermitRootLogin prohibit-password
  #PermitEmptyPasswords no

your have to change it too

  PermitRootLogin yes
  PermitEmptyPasswords yes

to enable ssh root access without a password (make sure your rpi is only
reachable via a private network)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
