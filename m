Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD0C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62AB61402;
	Mon,  4 Aug 2025 21:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRNm5phwnA0i; Mon,  4 Aug 2025 21:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB00D613F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB00D613F7;
	Mon,  4 Aug 2025 21:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5062233
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 21:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB4EA40DC9
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 21:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvXjt26J5VSF for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 21:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED8234013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8234013D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED8234013D
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 21:01:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-458a84e2917so41590385e9.1
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 14:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754341294; x=1754946094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bu4muS2Gh+6pxdchee+Pw2Qg/Ox7UXYc3NaqGfzc/EA=;
 b=hd6MrXD9SQoyPLpByVlJ7VymXTKtbNoufbvwKSLUZprcfvJKLGdvFk+6ObfRdV/vCD
 HO8vLIRu798gt3Sy66zZpgUAGw9ZZz+O/A1tlBrerT89k4ykj0EarnSX2aOgQ0eiyR+a
 cGEpxvBr7svXrcdj1/l214dui+yZl2IQ9+7Zi1jVeGg2YIwuHWdVXHQxlSpJaghPjcUl
 FP0I+xRsht2XjpizmINvb9gdr6rgrqH/erSQVnO+YD5lLCFpSbMZZhMNJOAZmA9ATijf
 EV0cOqDxTZ8THO3E19GbVv3u0A8a8FifEMOePlbsEOrSpL8XUnKWy7PCs00r+BQEFVuZ
 zjYQ==
X-Gm-Message-State: AOJu0YwI2To+on+O3iCxYVSNf9f3iLYf7HdOU+aLAXObETOGUxiHokBm
 Ht+/EZ8XEaIf7LtNl0G4i6Hvb9xzlejrVOSn/eFo2XPVbY9xLK0YImo8qnogDmTRKcXdURo75z7
 7GV0F
X-Gm-Gg: ASbGncs+1AzD2EeBXImDALmVZEi3XCss1BsuYsuXgbePr2NrJM1sGfLMXXHbpOzIqiE
 HKEprQm0kbee3JFqxxSIU9IQKZBvQfn3xSmNmNV1AbHFvNZphKnv6hV1SXNC65DBCkpbz8p2iTx
 4OvNppP6m7ToplwC1vwunG1bOvt/y2D43KU2F09MrvIiZwQjh75Q0arnMor6NPKkN5WGCzhA37N
 9aapGT87PwsBn58GBVhI7cS1cUA8PnDe3EyH6eWPKmAduknappvY1KZrV9ffT+kIgezTyzNt06M
 B/eqmPs8mGrwd3RnQV5zrgAphz7l0fPaD80/0HB8fUfgxxnoMxjnv+2Nn8jE9shUk9frs0qKzRk
 jsHebMaMMD1KYQA==
X-Google-Smtp-Source: AGHT+IH+qd1H9WiXZq9tu81lrEQ4Kp1A8UZ6rIi0F2QG1nX97xWEfiFuP6QHfE63Z/6w0SCWaOw/dA==
X-Received: by 2002:a05:600c:1608:b0:456:eab:633e with SMTP id
 5b1f17b1804b1-458b7d12c11mr60598085e9.17.1754341294378; 
 Mon, 04 Aug 2025 14:01:34 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c470102sm16569186f8f.53.2025.08.04.14.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:01:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Mon,  4 Aug 2025 23:01:32 +0200
Message-ID: <20250804210132.3249620-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754341294; x=1754946094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bu4muS2Gh+6pxdchee+Pw2Qg/Ox7UXYc3NaqGfzc/EA=;
 b=LVdNpn8o6loHPAerPgA3SvSwOVsay3bz6k8LGq5j3ZLo86J9bHdRHNWTL+FBUMCS+7
 EjcGzlxgJyKDyiZnBD3FfoDlNtrJK9utmG/uVabW6uucXjihSGSsMu3EtqOnWyZAUCqQ
 6Utc2q5SsOQIDZHEPb5x55PA8fpdrSfCzDojLAXNluOFKwhPQWyhLto9ja1GuyFGVxTa
 PcfNEl6ySRLKOiuRhgBwG03LZIahu+IRkjsiejWlIcPvCyIbXHKt2tN7Pq5kqnyYOjcS
 dpzKJvj2VgCmNdPiV9NrVrP4GwKjCuMPIq1PmAqbj3NqNyZ/omKLzKx0FYQug+OHgFDL
 PIlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LVdNpn8o
Subject: [Buildroot] [PATCH] package/apache: update mirror url
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

While the 2.4.65 release of this package is available on
https://dlcdn.apache.org/httpd older version are removed from this
location in favour of https://archive.apache.org/dist/httpd.

In 2025.02.x branch the apache package hasn't been bumped to the latest
version yet so the following error started appearing on the autobuilder:

```
>>> apache 2.4.64 Downloading
wget -nd -t 3 --no-check-certificate -O '/workdir/instance-0/output-1/build/.httpd-2.4.64.tar.bz2.hfXgDB/output' 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2'
WARNING: The certificate is NOT trusted. The certificate issuer is unknown.
[0] Downloading 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2' ...
HTTP ERROR response 404  [https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2]
make: *** [package/pkg-generic.mk:179: /workdir/instance-0/output-1/build/apache-2.4.64/.stamp_downloaded] Error 1
make: Leaving directory '/workdir/instance-0/buildroot'
```

To avoid running in the same error once the next package version is
released this patch update the site to the archive mirror with all the
releases.

Fixes: https://autobuild.buildroot.org/results/7a0/7a0982bcf9db4dcbcf4f6cf31b9f19571c061ee4/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/apache/apache.hash | 2 +-
 package/apache/apache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index ca9d1580ad..5b0aab0af2 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
+# From https://archive.apache.org/dist/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
 sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
 sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
 # Locally computed
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index cb029274c5..23332f3e85 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -6,7 +6,7 @@
 
 APACHE_VERSION = 2.4.65
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
-APACHE_SITE = https://dlcdn.apache.org/httpd
+APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
