Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4A5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 06:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD10D40320;
	Fri, 28 Jan 2022 06:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWaqpzN1pkJN; Fri, 28 Jan 2022 06:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C24A84033F;
	Fri, 28 Jan 2022 06:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F15D1BF2A4
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 06:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E01C416FF
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 06:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTSJKQzFkx6y for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 06:07:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14285414C6
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 06:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ih4t0XqcJVlHX1LOaQhSz1wbzUI2VN9M9EDFhSSfmgE=; 
 t=1643350053;x=1643955453; 
 b=IOajmcK3MKkoWNYDVpM5SSOO/CpHC+24yRdK4oyrLsF/KGHiXE/Y0NZ8OF3N0YZT/uPJjciMxG0nw9Ucj2hQorkGX0/im7Q4M89CltsBZPdTnlXGQ43T2mgE6eirqNy/bYGFvtSHYL63osfoIA3h6DoiX/VPRGrXT0z7QedO/hGXmIwk2YN7oYIPSEABfr8Q5d0nxULetM5PryNG3B1jWPsSXaHm0uNJSgZ0xqdiBV+GNA6wC3nGbNPMW/A8sXWkSu7ceIiiJh80O31BNS+cdlvF+PtVMpg00O8AZX22HFlRNqJahclPZ13/iIDAwroayuAcJpGQtvSGCMHhF2f16g==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nDKPy-0001jw-5N; Fri, 28 Jan 2022 09:07:30 +0300
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 09:07:28 +0300
Message-Id: <20220128060728.800722-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9DB8349C4A72921915232D984A6549A275B74A0BA3688A4391313CFAB8367EF908E2BE116634AD74D3D3C4CEF3D7D9D1666BD6AB7257E3C7C87A9E2CDD0C4ECABC0ACFA3BF7752234
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE705C173BDDADFC82AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748424D8FCCA3295D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89D9D589C925BBCA9397CF5ED2975E4DB6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370B730A9793D99025389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C86C5B328D8C3BEB6828EF7FF319C552BAEBD95B95871C02B9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21F69F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3454CC76E5F54B410C892E6F67708EC1E8051D1E79B2F8D2B4A1B7D1D080F753C699038CE9D626F5141D7E09C32AA3244C7096888B268EB6E3E44A8A4460E3A67969B6CAE0477E908D729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqLK0kLh8sGeiG67aB+P01w==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D64A1620AE3252A328C61522698B1F3D4B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1 next] package/osm2pgsql: bump version 1.6.0
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

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.6.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 88299745fb..898fcd5500 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4af0b925180ead2710eb68af28f70c91a81fb21dde5f80659d78e9fd14cf52cc  osm2pgsql-1.5.2.tar.gz
+sha256  0ec8b58ab972ac8356185af4161270c1b625a77299f09e5fb7f45e616ef1a9a5  osm2pgsql-1.6.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 43440e0db8..b00976d28b 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.5.2
+OSM2PGSQL_VERSION = 1.6.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
