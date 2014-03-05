From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:46:03 +0100
Subject: [Buildroot] [PATCH] host-python{,
 3}: fix parallel install of libpython
In-Reply-To: <1393975789-1881-1-git-send-email-arnout@mind.be>
References: <53165F4D.5060405@mind.be>
 <1393975789-1881-1-git-send-email-arnout@mind.be>
Message-ID: <20140305194603.575d6eab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Wed,  5 Mar 2014 00:29:49 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> During installation, host-python and host-python3 run the freshly built
> python executable. This is done with a proper LD_LIBRARY_PATH to make
> sure it picks up the libpython in the build directory. However, the
> python binary has an RPATH pointing to the $(HOST_DIR)/usr/lib.
> Therefore, if libpython exists there, it will be used instead.
> 
> If the install step is run in parallel, it is possible that libpython
> is already partially copied to $(HOST_DIR)/usr/lib when python is run.
> This gives an error like:
> 
> python: error while loading shared libraries: $(HOST_DIR)/usr/lib/libpython3.4m.so.1.0: file too short
> 
> The fix is simple: use RUNPATH instead of RPATH, which allows
> LD_LIBRARY_PATH to override RUNPATH. That way, the libpython in the
> build directory is always used. RUNPATH is enabled by passing
> --enable-new-dtags to the linker.
> 
> Fixes e.g.
> http://autobuild.buildroot.net/results/2a6/2a62de3247ba5ad273f03d01e690a3eeb11aa7b4
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
