Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE5DC3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056FB40CBA;
	Thu, 15 May 2025 10:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oj8EP1NRc9Vy; Thu, 15 May 2025 10:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1F940D1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1F940D1D;
	Thu, 15 May 2025 10:27:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A40013D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B60D60862
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHGZ5KfGuGvW for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA4666111F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA4666111F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA4666111F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:27:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a108684f90so463265f8f.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747304853; x=1747909653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mMEmBGV6gxz/ufewg5kwrAMHpJZUIcDpqW/4KyAXRss=;
 b=JEJYdR87OZeWHPJQLV4xv8jz/Qzob/JyFKYZxpJMcPiSl26urwx3ItUkeItbX5VHGI
 fPLihBkQZjF0Oc9hvG0Jeg8PwgBAnvAqhvAyj4/76xMYkAZ7K7tto1qWhpK92UcKtCsk
 WF80weXSEAnzymMpF08Akox+tgwzHSEzxz9Vbzj0IWuSAqN4WdQe+Z7myh0yoIoN6NAN
 Vp6eREKnvAzG8a2cTQZQ9HcKQr5zP/sCxTxlQ69xxTv3fZlmNmx5RFddt8gcLzbtR++H
 dShiHEVRnQtGDJOSyT82WLnPehYk/kVEpm4/LbqTQPLqJh6rne6g+wvlNEUYLtzHgiJo
 HeMg==
X-Gm-Message-State: AOJu0Yw/zUkz16LgYhhjjINKuFZiAvbEIpNiiLjbeMOtwsQvV16sG23n
 CCV0p0oZ4Vc06Ip4Upw7R5I/jLV1842A3kvg2fNSnWcZD2h29MLhwxO6S12UPd1YE9wq906iWKI
 rcgw=
X-Gm-Gg: ASbGncuPUh9Ic1Xp9Ol8of+qVlFDM8WqgUEmBMYU8vJ21rdTzKfYYovRInUG8/zLND7
 cvGWdj8CB9RI4x2xeXdB5d/Pc+GpcQqfX2SMAZ3GfdoCzd/bmnL70BWu5pspuOoTmsaVd8DqVLf
 jWnXHbU3AiUKhKj2tbXs5JSUrs46iKY39GO2RWmzXA/Etow/YnVUjWBHHZbNrgcHgdbTSA6QFm5
 XdUR508UUJj93Wl91Bk7P1LsaHK/YVNE9Osm1FLsQPuLP0s7KbGirKXqcvtohIwP1N3GMOF0VIE
 RGB4tQi/g2F+F28sjHTtvfPhhGxlfC6gbbNY/wvVVbed1vy1OBBD12Fu2alzoq6CE7N1lIQxhha
 IuZB4o84=
X-Google-Smtp-Source: AGHT+IEFBQde8UGHRWzeYZE6tI2mOFiHxnMEMuWpwoeenxlRGaqFSdNUY/07MDGvPfkUbn3KUH6NCQ==
X-Received: by 2002:a05:6000:430d:b0:3a0:b4f1:8bd1 with SMTP id
 ffacd0b85a97d-3a3499532b6mr5949758f8f.52.1747304852953; 
 Thu, 15 May 2025 03:27:32 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39ef811sm60563615e9.35.2025.05.15.03.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:27:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be
Date: Thu, 15 May 2025 12:27:16 +0200
Message-ID: <20250515102716.2989377-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747304853; x=1747909653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mMEmBGV6gxz/ufewg5kwrAMHpJZUIcDpqW/4KyAXRss=;
 b=dmhdO/rI5UU0Ul0L+MZQCpcpbku5JFbaztFu4stqv0oeZAWyM7vieS9BezIiDt+J08
 LILvQ2e8tMb4qROs8zUV0e4sBh1CNQQAw+falNlHPzX1Gr7+jeJmTEznplcAHni3oL6q
 /OxIUaRHNxKoZkRgLWVmdBxUrVW1sVGRZy9AdBb0BUBQhqnmX8HrcT2TECHbdMxgxOxv
 P/etdeEzCBIoXX2kXRF44AR9pnlEvtKJLgfB+ry16bPYOzx7gZZZLAzbgFsWVKwmrHMi
 1AxzokhbOaw7/f3+JxbPfuZBBUTSZG622qcx9JhAqm+FkMdlrEDuOeGc1P4WxJKa2QQ0
 TaTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dmhdO/rI
Subject: [Buildroot] [PATCH for 2025.02.x] package/openssh: apply security
 patch for CVE-2025-32728 (sshd)
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
There is already a pending patch to bump OpenSSH to 10.0 on Buildroot master,
but this probably won't happen in Buildroot LTS; hence this patch
---
 ...ic-error-in-disableforwarding-option.patch | 49 +++++++++++++++++++
 package/openssh/openssh.mk                    |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch

diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
new file mode 100644
index 0000000000..2c64ec1910
--- /dev/null
+++ b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
@@ -0,0 +1,49 @@
+From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 9 Apr 2025 07:00:03 +0000
+Subject: [PATCH] upstream: Fix logic error in DisableForwarding option.
+
+This option was documented as disabling X11 and agent forwarding but it failed to do so.
+Spotted by Tim Rice.
+
+OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
+
+Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
+
+Fixes the following CVE:
+  - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
+                    directive does not adhere to the documentation stating
+                    that it disables X11 and agent forwarding.
+
+[Titouan: 
+ - Remove diff on OpenBSD comment at the top of the file that does not apply
+   cleanly on openssh 9.9
+]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ session.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/session.c b/session.c
+index 52a4a3446e6..6444c77f31c 100644
+--- a/session.c
++++ b/session.c
+@@ -2171,7 +2171,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+ 	if ((r = sshpkt_get_end(ssh)) != 0)
+ 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+ 	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+ 		debug_f("agent forwarding disabled");
+ 		return 0;
+ 	}
+@@ -2566,7 +2567,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
+ 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
+ 		return 0;
+ 	}
+-	if (!options.x11_forwarding) {
++	if (!options.x11_forwarding || options.disable_forwarding) {
+ 		debug("X11 forwarding disabled in server configuration file.");
+ 		return 0;
+ 	}
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 115290ce13..b5e4645b50 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,6 +13,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
+# 0001-fix-logic-error-in-disableforwarding-option.patch
+OPENSSH_IGNORE_CVES += CVE-2025-32728
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
