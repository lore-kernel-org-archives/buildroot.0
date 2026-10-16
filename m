Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC446CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F71360B9A;
	Fri, 16 Oct 2026 13:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZLKTOkuQZzX; Fri, 16 Oct 2026 13:09:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B77A60BA4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156146;
	b=jfPg/Ib1F1c7WdYOJrS46wYTXq/XcjIrjkLTdUfW9Rjob7nmwAIwBktbNd1YEABRL5O/
	 yK+mqMCoi7GwL5BfftljIcNyS3n0yIOezKTxfJvIv4tPFpv6RZ/RhT32co39xXafWAb5X
	 WfP1jAA7qt+MAC/avfuShHukT3H94SBEz4WPzw5eUV9DmVgBIbjhDgvWLT6eWs5sRYeUY
	 MORUbRRr0AvWqCtRsdCs/3eEhUVcXNNMYj19rw3YXg0zqwgpdQFnqKvbbpXa12omDIcZ2
	 aKQTidaNx0ZouMDRVjbJ2piy2RqfV1aec1Whcoy6CQpTrDr7ciDdL6i+pgIe7wt813w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=FFf4Yp1BT9Yc/e3UGt2bdoVDcJB9U+R2hRMLMJC084w=;
	b=P8fq4TK5AjeHeAb1Po29n+hpkak/L/tYn2yyFOR0QUkvSniYQFGYVcB1F0P/jiGMXBgo
	 UDZTxJE6WGVe/amv2H8zeU1ZgVDvnC2WmNw4ZM/E6VU7INIA2Rl6G/62OwsNEwbADqzDT
	 MMF0oBu6KCxt8njE6hl6K4ohriX2AauvTsTnrGrSahV3r17hZXfmr/w/BnOkygnmcKmqi
	 djC2Nd06eAHPDFxJKTFChfjJPx54Jw+XaYW3bM30qvemHy8mWk9JLy8FK10Dr1/BmeBn3
	 4r0Rft1qyYlhWdFwqVvyQQaU0nOeo0vrhyxw6e9KVJOJEn3japZQnwqWbgJfYbshIHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156146;
	bh=FFf4Yp1BT9Yc/e3UGt2bdoVDcJB9U+R2hRMLMJC084w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a2vKl7c+HxoFbwPlHjA9uH2kpVCfCmiJKL74KJc4k4W8e+k90brzBjW0P4jG9Iwi2
	 wTy2bsvBblotxsZaUSwYX/JQOVO5u/YYcA7KMDXiulHe3ohbr2tqaAdQxkr9mCbsjc
	 YZYcQUMxDi4bPZcz7OI8wVey4p8VDERqOLPKWYzM4IzdeZzByrF44+GNAydb4xEmDX
	 OOoZkHgJ3yHlGR8yxTF9TbfEWFxDAylrmBuIVyJJq1s2E3Bi3MKxTrt2noxEW2cXzl
	 AV7+pnPZutA8sDqwi58Yle9B5wm+dWiXDof3vE86xg9ON8FoiI27tm4lnfDgAr0N3j
	 yZGtDmObYeUWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B77A60BA4;
	Fri, 16 Oct 2026 13:09:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D48DA255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B490C40A0E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG9fdVtaHM8i for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8BAED40A01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=owsCDnNDKGU8yTf3P0UvMMjX9tJv0hG2gCee+k6vvZPXIxpcZJV6MhLJlvfW9BfyTtGl
 tiPc/pN+EJnpwtoJdkRV71D6yGmE+vYj5nUCbxCu58pBTGLJSRLYUxyFa1f2TjoGbt6ZJ
 JTyo8hyAwi60wlGCPz+OnrA91ag6Mh18MmAj6nCGxnMQKGLxXwJ/RRPsFN0hmqG7f01a9
 YitPw4qEypFQ6vSOvf8wMDufesbFcYKBEHpkM3TNqBF++A8IegL9WjQlv6rcXcC61PIfA
 vSguM5W2F4nKmUOJCe/jCjlLZiNcu5cYqCPw7CghD8QTFoJ0DOx1SFckRkCqNkF1inA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UiZtp5StyUMNvVuN5D09pZcJygd0SPe4BvBAF3mJ2rs=;
 b=Zex4cgF/llWn+/cbnJXcVjbP5UWP9Gs2vW0CEbbUB8qRjNj9qqRwIHlPV59qVtWosRxP
 8wsrUV0fuJYavHBLjS7ZQOOwBjtCVJ4hJaHSL/UCIttXK4cE4EDFkwH5XHuCBoR7yVzHO
 5t9vikruAkvrGrtRvYhdhNPWX2XcBzRXpvvcUA7oyxGytdRLN3IsQICRBNcwnVC1wsj2B
 kHWNxZq/2RB1fQRO/sBDdx3QYlF4IhuK77r3TM1Ez/4Srkj9B7xn5xUVTgYSXo1eGYv5+
 CXoFumu5icgSqGRMoU+tgrxiWQ5Jkhx1bndMR2e9TLcNjAA9OfaK5878gBWQ6pQC6mw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BAED40A01
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D00F960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 61e4e9fa6d3d11ab44d4f2955530e47a663bf71f
X-Git-Newrev: f878cf1a608f0d87370a89c4964c8aa3a113640d
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.7D00F960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlitecpp: fixup
 Config.in comment
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
Content-Type: multipart/mixed; boundary="===============9076308286187972076=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9076308286187972076==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f878cf1a608f0d87370a89c4964c8aa3a113640d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 8b651fd817a9e0c11ebab12bd558ee6e80b86cd4 added a dependency on
gcc >= 4.9 and as part of that updated the Config.in comment to
mention C++11 instead of C++. This is not consistent with Buildroot
convention, where we only mention C++, and separately the GCC version
requirement. This commit aligns the Config.in comment with the
Buildroot convention.

Fixes: 8b651fd817a9e0c11ebab12bd558ee6e80b86cd4 ("package/sqlitecpp: require C++11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c12e9327c7c0f6ff86557eee40e854d8034aac2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sqlitecpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 614c46cb54..8e98b16137 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+comment "sqlitecpp needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============9076308286187972076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9076308286187972076==--
