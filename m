Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA23FEE4EB
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 11:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93EDE418F2;
	Sat, 28 Feb 2026 11:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FN22vSbmPUA; Sat, 28 Feb 2026 11:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933B2418E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772276785;
	bh=k+Q4Kth6A+rb298FZDfbGwVosqlgflX2oPwXb/ldJpQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JlZ8orB/gmX7bYS2yJYlo0lYAzZlpNxKjmAA3SwZ3L/nULaxK4VtbXN6E84yp5Uk4
	 DNsjZh2SU4OUWbRWTxlaJYw2wwacUlAtZJohkAkus+2Fc1uoGNsB6BEfU+cpHDEiTo
	 C7xPqd7Su/6DgR4zWxNfeCPuhHeR5lGNG5xRwwb6YYDNBBxelNYA+UgWvpNBjKoH7c
	 Mf+WBGnz5C2kn7bpVRLrdnHYK0brVjGYUZMsisaJoe3eq5cioFM2xJQRJCoqu4TZfZ
	 ML5BIW8uKAdnN/ZLqSMlp/47wqXWqxOB1H/+4oiASn8wLfKK+A+f4uMzvwqRYFxOcJ
	 cgg2uf4Shg+ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933B2418E0;
	Sat, 28 Feb 2026 11:06:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1040518D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 11:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 006C9418E0
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 11:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N06i-5xCDigm for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 11:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82DD2418AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DD2418AF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82DD2418AF
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 11:06:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 296ADA4C0788;
 Sat, 28 Feb 2026 12:06:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwI9M-000000003yo-0J1e;
 Sat, 28 Feb 2026 11:06:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 28 Feb 2026 12:06:19 +0100
Message-ID: <20260228110619.2758404-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772276780;
 bh=ReSvKfrQDWkHLvCrtAcYFVTaD3FkXbcUxIzUhkKLlh8=;
 h=From:To:Cc:Subject:Date:From;
 b=RGT8LznkKcV+z6kT9N5bE7b6w39PdJGRkG2MPI3uJ5l1PIcdhv3YgeeX/5qMjbkHa
 Nd8CpUbQC83wi/w66M/pdxE6Hais78vaLtsBKCAFI4qWswTTXsg7+kN1ozRuTg1SQE
 DShZ5oNBLvxFWKM0vl+v5o45V5M2maWopFkZ8ZfhqSb+lRwKXdYQC8IF33ZBsglsGS
 GZ57gBiLRvp05wzOjbeyJEUWhW9CsKKXGkzpPBdvMk4aoaVTI/SfbHSjxAEbfsAPew
 JGzeFsSnId6QV6wl6lh3UQ4eROWK+iM3WXLSXLVZSZIl1+cUfVbWh/ABKF8zSqV9rs
 rV7XKKu9J6G3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RGT8Lznk
Subject: [Buildroot] [PATCH/next 1/1] package/oath-toolkit: bump version to
 2.6.14
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

https://codeberg.org/oath-toolkit/oath-toolkit/src/tag/v2.6.14/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/oath-toolkit/oath-toolkit.hash | 8 ++++----
 package/oath-toolkit/oath-toolkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/oath-toolkit/oath-toolkit.hash b/package/oath-toolkit/oath-toolkit.hash
index d44b7bb742..a2c0b27de4 100644
--- a/package/oath-toolkit/oath-toolkit.hash
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -1,9 +1,9 @@
 # After checking pgp signature from:
-# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.13.tar.gz.sig
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.14.tar.gz.sig
 # using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
 # From release announce:
-# https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html
-sha1  62807099befb8141e429d3e38750772041ea9056  oath-toolkit-2.6.13.tar.gz
-sha256  5b5d82e9a4455206d24fcbd7ee58bf4c79398a2e67997d80bd45ae927586b18b  oath-toolkit-2.6.13.tar.gz
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2026-01/msg00000.html
+sha1  e408631d07f84c839f266e0b1081a9f202d76a81  oath-toolkit-2.6.14.tar.gz
+sha256  8b1da365759f1249be57a82aec6e107f7b57dc77d813f96dc0aaf81624f28971  oath-toolkit-2.6.14.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
index 37b00a8241..8dee1feb00 100644
--- a/package/oath-toolkit/oath-toolkit.mk
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OATH_TOOLKIT_VERSION = 2.6.13
+OATH_TOOLKIT_VERSION = 2.6.14
 OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
 OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
 OATH_TOOLKIT_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
