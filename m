From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 11:51:29 +0200
Subject: [Buildroot] [PATCH v3 1/3] go-bootstrap: new host package
In-Reply-To: <20160422010950.GA28839@xdna.net>
References: <cover.1459798147.git.geoff@infradead.org>
 <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
 <20160420230245.2e5629d4@free-electrons.com>
 <20160422010950.GA28839@xdna.net>
Message-ID: <20160422115129.4c4b523b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Apr 2016 11:09:50 +1000, Cam Hutchison wrote:

> I just started playing with these patches a few days ago and made a local
> change to this patch that made sense to me - I removed the
> HOST_GO_BOOTSTRAP_INSTALL_CMDS because I did not see that it was useful
> to have the bootstrap compiler installed in the HOST_DIR. This mattered
> for me as I build the toolchain and install it system-wide to use for
> other builds, which refer to that toolchain as an external one.
> 
> I then changed the second patch to use HOST_GO_BOOTSTRAP_BUILDDIR
> instead of GO_BOOTSTRAP_FINAL.
> 
> Does this make sense to have in buildroot?

We normally try to not use things from the build directory of package A
when building package B. In an ideal world, things should be
implemented as if we could remove the build directory of a package once
it has been installed in the host/staging/target directories. It should
therefore install there everything that might be needed by packages
that depend on that package.

That being said:

 1/ There are already numerous exceptions to this rule. For example,
    all the external kernel modules directly refer to $(LINUX_DIR). And
    I guess there are other cases as well.

 2/ The host-go-bootstrap case is also somewhat special.

Let's see what Arnout/Peter/Yann think about this, whether we really
need to enforce this rule or not.

However, back to your original problem, I don't really see why the fact
that host-go-bootstrap is installed in $(HOST_DIR) prevents you from
installing the toolchain system-wide for use by other builds. Yes, it
increases the size of the host directory, but other than that I don't
see the technical limitation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
