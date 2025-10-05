Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA2CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17675411BF;
	Sun,  5 Oct 2025 13:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HC7fjkC0jBAj; Sun,  5 Oct 2025 13:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6CB54118B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6CB54118B;
	Sun,  5 Oct 2025 13:25:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AA4E226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C6A341187
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxqNTJWidnDB for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F59C4118B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F59C4118B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F59C4118B
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:24:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso23045695e9.2
 for <buildroot@buildroot.org>; Sun, 05 Oct 2025 06:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759670697; x=1760275497;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5uCGyBDPgl0cUknlS3s46gZOmqauroDDQDag7eLPe8=;
 b=GWRUNpLNk0xNzzBVwdUVrxIE8z2TuCGaHzJpX2OeF9v6wBxhFloAKOmHaJrXOTWr3L
 ty2kUafRz5bQrLlMWPo1rLRdg8NCnEtg/MYr7Q3w+lhu34XzQ82QRyL2iF6/fGUqb23l
 T2J43K5ydaO32SA4pgg4KFONjKPtLsl4wE5MYatt9wHQZd7j7BHelG0ro0vbMqadS9Tt
 XZ5aUfNbwo4y+llzK4/aXivS13nvJ63GyodNIG2Kv69MGMZfTWIbza6pinvGQzyTyYNd
 izqMmXAORS0bUZ8n6vv4etVZR4u490CZbZwy17fJ4hwBp0PPL8t4O1IzybL4dIpR04dj
 icww==
X-Gm-Message-State: AOJu0YwJdwSQdGfT9KLySt8pivaqwmvjQyCTMlYHTte8nCK9FIdw1xIV
 P+cZ7lu8Ku54WbdB3XDTohEDgEkTdqB/P3nGzRlwS+MCYyu2RKkfDRJt
X-Gm-Gg: ASbGncvi5/Qr9BfJdsCV8SC6gR1fBZ+F6bTi9fIXB5fnrncPvhKaIdcWORKLH5s4Aw1
 vREdyew2PJvsFxBIzJqxDkDLXG0ryC1BflJ7Q1p3OWpm51HKi+hZFNUsAGavjhxtD8uL1IOc5YZ
 h0wTuD/ybAl1PlXcBS3AldS4RPUtnb3e76WduxDGK7MA6PhmdbfNPuE8cej5uhEAV+Z/UdWOGjX
 FQXOc0Z3ehMwMUbbnzqYuKVGPdCoQZIfF4CVEiXlBNGeXOBlvIGI+CDaQr3xFRDUJLzN70o9L/o
 91qZM3s2oSUEpKNeao8KMP+Y5vRNDXR22fZx5NovW51KbBNf+heoO94s3WRbdowXAAKaPouVt23
 UBrme2k+PvqwDzSE80zivDOPWgKktidwfkzRiOhAWQXyyrIqvaamaPhp5N6s=
X-Google-Smtp-Source: AGHT+IE6cxIWEmcPkOBKhd4TZS/kaWH2YfH7iNSltyZrVAQ0fyC3afE80cWPv6BWBZpfJfhKKmnubg==
X-Received: by 2002:a05:600d:4173:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-46e7114424emr65124745e9.18.1759670697000; 
 Sun, 05 Oct 2025 06:24:57 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e5c4ce4bbsm118265255e9.9.2025.10.05.06.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 06:24:56 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 05 Oct 2025 15:24:42 +0200
MIME-Version: 1.0
Message-Id: <20251005-waffle-v1-1-4aab4f497a8a@gmail.com>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
In-Reply-To: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=uNsIqJU7FaL9ZlkqUzTyPt8SIQAN97qLwYBtcS1JVxg=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBo4nGmCZ4lmH0Az1O37u/kRwV4Qb51nH+VEtZJ2
 D0HnFFYbDeJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaOJxpgAKCRDnIYpo1BLC
 tTJ2D/4+nICyL0SYPNIUpPEXAUlItfEsjXwTdnNxJTqPUYvDMWAwu+0dmmM9wmNlxyPdYWYQDjN
 QbXVX9Q18cwVydkli7poppV1QCJ1HyKCvdmWXlZaZJSODIvG0pyWAz2B+3c+kkJGhJxAHKKEsrS
 Z1wnJGiDFj/fJ8uSKTBt7MA2uqygT4SQDJ3CvzUU6zirkgh9OstqBjbp2lz0iT9dnnSWOTbyeY5
 Qo7t0U8OkDQfOYkYCJZJj+EH9PZY7RnqIip/uSvsXXgFPl5QtS39ocQbQGF+MBFRx6eFey6xMIB
 CV388mvHQmuxeOPlKwatZDaFNX6aHUAXodX+g7afXR7s4RozzsEHncUNf+goYPPx6JdSRo4v6f1
 UPfAi1Y/K3YcVk97lDyiriCNHLPabpV1w9r04QqQpsuohe01vNue8W1HqtLvsUlPgYuy18XKq48
 EzJpL3zNKhMj/vDzm3JSSfgO0n85wg3UHq3XfwGcFWE8nbu2wup6KXpbrjbxnfE2lbrMR/WM7bV
 KAcsFQA9PlAfY42cQdXIYZ09hFrEjpsVrzkjdzox3kWBZSEW3LyIDu2GOgp42YNLue9JaIZJTNi
 5BW41qeW1OF9avYko/1A1ZERFzv9XftRidVnnziuIDhAHhXLED/j0Ge+ln2aW/QTTQx/SMCWwkn
 Js2YhWi/PPdPT0Q==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759670697; x=1760275497; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r5uCGyBDPgl0cUknlS3s46gZOmqauroDDQDag7eLPe8=;
 b=W/wxzH2GBmr1eobGMIDceKp8JjegMbYI1TV3S+PCqtvyRGS+cV6gfDr2Q34/N/8oAf
 boHMmkJ2oVQAAryRRfsL40yabFNnJQj8Hi/ZfPzbgCFG8N7PSGcXvAqhsOge0t33+PRT
 W7TOssFrB4prjQ5UYtujvXPjtPL7nmDBRsIN5xNEbpQuU8pLvqkAadhWhxx1R4acl7F7
 AIWcGMhWlbkliTrHIo7TqrATTJe5Vt9D5zZ00Lpri8HVImXOVpUEd1d/uLW6ElJgTa5R
 MJlOr94O/UvxKHA+iuqAest1atK3X6THScM26NIMGP9O10LwzzR/apeTFO+36789CbpC
 OB5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W/wxzH2G
Subject: [Buildroot] [PATCH 1/4] package/waffle: fix website reference
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

http://www.waffle-gl.org yields "403 Forbidden".
Switch to freedesktop.org subdomain.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 package/waffle/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/waffle/Config.in b/package/waffle/Config.in
index 79cb4ca2ede65613f23a8c612623aa18524ad331..c8661e1a0b929538c5fad9d1d849b1197e51851a 100644
--- a/package/waffle/Config.in
+++ b/package/waffle/Config.in
@@ -44,4 +44,4 @@ config BR2_PACKAGE_WAFFLE
 	  [1] http://piglit.freedesktop.org
 	  [2] http://github.com/apitrace/apitrace#readme
 
-	  http://www.waffle-gl.org
+	  https://waffle.freedesktop.org/

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
