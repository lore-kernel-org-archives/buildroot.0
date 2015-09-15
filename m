From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 13:05:52 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec wants shutdown in /sbin,
 but systemd installs it in /usr/sbin
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915130552.896C67FF9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

Vicente Olivert Riera <vincent.riera@imgtec.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |NEW
            Summary|kexec fails due to missing  |kexec wants shutdown in
                   |/usr/sbin/shutdown          |/sbin, but systemd installs
                   |                            |it in /usr/sbin

--- Comment #11 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-09-15 13:05:52 UTC ---
(In reply to comment #10)
> Using kexec -l followed bu kexec -e will not shut down services correctly.

Well, but that's because you are using systemd, right? That would work with
busybox.

> but I think I should be able to use:
> 
> kexec -l 
> 
> followed by 
> 
> systemctl isolate kexec.target
> 
> to achieve what I want, as I think systemd should kexec the loaded kernel once
> services are shutdown.

Or, in the meantime, you can create the symlink to workaround the problem until
the patch from Yann gets applied.

You could also send a patch to kexec upstream in order to add...

execv("/usr/sbin/shutdown", args);

...to the my_shutdown() function, so it would also work on systemd although you
don't have the /bin, /sbin and /lib symlinks stuff.

So, to summarize and make progress on this issue:

- systemd: symlink workaround until Yann's patch OR fix kexec upstream
- sysvinit: already works
- busybox: use "kexec -e"

Should we mark this bug as RESOLVED DUPLICATE (of #8336), Peter?
For busybox you can use the "-e (--exec)" option

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
