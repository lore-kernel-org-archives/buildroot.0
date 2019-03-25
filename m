From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:36:08 +0100
Subject: [Buildroot] [PATCH 3/3 v3] support/graph-depends: use the new
 make-based dependency tree
In-Reply-To: <e26ba891857584eb10bbfbe76ec45be8eb2551b8.1553288807.git.yann.morin.1998@free.fr>
References: <cover.1553288807.git.yann.morin.1998@free.fr>
 <e26ba891857584eb10bbfbe76ec45be8eb2551b8.1553288807.git.yann.morin.1998@free.fr>
Message-ID: <20190325193608.7f3472f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Mar 2019 22:07:07 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Now that we can get the whole dependency tree from make, use it to
> speed up things considerably.
> 
> So far, we had three functions to get the dependencies information:
> get_depends(), get_rdepends(), and, somehow unrelated, get_version().
> 
> Because of the way %-show-{,r}depends works, getting the dependency tree
> was expensive, the three functions all took a set of packages for which
> to get the dependencies, in an attempt to limit the time it took to get
> that tree, but we still had to call these functions iteratively, until
> they returned no new dependency. This was pretty costly.
> 
> Now, getting the tree is much, much less costly, and we can get the
> whole tree as cheaply as we previously got only the first-level
> dependencies.
> 
> Furthermore, we can now also get the version information at the same
> time, and that also brings in whether the package is virtual or not,
> target or host.
> 
> So, we drop all three helper functions, and replace them with a single
> one that returns all that information in one go: full dependency trees
> (direct and reverse), per-package type, and per-package version.
> 
> Note: since commit 2d29fd96a (pkg-virtual: remove VERSION/SOURCE),
> virtual packages are no longer reported as having a 'virtual' version,
> so have since been displayed as regular packages in the graphs. Although
> noone complained, this patch incidentally restores the initial
> behaviour, and virtual packages are now correctly displayed as such
> again.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> 
> ---
> Changes v2 -> v3:
>   - use defaultdict()  (Thomas P.)
>   - also return the rdeps while at it

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
