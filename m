Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C119EC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53EA160F41
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53EA160F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1444B81D46;
	Tue, 10 Aug 2021 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGbKsCwGzbrq; Tue, 10 Aug 2021 12:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27E181D5F;
	Tue, 10 Aug 2021 12:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC2721BF2B5
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DABE440514
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 12:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwgWwfG_7YNV for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 12:09:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp30.i.mail.ru (smtp30.i.mail.ru [94.100.177.90])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B64D040501
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=SpkHVwyDecM/DKype6Mz6yA2bPxMJ4UdtqKE0PpZI08=; 
 t=1628597358;x=1629202758; 
 b=ZowwWC7A40DLePIyOgHQwJ4CWjAKkAMo38tLz72Hh5QlBhOs87hw4H6TmiOOZ0YdX/R9HSrnEyniot6M1Wx+MNM21dKXDKUWn5X1td7jyXCXP8x3YsPbfkSMGBIpNeLYTl4rgk0YZAJzErlN5Oj4Lbxy34zWzctOe0G/FCUqZDk=;
Received: by smtp30.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDQZH-0001XO-VB; Tue, 10 Aug 2021 15:09:16 +0300
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 15:11:29 +0300
Message-Id: <20210810121129.993657-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: smtp30.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD9ECFD080E047A606F56291F8739A291D6182A05F538085040B7C865E72E7F692642E5CD1880A571FD40E58D7571F1EA567C07B1AA8DDCE8B4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063739E242D0556ED1DD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D811C95E934DF3ED89CED5C480136AAE716F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC5FC25ED3FCEC3375A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735201E561CDFBCA1751FF04B652EEC242312D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE7532CA1512B819814782AAF36435267CD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE389DDFE3E282F3DD16E0066C2D8992A16C4224003CC83647634962F5C2B76545DE2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637B8F435DEDE9E76EBEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F86D65B9C644CDA22B2C86A2B305A4912969C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D5E4DBAB5AF249FA793EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3414C91BA6844B96CA2AE9BEA36D7DC7AF75DDC436FB868FC41F237F33531F407D7E951461AAFEC4AD1D7E09C32AA3244C4C9DE858423A592D65EE8A9ACFDCDE43795D98D676DD64D0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGhQhWEp1aB94/mGFD4HFTA==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB244955FDB482A375F5442AB48B15574FD204D5667F35E5B9D9EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: [Buildroot] [PATCH] package/postgis: bump version to 3.1.3
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
