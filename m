Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2D5C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 476EF40E04;
	Mon, 19 May 2025 16:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SA1hqo0XZmlf; Mon, 19 May 2025 16:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C039410B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C039410B0;
	Mon, 19 May 2025 16:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5391DD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5DC60A8F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAccLcoH0Xqb for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8A0C60ABC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8A0C60ABC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9540D87467; Mon, 19 May 2025 16:42:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:40:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fcf8bdc62aa419991273ff120d408273c8f85f1e
X-Git-Newrev: 45cdb5decb6e9c5f0e908c055b2cd721f0e8c476
X-Patchwork-Hint: ignore
Message-Id: <20250519164229.9540D87467@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mjpegtools: fix build
 with gcc-15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45cdb5decb6e9c5f0e908c055b2cd721f0e8c476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mjpegtools/0001-gcc15.patch | 354 ++++++++++++++++++++++++++++++++++++
 1 file changed, 354 insertions(+)

diff --git a/package/mjpegtools/0001-gcc15.patch b/package/mjpegtools/0001-gcc15.patch
new file mode 100644
index 0000000000..019317c7fd
--- /dev/null
+++ b/package/mjpegtools/0001-gcc15.patch
@@ -0,0 +1,354 @@
+Fix build with gcc-15.x
+
+Upstream: https://sourceforge.net/p/mjpeg/Code/3513/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: trunk/mjpeg_play/y4mdenoise/Region2D.hh
+===================================================================
+--- mjpeg_play/y4mdenoise/Region2D.hh	(Revision 3512)
++++ mjpeg_play/y4mdenoise/Region2D.hh	(Revision 3513)
+@@ -97,35 +97,11 @@
+ 		// Add the given horizontal extent to the region.  Note that
+ 		// a_tnXEnd is technically one past the end of the extent.
+ 
+-	template <class REGION, class REGION_TEMP>
+-	void UnionDebug (Status_t &a_reStatus, INDEX a_tnY,
+-			INDEX a_tnXStart, INDEX a_tnXEnd, REGION_TEMP &a_rTemp);
+-		// Add the given horizontal extent to the region.  Note that
+-		// a_tnXEnd is technically one past the end of the extent.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+-
+ 	template <class REGION>
+ 	void Union (Status_t &a_reStatus, const REGION &a_rOther);
+ 		// Make the current region represent the union between itself
+ 		// and the other given region.
+ 
+-	template <class REGION, class REGION_O, class REGION_TEMP>
+-	void UnionDebug (Status_t &a_reStatus,
+-			REGION_O &a_rOther, REGION_TEMP &a_rTemp);
+-		// Make the current region represent the union between itself
+-		// and the other given region.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+-
+ 	//void Merge (Status_t &a_reStatus, INDEX a_tnY, INDEX a_tnXStart,
+ 	//		INDEX a_tnXEnd);
+ 		// Merge this extent into the current region.
+@@ -166,36 +142,11 @@
+ 		// Subtract the given horizontal extent from the region.  Note
+ 		// that a_tnXEnd is technically one past the end of the extent.
+ 
+-	template <class REGION_TEMP>
+-	void SubtractDebug (Status_t &a_reStatus, INDEX a_tnY,
+-			INDEX a_tnXStart, INDEX a_tnXEnd, REGION_TEMP &a_rTemp);
+-		// Subtract the given horizontal extent from the region.  Note
+-		// that a_tnXEnd is technically one past the end of the extent.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+-
+ 	template <class REGION>
+ 	void Subtract (Status_t &a_reStatus, const REGION &a_rOther);
+ 		// Subtract the other region from the current region, i.e.
+ 		// remove from the current region any extents that exist in the
+ 		// other region.
+-	
+-	template <class REGION, class REGION_O, class REGION_TEMP>
+-	void SubtractDebug (Status_t &a_reStatus, REGION_O &a_rOther,
+-			REGION_TEMP &a_rTemp);
+-		// Subtract the other region from the current region, i.e.
+-		// remove from the current region any extents that exist in the
+-		// other region.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+ 
+ 	//typedef ... ConstIterator;
+ 	//ConstIterator Begin (void) const { return m_setExtents.Begin(); }
+@@ -404,85 +355,6 @@
+ 
+ 
+ 
+-// Add the given horizontal extent to the region.
+-template <class INDEX, class SIZE>
+-template <class REGION, class REGION_TEMP>
+-void
+-Region2D<INDEX,SIZE>::UnionDebug (Status_t &a_reStatus, INDEX a_tnY,
+-	INDEX a_tnXStart, INDEX a_tnXEnd, REGION_TEMP &a_rTemp)
+-{
+-	typename REGION::ConstIterator itHere;
+-	typename REGION_TEMP::ConstIterator itHereO;
+-	INDEX tnX;
+-		// Used to loop through points.
+-
+-	// Make sure they didn't start us off with an error.
+-	assert (a_reStatus == g_kNoError);
+-
+-	// Calculate the union.
+-	a_rTemp.Assign (a_reStatus, *this);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	a_rTemp.Union (a_reStatus, a_tnY, a_tnXStart, a_tnXEnd);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	
+-	// Loop through every point in the result, make sure it's in
+-	// one of the two input regions.
+-	for (itHereO = a_rTemp.Begin(); itHereO != a_rTemp.End(); ++itHereO)
+-	{
+-		const Extent &rHere = *itHereO;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!((rHere.m_tnY == a_tnY
+-				&& (tnX >= a_tnXStart && tnX < a_tnXEnd))
+-			|| this->DoesContainPoint (rHere.m_tnY, tnX)))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the original region, make sure
+-	// it's in the result.
+-	for (itHere = this->Begin(); itHere != this->End(); ++itHere)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the added extent, make sure it's in
+-	// the result.
+-	for (tnX = a_tnXStart; tnX < a_tnXEnd; ++tnX)
+-	{
+-		if (!a_rTemp.DoesContainPoint (a_tnY, tnX))
+-			goto error;
+-	}
+-
+-	// The operation succeeded.  Commit it.
+-	Assign (a_reStatus, a_rTemp);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-
+-	// All done.
+-	return;
+-
+-error:
+-	// Handle deviations.
+-	fprintf (stderr, "Region2D::Union() failed\n");
+-	fprintf (stderr, "Input region:\n");
+-	PrintRegion (*this);
+-	fprintf (stderr, "Input extent: [%d,%d-%d]\n",
+-		int (a_tnY), int (a_tnXStart), int (a_tnXEnd));
+-	fprintf (stderr, "Result:\n");
+-	PrintRegion (a_rTemp);
+-	assert (false);
+-}
+-
+-
+-
+ // Make the current region represent the union between itself
+ // and the other given region.
+ template <class INDEX, class SIZE>
+@@ -511,184 +383,6 @@
+ 	}
+ }
+ 
+-
+-
+-// Make the current region represent the union between itself
+-// and the other given region.
+-template <class INDEX, class SIZE>
+-template <class REGION, class REGION_O, class REGION_TEMP>
+-void
+-Region2D<INDEX,SIZE>::UnionDebug (Status_t &a_reStatus,
+-	REGION_O &a_rOther, REGION_TEMP &a_rTemp)
+-{
+-	typename REGION::ConstIterator itHere;
+-	typename REGION_O::ConstIterator itHereO;
+-	typename REGION_TEMP::ConstIterator itHereT;
+-	INDEX tnX;
+-		// Used to loop through points.
+-
+-	// Make sure they didn't start us off with an error.
+-	assert (a_reStatus == g_kNoError);
+-
+-	// Calculate the union.
+-	a_rTemp.Assign (a_reStatus, *this);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	a_rTemp.Union (a_reStatus, a_rOther);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	
+-	// Loop through every point in the result, make sure it's in
+-	// one of the two input regions.
+-	for (itHereT = a_rTemp.Begin(); itHereT != a_rTemp.End(); ++itHereT)
+-	{
+-		const Extent &rHere = *itHereT;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rOther.DoesContainPoint (rHere.m_tnY, tnX)
+-			&& !this->DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the first input region, make sure
+-	// it's in the result.
+-	for (itHere = this->Begin(); itHere != this->End(); ++itHere)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the second input region, make sure
+-	// it's in the result.
+-	for (itHereO = a_rOther.Begin();
+-		 itHereO != a_rOther.End();
+-		 ++itHereO)
+-	{
+-		const Extent &rHere = *itHereO;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// The operation succeeded.  Commit it.
+-	Assign (a_reStatus, a_rTemp);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-
+-	// All done.
+-	return;
+-
+-error:
+-	// Handle deviations.
+-	fprintf (stderr, "Region2D::Union() failed\n");
+-	fprintf (stderr, "First input region:\n");
+-	PrintRegion (*this);
+-	fprintf (stderr, "Second input region:\n");
+-	PrintRegion (a_rOther);
+-	fprintf (stderr, "Result:\n");
+-	PrintRegion (a_rTemp);
+-	assert (false);
+-}
+-
+-
+-
+-// Subtract the other region from the current region, i.e.
+-// remove from the current region any areas that exist in the
+-// other region.
+-template <class INDEX, class SIZE>
+-template <class REGION, class REGION_O, class REGION_TEMP>
+-void
+-Region2D<INDEX,SIZE>::SubtractDebug (Status_t &a_reStatus,
+-	REGION_O &a_rOther, REGION_TEMP &a_rTemp)
+-{
+-	typename REGION::ConstIterator itHere;
+-	typename REGION_O::ConstIterator itHereO;
+-	typename REGION_TEMP::ConstIterator itHereT;
+-	INDEX tnX;
+-		// Used to loop through points.
+-
+-	// Make sure they didn't start us off with an error.
+-	assert (a_reStatus == g_kNoError);
+-
+-	// Calculate the difference.
+-	a_rTemp.Assign (a_reStatus, *this);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	a_rTemp.Subtract (a_reStatus, a_rOther);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	
+-	// Loop through every point in the result, make sure it's in
+-	// the first input region but not the second.
+-	for (itHereT = a_rTemp.Begin(); itHereT != a_rTemp.End(); ++itHereT)
+-	{
+-		const Extent &rHere = *itHereT;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!(this->DoesContainPoint (rHere.m_tnY, tnX)
+-			&& !a_rOther.DoesContainPoint (rHere.m_tnY, tnX)))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the first input region, and if it's
+-	// not in the second input region, make sure it's in the result.
+-	for (itHere = this->Begin(); itHere != this->End(); ++itHere)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rOther.DoesContainPoint (rHere.m_tnY, tnX))
+-			{
+-				if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-					goto error;
+-			}
+-		}
+-	}
+-
+-	// Loop through every point in the second input region, make sure
+-	// it's not in the result.
+-	for (itHereO = a_rOther.Begin();
+-		 itHereO != a_rOther.End();
+-		 ++itHereO)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// The operation succeeded.  Commit it.
+-	Assign (a_reStatus, a_rTemp);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-
+-	// All done.
+-	return;
+-
+-error:
+-	// Handle deviations.
+-	fprintf (stderr, "Region2D::Subtract() failed\n");
+-	fprintf (stderr, "First input region:\n");
+-	PrintRegion (*this);
+-	fprintf (stderr, "Second input region:\n");
+-	PrintRegion (a_rOther);
+-	fprintf (stderr, "Result:\n");
+-	PrintRegion (a_rTemp);
+-	assert (false);
+-}
+-
+-
+-
+ // Flood-fill the current region.
+ template <class INDEX, class SIZE>
+ template <class CONTROL>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
