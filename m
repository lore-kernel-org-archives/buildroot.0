Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E16C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 18:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D24E4405C1;
	Mon, 13 Jun 2022 18:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaxIUSdltBlw; Mon, 13 Jun 2022 18:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 080BD401C5;
	Mon, 13 Jun 2022 18:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C64381BF232
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 18:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4DA860B1D
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 18:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbumLEddTgOs for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 18:44:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D7CE600B9
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=eSw4TeXUnZZG+qac61aukhLPGhPIzc29wLTErt5erXM=; 
 t=1655145878;x=1655751278; 
 b=VrUA4l35K4R0a4q1ey2kDEUMeb969CfI3lSximH43jBoAOh4Yq8UfrtVKKqE9i5O4sY4ExzZQvjRJBoGLXKfP1bvb7Sv2R3ITHSTbpUFl4k9WeGRo8Vf/sBkYt4bLrdJejH1wmpd2vqSbgJY1gQGwcUxyw1bFXKXhmHGZVzIPW8WKHQzZHneZDxO7V0ATp+5nUZDdCaDj6iHBvIyRBiqxE3L83HEUVCU776ffiDLFhkuGuiMlb2VVUdVf5Nmn1pzs2THVO+AUime+OoEjhMvVGcsDeNLkCCpJMmhxL8hYRopim7xRFdprB7mHEI35V+hmbNo1p8rjRfp3XRVtWpS7g==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1o0p3D-0000z4-61; Mon, 13 Jun 2022 21:44:35 +0300
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:44:22 +0300
Message-Id: <20220613184422.319524-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD97D44297578DBEB86B62F79C7FEB21477876C1A6C9E05F4E9182A05F538085040F054CCDA49AAF32E203FD0B3C2075962F5D31FFEBE92EA2E00CAEF412F110535
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE764FA19C802BBF8D7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D70459436292EC88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D821A98B2551FF1A1C3D0013DC935552F56F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B55B19328CBC4F849A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C6F118202071535F843847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CEF07A666895556670E5D13A3255FA420EF44E4C52373B6E19C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D532EE5AD8F952D28FBDC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34087368DEEB028F1743C397CD7E57AED4E372EA498BAAC2A9EF906D5AC0ADF1C45A0643E62D2E13431D7E09C32AA3244C9AE7E223AE6B6886AAEFA138F91F35A833C9DC155518937F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9PNmSuDLUimBLqNtJZINhw==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284EE319A5244597AF79D09E3128D203A46B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.10.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/blob/3.10.3/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index f93badbaa3..3b913b750c 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  50bbc599ac386b4c2b3962dcc411f0040a61f204aaef4eba7225ecdd0cf45715  geos-3.10.2.tar.bz2
+sha256  3c141b07d61958a758345d5f54e3c735834b2f4303edb9f67fb26914f0d44770  geos-3.10.3.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 197def1212..443c884abe 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.10.2
+LIBGEOS_VERSION = 3.10.3
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
