From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Jun 2010 15:28:58 +0000 (UTC)
Subject: [Buildroot] [Bug 1807] LZMA 4.32.7,
	Required header file(s) are missing.
In-Reply-To: <bug-1807-163@https.bugs.busybox.net/>
References: <bug-1807-163@https.bugs.busybox.net/>
Message-ID: <20100605152858.7FCC012EF0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1807

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I strongly think that the problem is that you compiled your uClibc without the
UCLIBC_SUSV4_LEGACY option set to yes. When this option isn't set, the header
file utime.h doesn't get installed (and the corresponding functions are not
implemented in uClibc).

Our default configuration file for uClibc 0.9.31
(toolchain/uClibc/uClibc-0.9.31.config) enables this option. However, if you
built an uClibc configuration file yourself, by default, uClibc disables this
option.

It is definitely not possible in Buildroot to handle all possible combinations
of C library configurations (we handle a few modifications like locale support
or not, wide char support or not, IPv6 support or not, but we can't handle all
of them).

So, I don't realistically see what we can do at the Buildroot level to fix
this, except asking you to fix your uClibc configuration file :-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
