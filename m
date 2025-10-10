Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912AFCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 431474127B;
	Fri, 10 Oct 2025 12:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5wTXCqUrS3S; Fri, 10 Oct 2025 12:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A4A412A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A4A412A4;
	Fri, 10 Oct 2025 12:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D59D226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E398614A0
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-9tuwicq6FA for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39A1061488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A1061488
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39A1061488
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:54:02 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso21846275e9.0
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 05:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760100840; x=1760705640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6alcBzjEqCUjpgzDcHFBhRAnu2V48B0uIDipGBXoeTA=;
 b=i5Y4G2Om1edCKuAwz+6QmmcMqKYsi785pylexn2hNHOqdrl14zphn5zpQniJ6/GmmF
 KXfvgBriKkq+B8bitTFSYUx+AwvrZmko5ZMEVjt4N5Vwhr1oRjeb5JHbgrOo6SSrNH4t
 9CRBveZj/kJWq3IdUwX/uvcYDzkHm0jNvvuG2If++hZQk4AEO8c5a0Ss1ZotQDo1Kq17
 kkFN/yGI13l59B6VhHuHrWnDQzi50n2Pj/8m2G1yClHaUsrFd83bTzIYkq95m0ZnsBk/
 zUj8QvH/Mi391RrxnD3K7bxRR61ibM7od8n/7FDZK2bJj8oorbTcZd4dLgmpGFCl2yjg
 ef/w==
X-Gm-Message-State: AOJu0YyZfonf2avSh48LgZN9b+o5/YaVPMY8RQWh5vfgxkvPahNquvYb
 ayD/87FL5/oYgxdFYKZjCSZs8HkR45kD6YRPTOW3k2py4BNjJ4Di0Jy8ZNXUTA==
X-Gm-Gg: ASbGnctp4GONAd3zSO0YEwsiAapbieOkQp00wklE0LqmxXYxp9JIASqx48rjq83byJ8
 NkVd3KgPZanoU34oaRgitaNzScypCv5QQwqKZ4hLAZQevi9e5BKTKrG7pgglbEvujhylmwc9602
 g6kVaZzmvPldqkYyBF1XYTmwj+HbeqL8T7D+IDDzg5T6RrPdkEPU91EzI3yYPEAerhDjrgcUUnP
 8a+UkD4CYCDmLXXSaOVxW1zgOlirZ/rzhCccdN3vBFIPbEcnNKrrFmuBH2Etd2l1YZddaAPxUbn
 6jJOdbJ48gDmB6Pj9csqulbUxNBIKsyTD32436aOpCa5eh0S6kfnlXnTyVJHHsOauzfdOns8kT3
 wQjX8WRXiXbRIdM28n+MpEsxblZ2B/5QeFLwOLV9ja3dMHiiIhtMQ8YvK4mYi06CQimlpZ0iPzk
 PlnEJyGGJDvLwOZ7DhPMWfjKKyRVvKAJ5LGR9susD/4N8=
X-Google-Smtp-Source: AGHT+IESvIiWBY6Fdg/kPIkggYqrsLppU2L07XZsUmf4eK1j94XFeY5hhhCpDQCQRQcxpZ4E0M+vWg==
X-Received: by 2002:a05:600c:5490:b0:46e:4744:add7 with SMTP id
 5b1f17b1804b1-46fae33db7amr68816685e9.7.1760100839587; 
 Fri, 10 Oct 2025 05:53:59 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb6f:7900:f303:6e96:eed7:13e8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-46fb4983053sm43965915e9.8.2025.10.10.05.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 05:53:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 14:53:55 +0200
Message-ID: <20251010125356.1245450-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libgtk4: bump to 4.21.0
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

News: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/NEWS

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libgtk4/libgtk4.hash | 4 ++--
 package/libgtk4/libgtk4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index 6c07161eff..dff32c57b4 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.20/gtk-4.20.1.sha256sum
-sha256  bf32fac019171c45681b2c45d05658ee8598c6341572e32a6a6bcb0b5673998d  gtk-4.20.1.tar.xz
+# From https://download.gnome.org/sources/gtk/4.21/gtk-4.21.0.sha256sum
+sha256  f52475c5041dfd02cc4eed22ee94f12ec310c16a68fda9203dc54ffd5daa6e6f  gtk-4.21.0.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 029eb5920c..5d3341a95d 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.20
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
+LIBGTK4_VERSION_MAJOR = 4.21
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).0
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
