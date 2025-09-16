Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039BCAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8EEE41174;
	Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEw3p-diMUGK; Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0026741207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0026741207;
	Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14FFD12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0745841963
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcTDUWVD1V7S for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 106A541C7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106A541C7F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 106A541C7F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3e8ef75b146so2463241f8f.0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054459; x=1758659259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnO3D1rCHPlya9uqU4jv7cZKfseJLrzrifd39gq6+1g=;
 b=czBFj499T/SifmJObJaeCBqSwhBxp9oZcmMG5T/C4ACTgHCdc37rbbga6Cit9IccSc
 rMTfVlJ+QLfZqGKuZUTGoP25nF5MqUgV36sA02WZ4ADN4tFp3iHw3JC8LLLr/Xt1i/6o
 4udGb0ec6VlcSGmxVkjUwkRczU0d9rQW0tO2D6PBLM9ZrDad6noue972Xwu0hhV/7A8T
 s9OKuf2ScJA2AFHZqo2r/TKzTFOpnKOpY7OQ0jSCflRwM2+PGVgNX93aGaONS8WmwjOX
 mzlwmNBhG6RjrOey7sEsm+iEdScPEG5mgo1rB1BuwM5+rKlx1NnjZsH6Z+Z2suL3YBWQ
 nk4w==
X-Gm-Message-State: AOJu0YxQlSG9Xzp0Uq675DdMyA0ILS1PkgP0SvOyZaAU0zdObaya2Too
 OrBen4cKQ5p2OaLPzzPR9ak5OXLq+7Y/DcMc/l6Vwv3W+hYetDbepDv7yCDsVdWNjjJ+r1YwGTj
 ndS7vXkI=
X-Gm-Gg: ASbGnct9LCXuGNEKT21Qv/DIvcQXE1qwUW/tX1YzLbb7ilLpy2SFftdWQ1LOJWTi8WW
 0Z1GmNI+D8MIp9avv5y2+2QgW2VvYBvoWEk8lGtJiHMRXx6hQVf4hDR0HcghHMto663cEomkRig
 BMHXW1YCF0G18tr0r3JS0M1t6s3Kpx1Wx/6Yo82X0KRtSthXJvOFAIEHONddLMMdTmZa63lO8VP
 z2RpklwFjB57djWYla4lpPXRUGGLhaq9OcI4NcmuEDce98Ly8GGBn3G57NgqtosgQpd9KuOBl4r
 cxt73y2OHR2bzjPnxI2Df9RHGyUBWBfARzutfkwE2YcZc0UXx2SSiC87IqL2c12jX02Cl9ILZN7
 tObwhp4+Ozg/HDGA=
X-Google-Smtp-Source: AGHT+IGFINgKFyrVINabI2H6rz8bItcbH4kEq5SsPrmEsSa0Nfq8xQTQbagRfPJEchxYHyo4RXgDGA==
X-Received: by 2002:adf:f6ce:0:b0:3ec:dc9d:bfcd with SMTP id
 ffacd0b85a97d-3ecdc9dc016mr1344810f8f.63.1758054458758; 
 Tue, 16 Sep 2025 13:27:38 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:26 +0200
Message-ID: <20250916202735.1121872-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054459; x=1758659259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnO3D1rCHPlya9uqU4jv7cZKfseJLrzrifd39gq6+1g=;
 b=Gl6e8G3d+Rr7Up89VPUvOdlW9vet20mUrSk8IT5Bi/pV34O7T6ct7KCDIIujT2P01t
 RogxIKZ+SSDWfYpXXjLFWB51fpQd5RA+Puu35siKGX1Q0GIrWS5MOSXknp37nb+OGrA4
 4vkfmE+zL/vUW52NlEE1XFtd5V8v/32lscrmmfjXn0jBh+GETD/ksyiG9wsrZrPeXO/Z
 Uaq2fZVz7/0zocSS+i45yuc1AtenEMbhi8uPGRlxd7a5fDeJMKy94jp+wnV5ls8+Nee5
 EJ7tmIskS1La4e+ZAZJBrsu5whAQVf4+IyRzc1blR3cclFmOMpOngV8qFJl8Its9006b
 eYCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gl6e8G3d
Subject: [Buildroot] [PATCH 03/12] package/cpp-httplib: fix deprecated CPE
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'cpp_httplib_project:cpp-httplib' has been deprecated in favour
of 'yhirose:cpp-httplib'.

See https://nvd.nist.gov/products/cpe/detail/5D557BEA-8246-464C-AB90-EA9495A0732A

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 64b517ed8b..3f63e3a865 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -8,7 +8,7 @@ CPP_HTTPLIB_VERSION = 0.25.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-CPP_HTTPLIB_CPE_ID_VALID = YES
+CPP_HTTPLIB_CPE_ID_VENDOR = yhirose
 CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dtest=false
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
