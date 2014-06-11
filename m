From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 14:53:45 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: fix static build against
	external libblkid
In-Reply-To: <20140611123159.GX4074@tarshish> (Baruch Siach's message of "Wed, 
 11 Jun 2014 15:31:59 +0300")
References: <72ae71741da36e003dd68da3677c6ce987df25a4.1402481709.git.baruch@tkos.co.il>
 <871tuvk9bj.fsf@dell.be.48ers.dk> <20140611123159.GX4074@tarshish>
Message-ID: <8738fbip46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> > +Patch status: sent upstream: http://patchwork.ozlabs.org/patch/358584/
 >> > +
 >> > + configure.in | 2 +-
 >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
 >> > +
 >> > +diff --git a/configure.in b/configure.in
 >> > +index 448a2926776a..ec6068320878 100644
 >> > +--- a/configure.in
 >> > ++++ b/configure.in
 >> > +@@ -551,7 +551,7 @@ then
 >> > + 		[LIBBLKID=`$PKG_CONFIG --libs blkid`;
 >> > + 		 STATIC_LIBBLKID=`$PKG_CONFIG --static --libs blkid`],
 >> > + 		[AC_MSG_ERROR([external blkid library not found])],
 >> > +-		[$LIBBLKID])
 >> > ++		[`$PKG_CONFIG --static --libs blkid`])
 >> 
 >> Why not '[$STATIC_LIBBLKID])' instead of rerunning pkg-config?

 > Quoting the autoconf manual:

 > AC_CHECK_LIB (LIBRARY, FUNCTION, [ACTION-IF-FOUND],
 > 		  [ACTION-IF-NOT-FOUND], [OTHER-LIBRARIES])

 > So, if I understand correctly, $STATIC_LIBBLKID in [ACTION-IF-FOUND] gets 
 > defined only after the test has run successfully.

Sorry, you're right - I misread the patch. It should arguably still pass
$LIBBLKID so the user can pass extra libraries, but looking at the
configure script I see it clears it just above, so it cannot be used
anyway.

Committed, thanks.

-- 
Bye, Peter Korsgaard
