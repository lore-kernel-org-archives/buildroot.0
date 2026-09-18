Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A9DC982E0
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1F940BC6;
	Fri, 18 Sep 2026 13:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7QeTkU8cano; Fri, 18 Sep 2026 13:06:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B5B1040BA7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736782;
	b=d7DP0qtDtACRCghZCje+nAApA3erLbXiFXrINKu0xnQigY5LTWT47yF5RMBxKrbKsx1F
	 +gTur6Lj1lQczCrFsUt37XXDiUiMBpj4YSTTp+zbIJACkoDoMsXMIdD9H8kkHZ0VtHAYb
	 w87ntDMapI7cHql9qwTYp7jq0szQdY6w/7OCeTPyFj37jitfktFD5D0wIX+rhyfx+OYO4
	 QFWi/5+upPtruA9zbVOB/FEtnIl3WilWWxUrER8Xrj/5RYKZCsM7kh/Yxs+Td+X+yvJVL
	 a2cSuTGmAYmRmTyA5xONsJxQ4eOYrWIW8cl1elLjfQkU7caaePLzixP5HSTcKz/4+bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l7EfTRYkCykVzRrGanNuAW0YG7S9Un4B4WfhM3V5eko=;
	b=GovCNqG8JeZovC4z2YpID9M5/JM3o+TEtxUGyr58gR+AoqvKAn+OMrTJdM8KTbSZyceX
	 2eBPNybc/v2k9RyHbj6Qtz3bmcO8yiXzixp1Rbcy5qqHXv4tpzaV8wUybdfFhhrkYfAai
	 3DnYJZEVFmhCdHOt14yzJirYqyt/5+KQuXwtJydHTNyrC9dTP0g2UNMf6pd0Zs5WSkw64
	 5NRTbIN78FHHr08ft6ppWyhCtRJ9PErZdwRA8j7Dzv0HlO2DdR/R4YGuS/TFOjKGzhupT
	 Mm9PPhjBEr5TB4J4hoJUAXU1V2WssDX39sZwR6mHfY3W4GKkaxcw5y68P2T4tmrhfCw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736782;
	bh=l7EfTRYkCykVzRrGanNuAW0YG7S9Un4B4WfhM3V5eko=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o+/crxr+jipV6N9p0Nt5MdY+32rORfhDhmM2XyE6usVF4X7i5wjLw/WPXd5uWfGI9
	 rmxHZmpfk9CSXbncdJQjguwdUMfir2fmUbqYGSpbhVrXg4x281jlksu8zoyTjSxl2x
	 MJyUS4mc93NkbaqaRFD/N3tugkehViKnr374jznP9PNo/NNFcNTXIO+L/Ob/4UvGWj
	 3f22vBYIfB+Qt9iKtUTBni46hdIeeZAA7KadVopFfVxp8JUBrwio4k1fpZnzeao9rF
	 i6WcHtJamlW2L3aERtxB8mnSFB46zU/8RISCJcLu8qmeQ47yhb9J0Y/QRLntub6h6G
	 GpXaxJEKou+rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B1040BA7;
	Fri, 18 Sep 2026 13:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC25B0C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEDF081283
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTf8e0js_qc7 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B3E3281299
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=GmBX4QNr2LPQaDRoEMUcp0pdkUT+uoSWwgXlPx5wMAPr5bN4SV9jsxmHR8tEUigWN2A3
 wVbidXfqV45T8YK7hoCTKLmZURgJyNw4qP2+7EwoVwHMJAL/A4jWRELC83Ifd+bQtE3Bc
 YpE4IAqNURiQUiqqyXFTqKPMy2E+NN/pdWMwRAl+z2zIlKdk5hdfuUppFkOR02jqhF02s
 QUbetOg+ZX4flJ65AH/lPW+u7bO74a4Z3vHAy2TIi0iNGIjioLJSfzHSaun0/t6WzyxQG
 SIX8pYXFMCCQxB+Xg/lirxABEv5U7T/KzleZGCfkbM41ZXUL3v4UaHyIioB023P9rPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vuSzRboxvgbSLnnTMCU9huV3S8zRQETZxqTm3JEBLz8=;
 b=Tkbhxfo0wc35w0JUosGbxkIMG0zzsG/FZAejaA+1yaTmWLWssbXoj1FwigNnTx8uNcz6
 dAgDMe3hE+OKkixG+iIox89fi8DD4AKmstbBUOfKHht8oMphRkoDwYFnfM7aOqTkdoqtW
 Ol6KOlzSMlfWJKHDCM50vUb5OlErxnC2rHQlM3s86bbHOoVNK4/znvObUL2RAMlOD5daT
 PFPCmHgPRqFd91UgHlkZd1Ug6H2LVvJMq1x+nOinThA9y2wQvbjJqODX31GMZY/qC6/tX
 /xGxL90LeqRtwRTxGat94ubpLU/7wnVtuSS18PxBO2fxIHD1Hcb48L9rMMhQn+PhMRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E3281299
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D02F97696; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 31843da84145730d9b2720a437122482011d576c
X-Git-Newrev: 71cbd3dab899c7ce07a1dfa29d9195459e5f315d
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.6D02F97696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/intel-mediasdk:
 add missing BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71cbd3dab899c7ce07a1dfa29d9195459e5f315d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_INTEL_MEDIASDK selects BR2_PACKAGE_INTEL_MEDIADRIVER but
forgets to propagate the "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8".

This issue was introduced in commit
51b60c8acf3f4b534d0954b801f1034491b59c94, when "depends on
BR2_TOOLCHAIN_GCC_AT_LEAST_8" was added to mesa3d, propagated to
intel-mediadriver, but not intel-mediasdk.

Fixes: 51b60c8acf3f4b534d0954b801f1034491b59c94 ("package/mesa3d: needs gcc >= 8")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fa38fea91c4677af141f8012723f9263a4f00ae1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/intel-mediasdk/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
index c1f609e3f8..7738dcbbeb 100644
--- a/package/intel-mediasdk/Config.in
+++ b/package/intel-mediasdk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS # intel-mediadriver
 	depends on BR2_INSTALL_LIBSTDCPP # intel-mediadriver
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
@@ -20,7 +21,8 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 
 	  http://mediasdk.intel.com/
 
-comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
+comment "intel-mediasdk needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
