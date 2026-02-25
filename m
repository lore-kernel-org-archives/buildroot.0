Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968B1EFD23A
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 09:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CFB4094B;
	Wed, 25 Feb 2026 09:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOsFxGo70_ri; Wed, 25 Feb 2026 09:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D5F74096D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772012910;
	bh=mW/E6qmftqb2xw+tL/SscN4IimFoO1zAadpK+FfHVxc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DdM5W9WfbZ4Frxr4JSFhF8O1mC7njBjMNKm1mSOYlQp84soXfrFNiJnqqgDmPNz9l
	 sEa7+UCOv/go4MO5URYkLb2mwA95e8Mc/R6OnGyrUHLVsEAUYmSX2kgdDME7ZV9I4I
	 JkqT1quGrSIHOFDuyat2GvAcpo5j4qCRAj8EH5VqQCk5wwEpPlwKU/qMkn7yutfaU8
	 276kd6GmDOZ3RxwE96fCOsTcbRlNFdMBvQycSSaPTLMAg6UaPh4633d7fTRmkXaFL7
	 hvSv2/Bc4XfZ6e0l56zOI61i9o2Sd6h07FloVl7rUluRTgb7S7/9b7YRFbFosrxWeb
	 PQg+A6WC40ZjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5F74096D;
	Wed, 25 Feb 2026 09:48:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E27BF23D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D41F04096D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FG2vKXH9jlKn for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 09:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9AF34094B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AF34094B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9AF34094B
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:48:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4398d1f06caso1028698f8f.0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 01:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772012905; x=1772617705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xB02o9p4k3vaYM7ny0W64ciWiloZ6O7/woI+/KoeeZk=;
 b=QabK/tFIXYEuJFpa2wk/mOi43J4WtKRXjHrlHBUL057VwqHHYvUjbQOsLcgKtx5Lym
 vKRavbFv1/2RlFjM7J0Muaw9HOHt07IvyfWWqEgERsYA/FDWEIrZtEQa4AENoJ3bE0cz
 1PbZBfR/IUITB/SLmabHmRE23sOqjftP78ONQhplYVFR6r8F55ZRsVSMF+pCIlzb1w+2
 ROMa8JcS6IDhZ/rUX2LiSvTzF5ofljGXNl7dvJe8sOVEjzTKj3Ie4SvuGeou3C/qa3MM
 xw1SILsM4q6nO4oWOHuLyAPR4gTF8hL6WMNyQ2H7XbUXeslcl2WtVkdAYwhU7ljBPx46
 EYjQ==
X-Gm-Message-State: AOJu0YyRAPijwXZOcCWEwnJx60gypJpjn3AOmjDipRr66jKVF6F/bZ3J
 abyDtBbnRBPjTdiLA9DR5CJWMlKTe92Z9NMer2Y2NIjnRuAo30hK5GmbeZuCA91v7uWmGdaCYGW
 xs0IK
X-Gm-Gg: ATEYQzxv0JUQD/osctyDTMec0AE4nagyGGCfiNve094ki0rNDEqPq4mYxxMT0gRyvj1
 HCYf8yVz2usQx7xECJmZWi5OHX7UoY998vrL5mrtc85eRVLCXAWEl5tkKyhu+Qzi8iBjiS3QnDK
 FiLfzVKSbRwHN9o3CpFpbHWNPz6CoW8WmImTJ2Ng2f7SIDVell/Z4tG6muMYwtrsF4+Gh3cJu50
 JPjeH3U+0TcKC48U5gjKElWf1llSsIKWTo69QUfWrMtKoJCfPhgpBZe5srmhXG8q1ihFyn3G73l
 2bA9wo/7x9tpV/Io7Kk2S8XUO/mR2mp5ZTgksnrwVRZP+TcU1sKHREo1KzUxSAHq3rHuJdhBhZx
 btnNjwM9Z7+OLbsryheKDaYhNFX3+n+RVaqts6OvxofZ8FVU+CM8xVh5gnzOrK0OeZsEJ6CX/4x
 CiaD0UiLm2Q8QLk08=
X-Received: by 2002:a05:600c:8215:b0:477:5ad9:6df1 with SMTP id
 5b1f17b1804b1-483bef18a2cmr28241785e9.3.1772012905134; 
 Wed, 25 Feb 2026 01:48:25 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd72bd66sm55770795e9.11.2026.02.25.01.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 01:48:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Wed, 25 Feb 2026 10:48:24 +0100
Message-ID: <20260225094824.270893-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225094824.270893-1-thomas.perale@mind.be>
References: <20260225094824.270893-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772012905; x=1772617705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xB02o9p4k3vaYM7ny0W64ciWiloZ6O7/woI+/KoeeZk=;
 b=b42rcQqqZ8Ek+luOwq0MLEHcjyJRtsv/KUMcANEaODZKN6+Q1XgxCVYDEb/hIkJeOK
 w4qBJqeS+zn6EW7EGGLGy2OxHkVtIkflQM2j5cKBY5WBZu/XRI6cuH8Qena1V+IPGZtW
 JH2LpLtB2PP1rMrPDo7QaEldx+NvGtmM4yLQzODkA9d/mJdvhMxOuX9eUdIKbV3M+YOI
 uNS7vzxSR3Q7GnEmOeescbCpYzpLSMaBAXdRf7ccNPKqFpazDcUv0h+PG0HT2lE/QR8D
 78TiyqVVuhI4F2qaKo2fMVODASDx34tM2UbbuCxgfx4kMN2a1JrWhBp5I3efR0mb+W70
 s1jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b42rcQqq
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html

Fixes the following vulnerabilities:

- CVE-2025-11626:
    MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
    4.2.13 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-11626

- CVE-2025-13499:
    Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
    denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13499

- CVE-2025-13946:
    MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 4.4.0
    to 4.4.11 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2025-13946

- CVE-2026-0959:
    IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0959

- CVE-2026-0960:
    HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0960

- CVE-2026-0961:
    BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 4.4.12
    allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0961

- CVE-2026-0962:
    SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
    4.4.0 to 4.4.12 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-0962

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 88eb7ef494..87d5781eed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
-sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
-sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
+sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
+sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9ccd8f9a9e..196ac63271 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.9
+WIRESHARK_VERSION = 4.4.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
