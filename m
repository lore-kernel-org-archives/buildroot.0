From: Cam Hutchison <camh@xdna.net>
Date: Sat, 23 Apr 2016 07:41:56 +1000
Subject: [Buildroot] [PATCH v3 1/3] go-bootstrap: new host package
In-Reply-To: <20160422115129.4c4b523b@free-electrons.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
 <20160420230245.2e5629d4@free-electrons.com>
 <20160422010950.GA28839@xdna.net>
 <20160422115129.4c4b523b@free-electrons.com>
Message-ID: <20160422214156.GA2816@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 22 Apr 2016 11:09:50 +1000, Cam Hutchison wrote:
> 
> > [leaving and using host-go-bootstrap in its BUILDDIR]
> 
> We normally try to not use things from the build directory of package A
> when building package B. 

I agree that it is not ideal to reach into the builddir of another
package. Ludovic Guegan implemented an alternative where the host-golang
package encapsulated the bootstrap compiler rather than using a separate
package. This makes some sense since the bootstrap compiler is purely
internal to the build of the go compiler.

But the implementation meant that extraction and build of the bootstrap
compiler was just replicaing what buildroot already does and gave less
control (you couldn't run "make host-go-bootstrap-build" for example),
which made it more tedious to iterate some change I was trying.

A separate go-bootstrap package makes better use of buildroot's
infrastructure.

> However, back to your original problem, I don't really see why the fact
> that host-go-bootstrap is installed in $(HOST_DIR) prevents you from
> installing the toolchain system-wide for use by other builds. Yes, it
> increases the size of the host directory, but other than that I don't
> see the technical limitation.

With two go compiler installed in the host dir, it becomes possible for
someone to use the wrong one. Since the sources are also installed in
the host dir, two sets of sources - one older than the other - will be
installed. That's annoying when you want to index it (ctags, etc) for
easy navigation. Having both full compilers (one completely unncessary)
just feels like laying a land mine.

When it is just the outputdir, I don't mind so much but when installed
system-wide, I'm usually quite careful about what gets installed.

I could also just delete it in a post-install script. But not doing
something is better than doing it and undoing it.

Perhaps this is just all personal preference, in which case I'll
maintain a local patch. I'm happy that go has made it into buildroot.
