From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 22:48:18 +0000 (UTC)
Subject: [Buildroot] [Bug 4363] Make sure that copied linux and busybox
 defconfig are writable before modifying
In-Reply-To: <bug-4363-163@https.bugs.busybox.net/>
References: <bug-4363-163@https.bugs.busybox.net/>
Message-ID: <20111022224818.49AE98EC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4363

--- Comment #2 from Danomi Mocelopolis <d_mo1234@yahoo.com> 2011-10-22 22:48:17 UTC ---
(In reply to comment #1)
> Is it required to also modify the group permission? I'd expect u+rw to be
> enough.

I'm okay with u+rw.

> Moreover, can we safely assume that the read permission is already set, so that
> u+w is the only thing that needs to happen?

I suppose, but why not do u+rw anyway?  I site the line that
fixes permissions after uncompressing package archives in
buildroot/package/Makefile.package.in:

    $(Q)chmod -R +rw $(@D)

But for my purposes, getting the +w would be good enough, if you feel
strongly about this.

(BTW, not sure if "+rw" is better than "u+rw".  I always specify
the u or ug.  The man for chmod leads me to believe that +rw might
open up beyond u depending on the umask setting.  Again, I'm not
picky on this point.)


> Thirdly, the same problem is probably present for many other locations, for
> example the uclibc config file, the default target skeleton (that you may want
> to modify from a post-build script) etc.
> To cater for your version control system (Clearcase?) all this should be fixed
> as well...

Actually, we're using Perforce, but I don't think that this is 
catering to Perforce in particular.  I think this would happen with 
any of the non-distributed version control systems (rcs, cvs, svn, ...).
No?

But I think you're right, that this probably effects any place
that there is a copy from a non-derived file, or a copy from
a file that wasn't untared by GENTARGETS, and a subsequent
edit of that file is attempted.  I just had to fix the ones that 
screwed my own projects, I didn't try to find other places.

So, I have made another patch that includes the changes in the
first patch, plus uclibc and target skeleton copies, plus any
other untar opts that I could find.  See what you think.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
