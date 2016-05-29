From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 May 2016 23:05:15 +0200
Subject: [Buildroot] [PATCH] libdrm: improve atomic handling,
	fix SPARCv8 build
In-Reply-To: <1464259996-7505-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 26 May 2016 12:53:16 +0200")
References: <1464259996-7505-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eg8k4ltg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit improves the handling of the "atomic stuff" in the libdrm
 > package. libdrm can either use the atomic intrinsics (4 byte variant)
 > when available, or otherwise can use libatomic_ops. Note that the
 > dependency on atomic operations is not from libdrm itself, but only
 > from some specific DRM drivers only.

 > Amongst other things, it fixes the build of the libdrm package on
 > SPARCv8, therefore fixing:

 >   http://autobuild.buildroot.org/results/74dd29b5ea146c320fde80a87a2fc910de9b7f60/

 > This commit does a number of changes that are all related to each
 > other:

 >  - Removes the dependency of the Intel DRM driver on
 >    libatomic_ops. The Intel DRM driver builds perfectly fine without
 >    libatomic_ops, as long as 4-byte variant __sync operations are
 >    available, which is always the case on x86 and x86_84 (which are
 >    the only architectures on which the Intel DRM driver can be
 >    enabled).

 >  - Adds an hidden Config.in boolean option
 >    BR2_PACKAGE_LIBDRM_HAS_ATOMIC that allows DRM driver that need
 >    atomic operation to know whether atomic support is available
 >    (either through intrinsics or through libatomic_ops).

 >  - Adds an hidden BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC Config.in option
 >    that DRM drivers that need atomic operation should select to ensure
 >    that the relevant dependencies are selected. It simply selects
 >    libatomic_ops if 4-byte atomic intrinsics are not available. We
 >    could let each DRM driver do this, but having an intermediate
 >    option avoids a bit of duplication.

 >  - Adds a patch that defines AO_REQUIRE_CAS before including
 >    <atomic_ops.h>. This is needed because libdrm uses the
 >    AO_compare_and_swap_full() which is only provided on all
 >    architectures when AO_REQUIRE_CAS is defined. The exact same fix
 >    was done in the erlang package in commit
 >    4a9df2942470241d7a96f326f0e7012aacd36f2e.

 >  - Adds the dependency on libatomic_ops when the package is enabled,
 >    and passes the necessary CFLAGS on SPARCv8 to make the thing build
 >    properly. The same CFLAGS are passed in the nginx package and bdwgc
 >    package.

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
