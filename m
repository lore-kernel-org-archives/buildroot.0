Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995CED6E2A5
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 15:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79FEF83E4C;
	Thu, 18 Dec 2025 15:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3dvEjfb9R58; Thu, 18 Dec 2025 15:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5144583E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766072077;
	bh=A70Mj4vLS2jBvKvVHR6LKR/nCjaUDBtjUkQDILPezMA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QejtIXp4XUR66rprF7xVY7letqwKsNUPUbgwxQryua4Ej2v8/CmU0sQUclgjrYwqn
	 t9wTiCR35qC6kjYsKB7ep3StZRIGtgVXXe8IHgGO7TWAyCxMmZN/aUw32MMOMAMltW
	 YBWjiLmIgMjmY7uldDDHeYw6N8MHR3KMED3VcmEDo+T57sdipyDP48dYcsPWHGlcSq
	 HRVlic68X0q75W/SutWiev2GDVRAQVz7qpe2QHmVuWx86dwNVZA7L/IvsO1tnQoy6r
	 zJvPPiwod+FN3dybAEaEdQLzsiqmQlRu217A1AQwfCiFVpmRroKKNiilpU/mZpUTaO
	 NqSVrpB51esAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5144583E36;
	Thu, 18 Dec 2025 15:34:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86AAA1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 15:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB4841045
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 15:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MvdI4SUf1cg for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 15:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 452EE41044
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 452EE41044
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 452EE41044
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 15:34:34 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AEA26B0059C;
 Thu, 18 Dec 2025 16:34:29 +0100 (CET)
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Thu, 18 Dec 2025 16:34:07 +0100
Message-ID: <20251218153407.4069189-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766072072;
 bh=TKv3RuDq2tXD4o4md/ggHOMyr/LwDNdIWpKTRc/tFmI=;
 h=From:To:Cc:Subject:Date:From;
 b=gDSm/+GYOJCdFjzfhAgS1w42Xsul0dH2XPYGj/0dh6IqHRyM9Pb5e2eH4p97UxS2I
 6En+CHh2gn7bf/5cXQ5DslvFwlibDF7quR299qBZX1dD2+C9tB+ZASZeBy9ocdtN1v
 lifzf4tdoMbyxeLr+rHtG1eGxDsuDwhP6WfwvKf8G1emSYKVw2EK8elZse5sClC7iT
 OASiMF/rXHedsw/aar0xYpPTz/5etN7Zo/ucVw1QLsK2uGB1iRODQ0F67EsSg5LDyJ
 n/CgRKWv1uWjUZao6D1exAL6w8oEbBd2/H3MyH90WOczlLNJvfRmBq7rghib7gzy0r
 djDsdPjYj63cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gDSm/+GY
Subject: [Buildroot] [PATCH 1/1] package/dpdk: bump dpdk package version to
 25.11 (LTS)
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Releases notes since 24.11:
- 25.03: https://doc.dpdk.org/guides-25.11/rel_notes/release_25_03.html
- 25.07: https://doc.dpdk.org/guides-25.11/rel_notes/release_25_07.html
- 25.11: https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/dpdk/dpdk.hash | 2 +-
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index 5c9fd7c087a7..3d372bc8f34d 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  d5ae4cfaef05d6aa491af643d61b83d840e53ced96f9c9f60fda986313ed84b2  dpdk-24.11.3.tar.xz
+sha256  52e90d2a531ef3ded0283bd91abc94980698f1f6471fa09658a0217cf6609526  dpdk-25.11.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
 sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 1c7eada93719..4843ba26671e 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.11.3
+DPDK_VERSION = 25.11
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
