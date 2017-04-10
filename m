From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Apr 2017 03:44:19 +0000
Subject: [Buildroot] [Bug 9436] e2fsprogs remove busybox applets even of
 unselected e2fsprogs components
In-Reply-To: <bug-9436-163@https.bugs.busybox.net/>
References: <bug-9436-163@https.bugs.busybox.net/>
Message-ID: <bug-9436-163-dpgLfxg3AD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9436

Carlos Santos <casantos@datacom.ind.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Carlos Santos <casantos@datacom.ind.br> ---
e2fsprogs does not provide an option to disable the build/instalation of chattr
and lsattr, so it is not possible to have "chattr" and "lsattr" from busybox
along with mkfs from e2fsprogs.

So far we attempted to solve the conflicts between busybox and e2fsprogs by
removing busybox programs from /bin and /sbin, leaving the e2fsprogs ones at
/usr/bin and /usr/sbin. This fails with BR2_ROOTFS_MERGED_USR=y, leading to
situations like the one described here. We could provide a better solution by
means of a fine-grained selection of programs, like util-linux does, but this
would require big changes in e2fsprogs.

So instead of resorting to dirty tricks we adopt a pragmatic approach:

1. Drop all configs to select/deselect utilities without corresponding
--enable/disable options to the configure script. In other words, we always
install the basic set of utilities.
2. Do not try to build UUID utilities, since they are disabled along with
libuuid (the util-linux ones must be used instead).
3. Install e2fsprogs utilities at /bin and /sbin, overriding the ones
eventually installed by busybox.

Notice that these changes do exactly the opposite of what is requested. On the
other hand the policy for e2fsprogs becomes coherent with the one for
util-linux: busybox never wins.

Notice that a patch solving several issues related to BR2_ROOTFS_MERGED_USR=y
was submitted for review:

    http://patchwork.ozlabs.org/patch/748826/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
