From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 17:57:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/libbsd: needs dynamic library
In-Reply-To: <20210201175113.937333-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 1 Feb 2021 18:51:13 +0100")
References: <20210201175113.937333-1-fontaine.fabrice@gmail.com>
 <20210201175113.937333-2-fontaine.fabrice@gmail.com>
Message-ID: <87a6sjdb3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Static linking with libbsd fails because of multiple definition of the
 > strlcpy symbol. uClibc optionally provides these symbols.

 > So add a dependency on dynamic library to avoid a build failure with a
 > zeromq-enabled bitcoin or with stress-ng.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ba87544d42ad5e77a27a7a504bc6336a06f6e291

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/fwts/Config.in           | 5 +++--
 >  package/libbsd/Config.in         | 6 ++++--
 >  package/netcat-openbsd/Config.in | 6 ++++--
 >  3 files changed, 11 insertions(+), 6 deletions(-)

 > diff --git a/package/fwts/Config.in b/package/fwts/Config.in
 > index ff28a4a403..ac9a2e3909 100644
 > --- a/package/fwts/Config.in
 > +++ b/package/fwts/Config.in
 > @@ -5,6 +5,7 @@ config BR2_PACKAGE_FWTS
 >  	depends on BR2_USE_MMU # libglib2
 >  	depends on BR2_USE_WCHAR # libglib2, libbsd
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libbsd
 > +	depends on !BR2_STATIC_LIBS # libbsd
 >  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 >  	select BR2_PACKAGE_LIBGLIB2
 >  	select BR2_PACKAGE_LIBBSD
 > @@ -31,9 +32,9 @@ comment "efi_runtime module needs a Linux kernel to be built"
 >  	depends on !BR2_LINUX_KERNEL
 >  endif
 
 > -comment "fwts needs a glibc toolchain w/ wchar, threads"
 > +comment "fwts needs a glibc toolchain w/ wchar, threads, dynamic library"

..
 
 > -comment "netcat-openbsd needs a glibc toolchain w/ threads, headers >= 3.12"
 > +comment "netcat-openbsd needs a glibc toolchain w/ dynamic library, threads, headers >= 3.12"

These comments are a bit silly given that glibc implies dynamic, but OK.

-- 
Bye, Peter Korsgaard
