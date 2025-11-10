Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299CACCFA1A
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 06:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E07608D9;
	Mon, 10 Nov 2025 06:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsvJHGTufEam; Mon, 10 Nov 2025 06:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83C2608D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D83C2608D7;
	Mon, 10 Nov 2025 06:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F8425D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 06:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C906608D2
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 06:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3ulsTEDGz2e for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 06:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B755608D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B755608D6
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B755608D6
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 06:41:18 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b55517e74e3so2275115a12.2
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 22:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762756877; x=1763361677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPDJgdpetYcq0SkDprnSL+ZbaetSLegVnazwi4JvHao=;
 b=q4CIC3E32shNKcIteiQJYldw88nPZ9J1EqBVnhf9i88K7osLHpfe9V4eWa1bb6ngy/
 JAE08oHWH3eejmxBvev8zd8d3cdGGwHp1mTl5MsfEfrcTQpAv4xij45MabCj0n6RvE78
 HXRz5OQzj0XyCxwcwpGof+EM+p13ai+OLYHa0PJbZd76q9VS9w7DSmmr4FMAdTomr1NF
 H4MbdN4I62RRVwy0tvoF9HnHSmNA3gWwNZCGV2k0Rz4gOpm4ibmmjs2naseqmkJIyQRB
 1fEAOexwYQt/5j8C2QZvBbIB+BUy6jML2wTzEcOViU1h8tjypsY48hj7+q+97v8NyLPv
 qc0A==
X-Gm-Message-State: AOJu0Yy9rVV5dF2ku0JPJrK6ZffsWcgkBX6d7J9aFCU24zbExaTniwvp
 b7O6ShQeQbQkBUDdl21IWpE82QJ5kMqrEDaCF7YNeOlgmYMLxY4g+2jcnC3sDeHY
X-Gm-Gg: ASbGncuFgbInXt0mfttesOEST/1jMxcnKKrbm5xHE8pNjFtqQhlSQAm/iOEll4ngGJg
 6fjdVD5p9PjQlJCYgHF3rWkIIoepcCtZqR+3cI7DlCi1bauHUEdj/QA1qe3IVc52oNW5JtqWkRC
 istvnBRpBqGL+24a0aa0CusfeJMYqzB24KLbo9FhLxHn+I7AWtOhfHqAzORO4nw/A7QsScGFwby
 LVvMfTwCsi2Be/Um/EpTT8TA9r6y7hdpjDxWDXLS93QuVGydfxJoaxRPmIzxkhxcneaIdCLTNjw
 otFil51qSy5eHYHoUJq43U5Y57rKdDWV1q8w3sGYfZfNLE107JTTJ00sNUNWtz2EyOaTA9CkkS8
 Mk/otqo1aoPHPDZZmmQLOBZIcIGuwDWSv2C4zVGbg61t82QKlot9hfFh22Ij0XoX4hcZgeB/gLh
 WFp0ep3YuH+Af9yFKROxjFXIJygh3S6jSTEzxIJepLr78ysbhT0z1y011MRds=
X-Google-Smtp-Source: AGHT+IH/AOFzcBexFRdB/HJSqnLM0txebA1XcBNJD2Jb2NL0H6G/cXKs4uyX0iJ/O7+VtYCFVtPe+Q==
X-Received: by 2002:a17:903:19c8:b0:295:fdc2:1f52 with SMTP id
 d9443c01a7336-297e5625cf9mr94834625ad.14.1762756877335; 
 Sun, 09 Nov 2025 22:41:17 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2980c51b8c9sm33902925ad.47.2025.11.09.22.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 22:41:16 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  9 Nov 2025 22:41:13 -0800
Message-Id: <20251110064113.234252-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762756877; x=1763361677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lPDJgdpetYcq0SkDprnSL+ZbaetSLegVnazwi4JvHao=;
 b=Vse2G/tJX0hHh1OW0NBmYA6xWMs/NLoW2Q9Upn2JyjBlDuIgiNm19XINF29valEcvB
 AaS4Xj88pCsQOt9v8UMpyy1iUs50p+Xo/gTyeVyAfZDNQRfTLoqmG4raqJtDq7YDQT7e
 ObrCThBbvOXWAjmwcMHAwo3H3uEs/XXptpgE/0HxhU1iU6+QC/teTMfH4sHVUUt/Sv+R
 d1VEIBcOAeymMP3EkHBYvVaSRBh3Of28wW/slVJc7ETCSRhpzIxubvoHLr9bL3AB3+ot
 7jeTmE4nz74WR0jFw5tq2C29vtw7h/2fxidhZoc3QyK+18t9RVCLceqrHg7Gndi3WW7y
 JfTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vse2G/tJ
Subject: [Buildroot] [PATCH 1/1] package/lldpd: bump to version 1.0.20
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

Release notes:
https://github.com/lldpd/lldpd/releases/tag/1.0.20
https://github.com/lldpd/lldpd/releases/tag/1.0.19

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 127480095e..f3cefe7b73 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.18.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.18.tar.gz.gpg lldpd-1.0.18.tar.gz
-sha256  4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7  lldpd-1.0.18.tar.gz
+# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
+sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 1b2cef9865..a3015e9e7d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.18
+LLDPD_VERSION = 1.0.20
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
