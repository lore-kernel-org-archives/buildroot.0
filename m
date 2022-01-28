Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B624C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 05:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F1B81333;
	Fri, 28 Jan 2022 05:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfoHPpC5G34X; Fri, 28 Jan 2022 05:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543F181382;
	Fri, 28 Jan 2022 05:13:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25A6A1BF86C
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 05:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22679415B3
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 05:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xg2WjD5VGe4S for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 05:13:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06526410A0
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 05:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=0BnmTFmqAp4s13bhdpkcBWzV8oorPgos8w0gXOEod4k=; 
 t=1643346817;x=1643952217; 
 b=icVYAY85ImcoWA/xT/op56Xsl9VgzWHPr5H48vsYTkn+yNw2zViZWLl/FI9VKsMpZDnREOpyUTySzrRCaqahUrR1iPd1dZZmN3TJaTDf/dhoTH0iddI5jy7whvJAMpOLq6G6weFJfHMHbCSWSktSaDWz88LfpzhONrM1jO/7gavU+ybiRC8tpmiWnXkOsrDj84QkYYE4fTu+xhC4BQ6JEVvfydRJbTJJzYEm7MKGWLRrsbR+Zvk5kmNyxL0/4qPYo4rU+f/G+PAuE44SJU1EKLz3w1Bi0mEtdZmLDeUUgm6b+nlzis6dt7oYuLxeqFRO4oPVVjjcmhDBHJjGsPlx1g==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nDJZm-00057q-3n; Fri, 28 Jan 2022 08:13:34 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 08:13:32 +0300
Message-Id: <20220128051332.459202-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AA78FDF62ECAE61F574C814AB3F23F4AA01FB0D4144D4AE0182A05F53808504096A1C57B57320AD4AD969A9508EA67A6DA1870F5A1D7EE6DF935D3107172DA47
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7548C33FFD72831AFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372D850D7477D401F58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B8B390F39D10695F50299B977FABCB8B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7BEE62E5629C982429FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD1828451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CAA44A86D94E7BBB043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C86C5B328D8C3BEB657E889813AE25DC292888913075555349C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21F69F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AE88D5ADEBE7C98318EAAA913567871B7FE44BBA8FCBE4E57085D1349CF053C3EAC059C73783A53B1D7E09C32AA3244CBE850BD756C555880CADE5D1F9745D8B4DBEAD0ED6C55A80729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqLK0kLh8sGeua9VC/4Y9JA==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D6AAFD3A025CDCD93F7482004D577AD34498CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.17.3
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

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.17.3

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 564b7c07d7..ccfd3b09b0 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f30e37c28f37ca3857b8107a12e6d138a0719831eca52a836692909801c8b0bd  libosmium-2.17.2.tar.gz
+sha256  ff85d55ca83d77fc41f6b7ae77f3d8d4337d299cbb4cc60c00e1f9d90d94e71b  libosmium-2.17.3.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 82dd274bba..6510af4e77 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.17.2
+LIBOSMIUM_VERSION = 2.17.3
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
