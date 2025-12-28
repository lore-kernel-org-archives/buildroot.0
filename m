Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580B7E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF4140702;
	Sun, 28 Dec 2025 22:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nT8H_gg5jOlR; Sun, 28 Dec 2025 22:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680714050F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766961422;
	bh=4onYpZSDYm2AZnLxe8QT5w2GhjND0sENHfcwnGaSdsA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EiDncb0bhR9UHMkYrW48Gjp4V8Vh7Fhns4rQHDGrnWjirCai/CDTxrr8RWEgLnWYG
	 7Po/X0u1TkOTABg3m6BUvtV+0UJgSAJrOWO61eaq9TtNMZYAMZaq00CpyxJMq3K4lH
	 HjtkiIWWiF9yjCkDg6+Auzg1EYdWZXtkrzl9hT7f81GosxIkEt1ysiy1lgM1biAYzG
	 ecwMUX+kD9iXQulqqBgG7nqx52lmzdRT3j98ld1EAB87wT37M9rpm2XoHcnv4FMa0e
	 s4Zcvt8uUoBZSZQ576JkLb/+6eUepZXQmuYO2DaMjOiTIF1kNNCAZtXAJvZSHBKJwS
	 h1Qm8Ud3ak6cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680714050F;
	Sun, 28 Dec 2025 22:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16251B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0734060A67
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eafqeXuxT1KF for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30B4F60A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B4F60A5C
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30B4F60A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:36:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZzNevXm0uGVgvZzNfv0YXz; Sun, 28 Dec 2025 23:36:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 23:36:52 +0100
Message-ID: <20251228223653.2130377-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLoda1M2PiKchFCdsUUVuCJ3gWGTCV9lmObike8+vNtYEjFSXz3MnP6H05Bb6tf+HkNge0PkS9QqD2qjltq+lcGHwufMV9/pMWde6wTnGn7EyBNDPg6a
 tD7dcwtgpelgbZphH1x4wHpb953n6o/1OjD6Gm9wCWuU/8a00R08s0HHWxn7Ex32s34CXWhM31smxhT13A2nlrDYljT39BNhlt7gEZoF10xhARczDqpwgBN4
 bqhSiD01AOULEZapJqAberGHiuC7graKsuGkdDXj4AU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766961415; bh=8NXx+J+YyCFvhNr2ZtFfqwsU4IPtwFT35xQzX8Xbjgw=;
 h=From:To:Subject:Date:MIME-Version;
 b=aUkS/x4K3xmOQS6MYLH0F1aHYqYRc74aTckpJuvyyy9hsd3yXeK2AtEuUL4a+gmhC
 WYeGLglyYIlGoSgBH8ozU07RRD2kQxF28gL8zFIqiN+TTQCwGtXTc5YbXGY3+RPBd+
 BAAyYKXUKXq3J5zLFhZRLXvVGGfVF6KAChx4XZhcQ6+qkC7NzvwhhFAtoYmkXGqOzR
 qK+F2P4iqsVbpeKkcT+s8BvXUAZQssjsloxo2vYrqV6EEQA2ZOsKIUQQulscDL1pIt
 UG8AC1uJ+FB49YQ/1o/B73O+NRNdeDoFbd7qPjVwCwt3Z/VSWXSYwyzWtvXRNKZSa8
 cyaCoz1bicZmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aUkS/x4K
Subject: [Buildroot] [PATCH] package/gobject-introspection: fix harfbuzz GIR
 linking
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Prepend sysroot by default in gobject-introspection-1.0.pc to let pkgconf
checking for girdir to find the extended path including sysroot.

Fixes:
https://autobuild.buildroot.org/results/3d4e909b07b717a49e97a2452578bd3870a5bb48/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gobject-introspection/gobject-introspection.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index dbf0ee3fa8..aa01844d0a 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -136,7 +136,7 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 	# of which pkg-config appends the sysroot directory. This results in files
 	# being installed in $(STAGING_DIR)/$(STAGING_DIR)/path/to/files.
 	# Changing the prefix to prefix prevents this error.
-	$(SED) "s%girdir=.*%girdir=\$${prefix}/share/gir-1.0%g" \
+	$(SED) "s%girdir=.*%girdir=\$${pc_sysrootdir}\$${prefix}/share/gir-1.0%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
 	$(SED) "s%typelibdir=.*%typelibdir=\$${prefix}/lib/girepository-1.0%g" \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
