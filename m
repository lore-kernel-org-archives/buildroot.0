From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 22:09:28 +0200
Subject: [Buildroot] [PATCH 3/3] pkgconf: Configure using
 pkgconf-personality
In-Reply-To: <7af4ded6-5fb5-7a45-a016-294a0ae52850@mind.be>
References: <20191001124132.107700-1-thomas.preston@codethink.co.uk>
 <20191001124132.107700-3-thomas.preston@codethink.co.uk>
 <ed2e5703-e1df-5d4c-f29f-2fde4ba96ffc@codethink.co.uk>
 <20191002202252.GJ10860@scaer>
 <81087355-77e9-68f1-a92f-cdef0ac569d2@codethink.co.uk>
 <7af4ded6-5fb5-7a45-a016-294a0ae52850@mind.be>
Message-ID: <20191012220928.4fdc5b90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 5 Oct 2019 15:43:36 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I think the personality approach is better than the wrapper script for sure.
> However, it's not always easy to override a package's idea of how to call
> pkg-config (e.g. quite a few use `pkg-config ...` in the Makefile directly - in
> fact, we do the same, in support/kconfig!). Therefore, I think a better approach
> is to have a separate "host" and "cross" bin directory, both of which contain a
> pkg-config (symlink or wrapper script). For cross-compilation, both directories
> are put in PATH, and for host compilation on the host directory.

I already expressed my opinion on this before, but I think the
pkg-config vs. TUPLE-pkg-config solution is the right thing to do. It
is really the standard way of doing this, the PKG_CHECK_MODULES()
autoconf macro looks first for TUPLE-pkg-config, before using
pkg-config.

Yes, it's not going to work with a number of packages that directly use
"pkg-config", but they should "simply" be fixed, no?

Another problem with the approach you suggest is that some packages
build both target code and host code. In this case, playing around with
two pkg-config binaries installed in two different locations isn't
going to work well. While with different names, you can have PKG_CONFIG
and PKG_CONFIG_FOR_BUILD with different values.

>  The cross dir can then also be populated with the -config script from
> STAGING_DIR, which avoids having to pass them explicitly in other packages.

That is admittedly an interesting argument.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
