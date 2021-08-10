Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805CDC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 08:21:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD3260EFF
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 08:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FD3260EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E5F827CA;
	Tue, 10 Aug 2021 08:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o78X5Epr2FJd; Tue, 10 Aug 2021 08:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656ED82A53;
	Tue, 10 Aug 2021 08:21:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 491961BF2F4
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 08:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45C8E605D1
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 08:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgqRirqY8cdF for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 08:21:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp45.i.mail.ru (smtp45.i.mail.ru [94.100.177.105])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EA8F6058D
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=uZMA3qZXksyEvzW46JK4mYuIcwAE7a4yao80bN2IILQ=; 
 t=1628583690;x=1629189090; 
 b=mJSpBA237b1Pc0U/SxqcIvj+kOCs9p7XaddY8ZQsuVMFeupPdkUXEvt+SKKxNOQyNtXRWF0FuurmtQuC8QKHMdh+JL94WCszvl1vKe9ZQrUBRIuaQIqiAdLKP1CFaBvLCAL63oZuOEnxT6Zda/VpUjNoWkHIJFejuZ2uUTxJrC0=;
Received: by smtp45.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDN0p-0006Z7-Kd; Tue, 10 Aug 2021 11:21:28 +0300
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 11:23:36 +0300
Message-Id: <20210810082336.764786-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: smtp45.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD9ECFD080E047A606F56291F8739A291D6182A05F5380850408648CBEFDBC1F9B8186637B73C2C7386FDE78BC81F9C8DA056E200726CCA0F28
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE745229D52CF30560CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B5932F77F0041FFB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88E06FA6C1B7CB91C2111BFB84705C7386F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74601F13E4625331C9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCDAAF80516FC4B78B3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637462766F9E200F231D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16BC6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F86A1E0F8C01D9FD34EF747B513378AC5559C2B6934AE262D3EE7EAB7254005DCED3A96BCF046FC1CF19510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D5E4DBAB5AF249FA793EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34351729636A02D1DEA53D7BC7020B3AA102937FC699E3A374ED0320A34F77BE275832B57DFB80A3741D7E09C32AA3244C663C787CF32797459C5B67CDDF381C35D9ADFF0C0BDB8D1F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGhQhWEp1aB9rFZs17J+plA==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24B9037E1390CE97D3062F52B0A786F31C63DB8BCE4C7EAB77EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.4.0
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.4.0

Starting from 2.4.0 timescaledb runs TAP tests by default so disable it by
-DTAP_CHECKS=OFF.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index e97045f7d5..4b6d6f77a8 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  730e61e48f471c1d643494421d21e43766128cbcb62a5c4b138c171379195cf2  timescaledb-2.3.0.tar.gz
+sha256  1adbff3ae7f8f39d1b5ac2189d60b9bd0a8154c0c3603e53b030a204f72d86af  timescaledb-2.4.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 27e9142b0c..900bac5a7e 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.3.0
+TIMESCALEDB_VERSION = 2.4.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
@@ -16,6 +16,7 @@ TIMESCALEDB_DEPENDENCIES = postgresql
 # pg_config replacement doesn't implement --cppflags --cflags
 # --ldflags and --libs.
 TIMESCALEDB_CONF_OPTS = \
+	-DTAP_CHECKS=OFF \
 	-DREGRESS_CHECKS=OFF \
 	-DWARNINGS_AS_ERRORS=OFF \
 	-DPG_PKGLIBDIR=lib/postgresql \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
