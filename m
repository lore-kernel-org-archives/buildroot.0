From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Dec 2013 20:40:06 +0000 (UTC)
Subject: [Buildroot] [Bug 5390] System banner - change to empty doesn't
	remove /etc/issue
In-Reply-To: <bug-5390-163@https.bugs.busybox.net/>
References: <bug-5390-163@https.bugs.busybox.net/>
Message-ID: <20131204204006.269CA9BF0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5390

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-12-04 20:40:05 UTC ---
This is "expected": Buildroot doesn't track the configuration changes that are
made to update the root filesystem after just a "make" invocation. For example,
if you remove a package from your configuration, and then run "make", then the
files installed by this package in the previous build are not going to be
removed from the root filesystem.

It's the same for this /etc/issue thing. If the BR2_TARGET_GENERIC_ISSUE option
is empty at the first build, then no /etc/issue file gets created.

Otherwise, if you change BR2_TARGET_GENERIC_ISSUE after the first build, then
the file will remain as it was before, until you do a "make clean all" cycle.

Even though fixing this would not be very difficult, I don't think we really
want to do it, since we anyway don't do it for the vast majority of other
Buildroot configuration options.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
