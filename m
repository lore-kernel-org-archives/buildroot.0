From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 09:22:22 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915092222.CAA9E7FA14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #6 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-09-15 09:22:22 UTC ---
(In reply to comment #0)
> Chaining a new kernel using kexec fails as /usr/sbin/shutdown is missing.

That's not correct. /usr/sbin/shutdown does exists. The problem is that kexec
is trying to find it at /sbin instead of /usr/sbin.

(In reply to comment #3)
> I also raised a similay bug report 8336, to which I had a responce citing
> http://patchwork.ozlabs.org/patch/514750/ as a fix.  That patch should also fix
> this bug.

Currently in Buildroot there are two ways to have shutdown installed in your
target. The first one is using sysvinit as you init system, which will install
shutdown in /sbin. The second one is using systemd as your init system, which
will install shutdown in /usr/sbin.

Once we get the patch from Yann merged, kexec will be able to find shutdown
because /sbin will be a symlink to /usr/sbin if you use systemd as your init
system. So, yes, that patches fixes your problem.

The thing is that here we have highlighted a different problem. Busybox doesn't
install shutdown, so kexec will never be able to find it, either if you have
/sbin as a real directory or being a symlink to /usr/sbin. It simply doesn't
exist.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
