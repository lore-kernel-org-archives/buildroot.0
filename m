Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE29C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B48B160883;
	Wed,  2 Sep 2026 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3u3vJfXDZwS; Wed,  2 Sep 2026 12:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788350748;
	bh=ETUQrmp6k3fr/e06CNPvTwfD9QH19q/UhHOgA8lvUuU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=I0KRzaOFGU6FFjQ/WQ9by0z5aQnV3WSq574gG+kmDe71t2UrGlQX1nZ47nXLvxygi
	 lwS8yZemylUcmabuoy0QdPGj5ztNS9vD+tOj5ULzkA4ofg9u9XivfrBsbag92m7CHc
	 3fB6Y5bENstxHRVzXx2TZafu1iXX2g6Tf7Luruwiwk3ARAoqR9v/8Pp7NV2bOSxugr
	 rL+zpNs2rLUii8LX2zTdzhRT9K99bLtuuyHvmCKBkH7WKC8p5OoujBQyShqEGfGKUe
	 85m+/+xxU1L8sU4W3VbcDI+qjc37EWh+yZttg9lDRF0Anb5AxzOiWvRS+BhR0yeYFE
	 Pv6AvftaKs4Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 942976072A;
	Wed,  2 Sep 2026 12:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84EBC465
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C954004D
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwxvBlN0kgnR for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 12:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 832064009F
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:05:44 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso7070095e9.0
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 05:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788350742; x=1788955542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G9RJIPexh1khxuMyY5RSALLvsHqZFPIzmgOGQXxuaXw=;
 b=QpTeHuR3dCvM3asLS9VnZjF2NbBOiye6GpysWGkjEzOJK3+pZeAMEkuxcTpQ4kMQ4z
 MF1sZsUCrtSTUl49Vjff3OOmxnPgkP4NtYZEDjAj0qD80x8tUZ9OPH2xUezg85rwW+2I
 hfPyWOpd6dNVo3cPdpcH/+Ju91Pbu4HRy8hDSAR6r3QB1omyVkMU9A9XIikIQZtZb2yV
 I+Fgf8Cpw2OebneHJQkWhzda2A+3oCCBxeorUjDvXQwjBjksrLcIG28ThUgw28B1VgWT
 NkE2Tn2j4mFF2xHXEhvEKFMRQic4UvEZHBRTW6mcbNcnRaGGnC4CUL0skcOrsNjtTZNn
 QN3w==
X-Gm-Message-State: AFuF++mriXv3YNhLPuxZ7p8dOsseTegmHiUqJPGWU1Rag5SSK+6tzjyP
 nt+2KFz2e3tNMfb6GSt+ZEnZmiTyKVIjpIUybmXK4S3R54su2xLoK7sUPa+7uedkPQYpDcLXxb8
 rQi1Nk8g=
X-Gm-Gg: AR+sD117DYO2rqxx8PeXEPqheC0DoIK1we6AtfOu/NQid3Ie30gLhqBy+yQUMmAZFL0
 sTZxsf3lG10VMGx6mVyA/HcmIDD1EXcNqBeGtgf9g+TTbHgjc3EnWnPu8ip5nv4Vfy4yMQamVBk
 7U8AOvby3aQXJUGsEytg+PT0af8GUUOWJ6NPcz1UIyPdy3IygdCmLcRwq7Jlz9VYdKJbswXkC2r
 U//frLL0LqfjEs8BqeDGK0uGU6EvziY9ZEHTn/0Lo9lQjRTczsENn35nKJErztAvtuq0Rxg5J81
 Tg/BeOQ+mk9wIuy3gVmQhnjFtBG99iGuTxY6W7ebX3NL5qA0ImJZuT4zcc9qYw9nrlWk47I0BmG
 AbkYqjuOM/zEXBPyq6LVoGmg7tq7ALfGYVRUGaE7veDFCBK6fFVTTIpTXTMlwHZo/lmpuKWMw6V
 qT++kwEVF058nx0NomZTA04VTq5qzyGp3Ef+mrtqbccwiktNMvIeNdgsZWY35ZFxmENOyxlI2CO
 t9Cg61j1b4/lwo=
X-Received: by 2002:a05:600c:3f19:b0:499:93b3:91ea with SMTP id
 5b1f17b1804b1-49ce582959cmr86567225e9.15.1788350742310; 
 Wed, 02 Sep 2026 05:05:42 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e80388sm7343444f8f.14.2026.09.02.05.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 05:05:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 14:05:33 +0200
Message-ID: <20260902120533.175090-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2026.05.x] package/glibc: security bump to
 v2.43-61
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following known vulnerabilities:
- CVE-2026-19499
- CVE-2026-77117
- CVE-2026-80489

(alternative to commit be382f6061216ca82a735d0992894c4e6fe5173a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash |  2 +-
 package/glibc/glibc.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 237b56ee48..cff188ab52 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  6c6ec86c66f0484c6916e849e20433ebc67869649c72a772cdf1bb6ca408d516  glibc-2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09-git4.tar.gz
+sha256  221a59fb35cad9435481bf7e79cbc4edd0ded70fb0ccf7e57d5478fb169dcdf6  glibc-2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 29b0639cb1..bdf26a0f95 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
+GLIBC_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -61,6 +61,15 @@ GLIBC_IGNORE_CVES += CVE-2026-6238
 # Fixed by glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 GLIBC_IGNORE_CVES += CVE-2026-6791
 
+# Fixed in glibc-2.43-54-713998bf001027c2507cb56f9d1c73e46a6bad0b
+GLIBC_IGNORE_CVES += CVE-2026-19499
+
+# Fixed in glibc-2.43-55-138c43f0180945b014e284a87b332d4d8237f537
+GLIBC_IGNORE_CVES += CVE-2026-77117
+
+# Fixed in glibc-2.43-56-3ad1bbd8f94a207efb108a38d434695eab8a1831
+GLIBC_IGNORE_CVES += CVE-2026-80489
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
