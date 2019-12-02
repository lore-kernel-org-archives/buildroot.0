From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 12:40:13 +0100
Subject: [Buildroot] [PATCH 1/3] package/jasper: Apply fix for
 CVE-2018-19541
In-Reply-To: <20191202095142.15115-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 2 Dec 2019 10:51:40 +0100")
References: <20191202095142.15115-1-jubalh@iodoru.org>
Message-ID: <87eexnot0i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Add 0001-verify-data-range-CVE-2018-19541.patch:
 > We need to verify the data is in the expected range. Otherwise we get
 > problems later.

 > Patch was proposed upstream[1] but upstream is very inactive. Linux
 > distributions use the same fix to patch their packages.

 > 1: https://github.com/mdadams/jasper/pull/211
 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Please also add your signed-off-by in the individual patches as pointed
out by utils/check-package:

package/jasper/0001-verify-data-range-CVE-2018-19541.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)

 > ---
 >  .../0001-verify-data-range-CVE-2018-19541.patch    | 34 ++++++++++++++++++++++
 >  1 file changed, 34 insertions(+)
 >  create mode 100644 package/jasper/0001-verify-data-range-CVE-2018-19541.patch

 > diff --git a/package/jasper/0001-verify-data-range-CVE-2018-19541.patch b/package/jasper/0001-verify-data-range-CVE-2018-19541.patch
 > new file mode 100644
 > index 0000000000..95812c4006
 > --- /dev/null
 > +++ b/package/jasper/0001-verify-data-range-CVE-2018-19541.patch
 > @@ -0,0 +1,34 @@
 > +From 24fc4d6f01d2d4c8297d1bebec02360f796e01c2 Mon Sep 17 00:00:00 2001
 > +From: Michael Vetter <jubalh@iodoru.org>
 > +Date: Mon, 4 Nov 2019 18:17:44 +0100
 > +Subject: [PATCH] Verify range data in jp2_pclr_getdata
 > +
 > +This fixes CVE-2018-19541.
 > +We need to verify the data is in the expected range. Otherwise we get
 > +problems later.
 > +
 > +This is a better fix for https://github.com/mdadams/jasper/pull/199
 > +which caused segfaults under certain circumstances.
 > +
 > +Patch by Adam Majer <adam.majer@suse.de>
 > +---
 > + src/libjasper/jp2/jp2_cod.c | 6 ++++++
 > + 1 file changed, 6 insertions(+)
 > +
 > +diff --git a/src/libjasper/jp2/jp2_cod.c b/src/libjasper/jp2/jp2_cod.c
 > +index 890e6ad..0f8d804 100644
 > +--- a/src/libjasper/jp2/jp2_cod.c
 > ++++ b/src/libjasper/jp2/jp2_cod.c
 > +@@ -855,6 +855,12 @@ static int jp2_pclr_getdata(jp2_box_t *box, jas_stream_t *in)
 > + 	  jp2_getuint8(in, &pclr->numchans)) {
 > + 		return -1;
 > + 	}
 > ++
 > ++    // verify in range data as per I.5.3.4 - Palette box
 > ++    if (pclr->numchans < 1 || pclr->numlutents < 1 || pclr->numlutents > 1024) {
 > ++        return -1;
 > ++    }
 > ++
 > + 	lutsize = pclr->numlutents * pclr->numchans;
 > + 	if (!(pclr->lutdata = jas_alloc2(lutsize, sizeof(int_fast32_t)))) {
 > + 		return -1;
 > -- 
 > 2.16.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
