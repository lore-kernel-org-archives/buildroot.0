From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:49:46 +0200
Subject: [Buildroot] [PATCH] toolchain: GCC bug 85862
In-Reply-To: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 21 May 2018 15:29:42 -0500")
References: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87k1rwisqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > GCC < 7.x hangs while building libnss for the Microblaze Arch.
 > Discovered by
 > http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df

 > Reported:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862

 > Simlar to:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=49218

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/ecryptfs-utils/Config.in | 4 ++++
 >  package/libnss/Config.in         | 4 ++++
 >  toolchain/Config.in              | 8 ++++++++

You forgot qt5webengine. I know that qt5webengine currently isn't
available for Microblaze / issue only happens on Microblaze, but I have
added it anyway for consistency.

>  3 files changed, 16 insertions(+)

 > diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
 > index bb4cc64..9d4a905 100644
 > --- a/package/ecryptfs-utils/Config.in
 > +++ b/package/ecryptfs-utils/Config.in
 > @@ -7,6 +7,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 >  	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 >  	depends on !BR2_MIPS_NABI32 # libnss
 >  	depends on !BR2_STATIC_LIBS # libnss, keyutils
 > +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # microblaze specific & GCC < 7.x
 >  	select BR2_PACKAGE_KEYUTILS
 >  	select BR2_PACKAGE_LIBNSS
 >  	# runtime dependency only, some scripts are using the
 > @@ -35,3 +36,6 @@ comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
 >  	depends on BR2_USE_MMU
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 >  		BR2_STATIC_LIBS
 > +
 > +comment "ecryptfs selects libnss and libnss needs a toolchain not affected by GCC bug 85862"
 > +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862

We normally just say 'ecryptfs needs a toolchain not affected by..', so
I've changed it to that and committed, thanks.

-- 
Bye, Peter Korsgaard
