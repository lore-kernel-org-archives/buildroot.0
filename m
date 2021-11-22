Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 10:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25D2402DF;
	Mon, 22 Nov 2021 10:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DqPuPIzoI9q; Mon, 22 Nov 2021 10:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3393C402C3;
	Mon, 22 Nov 2021 10:26:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A273E1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 10:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90216402C3
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 10:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKnZ-QU4s-1T for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 10:26:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7194E402BC
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=z5mR0GZNnekAiii/Tl8p0ffqoIUzgaCMMdgVw6iSgbg=; 
 t=1637576770;x=1638182170; 
 b=IgGRXG6NMWXP4iVzJNhncplr7E7U9oHcY75MeSzydarJ0JAEoyMF3DtLjdTi2UroSwKQ/XigpfIWbN7wOLinm2WWNjwwuVofzmigAdToUDemfqzB5QaJtIldg2nq8voE8mas1ENTDhkaf6gdoeSO2lQp+hmOczlRDkAss8HIqw2aKFWFPMBZeFkn1UqJ5gOkSFT2b4W4ykvr7r9uLmh4SfMZUi48qNRQpRRTKSjs3GBdd1xuo+4mdbaCGAmkISKDoWI51EloWkalRiz6Ot5GxFdRc49MOfKNDkrEF6JZqad6+dECzwc6rkDXI2SmK2aNNMjxlGLK6hycIhglEwJyXw==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mp6WV-0004xi-7r; Mon, 22 Nov 2021 13:26:07 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 13:26:03 +0300
Message-Id: <20211122102603.954608-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9FE0487E502468146B8787A579DD4BF53FBE1400F6FA43E0D182A05F538085040BA827E78DF3708A551ABA1B9A4CF477F11228F455141B5682EA5ABFC781ABF58
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB84ED444C624799EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370CE92FB8C11ED3D88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8979A99406321909EAD8992573DC85E156F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C565C1E6824D8037B43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CC559E5F89E84DC5502E420E3412EEA8E4DBF22239631C5B89C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D1B2EFE7B39F7738393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348D68DCC07DD06FF52BF7617C66D28EF40A3578880AE1E5208B5D9806C13DF0496D90377D411D44B61D7E09C32AA3244C3EF9D073DAEF8F6B68E8F210B48A95BC3A76366E8A9DE7CA729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojp2KOOpFlmzf9rKBNxcpQeg==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DEB4DE35824CC6953D45D4B5CE30C790498CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888E0D4ABDE8C577C2ED
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.17.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/osmcode/libosmium/releases/tag/v2.17.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 05d898bc7f..ce3c7b6020 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a7672d7caf4da3bc68619912b298462370c423c697871a0be6273c6686e10d6  libosmium-2.17.0.tar.gz
+sha256  6faa7952aa1210dcd9ae4ef83e7653a4f8eb880e6a4e5b37f87a5d4835f6327b  libosmium-2.17.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 3beca73c4a..a969f2c4dc 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.17.0
+LIBOSMIUM_VERSION = 2.17.1
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
