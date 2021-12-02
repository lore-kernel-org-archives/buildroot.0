Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A99FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1ED6F4E1;
	Thu,  2 Dec 2021 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XO67-AESGv48; Thu,  2 Dec 2021 20:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6364C6F4DE;
	Thu,  2 Dec 2021 20:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A118B1BF343
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D8C383FA8
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fxf2P6902ora for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 20:57:35 +0000 (UTC)
X-Greylist: delayed 00:25:28 by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8169783FA6
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=YTr+QX1SyToae13TzFcRhMWqbm1ClsefFMsjJwK1NbM=; 
 t=1638478655;x=1639084055; 
 b=AQTax9aLxUnkAlhxQ+J55lHIFfIr7QTRBWKjDMidSoTg1yoBlk8j12MZ0D+uVRvdOe4QZwAN/BtJCSd7/lDobDKnTLwEcS+/TlK+oEn7Jh+H5lOHLL7EBqbBeWKpPu7n3+wt1BTIYSyAq1MY9Of4XRB7q4q1IRd4hcfN2//OQFaTQADUYzg6JVwS7PmLOlgDdvJjJP/YemJfcoERKUwZrD++zlbQA1NPVQ6A0+Ukzq3sr1ecnHP01kexrH/PMwwVxWhjzeTZfLNTgLRqAMTRJm977keis3ll4DsIEJ4MKsNKbk6ijT1p3o0JzV8cd+mTb1ZNkalwTf5QbAUw9yEcAw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mst92-0004RH-UE; Thu, 02 Dec 2021 23:57:33 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 23:57:26 +0300
Message-Id: <20211202205727.3572777-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93822B471089FF64DFA455658C3104DE9BDD9AB7435BCB66C182A05F538085040ED98F8FDA1D1467938939ADBC2FC6EA93C70D9568481F35C5133FAF9374D14EA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70FFC2100EB7B6895EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B97DA3EE4E90F98B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84ABB03975F510C4C09EC58BEB7169E6E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86D618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BB37B5D51F58B3735A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9D13BAE5FA0B9E2524AF4988B5A420F4949C2B6934AE262D3EE7EAB7254005DCED4ED5B231F855E8739510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D5E4DBAB5AF249FA793EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3490011A262ADAEDFEAC13BC202AD08E9AB5246C56B659A8408A7DB339E3C1AC3228A10862EE751EEE1D7E09C32AA3244C590682089B26BF338356E4D482359214F522A1CF68F4BE05729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR3OOC9h+EqpVA==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DEC6B722D63E29D302144AAF467369D9098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH/next 1/2] package/libgeos: add threads dependency
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

libgeos uses mutex since commit https://github.com/libgeos/geos/commit/3fcbd1e0c52843c2ae0b4809c9f89f74ce529afe#diff-38d1bc63228770a179e474aef4fd26b1a2ab5f5758a5d98d07ac556498dd1f3d

Toolchains without threads support fails to build:
/home/giuliobenetti/autobuild/run/instance-1/output-1/build/libgeos-3.10.1/include/geos/index/strtree/TemplateSTRtree.h:376:10: error: 'mutex' in namespace 'std' does not name a type
  376 |     std::mutex lock_;
      |          ^~~~~

So it needs threads.

Fixes:
 - http://autobuild.buildroot.net/results/2d5fe2866dfa24f5747fbc826fea1108a2a6cb47/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 86a1cddcf3..5e861ab010 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
@@ -13,7 +14,8 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, threads not binutils bug 21464, 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		   !BR2_TOOLCHAIN_HAS_THREADS || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
