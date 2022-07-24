Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15809C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 06:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A149140650;
	Sun, 24 Jul 2022 06:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A149140650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kiFM-66F2LlT; Sun, 24 Jul 2022 06:33:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A78240A8E;
	Sun, 24 Jul 2022 06:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A78240A8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6C01BF588
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1703B83E64
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1703B83E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XElEJ6Jh3kjw for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 06:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E3183E5D
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24E3183E5D
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 06:33:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v13so3956014wru.12
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 23:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EKwlaxQF97aRioWjaMEBU1xLoDjAkw1PdwQL4558fmc=;
 b=Q012gH8llEvALQcZV5gvoWyl2L8fDh+8O1igmtpUTpK6LTLUaBFxzea9PKwouQJmkl
 UoNEsMyTVU9slZwQ+z4ur96VvD2fqxc/R1U7Q7NeVXavkPBUUGgZI7JgZ3OzOpYWYdnD
 v/AKdO+fd92vDAYUjL6gvzviea04Rxx8KSmGiZHYZYww4XLlcwkBXPYjzuizfEdAo0IK
 wsyNEzr+kaw6LgyLw5uLuk+yswxSZ3rGyF4FvYvtw4txbEq0N80+EE8MfBy4+a64p0iY
 GuSCxu4ojmS84+Z8FtSXFylQnkL9zD1JUcOZmn3VD+wMacFIvyK429y+FLgFVnq4MoHY
 YB0A==
X-Gm-Message-State: AJIora8hf27DvKBLfnlCYU9OPS1EhHUY2OW1zHxNzo0pEy+c605xsOqA
 +wBZ2I010MA+Tjfb4PqGkfDhQ0RDbw8=
X-Google-Smtp-Source: AGRyM1tbXlfwyqVDiLkAvAfZpPY62f7+SQrfZS/aUV8OhX96p7UxRKREOfqr0yrl9eLiEhB2/6MaxQ==
X-Received: by 2002:adf:df8e:0:b0:21e:4f87:6b42 with SMTP id
 z14-20020adfdf8e000000b0021e4f876b42mr4484090wrl.5.1658644380013; 
 Sat, 23 Jul 2022 23:33:00 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1c4603000000b003a2d87aea57sm14006992wma.10.2022.07.23.23.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 23:32:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 24 Jul 2022 08:32:53 +0200
Message-Id: <20220724063254.3305395-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EKwlaxQF97aRioWjaMEBU1xLoDjAkw1PdwQL4558fmc=;
 b=TyKw63Q5MYPWpt7wrJmH3lrV4/mJ2koy7ij4ZMLTEDkYEPOptja4mvaijxMKgoQ0uF
 uy06iB0PTAeFHkGbTjkCDAY5WEUx8aMuERnuU2yGOJY9VmU2DT0CGxW5iH2m0WMr4zrv
 jh2rUTza63XE8RryZ3HI3hy9Y66IkHUtGW9gR/snY2z7EL0Qb44yOxPBYPkpFMz+256G
 P4PrVjIJC8DtEe8kxLZoWYD3LSnCVUDZW2LnAZ4hLkVKA6qH0Pd1pmfIlTW5FkZicwK+
 KYgci5f9bUwXSb8MWJ7SMQ/e3K90uYyIiEQ2tE89TgCSOgKqXsHoqiz6WmGtGeZgrsCY
 3qVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TyKw63Q5
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.23.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index a93129cfa..473955e39 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7c6969f8e82badc7afa28aa1054555c1c91d2858f9f45c41a82557f5c5ce85bd  janet-1.22.0.tar.gz
+sha256  0b4d5d3632e0d376d9512ea8ea262f31f75c132b488dd7870f472acae709a865  janet-1.23.0.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index ad09d47c6..070eae1cf 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.22.0
+JANET_VERSION = 1.23.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
