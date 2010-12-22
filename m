From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Dec 2010 09:18:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2869] Do not erase source and build directories
 from the linux kernel build.
In-Reply-To: <bug-2869-163@https.bugs.busybox.net/>
References: <bug-2869-163@https.bugs.busybox.net/>
Message-ID: <20101222091836.505A78C9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2869

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I think I see the problem, but I don't think it is the correct fix: those two
symbolic links are intentionally being removed, because they point to
directories that are outside of the target root filesystem, so on the target
they do not make sense at all.

The current solution to build an out-of-tree kernel module is to use directly
the kernel source directory, whose location is in $(LINUX26_DIR). An example of
an out-of-tree kernel module packaged in Buildroot is package/linux-fusion/.

Another solution could be to do a "make modules_install" to the $(STAGING_DIR),
but keeping the symbolic links in that case. But I'm not sure it gives a huge
benefit compared to just using the kernel source code in $(LINUX26_DIR).

What do you think ?

Could you point us to the source code of the kernel module your are trying to
build ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
