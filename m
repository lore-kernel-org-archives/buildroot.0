Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AE3C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80CDD60E78
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80CDD60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 458C84020D;
	Tue, 10 Aug 2021 12:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jhvdqAYB4TX; Tue, 10 Aug 2021 12:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39FC401D0;
	Tue, 10 Aug 2021 12:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3A31BF2B5
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A5B88270B
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdPxa7OQiCVa for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 12:04:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp48.i.mail.ru (smtp48.i.mail.ru [94.100.177.108])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2E98826D6
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=SpkHVwyDecM/DKype6Mz6yA2bPxMJ4UdtqKE0PpZI08=; 
 t=1628597075;x=1629202475; 
 b=HhenSfzUAEuOZ3Z7wxveGmL7gIVg6JYM+xc2gD+F+sSkIVEXq6M6B8mxkCfVj2bq/qtGH2+FwpPG2XG0AnepjrveR9zmoHXVtdxOMTjpBkA4xqdqhWWd1suMhIrNRXqfmthlU+moqIygadXmsytN0KIjoZhsbTeuUvtA28PsbJg=;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDQUi-0004oV-Vh; Tue, 10 Aug 2021 15:04:33 +0300
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 15:06:44 +0300
Message-Id: <20210810120644.861092-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: smtp48.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD91BCCB18F2C129F87F36E61E9E4584E9D182A05F5380850404A52C123101294C4872D532B552101188E0A66CD2DEC53DF58F5CE258A563ACC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3DED2DACB82E709C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE71BB7708D34E2BFDAEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BBCA57AF85F7723F29323B5B96B9D9FF2069581D08B4C008B20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C04CF195F1528592878941B15DA834481FA18204E546F3947C744B801E316CB65FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006374F09588CB15B21E6389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637E422C47F6236AB83D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7380A0F9BA6E78654EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9BE88FFEDFA497A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F8609C8DF32014EE1E17691841343BA61FE9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D5E4DBAB5AF249FA793EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34351729636A02D1DE7226CD6D4F32E77A09945D355B7D30023C796CF87A34B4B1FAE826644EC05A0A1D7E09C32AA3244C18833B1FEFB9567FC1B751D07EE73BB1C86C126E7119A0FE729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGhQhWEp1aB8uY1o6Me5yAA==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB246E564A1DE0DAF49F230147F38723DA8DE4690EE79E431205EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: [Buildroot] [PATCH] package/postgis: bumpd version to 3.1.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release-notes: https://postgis.net/2021/07/02/postgis-3.1.3/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 8a8e47ffcc..15983565b4 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2cdd3760176926704b4eb25ff3357543c9637dee74425a49082906857c7e0732  postgis-3.1.2.tar.gz
+sha256  71e929553bb73a0413206a0f92df5180ac6579c500d8ddce3a03559f1b349fcb  postgis-3.1.3.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index a0acf62e05..b3d97b2774 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.1.2
+POSTGIS_VERSION = 3.1.3
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
