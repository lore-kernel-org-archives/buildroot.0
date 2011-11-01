From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Nov 2011 01:29:09 +0000 (UTC)
Subject: [Buildroot] [Bug 4363] Make sure that copied linux and busybox
 defconfig are writable before modifying
In-Reply-To: <bug-4363-163@https.bugs.busybox.net/>
References: <bug-4363-163@https.bugs.busybox.net/>
Message-ID: <20111101012909.396578F30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4363

--- Comment #5 from Danomi Mocelopolis <d_mo1234@yahoo.com> 2011-11-01 01:29:08 UTC ---
(In reply to comment #4)
> I really don't understand why this would be necessary. Could you detail what
> you mean by "If the custom defconfigs are not checked out, then they are
> read-only" ?

For some version control systems, controlled files are read-only unless you
actually check the file out for modification.  Regardless, if the custom linux
or busybox defconfig is read-only (for whatever reason), then the copied file
(made by buildroot) will be read-only.  When that's the case, "sed -i" fails.

I.e., buildroot starts by copying the linux or busybox defconfig from where
ever it was set up in menuconfig to output/build/*/.config, then uses sed to
modify some of the selections according to other menuconfig settings.  If the
file comes out of the initial copy with read-only permissions, then the sed
will fail, and make will error out.

I would imagine that buildroot's Makefile.package.in does the "chmod -R +rw
$(@D)" when unpacking archives (prior to patching) for similar reasons, no?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
