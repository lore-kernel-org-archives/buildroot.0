From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 09:26:41 +0200
Subject: [Buildroot] [PATCH 1/6] boost: disable on NIOS 2 with broken
	toolchains
In-Reply-To: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 15 May 2015 20:23:48 +0200")
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874mndc79q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The current NIOS 2 toolchains are not capable of building Boost, so
 > let's disable it and its reverse dependencies. Even though it's not
 > strictly an architecture dependency, we use the <pkg>_ARCH_SUPPORTS
 > paradigm for this dependency, since it simplifies a lot handling all
 > boost reverse dependencies, and is anyway quite similar to an
 > architecture dependency since we don't display a comment about this
 > dependency.

 > Fixes:

 >   http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/boost/Config.in            | 6 ++++++
 >  package/cc-tool/Config.in          | 2 ++
 >  package/gnuradio/Config.in         | 2 ++
 >  package/kodi/Config.in             | 3 ++-
 >  package/libftdi1/Config.in         | 2 ++
 >  package/mpd/Config.in              | 1 +
 >  package/pulseview/Config.in        | 2 ++
 >  package/python-libconfig/Config.in | 2 ++
 >  package/thrift/Config.in           | 2 ++
 >  package/yaml-cpp/Config.in         | 2 ++
 >  package/zmqpp/Config.in            | 2 ++
 >  11 files changed, 25 insertions(+), 1 deletion(-)

[snip]

 > +++ b/package/libftdi1/Config.in
 > @@ -14,11 +14,13 @@ config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1

Not related to this patch, but there's a typo in this symbol (FTDI1 not
TFDI1). I'll fix that.

> +++ b/package/mpd/Config.in
 > @@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_MPD
 >  	# sparc & CS powerpc gcc are too old
 >  	depends on !BR2_sparc
 >  	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 > +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 >  	select BR2_PACKAGE_BOOST
 >  	select BR2_PACKAGE_LIBGLIB2
 >  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

You forgot to update the comment. I know it doesn't have any practical
impact right now as mpd needs mmu, but we should still add it in case
some other archs needs to get blacklisted.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
