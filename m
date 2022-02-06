Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D561C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 22:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2982818C4;
	Sun,  6 Feb 2022 22:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fb9Fw8yNxAua; Sun,  6 Feb 2022 22:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EBBE8145B;
	Sun,  6 Feb 2022 22:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A00C21BF341
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8501540186
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ru6f940TnUp0 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 22:10:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 562FF400D2
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 22:10:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m5so4332673wrb.2
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 14:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xMGGbb4jptH01gCZCNUeK33VmapumZaUZLhJi1adFg=;
 b=gcUL6WRarF67XzxJbAFrg/5o4RHMyHkGBIpb5IZbLSS486/CZx7Eu+hZh0q4TBrbyU
 GN/z/xQJL79P1DOwQ3x5mqKht9dpjM/RItrPph+LZPfIzYbZRgBc32HkAciG40k0t+Xz
 zR+iC8opbupAVn3qb5kBrgeY9JCNORK8/NMX7PkUJ3Y3HV/Q5ki7IHf/WB0+xpDxpay/
 Aelm793PgVywxy2aBaIPdADs3d8hRbYQyjUKUmiF91Av/79/a6WlVd8J1hTkZhys+wRs
 mU4p3iAYt5+/aGBRCE93KQ8Y8H49S6bTTNVOooYOGNM/GBAVZKekdPKv8XwhEidjJKxT
 0Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xMGGbb4jptH01gCZCNUeK33VmapumZaUZLhJi1adFg=;
 b=PAv03W4mTAwLacnD7Bj+fKYJa0CImCTz+ep8sAbrqsD6zu1FH650gLTbpN6ILgg4+5
 ZxiFAsDCdCsvKGfPve09nNgJnldktSg91iztOiG4wveyePAVzHFJK5sO6pyzTjIlw5It
 sMM58cYUqpkM4pnqGy5GD/3TZz1SZX75Fg4rWLFuLjhbTiQs/vKxfcKkxNTX8gKQoX9P
 gWCXqlGZj/f9XcR31IFWCRHILJNmKr8cChsxP+UE8Nm/3bcK6F/Sb8ZiABWCmpPXBwWG
 XTvL+yuuY55QfJtY8Jwvy9x91Xq7tHy/uW734rfA0OfA9czP8YXDNN8U85JN0bTspmf3
 VbTw==
X-Gm-Message-State: AOAM531LVv4Ug33l6+m4hxyMS2+n+qs6+oqPaXj+LvRMX3PkdEirj0mt
 U29KZqgAsJOcCqob0aTKoUiG/gbyxb8=
X-Google-Smtp-Source: ABdhPJz1c/UrifCXDXwBdwJ8rVNMdo8xLhxMqmVG0AURu5E8R5Dk/54Se6PerWVgPvDHJVyBvhUdxw==
X-Received: by 2002:a05:6000:1682:: with SMTP id
 y2mr7557537wrd.654.1644185428295; 
 Sun, 06 Feb 2022 14:10:28 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id ay3sm15280322wmb.44.2022.02.06.14.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 14:10:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 23:08:14 +0100
Message-Id: <20220206220814.2580975-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-regex: fix license
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License is Apache-2.0 since bump to version 2021.4.4 in commit
d973fac7ca2e7c0c4864e8045e5205764e84c45b and
https://github.com/mrabarnett/mrab-regex/commit/b693a1fba731a9aa0dc6ae37b441267d4b7b0419

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-regex/python-regex.hash | 2 ++
 package/python-regex/python-regex.mk   | 3 ++-
 package/python3-regex/python3-regex.mk | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 4749cd6167..b0f5bb05da 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
 md5  cd206281327b4c087bb20bf93cee4ab9  regex-2021.4.4.tar.gz
 sha256  52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb  regex-2021.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index c46c4d1614..4019bcdd3e 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -9,6 +9,7 @@ PYTHON_REGEX_VERSION = 2021.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
 PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
 PYTHON_REGEX_SETUP_TYPE = setuptools
-PYTHON_REGEX_LICENSE = CNRI-Python
+PYTHON_REGEX_LICENSE = Apache-2.0
+PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
index 0b71768e9d..5c08338437 100644
--- a/package/python3-regex/python3-regex.mk
+++ b/package/python3-regex/python3-regex.mk
@@ -9,7 +9,8 @@ PYTHON3_REGEX_VERSION = 2021.4.4
 PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
 PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
 PYTHON3_REGEX_SETUP_TYPE = setuptools
-PYTHON3_REGEX_LICENSE = CNRI-Python
+PYTHON3_REGEX_LICENSE = Apache-2.0
+PYTHON3_REGEX_LICENSE_FILES = LICENSE.txt
 HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
 HOST_PYTHON3_REGEX_NEEDS_HOST_PYTHON = python3
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
