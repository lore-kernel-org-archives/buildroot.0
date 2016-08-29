From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 17:53:56 +0200
Subject: [Buildroot] [PATCH] libiio: Disable IIOD on Blackfin
In-Reply-To: <1472462723-18842-1-git-send-email-paul.cercueil@analog.com>
 (Paul Cercueil's message of "Mon, 29 Aug 2016 11:25:23 +0200")
References: <1472462723-18842-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <87fupn606j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul.cercueil@analog.com> writes:

 > IIOD uses accept4, which is not yet available on Blackfin.
 > Fixes:
 >  http://autobuild.buildroot.net/results/b75/b7552c9325ffcc7f1cb6e114b82648f3280fded6/

 > Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
 > ---
 >  package/libiio/Config.in | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/libiio/Config.in b/package/libiio/Config.in
 > index 69269e0..6f35715 100644
 > --- a/package/libiio/Config.in
 > +++ b/package/libiio/Config.in
 > @@ -53,6 +53,7 @@ config BR2_PACKAGE_LIBIIO_IIOD
 >  	bool "IIO Daemon"
 >  	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on !BR2_bfin
 >  	default y
 >  	help
 >  	  Install the IIO Daemon.
 > @@ -60,6 +61,9 @@ config BR2_PACKAGE_LIBIIO_IIOD
 >  comment "IIO Daemon needs a toolchain w/ threads"
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS

This comment no longer makes sense for bfin, so I added a 'depends on
!BR2_bfin'.

I verified that the system call indeed isn't wired up and committed with
that fix, thanks.


 > +comment "IIO Daemon is not yet available on Blackfin"
 > +	depends on BR2_bfin
 > +
 >  config BR2_PACKAGE_LIBIIO_TESTS
 >  	bool "Install test programs"
 >  	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 > -- 
 > 2.8.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
