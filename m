Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C634C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 04:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1AD660687;
	Wed,  7 Aug 2024 04:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvtAzZ7bZBZt; Wed,  7 Aug 2024 04:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BBDF6065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BBDF6065C;
	Wed,  7 Aug 2024 04:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7D11BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 051A380CF3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTO7q0j23YDM for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 04:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9279D80CB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9279D80CB7
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9279D80CB7
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 04:42:38 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E683F3520FD9; Wed,  7 Aug 2024 06:42:34 +0200 (CEST)
Date: Wed, 7 Aug 2024 06:42:34 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrL7Ovbl+xTX+KX/@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723005755; bh=0a57zoESPf0EJc5yCacwLFGS1MvuUMGGbX/qNJ0UMBY=;
 h=Date:From:To:Subject:From;
 b=QzZnvy+l3IkZhffuoA8dt1tM8YykvM8vgrmIUX/a2w+x0+1XeW6nsRGK4BcoA72zQ
 n/HBpLlqsotE2FAmNIz4liTrwiOoQAbd07KDf/EHxN0lqKp7vIcb1rOCWV4nUvirll
 wThQY2cqzDalNhjEAg6XfnPg3JkB6OYZ2cqhBPoat/cdgXVQjmAo/9wDBCkCi4YlA9
 nlo863/jMnSuqLF+fnDbQveM0GIGL7MR4OPSQCqcocERBn/emuE8UQE0+YEvUOg0f2
 Y3v5HTgwP+pm6ak2/nZxeSnUcPKCbO81aRXNUaOLV7vqVFXSS++Cd2RgFczb6QXGTR
 CHvLKcgdan02w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=QzZnvy+l
Subject: [Buildroot] [PATCH] package/libjcat: fix linking,
 add missing intl library
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For musl/uClibc-ng toolchains we need to explicitely link
libintl. The problem exist since the addition of the package
in commit e52605c092d8eaa926da8720ae498a38eddb5205.

Fixes:
 - http://autobuild.buildroot.net/results/58c/58c7ecbcfab96ebbc7a20291d4712cf64094b9f7/
 - http://autobuild.buildroot.net/results/5d7/5d7c5dea0213f5a24489c397c5703c0601b2f12d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libjcat/libjcat.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
index e13e5dbfb7..222e8ff72b 100644
--- a/package/libjcat/libjcat.mk
+++ b/package/libjcat/libjcat.mk
@@ -40,4 +40,8 @@ else
 LIBJCAT_CONF_OPTS += -Dpkcs7=false
 endif
 
+ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+LIBJCAT_LDFLAGS += -lintl
+endif
+
 $(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
