From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 18:18:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140608181827.365369CF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #8 from Mike Z <minimod@morethan.org> 2014-06-08 18:18:26 UTC ---
(In reply to comment #7)
> (In reply to comment #6)
> > (In reply to comment #5)
> > > Is what you wrote here correct? (No copy paste error?) Case one and two are
> > > identical?
> > > Have you tried four dollar signs? Depending on how things are parsed it may be
> > > needed...
> > >
> > 
> > Yup - not what I expected either.*
> > 
> > Will recheck for cockpit error here and the $$$$ case.
> 
> Well, I've already spent hours trying to figure out the right escape
> sequence... in vain :-(
> 
> I even ended up with some mad sequences of '$' and '\'.
> [1] is just an example of the dirty things I tried! My advice: don't go there
> ;-).
> 
> To me, escaping '$' is a dead end (or at least, really hard, except fo
> CMake-based packages) because of:
> - the make/shell escape character is '$' vs. '\';
> - the unpredictable (or hard-to-predict) level/number of make/shell nested,
> even for packages using the autotools (Makefile + libtool + ... + custom
> commands).
> 
> That's why I end up thinking that a solution based on chrpath or patchelf is
> the only sane way of handling the '$ORIGIN' support in RPATH (for both target
> and host packages).
> 
> BTW, this is part of the "relocatable SDK" item, which is somewhere in my todo
> list. I have a couple of branches (maybe more than just a couple) in my github
> in which I test things from time to time, and that one day, I should gather and
> post a real RFC.
> 
> 
> [1]
> https://github.com/tSed/buildroot/commit/7d53fe664afd3c98b3609994c5bf2addf2f4f692

Agreed - add host-patchelf to the packages and let some's post-build
script deal with this.

If your working on a relocatable toolchain - note that your going to
have to diddle glibc and its support binaries also.

- - -

But as requested earlier - the additional tests for the record:

The earlier ${ORIGIN} and &&{ORIGIN} cases **ARE** the same result.

Four $ case: $$$${ORIGIN}/../lib

 0x0000000f (RPATH)                      Library rpath: [27445{ORIGIN}/../lib]
 0x0000001d (RUNPATH)                    Library runpath:
[27445{ORIGIN}/../lib]

These are out-of-tree builds -
'/home/mszick/kA8/.' is the contents of $O

Single $ case: $ORIGIN/../lib

 0x0000000f (RPATH)                      Library rpath:
[/home/mszick/kA8/.RIGIN/../lib]
 0x0000001d (RUNPATH)                    Library runpath:
[/home/mszick/kA8/.RIGIN/../lib]

Double $ case $$ORIGIN/../lib

 0x0000000f (RPATH)                      Library rpath: [/../lib]
 0x0000001d (RUNPATH)                    Library runpath: [/../lib]

Triple $ case $$$ORIGIN/../lib

 0x0000000f (RPATH)                      Library rpath:
[home/mszick/kA8/.RIGIN/../lib]
 0x0000001d (RUNPATH)                    Library runpath:
[home/mszick/kA8/.RIGIN/../lib]

Quad $ case $$$$ORIGIN/../lib

 0x0000000f (RPATH)                      Library rpath: [3092ORIGIN/../lib]
 0x0000001d (RUNPATH)                    Library runpath: [3092ORIGIN/../lib]

The only pattern I see here is odd/even $ count.

PS: 
rpath and runpath can be relative paths (in glibc-2.19 at least).
but the path is resolved relative to cwd, not executable's location.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
