From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2015 11:19:49 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/audit: not available
	for musl
In-Reply-To: <1439503065-12462-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 13 Aug 2015 23:57:45 +0200")
References: <1439503065-12462-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d1yl7y2y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > audit uses strndupa() which is missing from musl.
 > Even though the implementation of strndupa is not too complex, we won't
 > go as far as duplicating it in audit, and we just disable audit for the
 > musl C library.

 > Fixes;
 >     http://autobuild.buildroot.org/results/e22/e22a70f9ff14bc52f642a6135da44c14e41b6cbb/
 >     http://autobuild.buildroot.org/results/233/2333c9b3d8f81b15602263b918d422e440f09d60/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>

 > ---
 > Note: musl does have strdupa() so maybe strndupa is just a few commits
 > away. Need to revisit later?
 > ---
 >  package/audit/0001-Missed-cross-compile-fixes.patch | 0
 >  package/audit/Config.in                             | 6 ++++--
 >  2 files changed, 4 insertions(+), 2 deletions(-)
 >  mode change 100755 => 100644 package/audit/0001-Missed-cross-compile-fixes.patch

 > diff --git a/package/audit/0001-Missed-cross-compile-fixes.patch b/package/audit/0001-Missed-cross-compile-fixes.patch
 > old mode 100755
 > new mode 100644
 > diff --git a/package/audit/Config.in b/package/audit/Config.in
 > index 8ac1b4f..717c364 100644
 > --- a/package/audit/Config.in
 > +++ b/package/audit/Config.in
 > @@ -9,6 +9,7 @@ config BR2_PACKAGE_AUDIT
 >  	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	depends on !BR2_STATIC_LIBS
 > +	depends on !BR2_TOOLCHAIN_USES_MUSL

Minor nit: It would have been good to add a comment like

# no strndupa()

So it is clear why we don't allow it without looking at the git history.

-- 
Bye, Peter Korsgaard
