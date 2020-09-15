From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 21:03:09 +0200
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <20200914200407.GB8792@scaer> (Yann E. MORIN's message of "Mon,
 14 Sep 2020 22:04:07 +0200")
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <20200914200407.GB8792@scaer>
Message-ID: <87pn6mrhg2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas?, All,
 > On 2019-12-04 16:02 +0100, Thomas Petazzoni spake thusly:
 >> Currently, the cross-compilation.conf installed in
 >> $(HOST_DIR)/etc/meson/cross-compilation.conf for use by the SDK is
 >> generated in a post-install-staging hook of the toolchain package.
 >> 
 >> With per-package directory support enabled, this means that the
 >> generated cross-compilation.conf contains references to the
 >> per-package directory of the toolchain/ package, which is not want we
 >> want:
 >> 
 >> [binaries]
 >> c = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-gcc'
 >> cpp = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-g++'
 >> ar = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-ar'
 >> strip = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-strip'
 >> pkgconfig = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/usr/bin/pkg-config'
 >> 
 >> So instead, we generate this file in TOOLCHAIN_TARGET_FINALIZE_HOOKS,
 >> so that the global paths are used:
 >> 
 >> [binaries]
 >> c = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc'
 >> cpp = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-g++'
 >> ar = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-ar'
 >> strip = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-strip'
 >> pkgconfig = '/home/thomas/projets/buildroot/output/host/usr/bin/pkg-config'
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > After giving it quite some thoughts, I think we do not want to provide
 > any guarantee about the stableness of target/ vs. host/ on a partial
 > rebuild, like Thomas P. said.

 > As such, I have applied this patch now.

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
