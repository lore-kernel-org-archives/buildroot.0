From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Mar 2010 08:44:32 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100319084432.4301F776BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-19 08:44:30 UTC ---
(In reply to comment #0)

> The patch modifies config and the top level Makefile so that all files reside
> in the output folder. Feedback welcome. Could go further and tidy some things
> up as well but have not done so. In particular we generate .auto.deps but never
> seem to use it. Also have not updated
> package/config/kconfig-to-buildroot2.patch as the previous patch was old and
> the instructions on how to generate it were incorrect.

Thanks, it looks very interesting. I have given it a quick try and see two
things I would like to change:

 - The .config location has moved to output/.config if you don't use O=. I
would prefer to keep it like it is for non-O= builds (easy to do by adding
something like CONFIG_DIR that is either set to $(TOPDIR) or $(O) depending on
if O is passed.

 - Some temporary files are still written to TOPDIR, breaking the renames when
O= points to another file system:

[pid 28140] rename("/tmp/br/.config", "/tmp/br/.config.old") = 0
[pid 28140] rename(".tmpconfig.28140", "/tmp/br/.config") = -1 EXDEV (Invalid
cross-device link)
[pid 28140] write(2, "\n*** Error during writing of the"..., 59
*** Error during writing of the Buildroot configuration.

I'll have a closer look at fixing this next week, unless someone beats me to
it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
