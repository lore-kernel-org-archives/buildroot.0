Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2216CAC59D
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E32611BE;
	Tue, 16 Sep 2025 20:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JY10ubkHer5l; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93385611AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93385611AA;
	Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB032199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1B1A61198
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xB9Wwps9Q33 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E17556117A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17556117A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E17556117A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ebc706eb7bso1376887f8f.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054461; x=1758659261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCnsWHxoln6B7bC+0JCta1MtCFvB5mvIZxr3cCirRB8=;
 b=v8+VMh2iUWDR0i3tgigAAye4ZSMxrHhRoOE4MncYfE6fNFe4CZf6mRbJvF5i+lQ9D/
 8GQcQLh/ueHXMQdxZLF8TfS68UKmCfPbwiqEixi5DuX9cZXH+p/9bMh3NzAXCr7yX0/v
 uejvZJWttgwbGPAp6ii7jfEqnxfyv7FgdOV2ejCItriqbrUD/5u65iOxFhFLYfcaBvD9
 559DyB6bBPTfzz3lFOpW4kU/h1q98ieB5pJKcvc65tIoJAngu5u6hLHSNqRHFZ6uKjWg
 sJyShhkIFoYvitj6sLE/DLCxXDGTu5J4ds6W2DaRpLUZnB+Uv8MwlNil8BbcXo6oz5aG
 97ng==
X-Gm-Message-State: AOJu0YxjcuOxPgQQcX9ves0ZKo5hgKMK8uVrSON1e7QZlEyhUdkXbv2y
 MZZ8A9QvVozCB0WiA2FDo2RldXPHOztS+Srg/Bk6WOuPYW4IzGlns4gmcpNcBL5n2FldqiGjsEs
 peIbxKzA=
X-Gm-Gg: ASbGncs4hxtGhG3PyrloRUU/xZ/ZigR7UthrH70qVhh1kpEhPCM+6ZdHUxTbZzwePyb
 9S+aEqBJynE9zemxi5CiJxcY20bDj5QqouYwMXVwBIcBaooYKkddcCwlmB6g9dmv8YjJqKOTAPX
 tes/rO0DL0iBOTqyh1GVDCxPq1VMSFDzPH0TkuS8EpHQahiIVDNPyZtwZOB0plyddUHFbjVimDB
 2a75uPuuYdpjhTmbv7+zNRcaW4ZuzolkEq6oGEPv7eS27O3sMR0Tlw+pMPR5wl0o1lF9CRQ2D6/
 wD74CmWtCLOhugSv5qZqm5LUES2cSZUjKcqdCAY3pf0CWmK+T5LBsDrycZtLpw8sHh5uJ4rOrou
 J2Vj7go7DWnM+C9g=
X-Google-Smtp-Source: AGHT+IGd0MJHesl6A3Vboxi+Y1sxUJ7iNkjMQJaMs/XdbQZVBhJtZZqz1Ax9L2r2mYIrWD3ERa5Ngg==
X-Received: by 2002:a5d:64c4:0:b0:3ea:a8a:5473 with SMTP id
 ffacd0b85a97d-3ea0a8a636bmr9653529f8f.34.1758054460662; 
 Tue, 16 Sep 2025 13:27:40 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:28 +0200
Message-ID: <20250916202735.1121872-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054461; x=1758659261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCnsWHxoln6B7bC+0JCta1MtCFvB5mvIZxr3cCirRB8=;
 b=L/ocAZDnmSO05+dGBXgvvTsUWbuLIkn7tsqoiUmpQKSjboVzk8Hhb3DyDHuYJWNE/k
 fukDuJt76CBYHp7snP69r8Z5WC7SlADLT16kIGJHIO4QI7R3881bchuakHok5TLTubh3
 AF9DiAjlvKTvz8XaL2H+2VVQi8ufGxaQ2D+LlxXOvIPHzVCvfi5MPjyIEulj67+GoXP+
 2cT1Yys3RUYRMaXRTQYDyIozt/7Ig/ZEdGEwBxv1B8mz0xGIou1iLf4D6OdvBDkW84WQ
 Zx61y3pHowXxNe84aogKdBTYR1yXMAUwz/AhDQ6DNory8ZIqM4msQKg0j9OQi+48w+Ua
 y1Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L/ocAZDn
Subject: [Buildroot] [PATCH 05/12] package/pango: fix deprecated CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'pango:pango' has been deprecated in favour of 'gnome:pango'.

See https://nvd.nist.gov/products/cpe/detail/19B77822-6C34-41C8-8160-367D56AD1569

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pango/pango.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index bd5dd4d332..671705d0b3 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -11,7 +11,7 @@ PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
-PANGO_CPE_ID_VENDOR = pango
+PANGO_CPE_ID_VENDOR = gnome
 
 PANGO_CONF_OPTS = -Dfontconfig=enabled
 HOST_PANGO_CONF_OPTS = -Dfontconfig=enabled -Dintrospection=disabled
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
