Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4C3CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 09:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F482407EA;
	Mon, 10 Nov 2025 09:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRnD7tAUkBKw; Mon, 10 Nov 2025 09:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F378406EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F378406EF;
	Mon, 10 Nov 2025 09:40:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 603711CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 09:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 466FB40748
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 09:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQ_Gmm1XU6ix for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 09:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D216640679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D216640679
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D216640679
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 09:40:11 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3436a97f092so2397702a91.3
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 01:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762767611; x=1763372411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAH4FtZ3+xJpoWtuskTNTRiJVq7IK0rm5JGIPQKMfig=;
 b=QzcX9RDOSgq96J5vvWD1Fo23bQzxzueZyfRXHtPPkGmGmDSwIuXXqpJB43/1KfouUe
 iW7DrQF/2Dd/q425qGM2eT+GnPdMcMBnNzcSf9lVNNJ1LVy0EDFZaJnLkb5USuZusAYt
 ImT9nUSYurkuZohsnvT7vT45LCOovOeMsQh+ipxDupHSpNdI0FvILFQH4AramZ27LMli
 JfsVi0mQ6Eqssrp3OEjkvx+FYlkd75146RGxnab4FYpOo6GBmI+0v9VhQrcFx7VcAREO
 bGPu9uU3qH807fARhGcoOr8pa9F6DEMOYmWvfd3EPpM5pcg5oZ6+oxzDbWpLN3tiIEH2
 pNJA==
X-Gm-Message-State: AOJu0YwbqxmpcvREFPACGpt73URoclKcvm6BjL/aShKCK4kkq36pMtw6
 RI+5P9cfnkTNJEMzTa4yg5awo1M8B4E9U+8AK9xCwFZtd4cWN+bK38Z6gYJ2w833
X-Gm-Gg: ASbGncv7709p785iX54knUXwYK5bC9ulawFhIzfzofTJszJsLKZDFekSVLmQo3vw+zq
 mzM7tKgtOCVW1RHxmdzZCdp94uheP8HFd/TnEbPM10EJaX9v8kHnVwCkC++bOH2xEhug+FNr3Oe
 F+fTGA3a34LKqUF8TaPIW/fYGPaHHqeu3Rl6vj0haLuh+KxiDxAxRPZiVM08tFt3CN0xnUXTKRI
 TPQKqUMvkrZfFSIni9pabq/LvqmmzX+sBE7H6VFoERoPB1/6JdmoNQqIdpMnSH/LALrLNMxL2zB
 PAnNVry2LaRO/VxyEpPRjG8jZW5CqjoJKZ09SJwWfyLEYiALkAhp57wmarKnVCePmT6T43DVLKW
 c2FkUCNYUKFf8iQeeON5wULkFjFi0AdFPEXf/PpllfzEjMfy0a2D4VxZ6uHDprD8xb7BlUK6M/2
 w3/GnuCGS8MvqCiKu3C9XYQg1oxkb0eGLFwv4FoY888LIoQZv9Inc7KURQXcI=
X-Google-Smtp-Source: AGHT+IH1Znoy7ru1dxpnAFNnX9QGgKveLnNsMGxokBU1N9pYAjzPLDf92bpIBEpH5x1WcUVDfoGSXg==
X-Received: by 2002:a17:90b:3d8a:b0:32b:65e6:ec48 with SMTP id
 98e67ed59e1d1-3436cb229e8mr8718729a91.8.1762767610851; 
 Mon, 10 Nov 2025 01:40:10 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc17a252sm11490237b3a.41.2025.11.10.01.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:40:10 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 01:40:07 -0800
Message-Id: <20251110094007.434279-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762767611; x=1763372411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aAH4FtZ3+xJpoWtuskTNTRiJVq7IK0rm5JGIPQKMfig=;
 b=cSJxpq8gDkt6eOUaV9vr4lFlGrcXq6cGeheQYZUBYU+DhX+MxTjBwipZzdHnSzvP4C
 TDfFiql8O3JeMMV4RXFhH6opyELahW89xFFEtrseSxOA47b1O8z3k7DaqeNKkfbSkZmK
 WKRFUrorEPP5vfwGoVHvmxb4i5vSH6kHfPMD5AW5dXfYUvL6iya4FouivWey3DotgCiV
 Pz+ivtZZPaWO8GOGBENKMJAwd5Jis3j1kza7AKgEkazud+wPg44XSHA5mToGJVBiZ3XQ
 YlGtDb/2U+nfb/sQe+L6jL5D5GTzsZemIu25NJBdeeI5NVYgmiJGmvtzt4of0pFF3ODJ
 n6Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cSJxpq8g
Subject: [Buildroot] [PATCH 1/1] package/pppd: Add an option to
 enable/disable CBCP support.
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

Adds BR2_PACKAGE_PPPD_CBCP option.
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/pppd/Config.in | 7 +++++++
 package/pppd/pppd.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 88c2180a9b..8c12557549 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -19,6 +19,13 @@ config BR2_PACKAGE_PPPD_FILTER
 	  the pppd active-filter and pass-filter options
 	  are available.
 
+config BR2_PACKAGE_PPPD_CBCP
+	bool "CBCP (Callback Control Protocol)"
+	default n
+	help
+	  Enable Callback Control Protocol (CBCP) support in pppd.
+	  https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.
+
 endif
 
 comment "pppd needs a toolchain w/ dynamic library"
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 8d80675d15..1cc5dc7f4f 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -53,4 +53,10 @@ else
 PPPD_CONF_OPTS += --disable-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PPPD_CBCP),y)
+PPPD_CONF_OPTS += --enable-cbcp
+else
+PPPD_CONF_OPTS += --disable-cbcp
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
