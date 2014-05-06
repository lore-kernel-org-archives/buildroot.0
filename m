From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 May 2014 07:01:02 +0000 (UTC)
Subject: [Buildroot] [Bug 4790] Running udhcpc on a system with NFS root
	kills NFS
In-Reply-To: <bug-4790-163@https.bugs.busybox.net/>
References: <bug-4790-163@https.bugs.busybox.net/>
Message-ID: <20140506070102.851D59CA5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4790

--- Comment #5 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-05-06 07:01:01 UTC ---
Peter, all,

What to do with this patch?
In commit 8432d81a849efca1d95ab0bd1324afd96bbdd804, changing buildroot's
udhcp.script file, Peter wrote:

http://git.buildroot.org/buildroot/commit/?id=8432d81a849efca1d95ab0bd1324afd96bbdd804

"Systems might have multiple network devices, and perhaps run udhcpc on
another interface even when booted over nfs, so don't disable the
per-interface deconfig based on the global nfsroot= setting on the kernel
command line.

If you don't want udhcpc to mess with kernel level IP autoconfiguration
(E.G. for nfs boot), you should instead ensure udhcpc/ifup/ifplugd isn't
started for that interface."


In that commit, an existing check for NFS boot was removed.
This bug basically requests such a check to be added again, but as mentioned in
the above commit message may not be desirable in all cases.

According to me, we should close this bug in 2014.05 (it has been open for more
than 2 years).
1. Either we stand with the commit mentioned above, and do not try to be too
smart. The user that does use NFS can use a rootfs-overlay or other mechanisms
to provide a custom configuration. We may want to describe this situation in
the manual to help unaware users.

2. Or we adapt the script based on the request in this bug, and let those NFS
users that do not use udhcpc on the NFS interface (but on others) use a rootfs
overlay.

One could argue that the simplest case (one network interface with NFS + dhcp)
is more common than the other ones, so alternative 2 is preferred to help most
users. Those developers that have a more complex setup, hopefully understand
the behavior of the system better to be able to tweak the script.

Another alternative is:
3. We add a config switch in the script that does one thing or the other, the
user can set this switch before the script is run, defaulting to one or the
other.

Input more than welcome, 
Thanks, Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
