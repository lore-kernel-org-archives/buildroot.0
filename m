From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 12:00:06 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-raDlQsmQJj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #3 from nroach44 at gmail.com ---
Just performed a test using the /etc/pam.d/sudo file from debian.

Using buildroot's sudo file a password is prompted for, but it's always wrong

cat /etc/pam.d/sudo
auth        sufficient   pam_rootok.so
auth        required     pam_wheel.so use_uid
auth        required     pam_env.so
auth        required     pam_unix.so nullok

account     required     pam_unix.so

password    required     pam_unix.so nullok

session     required     pam_limits.so
session     required     pam_env.so
session     required     pam_unix.so
###

Using debian's sudo file a password is not prompted for and simply fails three
times:

cat /etc/pam.d/sudo
#%PAM-1.0

@include common-auth
@include common-account
@include common-session-noninteractive
###

[nroach44 at charon ~]$ sudo bash
Sorry, try again.
Sorry, try again.
sudo: 3 incorrect password attempts

The following shows in journalctl:

Jan 01 09:01:25 charon sudo[1094]: PAM (sudo) illegal module type: @include
Jan 01 09:01:25 charon sudo[1094]: PAM pam_parse: expecting return value;
[...common-auth]
Jan 01 09:01:25 charon sudo[1094]: PAM (sudo) no module name supplied

So it seems like the format is different for whatever reason.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
