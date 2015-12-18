From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 23:32:30 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-TwlWMK3XwW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #6 from James Knight <james.knight@rockwellcollins.com> ---
(In reply to Thomas Petazzoni from comment #2)
I am using Buildroot's provided /etc/pam.d/sudo file.


(In reply to nroach44 from comment #3)
Interesting.

Just took a gander at Fedora's (22) variant:

cat /etc/pam.d/sudo
#%PAM-1.0
auth       include      system-auth
account    include      system-auth
password   include      system-auth
session    optional     pam_keyinit.so revoke
session    required     pam_limits.so
session    include      system-auth

(where system-auth file contains a boat load of more entries)

I guess Debian's PAM format varies from RedHat's PAM variant (although I
haven't really looked into it).


(In reply to Doug Kehn from comment #5)
Should Buildroot's sudo.pam work 'out of the box' with LDAP? I'm not against it
but just glancing at my own target, I do not have the pam_ldap.so module
installed.


(all)
While it might not fit all use cases, I believe the Buildroot-provided
/etc/pam.d/sudo file is generic enough for a standard setup; but, given the
woes that nroach44 is experiencing, it might be missing something.

@nroach44, in your sudo configuration you mentioned (comment #0) you have the
following:

%sudo ALL=(ALL) ALL

I assume you're trying to give the "sudo" group permission (instead of using
the wheel group). What happens when you try to alter the following file (see
[1]):

auth required pam_wheel.so use_uid group=sudo

I'm also curious if the root user can use sudo in your system (ie. I assume
`sudo echo a` is failing for your default user but does it also fail when
running under root)?

 [1]: http://www.linux-pam.org/Linux-PAM-html/sag-pam_wheel.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
