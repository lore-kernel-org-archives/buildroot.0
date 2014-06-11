From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Jun 2014 15:31:59 +0300
Subject: [Buildroot] [PATCH] e2fsprogs: fix static build against
	external libblkid
In-Reply-To: <871tuvk9bj.fsf@dell.be.48ers.dk>
References: <72ae71741da36e003dd68da3677c6ce987df25a4.1402481709.git.baruch@tkos.co.il>
 <871tuvk9bj.fsf@dell.be.48ers.dk>
Message-ID: <20140611123159.GX4074@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Jun 11, 2014 at 12:52:00PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/0159246b52659508a4bbba4126ab27b28a2b2e2c/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  ...n-fix-external-libblkid-test-for-static-l.patch | 34 ++++++++++++++++++++++
>  >  1 file changed, 34 insertions(+)
>  >  create mode 100644 package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
> 
>  > diff --git a/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch b/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
>  > new file mode 100644
>  > index 000000000000..65d6c4c024bc
>  > --- /dev/null
>  > +++ b/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
>  > @@ -0,0 +1,34 @@
>  > +From b52e76432fe23490b891884f3a66504101c2a5bd Mon Sep 17 00:00:00 2001
>  > +Message-Id: <b52e76432fe23490b891884f3a66504101c2a5bd.1402480818.git.baruch@tkos.co.il>
>  > +From: Baruch Siach <baruch@tkos.co.il>
>  > +Date: Wed, 11 Jun 2014 12:56:15 +0300
>  > +Subject: [PATCH] configure.in: fix external libblkid test for static link
>  > +
>  > +External libblkid needs -luuid when linking statically. Use pkg-config to
>  > +determine it correctly. Adding --static doesn't hurt even for dynamic
>  > +linking.
>  > +
>  > +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > +---
>  > +
>  > +Patch status: sent upstream: http://patchwork.ozlabs.org/patch/358584/
>  > +
>  > + configure.in | 2 +-
>  > + 1 file changed, 1 insertion(+), 1 deletion(-)
>  > +
>  > +diff --git a/configure.in b/configure.in
>  > +index 448a2926776a..ec6068320878 100644
>  > +--- a/configure.in
>  > ++++ b/configure.in
>  > +@@ -551,7 +551,7 @@ then
>  > + 		[LIBBLKID=`$PKG_CONFIG --libs blkid`;
>  > + 		 STATIC_LIBBLKID=`$PKG_CONFIG --static --libs blkid`],
>  > + 		[AC_MSG_ERROR([external blkid library not found])],
>  > +-		[$LIBBLKID])
>  > ++		[`$PKG_CONFIG --static --libs blkid`])
> 
> Why not '[$STATIC_LIBBLKID])' instead of rerunning pkg-config?

Quoting the autoconf manual:

AC_CHECK_LIB (LIBRARY, FUNCTION, [ACTION-IF-FOUND],
		  [ACTION-IF-NOT-FOUND], [OTHER-LIBRARIES])

So, if I understand correctly, $STATIC_LIBBLKID in [ACTION-IF-FOUND] gets 
defined only after the test has run successfully.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
