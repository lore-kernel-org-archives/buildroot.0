Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D701CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:03:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB6461213
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 16:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FB6461213
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E134075D;
	Tue, 28 Sep 2021 16:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVqU5r0Pp6iu; Tue, 28 Sep 2021 16:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6302140791;
	Tue, 28 Sep 2021 16:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D80281BF681
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C82C06077A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 16:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru header.b="kpvyesUf";
 dkim=pass (2048-bit key) header.d=inbox.ru header.b="lxXKvg3L"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jU68oPPn_15b for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 16:03:46 +0000 (UTC)
X-Greylist: delayed 00:17:49 by SQLgrey-1.8.0
Received: from fallback20.mail.ru (fallback20.mail.ru [185.5.136.252])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7550760777
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=9hIN7FsKzAoNYGPDtCPSwDLJRKsccADIgpfNZpjFkZo=; 
 t=1632845026;x=1633450426; 
 b=kpvyesUfhy6Q6/zMmwZu6L4QS4if1UD7bIwurd8r/3JX/tIjwB5cHRaUH+eAA5q18w1IK+fCKFkLEcXMPUswdb/a0Xz+yNadU15I8CHS+VtBLRiOiMiDGeH5lAy76+Y1iOHTPlWAZzCHziLkMz1W3o4ksc44v1zOZxicA5aUDPM=;
Received: from [10.161.55.49] (port=39974 helo=smtpng1.i.mail.ru)
 by fallback20.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1mVFIo-000129-MU
 for buildroot@buildroot.org; Tue, 28 Sep 2021 18:45:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=9hIN7FsKzAoNYGPDtCPSwDLJRKsccADIgpfNZpjFkZo=; 
 t=1632843954;x=1633449354; 
 b=lxXKvg3Leg/hgCB4El3Dgw9sgAGAw7f/cId1fpRwTtChkpCAmIvkaZLATiqkqFn7D9sPfmMV0ljwWh5tjZC9YyxyyL7L3DxuL3UFKXz63UICC4NN4QEqyQBkBBT2PxR/laLAjOf6Lnrf3TWtT33L02yIEf/QgcRCM9gs0uudHh1zTkPD5Cm+Bu5FIfVLl3gFy5xkCv2BxSdr0nqCZArGSbsnxzS3kSUSZh8ltwsWbvkcOdGWVUJEPSta5fs2d50CgRWt/TkZrK/ErkljOVOiplJ0yHEmluw3dORAPOgbLL4Aayu9jSTpxAfwh5pJl7/BRmCT9dPlE7IJCPmsH1F/1w==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mVFIf-0000w6-ND; Tue, 28 Sep 2021 18:45:46 +0300
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 18:45:39 +0300
Message-Id: <20210928154539.1617952-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96A58C36AA2E99649DFE41A06634A2C4EB30EB11CC09FFC21182A05F538085040FD3BFA711333E2C06DF7D5C4EEE1AE21E450F1A7162391B627D7BC4DC7FF5862
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE797F4D2EDC29AFAF7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FF37B1FF54E2C7C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BB3966F92B9C87AF32C6677FB87EA35D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CA5583D5FF21A78E543847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C5D501480F5414410720052BABC1C9C72AF901A172A109FD29C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D1B2EFE7B39F7738393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D8FD11F74BDD6E8D29058667E0E330BD3549E8A788014B1A54D9CBDA3D3D6A061C8E921D7CD8B6C91D7E09C32AA3244C8F13AE68CA470B97A3EAB9BB3E534EE1725D5B54B2FE4575729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWaDhU1ub98bqdLppBUhiaA==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D7FFA044EF93021E764CA58E063D4EF4198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888E0D4ABDE8C577C2ED
X-Mras: Ok
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4DD0C531CF85931E96D4DDF883E824DC1036315B38362CD6D68F3CF0E9FE49B693457ED080455A8571241F48E49D7AEF8D32E91F4AF7A738FDF8763B7D66A4F65
X-7FA49CB5: 0D63561A33F958A56F51DBE6A8422F6D8EE465044EB721E6B499B68660BB9568CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F7900637E147A944133A9D33389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC87BF93E671518182AF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7742996B5449390BC731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C5D501480F54144108F301725D02B297219FB8B59A727E0DE9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWaDhU1ub98aZ05riiO20UA==
X-Mailru-MI: 400800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DA2225410130F8AC2CB1B3E69A9641AD35DADE3F638E55F50EC099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.4.2
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.4.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 4b6d6f77a8..4e3e91e152 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1adbff3ae7f8f39d1b5ac2189d60b9bd0a8154c0c3603e53b030a204f72d86af  timescaledb-2.4.0.tar.gz
+sha256  b206a376251259eb745eee819e7a853b3fbab9dc8443303714484a0fef89a2a4  timescaledb-2.4.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 900bac5a7e..4adf2bdbb3 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.4.0
+TIMESCALEDB_VERSION = 2.4.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
