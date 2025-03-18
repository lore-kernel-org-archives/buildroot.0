Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE4BC35FF8
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 08:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C7D410FF;
	Tue, 18 Mar 2025 08:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxA_vr_LATo6; Tue, 18 Mar 2025 08:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A6D41117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A6D41117;
	Tue, 18 Mar 2025 08:39:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2462816E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 08:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F7CB4016B
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 08:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKgMvddBMDyb for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 08:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=colin.evrard@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60FEB40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60FEB40136
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60FEB40136
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 08:39:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5273380f8f.2
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 01:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742287157; x=1742891957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SOQxBdZQ5JmKaRfN0NRZMNwSRho/1i4doKkk4LaPV74=;
 b=GvcVHHFVFBKv0ifloKVQKoJtOR6sW9FdTpjmNR38MSsOhDXGV2+PKlXO+ww/Z9kaK2
 hO1dOcGaTl0weYYmCcvskfCOLbnmHCvQftF6aFI7o89sEzKP8WHVJnj01wROfxRnDlo7
 obq79F5IdsRxZ9PQ81yUNif9l0GX+SyUs7CuyV2IW22i5mQNoCLr/OTNXXWrIYtTw18m
 SqtI8YQlyUTIB8XEMJxZmWvA0CYvIDjAT5Ggfr+O3UAnKkK7c5el8LdPkfNOiUFjiOv+
 F36psApxJftJlUtqHC5yp7sEkIjTEgejZLoKuCQHObJS7LzGwdab9gTtKiRJeuMG+vdL
 spOw==
X-Gm-Message-State: AOJu0Yw4MP5AE+nd7M99HTE1lKcZHtQDrf0qErQ+5OpvZ38L6OkB5eMR
 D1wTWy2zHRvDRD3O2+I4iRQoEZPaCXha8yZVxEdz1JgmYd6aSoh6p12YuwsFy7GxGc9XXaSJU/9
 J
X-Gm-Gg: ASbGncsukcTKqBy+dlWKOXnxfPCal1HPD5uo/tW944x5nJepWoejYwXwwh+hvpjPTVl
 oPpGceqvtrON6zMW92AFaBTBS0pz4adp42HAAULqoXdYZ6sjDJJ6/9apY7rFXOIN/qQH14qwfYs
 WhUvA1q8ZB4ZtofvN5ViO2O70PijlYS3VntcZw4SxP3VyGL8bgWZ63Zii3KcLHAVgSIcTDA46Lz
 cYKfRiYA1OgI+ST9efILJvJRlJruQMqKN7bg9YGUxFyOcZ8NdHOPDV61LDvgSSkEGiIVptlf4nf
 OETgmoINjrpkNKkw3oxs9Wvc0sEE/W3AuV+hGTCGwGTT7Xng77XUR+Hefp/41VFJRIk=
X-Google-Smtp-Source: AGHT+IGeRaO78kYqBKC/FO646iqxapWQGJ5JPab5rXmAZ5KpMRukpiv4ty6YsxKDGOE+yeTJJw6smQ==
X-Received: by 2002:a5d:6d03:0:b0:391:4231:416 with SMTP id
 ffacd0b85a97d-3996b499016mr2479992f8f.36.1742287157108; 
 Tue, 18 Mar 2025 01:39:17 -0700 (PDT)
Received: from colin-evrard-laptop.voo.be
 ([2a02:2788:7d4:6c9:a468:20c3:cd13:f78c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318af0sm17524347f8f.73.2025.03.18.01.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 01:39:15 -0700 (PDT)
X-Google-Original-From: Colin Evrard <colin.evrard@mind.be>
To: buildroot@buildroot.org
Cc: Colin Evrard <colin.evrard@mind.be>,
 Frank Vanbever <frank.vanbever@mind.be>
Date: Tue, 18 Mar 2025 09:39:05 +0100
Message-Id: <20250318083905.45217-1-colin.evrard@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1742287157; x=1742891957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SOQxBdZQ5JmKaRfN0NRZMNwSRho/1i4doKkk4LaPV74=;
 b=H40vcB+YxSYmDpokfkKXl6DapTsjYxPcgfLAwVlxtY63Zx9AhdRyYj66VPW2tbsd2f
 EQ/L+zDeHKeGDn2i03ofGCCESRWgCAj0V0/2uHHN0A6PyPnM+D4bWb5BvZNKlURcXeEH
 3QIrihTNWPRnwMTMp+yCHbCiatKp0/cYtDpUVmL6QiwZGOWsT2nT6H2T/0j6gNEI1Ar5
 0e1IPymCmsvu5gj2W0nTiW7rryE9XCXw5lZcoccGCexzT5p4iOwZwT6HzIRWmcCyWAL6
 Dwa5Po3YEd35M9XtVAS94V8YWeq8JQMjXJd20LJtt6NjPnHadLwgT113sAbKQlESmeeM
 r5Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=H40vcB+Y
Subject: [Buildroot] [PATCH] package/libmodsecurity: security bump to 3.0.14
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
From: Colin Evrard via buildroot <buildroot@buildroot.org>
Reply-To: Colin Evrard <colin.evrard@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The project has been updated, including
security fixes to issues present in version 3.0.13.

- Fixes:
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2025-27110

- For a full changelog, visit:
  https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.14/CHANGES

Signed-off-by: Colin Evrard <colin.evrard@mind.be>
---
 package/libmodsecurity/libmodsecurity.hash | 5 ++---
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 704b5541ad..821459f6b9 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,5 +1,4 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.13/modsecurity-v3.0.13.tar.gz.sha256
-sha256  86b4881164a161b822a49df3501e83b254323206906134bdc34a6f3338f4d3f2  modsecurity-v3.0.13.tar.gz
-
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.14/modsecurity-v3.0.14.tar.gz.sha256
+sha256  f7599057b35e67ab61764265daddf9ab03c35cee1e55527547afb073ce8f04e8  modsecurity-v3.0.14.tar.gz
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index f6a74e13d5..a90fa1d614 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.13
+LIBMODSECURITY_VERSION = 3.0.14
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
