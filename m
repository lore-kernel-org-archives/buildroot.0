Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2853C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 11:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C62A40385;
	Sat, 30 Apr 2022 11:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYRlmtp73sHu; Sat, 30 Apr 2022 11:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D86240103;
	Sat, 30 Apr 2022 11:32:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7E001BF5E0
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 11:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD6240278
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 11:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-8_vbWsdy-6 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 11:32:49 +0000 (UTC)
X-Greylist: delayed 00:09:01 by SQLgrey-1.8.0
Received: from fallback13.mail.ru (fallback13.mail.ru [94.100.179.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C14540022
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BD2v+ltFwIP6b5hYQ13qmwx5P6J9wgh50y9qAHtJDeM=; 
 t=1651318369;x=1651923769; 
 b=RAy6LkTgjybmYrcGgXv3EsQogyEzpVSSbDI/72qq/YFcbuxf/n7Zxvh4M5NuFov+BlIxgdVSdnaXwDFTzaKGrWNuw+0KphGHociKdPMnUwENf5lXK0JGV2ro5srulTHK7GEAVM1eZ6M/eNHDAMrlPOre8csa2+1sQhPCB1Nf/TksPkMN4ccfrjkv38Akl3QYiv13Gh5JT3+7/ltfZ8eC1mPrAVXVm3rXRDhinfhmndqctNVFHoTjvnkpygEF9cbAaz35S/n5DasobRoWJYA4NlDmEGVKv0tWPzocbf1BdvmqWJ15aXeU4bXUyzJY9GORtNB3yOH00k9gSMPCp2+wqQ==;
Received: from [10.161.100.15] (port=49656 helo=smtpng3.i.mail.ru)
 by fallback13.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1nklCT-0007CB-Ju
 for buildroot@buildroot.org; Sat, 30 Apr 2022 14:23:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BD2v+ltFwIP6b5hYQ13qmwx5P6J9wgh50y9qAHtJDeM=; 
 t=1651317825;x=1651923225; 
 b=huhdpmjwQr6DbTR1vntwgbCtQGWzsGRaKLBzbkeETrH4rNwdNlcYpzqB3SC9V0+1ZKWrW4fcKdJrkMieWLyTsDJUcO2gruKl7B9y9XBSRsXBxtwAdKAVW0CAektdFvznM+y5fzDjgnWovms7CYU7MXQNTTsaFnKVuSCXe37oL4nSpi9CAvIHD6OhvhuH704JCJKp7vKmOMHd50u+s7sSQD5DFg9W/V6+0ff4XFcxtdmtyKKWaZA8AKTzOPxi+Gy670OACgUbUDXGreweoENikrY/iKKUOH6tbXrx42i30ZB2bhpEiyGVudA7JpRNDm0L9151I7AHcjV/cqW+FqilIg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nklCK-0006ZX-1e; Sat, 30 Apr 2022 14:23:36 +0300
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 14:23:33 +0300
Message-Id: <20220430112333.414925-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD977B76FDA87AFA8B90ECF45BAB5C389F35438536F2E23DF82182A05F5380850404FCEBBCC964D1361AC65D9759C42B8715631C65B56D12D16EBEF89F1F3193ED5
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7811C3E343B302E2EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745D431239A8C7DA08638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85ABE385C697970B9116570C343DC78686F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B974A882099E279BDA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C440208D3F8D8ED8643847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C242CCBC298CA299A7D33D61A2CD5A2321CA63E8613262A1C9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D5333F7A9E5587C79A693EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349320586B19AD2C720EBEB4275C2670D4503B0F476B3929B6421FB70E2107F90FC97332CFAB27107B1D7E09C32AA3244C3B9BAC203D195F94AFBFC9CF879BC679A995755A1445935E729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpu98ZoqON0b9D+v0czhqFw==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D678837319DBC8F020A20029D3D092C42998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B43AA9A89F3DE39AFE8AC1265785075D8D368388E2F1FDF9EB049FFFDB7839CE9ED9EC5E0AAB34E4C0A39E6664F2F0517916EA6C1BC80A6C6786D79639EAED6878
X-7FA49CB5: 0D63561A33F958A52EA62B1AEB16203FA5A510217F0F83BFBC2D215EE3195BC6CACD7DF95DA8FC8BD5E8D9A59859A8B6E948697DC93A752DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637BB2C0205A76F6561389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC881C78A5080CD6B35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE781C7C20B2E2DCEEF731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C242CCBC298CA299A321FAB69D49AB4A4653B1EF7386B5D979C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpu98ZoqON0YY4uCJ69Pflw==
X-Mailru-MI: 8000000000400800
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.18.0
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

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.18.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index ccfd3b09b0..cb53a91c67 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ff85d55ca83d77fc41f6b7ae77f3d8d4337d299cbb4cc60c00e1f9d90d94e71b  libosmium-2.17.3.tar.gz
+sha256  c05a3e95c9c811521ebad8637e90f43ab8fb053b310875acce741cc4c17d6f59  libosmium-2.18.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 6510af4e77..f7ced04de3 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.17.3
+LIBOSMIUM_VERSION = 2.18.0
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
