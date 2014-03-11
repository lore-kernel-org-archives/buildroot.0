From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Mar 2014 23:38:28 +0100
Subject: [Buildroot] [PATCH] pcsc-lite: not available for static builds
In-Reply-To: <1394453433-18449-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 10 Mar 2014 12:10:33 +0000")
References: <1394453433-18449-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <871ty8qs2j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package requires dlopen and checks for it in the configure phase.
 > If it's not present, then the build process is stopped.

 > Fixes:
 >    http://autobuild.buildroot.net/results/34b/34b83c3ea4a8aac6aeda225e5859bd318b13a676/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/pcsc-lite/Config.in |    4 ++++
 >  1 files changed, 4 insertions(+), 0 deletions(-)

 > diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
 > index aab42e8..24981bd 100644
 > --- a/package/pcsc-lite/Config.in
 > +++ b/package/pcsc-lite/Config.in
 > @@ -2,6 +2,7 @@ config BR2_PACKAGE_PCSC_LITE
 >  	bool "pcsc-lite"
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	depends on BR2_USE_MMU # fork()
 > +	depends on !BR2_PREFER_STATIC_LIB

This dependency should also be propagated to the reverse dependencies of pcsc-lite.


 >  	help
 >  	  Middleware to access smart card using SCard API (PC/SC).
 
 > @@ -31,3 +32,6 @@ endif
 >  comment "pcsc-lite needs a toolchain w/ threads"
 >  	depends on BR2_USE_MMU
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS
 > +
 > +comment "pcsc-lite needs a toolchain w/ dynamic library"
 > +	depends on BR2_PREFER_STATIC_LIB

We normally merge all the toolchain dependency options together, E.G.:

comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
        depends on BR2_USE_MMU
        depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
