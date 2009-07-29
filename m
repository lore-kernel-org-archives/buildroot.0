From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 14:23:51 +0000 (UTC)
Subject: [Buildroot] [Bug 497] New: OpenSSL RSA key generation hangs on
	x86_64
Message-ID: <bug-497-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=497

            Target: x86_64
           Summary: OpenSSL RSA key generation hangs on x86_64
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


OpenSSL ends up in an endless 100% CPU loop when generating keys on x86_64.

E.g. when running "openssh" for the first time, or executing "openssl genrsa"


It seems that the openssl library buildroot produces includes code for 32-bit
systems, and does not work properly on x86_64.

In openssl.mk It tests for BR2_ARCH:

==
OPENSSL_TARGET_ARCH=generic32

[...]

ifeq ($(BR2_ARCH),x86_64)
OPENSSL_TARGET_ARCH=x86_64
endif
==

Not sure why, but this does not seem to work, and OpenSSL always builds as
"generic32"

If I use $(ARCH) instead, it does work properly and solves the key generation
problem:

==
ifeq ($(ARCH),x86_64)
OPENSSL_TARGET_ARCH=x86_64
endif
==


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
