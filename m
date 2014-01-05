From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 22:09:06 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] genext2fs: e2fsck must run before tunefs -U
	random
In-Reply-To: <bug-6752-163@https.bugs.busybox.net/>
References: <bug-6752-163@https.bugs.busybox.net/>
Message-ID: <20140105220906.DEE6B9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-01-05 22:09:06 UTC ---
This is working fine for me.

Besides, in the comment you moved, there is an explanation
on why adding the UID has to be done *before* calling fsck:

---8<---
# genext2fs does not generate a UUID, but fsck will whine if one is
# is missing, so we need to add a UUID.
# Of course, this has to happend _before_ we run fsck.
---8<---

So, moving this block after fsck is not correct.

Also, I'm using ext2/3/4 quite a lot, and I did not catch
any issue with them so far.

I suspect there is another problem with your filesystem.
One such potential problem is missing space and/or inodes
in the filesystem, which prevents tune2fs and/or e2fsck
to work correctly.

Can you attach your defconfig, please?

You can get a defconfig by running:
    make savedefconfig

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
