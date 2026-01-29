Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB3DD6B087
	for <buildroot@archiver.kernel.org>; Thu, 29 Jan 2026 16:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BB0837D3;
	Thu, 29 Jan 2026 16:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 272lePDsWLhz; Thu, 29 Jan 2026 16:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE298381F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769703040;
	bh=OYO43NvDf/00FaXovWCp7lNREJvj37fMW/qS1hVu7BI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7NGGcya/G8A65PK9/dLOGV7mVN+qdYXuRbtYsVLsyflb2x/Ihui6uCECigB0pgM/
	 EAfXEC1pbn9gYhCAoaf/El7yFUFr3F+OZlvkUWKk0fNdVtY8wE0nC5LYNyp6TQFCL8
	 XDWKjukilsNNCSl5oXnnnmuL1I8d8h97KVfXBiz855Ke925S/BhU0T74b5F6JUifuv
	 EwATPcUVvMVh5pY7Ei74wyHjtLFtgSWyXjzAgrCbOj9sg6Uq48VGekRIEkZSs0MsbE
	 Gjm8X0Bk0VjP4lUoXr7kq645eLK1CAw2zXcK8Jd3YDf0siRhmu5HWktg98I25Xxu1n
	 44zrdZYe5tYrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AE298381F;
	Thu, 29 Jan 2026 16:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE0C1BD
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 16:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E039F837CD
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 16:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGGv85uSj2lY for <buildroot@buildroot.org>;
 Thu, 29 Jan 2026 16:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD10A833CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD10A833CA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD10A833CA
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 16:10:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so911535f8f.2
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 08:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769703036; x=1770307836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VNlupfQGW8QFY6SIAGhR+omh/3GcvyQPPRCJp2OCAto=;
 b=qWE5goIMUc+WNxe65A+HK3VwVijabl9BkrDIGW19MXPrZqzM21PFa55C11GJCrO594
 MJTSu444QeBo9QLb7II/4zK/RoeglvcKJFQs2CfjilW5CeJWgrB8MfvueCuu7LpxQB85
 0oBgZrd4owjBwc4byezjU43VQPrNB2p1Ik2SPpBXV6djp3q77Puy/QGK5AoltJAupPyx
 9Y3KX+XqT3fpI3Jzx4cT2oZ4LwGfWP+3xLVSZmtXB1y+6j65lX/W2QXKYQcJ44tur46F
 tt4tIwPhVEYGvjjUjfysAItBIcDt4aLLPLLWAupATOO0CdOfHtOsx5fBWLUd2eww9n9j
 J9/A==
X-Gm-Message-State: AOJu0YydFlMqe2TTMDWqMVClu1DaDf88EsMsCLaBvRL5/abOe+sIw1up
 1j9bWOuL739wIDUsnwXoVjk/4sI3oQOaYTsDmMJp+jxsbPPqVkuo0mdy6iQA+w==
X-Gm-Gg: AZuq6aKa/du9Re7mRlilyNIDz+B2o/cuJlI2YIzFak5CZzPCDUrbKYMjiQEhCEVVnV9
 CBXMjF4tV/ss8rFG7c6TRnT9QEvqPmG7kyamNk39hwyVGeyAPuiukceLgpsINRI1qkJwrHiH2JP
 CHE73U4NSu+/kZov8WjHXFZdJ+yTxfgLSIgw+vlXMvecT04Him9lmFKgjBIA9flZ8QVwrUCpFE5
 88JnZnmSynQ9lfxc7uSBWI6qa44+l3q6g5KPFK5WavmdouSPGuT/L9O/gt+jsMwi5OgAFv1HNUN
 VCnEdJWRKeL3VwFfbiFjJzuULfB89wHSffenDJpsbCWkjE8c4g3OI+CnmtyyWadyxWjTL7j9PV0
 DaI4/cSB0odDphYRBoJHgwHoEtQzjYKo+0/8tFohJpXG5B7F6Wn2zkVuxbtE6hWN6rPXCreM0m6
 ZtW0JnfB9FvKY=
X-Received: by 2002:a5d:5f47:0:b0:432:84f9:8c04 with SMTP id
 ffacd0b85a97d-435f3a86558mr182892f8f.24.1769703035826; 
 Thu, 29 Jan 2026 08:10:35 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::b4ea])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm16512581f8f.43.2026.01.29.08.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 08:10:35 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 29 Jan 2026 17:10:05 +0100
Message-ID: <20260129161012.1610562-3-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769703036; x=1770307836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNlupfQGW8QFY6SIAGhR+omh/3GcvyQPPRCJp2OCAto=;
 b=UUVAAlwELxJlRpYscaa+3du5+cn2U63gxzMBK0k9izHPMQt1DcKiVz9pJENAd3RQZS
 E9jp36euaPO3Q+YvKbC3sq0IkQyiFXGSd0sf5saGH69BgFAcE2pz2j4ML6CgQrgadv1/
 N8qBoQdgxgR3Rnc+caHPvRPQzDF5pgYoT9Qmv2T5clI03MRN0rJ8p0PX3J7LivlFakBy
 dsA5I6VvXITR9uY4Y+zKEkkHlKzr+cayxTgOOOyKZpwGAtMt1ZhvsLFvKg2gUMlbUyzK
 RL3WxH9fPRy5pu5W2yGETfo0CotAzvUhwdQ/m+fDBM6T/XGfU0kjAE/xhGDg+uFLCRul
 QylQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UUVAAlwE
Subject: [Buildroot] [PATCH v1 3/3] package/linux-pam: install files into
 /usr/lib/pam.d
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

The /etc directory is reserved for host-specific, system-wide
configuration maintained by the local administrator. Buildroot packages
should avoid placing files in /etc and instead install them under /usr
whenever possible.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/linux-pam/linux-pam.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 799e74c911..a4be4fa3b6 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -31,7 +31,7 @@ LINUX_PAM_CONF_OPTS += -Dselinux=enabled
 LINUX_PAM_DEPENDENCIES += libselinux
 define LINUX_PAM_SELINUX_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
-		$(TARGET_DIR)/etc/pam.d/login
+		$(TARGET_DIR)/usr/lib/pam.d/login
 endef
 else
 LINUX_PAM_CONF_OPTS += -Dselinux=disabled
@@ -55,7 +55,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
 LINUX_PAM_CONF_OPTS += -Dpam_lastlog=enabled
 define LINUX_PAM_LASTLOG_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_lastlog.so.*\)$$/\1/' \
-		$(TARGET_DIR)/etc/pam.d/login
+		$(TARGET_DIR)/usr/lib/pam.d/login
 endef
 else
 LINUX_PAM_CONF_OPTS += -Dpam_lastlog=disabled
@@ -63,10 +63,10 @@ endif
 
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
-	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
-		$(TARGET_DIR)/etc/pam.d/login
-	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
-		$(TARGET_DIR)/etc/pam.d/other
+	$(INSTALL) -m 0644 -D $(LINUX_PAM_PKGDIR)/login.pam \
+		$(TARGET_DIR)/usr/lib/pam.d/login
+	$(INSTALL) -m 0644 -D $(LINUX_PAM_PKGDIR)/other.pam \
+		$(TARGET_DIR)/usr/lib/pam.d/other
 	$(LINUX_PAM_LASTLOG_PAMFILE_TWEAK)
 	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
 endef
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
