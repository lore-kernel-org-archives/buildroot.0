From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2016 21:15:36 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-A1Q0WgFj4N@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is just a configuration problem, and not a bug in Buildroot.

The default /etc/sudoers file in Buildroot only contains:

root ALL=(ALL) ALL

And you have decided to enable in addition:

%sudo   ALL=(ALL) ALL

to allow users of the sudo group to be able to execute commands as root using
sudo.

However, when you enable PAM, we install the following default /etc/pam.d/sudo:

auth        sufficient   pam_rootok.so
auth        required     pam_wheel.so use_uid
auth        required     pam_env.so
auth        required     pam_unix.so nullok

account     required     pam_unix.so

password    required     pam_unix.so nullok

session     required     pam_limits.so
session     required     pam_env.so
session     required     pam_unix.so

The second line, that uses the pam_wheel.so is the one that restricts switching
to the root account to users members of the "wheel" group. If you want to allow
members of the sudo group to switch to root, you need to change it to:

auth        required     pam_wheel.so use_uid group=sudo

I've tested, and it just works fine.

But of course, whether you enable sudo for users that are part of the wheel
group, or part of the sudo group is only related to *your* customization of
/etc/sudoers.

So there's nothing wrong in Buildroot's current setup. If you had uncommented
the line in /etc/sudoers that allow users part of the wheel group to use sudo,
you wouldn't have seen this problem.

Therefore, I don't consider this as a bug, but simply as a system customization
issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
