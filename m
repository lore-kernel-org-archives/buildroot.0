Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB71C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 20:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E828140A8B;
	Thu,  2 Dec 2021 20:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x85hMY1j9Lij; Thu,  2 Dec 2021 20:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0661E40A84;
	Thu,  2 Dec 2021 20:58:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 470981BF343
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4454783FA9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru header.b="Mf6docdl";
 dkim=pass (2048-bit key) header.d=inbox.ru header.b="o+35bctU"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_wdDYeHpEbz for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 20:58:21 +0000 (UTC)
X-Greylist: delayed 00:26:04 by SQLgrey-1.8.0
Received: from fallback23.mail.ru (fallback23.m.smailru.net [94.100.187.222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31F5383FA8
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=YTr+QX1SyToae13TzFcRhMWqbm1ClsefFMsjJwK1NbM=; 
 t=1638478701;x=1639084101; 
 b=Mf6docdlbqm7YphJylNy226Xr6PCsES+vsioLS5tJSNq1jBr2sAFmD1xbkuzUFtN41i9zhhDsT1HbO9OSAmAd1ZYOaHsJgKcA1V6tla1ASd8sxPSs34qaarjE9hfC+0O+M85L/QKZ7txWEglzyUZF3TFzVzhdewGsdrll4Yopug=;
Received: from [10.161.55.49] (port=55634 helo=smtpng1.i.mail.ru)
 by fallback23.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1msska-0005Kw-9o
 for buildroot@buildroot.org; Thu, 02 Dec 2021 23:32:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=YTr+QX1SyToae13TzFcRhMWqbm1ClsefFMsjJwK1NbM=; 
 t=1638477136;x=1639082536; 
 b=o+35bctU8M7VuaDZvLFBbkNwOT7w2lJVmoo/unnAELpOBpOZz2L7/QKPD08ioN8q7LxZcpfkegaObmzFvZxq/0dMj3f2jkhfggIAg0/dFt/KzziGx4ygodZjVtO8xX/wCzWbelJZ8MoeHF0ilhbSzpPII9ME6n6JhO0vLDh60P0HDMet7N5p+EzYtIuB3KfUUQqGljhCPx/b2yJ+PeIq0aZUVcYuXUIb9IAXFsNERdr+YTdnJJldXsHRsr2XqlR4qS0Vbmxcp+oqX03GL+WGoAOVQG5UGKwx2dIowuu7BfcMu1A1amR26V2zQ9b2CLQY3HG/kGrQ8BptPaImGvPPUw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1msskR-0003Bj-IF; Thu, 02 Dec 2021 23:32:07 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 23:31:53 +0300
Message-Id: <20211202203154.3571442-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211202203154.3571442-1-fido_max@inbox.ru>
References: <20211202203154.3571442-1-fido_max@inbox.ru>
MIME-Version: 1.0
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93822B471089FF64D57D2D9679C7A7861B82AB5CE2FA20EEC182A05F538085040FB8C8AB646CCF75A5913FBB3FD44A6E3FD8D41480FB7FDC2B3F6C1FFC28A44B3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70FFC2100EB7B6895EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B97DA3EE4E90F98B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D863FE25D66989DF11362637F962D84E9F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73AFA331E307B52169FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86D618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF77088377309FF52A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9DE842D6F1ACB101E508BBB9C1604EA3A99C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF197FFA0EFC27E0ACDC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3490011A262ADAEDFEAC13BC202AD08E9AB5246C56B659A8408A7DB339E3C1AC3228A10862EE751EEE1D7E09C32AA3244C8D6106CE1F1C0DEEFF55E3249B5276ED35DA7DC5AF9B58C0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR1D7WeJIVExJg==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D77EC7C1D4464D62823F7CA754B7F318698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 6242723A09DB00B4297D9AD4AAE60BCB73DCF6C1D8861912E93E72B18167E7E8049FFFDB7839CE9E5E34638419BF5A1941047BA5CBD5FCB8CD06C43E97F4AB01F5C4EF12CF547BA0
X-7FA49CB5: 0D63561A33F958A5B9564BC87331E95E2989B23C6CFD83FF0C13F039F00C03A3CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006375BD8EA5EF8B46F919FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C39E9AB6E7577F4A2ECC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E735DD0078234547CCE7C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9D63456B46669C4CFF1165C4FA26BE991D9C2B6934AE262D3EE7EAB7254005DCED8DA55E71E02F9FC08E8E86DC7131B365E7726E8460B7C23C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR2rmGG4lYOBYg==
X-Mailru-MI: 400800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DA18478CF2EA518691B406C19299C07FBB9EC5B4DFC753F7C0C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CC77752E0C033A69E3453F38A29522196
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
