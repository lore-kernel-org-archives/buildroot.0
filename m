Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B75C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 18:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A5360859;
	Sun, 11 Feb 2024 18:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrjJnBOnM9iH; Sun, 11 Feb 2024 18:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4B860866
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4B860866;
	Sun, 11 Feb 2024 18:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D97891BF349
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 18:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6BEC40760
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 18:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07h7ZcUxzVTy for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 18:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0F9040745
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F9040745
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0F9040745
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 18:38:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-410c59a3e46so2958515e9.3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 10:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707676698; x=1708281498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JNqgEo/M3lQaD5fQfZAB9eYHE3EISTI8ExB8hEN3k4=;
 b=MMRZKqq/9FGuMrLOBx66V9noHHqqB5t8gVpx7WnTOkRaAYehXU7U+5fkC60lvbBpiT
 cMkoyd/e+aTXhTd8grbDHGd5iPHEUfwXQMnVPuhFlUQyPKjz+ePyRLoPLw5bUkUsHVQH
 2qVYJ/t/NwKBmfqwUD1HW8JUe5XohGCT7FAJQz3QonEimfgjP6sgaxNnnQLDq3Pg65cI
 052w46o6cGnxa0gwCXvm0sPBQJQQYo3myshN/aWPkwvWAQfSJ3WCunzcm98j3GMhsOFY
 VXAFmMDAylbKztfPJTFyKo4i77W298K2sG4Hlqdunv6fklKvvg4FbGAAE4rIannZyAeL
 FC+g==
X-Gm-Message-State: AOJu0YxOXNzM0GhCvLoMo+cJqMdTcRtdyC38o03S5QGdvyvB2J6HvdG6
 3HQRKLp27BwNLgAogKwxkhTnUCXDksPP6B9djvrnzXzEtrhWgu9H9ifn7Sqxt5k=
X-Google-Smtp-Source: AGHT+IHAom3xowtBcW+GFhjS9ZQtFrT01WsON0rthnhDqtlp5JCuzOqLo8W/i46RLcJRrdefGc04/w==
X-Received: by 2002:a05:600c:3b9c:b0:410:cd2c:7d85 with SMTP id
 n28-20020a05600c3b9c00b00410cd2c7d85mr983319wms.13.1707676697440; 
 Sun, 11 Feb 2024 10:38:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwUuQ8jdO1a0AgenmMrrLLkdmRiMAazn9zq6dt9bFzzGBgdTUYnCjzxLHDO+gW6j6sQpHlUHJrXni6AtG2WnQM2EKlkMoPvKW5ng==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b00410ac2d6b40sm2998693wmr.8.2024.02.11.10.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 10:38:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 19:38:13 +0100
Message-ID: <20240211183813.1164093-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707676698; x=1708281498; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9JNqgEo/M3lQaD5fQfZAB9eYHE3EISTI8ExB8hEN3k4=;
 b=Vl9+l1FbhNVenmzveplfBF95Yy2v2k5VY+t5TTHE7VYgzYbULXBM4I1LL33ddCT2ci
 DmDl1hJv77/0nkq3ts09g3DcuAJEnASL4IKuTApa7CnGYATRKNq3t0BqixUip2zOHzAz
 5sY8654GYOA+xnw6u/+108EN6quAM0ZWvOhu7+s5v1p0GpQeQLzNrYfykjWZGx6lzUZN
 jYKVf7OZhVtTf3cPaqfh/CumjBPexqY1OiNx97/YCdNnJdK8ODHBPS/WIcuFEbQcWKAp
 nTBb/IaiEXyMvAqKPmEgdm0Xg4EzddGc4mJPydQRO8shD46ChK3xY+z21oWQs838IPYq
 cZag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Vl9+l1Fb
Subject: [Buildroot] [PATCH 1/1] package/opencv4: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV
to avoid an issue with naming of python modules since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b

Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/opencv4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index b535761cb2..e50e0f99a9 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -410,7 +410,7 @@ OPENCV4_CONF_OPTS += \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV4_DEPENDENCIES += python3
 OPENCV4_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
-OPENCV4_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+OPENCV4_CONF_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
 OPENCV4_DEPENDENCIES += python-numpy
 else
 OPENCV4_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
