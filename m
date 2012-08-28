From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 14:12:02 +0200
Subject: [Buildroot] Generating external toolchains with Buildroot
In-Reply-To: <503C7508.8030905@mind.be>
References: <20120825113012.44b2612f@skate>
	<503C7508.8030905@mind.be>
Message-ID: <20120828141202.60da849d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Aug 2012 09:36:40 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > Problem 1: everything is in usr/
> > ================================
> >
> [snip]
> >
> > Question: should we be changing our host directory policy and use
> > --prefix=$(HOST_DIR) instead of --prefix=$(HOST_DIR)/usr ? Or
> > should we keep things as it is and leave with this little drawback ?
> 
>   Yes!  I've always been annoyed with the redundant usr part,
> especially since two or three packages install in $(HOST_DIR)/bin...

Ah, really? Which ones?

>   It's a big change but can probably easily be automated with sed.

Well, most of the host packages are probably using the
host-autotools-package infrastructure, so those are easy to change:
only one place. Of course, all the host-generic-package would need
manual intervention.

Peter, what's your feeling about this?

> > For the toolchains that I've put online at
> > http://autobuild.buildroot.org/toolchains/tarballs/, I've solved
> > this problem by modifying Buildroot so that it builds mpfr, gmp and
> > mpc as static libraries, so that the gcc binaries do not depend to
> > any shared libraries besides the C library. And this seems to work
> > fine, though it is not a completely satisfying solution.
> 
>   I'm not sure if linking mpfr, gmp and mpc statically is so bad...

No, it's not so bad. It's just that from a "beauty" point of view, I
would have preferred to be able to link dynamically against them. Just
because we _should_ be able to do it :-)

> How much larger do the binaries become with static linking?  If it's
> not much larger, the startup of cc1 may actually become faster with
> static linking!
> 
>   Quick comparison: buildroot-built cc1 for gcc-4.5.3 is 11M;
> statically-linked cc1 from Sourcery's gcc-4.5.2 is 12M.

Yes, the impact is not that significant, you're right.

>   I think crosstool-NG links statically as well.  Yann?

Yes, crosstool-NG links statically.

> > Any ideas on this one? Should we add both -Wl,-rpath,$ORIGIN/../lib
> > and -Wl,-rpath,$ORIGIN/../../../../lib when building gcc to solve
> > this problem? Another solution?
> 
>   Not very nice.  Perhaps a specific rpath for linking cc1 and
> friends?

That means diving into the internal gcc build process. You, crazy
guy? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
