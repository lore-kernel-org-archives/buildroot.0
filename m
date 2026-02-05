Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A157E91286
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 07:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05AC980DC8;
	Thu,  5 Feb 2026 07:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afAGF7ReM5kt; Thu,  5 Feb 2026 07:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E7280C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770275373;
	bh=yIzoe7AtzbuX5qG+sMmcwJ5jUvMflhY7ETBb3yIij34=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E6+C+3WvktQCHpfecWZWbPlSwRdHRpptHF15KCX/1dhe6RnC9sD9Gw2zJHdyK0EHI
	 og78iaRkprPSy7cmEY61yHoZeUYCIm2Fo2bb5Qi9HNkudSsdHYFwb86u2yco8Tu8af
	 gijJEj8uvqDBVHYyqQiAQqdiQEfinm5nmUfIOaSei38N6mf0nstNISYW+aiiCdcYtb
	 9MEXDRYIXaDgNW9LsAt1gkGv7WjKRaDiar5QI1NankwMNQGiRBoNruI/vz3nFkF3oh
	 W/iPN8eqhsRam8k0wkr3LH9E1LSLO2q1VXVKsNF7g/njAgCDvgq1DGFYRX+648UVl1
	 hsUzSfjKPnj2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E7280C9F;
	Thu,  5 Feb 2026 07:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8B7417A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8953D40A88
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVI49PwaAT2t for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 07:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21E0340A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E0340A5B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21E0340A5B
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:09:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57AF0A4C4828;
 Thu,  5 Feb 2026 08:09:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60476)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vntUT-000000006II-0qRC;
 Thu, 05 Feb 2026 07:09:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Thu,  5 Feb 2026 08:09:24 +0100
Message-ID: <20260205070924.275981-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770275365;
 bh=SXUXt4zmeC2Tz/2K84nCNWd7Bni/XtLKS4nod5JjL7s=;
 h=From:To:Cc:Subject:Date:From;
 b=HSqKQZz9v9hHOOFq6T3LcduP/OntgNgMxo/m9ITSs880qwSaUrOY1faCh1t3bhlle
 tg/vbDZCQSDVoNl5T5HQpXyG45Nd/CNHxu2dju50D43vAzwQkCHyIdSczv9xV/RZFH
 kh/p1WcxghKm/vgmON8d3STZHKDGwp7TWFn8Qzi8oZ1APv1+CmxNHEHx1Ss4ShjXME
 gmelr9aGw9baCWt2CNYjIKTZMzLP/o882TjLeVS2eVrp+D6DXBbkvDb1MZQSYe2/aM
 wGwcI6yxBDO4f7vVYaWzMzd4EoNPwSeROmfh56TvhCB4puw8Uc7NC3bzhyRwCkfiDu
 wpZwGVeXrQAkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HSqKQZz9
Subject: [Buildroot] [PATCH 1/1] package/jasper: fix build without threads
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

Buildroot commit 03a1732dea67e088ec85f92853ca14f5a3c0f7b7 bumped the
package from 2.0.33 to 4.2.8. This bump includes upstream commit
https://github.com/jasper-software/jasper/commit/91fca092098396938830fe458f57109f0dd58a54
which was added to version 3.0.0 and causes build errors when threads
are not available:

    message(FATAL_ERROR "Threading support is not available.")

because JAS_ENABLE_MULTITHREADING_SUPPORT defaults to ON:
https://github.com/jasper-software/jasper/blob/version-4.2.8/CMakeLists.txt#L124

Add configure options to disable thread support when needed.

Fixes:
https://autobuild.buildroot.net/results/870/870d6adbac166b22cce217628d477b1bce538320/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jasper/jasper.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 88633c9661..9ed54989e2 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -32,6 +32,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=ON
+else
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
 JASPER_DEPENDENCIES += jpeg
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
