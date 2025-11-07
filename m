Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B7CCF9F8
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 15:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0863740354;
	Fri,  7 Nov 2025 15:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guQeH6jSoBaJ; Fri,  7 Nov 2025 15:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E69B40333
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E69B40333;
	Fri,  7 Nov 2025 15:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33E66961
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 15:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1981C61393
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 15:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSO9ApGiKuQH for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 15:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD51A607A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD51A607A6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD51A607A6
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 15:11:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so119048666b.0
 for <buildroot@buildroot.org>; Fri, 07 Nov 2025 07:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762528275; x=1763133075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zh+VChLQcpYegXu08/d1qFUJuSMZAoY19A/XNB3OlqE=;
 b=J/+7K3az+/PRuHZbx6adqQTvNWlWIDERrSVTSOksXbWUR6mGcYvst9Oiu+lHso8hag
 XE99evSzBUTaMRjDDk0Sq13eG0LABCcqEbO3Yk2m+B3l+Ken4mX+eQFEMxNZhfBgrodm
 KN5XpFC40kOOLqlyGLHdI+hxFjOusw+2b0U9hg5NHuoQf/8iXv30N2lHK98ZdoHxGHPt
 +u8ps8r6rypGURmseSDevgIDtpI1maX14hIaN75V4CUiNMrGWsxRsn1TGy4WURoxHLI0
 TSw56C3j9R3pi0RFksjIQsCHFayMzWUuI0+Fp63oo2qt5k2aFzXS6dnhKsdkNFHRU34B
 oXUw==
X-Gm-Message-State: AOJu0YzPpGBF3Gg9tex2BhJ5qCeXsWCaacUXgqYbWTY+GyDDPCgWAePS
 lUyNCppo2atfH/hF1HYehk5q6cfNuAZSOoioUGdpdLkX29oXiQj+OsOAAE5l
X-Gm-Gg: ASbGnctvqrK+e0EGYDeC9wEOz/vNmeg+DRo+3VPL+3BZp14u4tw8WcNrH4hWfZ5Obwe
 0syp3QOBmnIp03xIgx+f7OzYB57ppS/pt6/VSq1rr8rN4VS6jxjGHOF+0nlW5KSbvi2lKalKYEw
 y7ieWRRu8U6BkYMHBcyjdvMWumnAMFXx8nh8G04Ch+54FxR24YskqFjDRPoBxZXnqsnpf2WIIeX
 X9kAWAb1sEiur7OlQHrVRKkVIxHiLbkCaRGTrTNXSJL/PLRALG4LP0Q308YZhpRK9I3INGCh0da
 bLfP8YG9osK2BZD/MA37RfBxAvX4oK/cY79PLpk9RHZiAORwnxn6XpABKPmoc29pvp1ahKJJ5Q/
 JYaUb4y8sPehp0BzU5n1QJVy4Ms07g3i7lz30gU2d71h2xf5hNHyj85RQDq+xKIYC89zrlgOMhr
 dDX2/FBbiDS7WKLhjwQlmugLplHg==
X-Google-Smtp-Source: AGHT+IGVGDBd9HXSgyWqAv1SdfgowRAAdrUly43Bf808LsZhSD/dD8bNTFboRQbno//96LEqcMRbGg==
X-Received: by 2002:a17:906:c115:b0:b72:52c2:b8e0 with SMTP id
 a640c23a62f3a-b72c0ac2e3amr271377666b.37.1762528275260; 
 Fri, 07 Nov 2025 07:11:15 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bc874sm275919766b.54.2025.11.07.07.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 07:11:14 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Fri,  7 Nov 2025 16:10:28 +0100
Message-ID: <20251107151112.1105070-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762528275; x=1763133075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zh+VChLQcpYegXu08/d1qFUJuSMZAoY19A/XNB3OlqE=;
 b=RW7tqlmpsGhbnmCuEksBEuw/eBybb/62J7QRVs3U+lba33AIl69CNVknAngxVPQCHF
 jU4M53KxR2BI6TRAam6squP+ayNZ+NJw+W237EV4m5A4uBJFlg2IULaKuj4VfBG8Agio
 2aBSEBB0GcaAwLWkev4fQjo1nK3GV5Zz/Zb0ZfWDLleWRBHuBAe6jTdZCHQqIPxiquFd
 57QecI2DBFXermR7nBuj+rBFDn03h2sopJfjxFD10VWhv0pFNMYdVNu9qqwp0lJjx9UR
 UgMJDw2PTKumF5DsbI9ycq9mnD99IaGx2KMns0gQF0M3WEazo83bPd0h6mLfxqqQl0Vr
 IoUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RW7tqlmp
Subject: [Buildroot] [v1, 1/1] package/broot:new package
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

This commit adds `broot` a fast and powerful file manager written
in Rust and licensed under MIT license. It supports filters, regular
expressions, and real-time "show-as-you-type" search for quick and easy
navigation, even in complex directory structures.

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/broot/Config.in  | 11 +++++++++++
 package/broot/broot.hash |  3 +++
 package/broot/broot.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/broot/Config.in
 create mode 100644 package/broot/broot.hash
 create mode 100644 package/broot/broot.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b14c6e3875..dbd3b1517c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/broot/
 F:	package/nnn/
 
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 930f368058..1152748d8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2950,6 +2950,7 @@ endmenu
 
 menu "Text editors and viewers"
 	source "package/bat/Config.in"
+	source "package/broot/Config.in"
 	source "package/bvi/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
diff --git a/package/broot/Config.in b/package/broot/Config.in
new file mode 100644
index 0000000000..bffdf7aaad
--- /dev/null
+++ b/package/broot/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BROOT
+	bool "broot"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC
+	help
+	  Broot is a fast and powerful file manager written in Rust and
+	  licensed under MIT license. It supports filters, regular
+	  expressions, and real-time "show-as-you-type" search for quick
+	  and easy navigation, even in complex directory structures.
+
+	  https://github.com/Canop/broot
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
new file mode 100644
index 0000000000..09dd907bf5
--- /dev/null
+++ b/package/broot/broot.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  2f9fc93d3e3b547108d66ac0baafb8f60a9506fc189b509821ab301d9ea75a19  broot-1.52.0-cargo4.tar.gz
+sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
new file mode 100644
index 0000000000..9b60d35857
--- /dev/null
+++ b/package/broot/broot.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# broot
+#
+################################################################################
+
+BROOT_VERSION = 1.52.0
+BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
+BROOT_LICENSE = MIT
+BROOT_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.51.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
