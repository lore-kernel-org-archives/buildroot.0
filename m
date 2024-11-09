Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80656D64076
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 00:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336DF42B1B;
	Sat,  9 Nov 2024 00:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mckfGrhxC4Is; Sat,  9 Nov 2024 00:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D54842497
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D54842497;
	Sat,  9 Nov 2024 00:23:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F05978
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C18184004A
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iClKDxIjpY97 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 00:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF45A40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF45A40015
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF45A40015
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:50 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a6ababaaa9so10715195ab.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 16:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731111830; x=1731716630;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMmHMkF0GNqAOhYSWFMzTZklgNpKA5RjBXgrvtHaGsU=;
 b=Fq4IWx8BRlR9nEYwS71teM/ybSSny0uPRx9Iu7XGxX5mXxtWD9detvPn+HDNnWphci
 +VnE8FtXlPgKQHGRbNdMnG3hIaZI9nQES9uxJNBn2L1/lLRJLAZ1rtTtDqq0iJAELDT3
 srhTUrL7ov7fq8yhG4tVNHCImo9Okn8Ex5bRkB6bZI2NhQqud0EPo+8+HmZTnNebCkP6
 IP23vAFgU0hRaCLzHzuufR3ceWM80IxKn2LpinOtPvtDhHtXlMvXZ2i8bNYcOd4DQ+t4
 zCQJmja8AH8qwDPhWv5hS6UmEsxG500bPHtuZsUkkOrhgWUbNvQrwY+a2rCEyeB43T13
 x45Q==
X-Gm-Message-State: AOJu0YwK65QIlo1APjPB7Srb4xYGmmtsFh36XnU/bqG5rFrjHq39P6rt
 HzA1RwOYO8qivOBTokMIVPRvH593d1INqN0KSD0Z46h5CG0L1FNu
X-Google-Smtp-Source: AGHT+IEv6k0cElDr3F8whwlCfdfaDoIxrrHi49ewnbJO3xzdgLBeVBAtP0VhYF6WYJ+8NigS/1B2bw==
X-Received: by 2002:a05:6e02:1:b0:3a6:b8ce:7e2 with SMTP id
 e9e14a558f8ab-3a6f19a8f30mr59547755ab.6.1731111829897; 
 Fri, 08 Nov 2024 16:23:49 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f987e094sm634025ab.53.2024.11.08.16.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 16:23:49 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Fri, 08 Nov 2024 18:23:41 -0600
MIME-Version: 1.0
Message-Id: <20241108-dtc-1-7-2-v1-2-1141a7b163e9@gmail.com>
References: <20241108-dtc-1-7-2-v1-0-1141a7b163e9@gmail.com>
In-Reply-To: <20241108-dtc-1-7-2-v1-0-1141a7b163e9@gmail.com>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731111830; x=1731716630; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DMmHMkF0GNqAOhYSWFMzTZklgNpKA5RjBXgrvtHaGsU=;
 b=PwC35A8Dvb1RfCaB0Z3HYo4QlaBNyx9xPwuU53Y8GB5i+9l1v0UUrXc0X7MZQ+vzOE
 1IKliLNwIhwAuTxze8txDl40pBLG7nDTHbP6nYB0Z/7ZOEB3amMfoGdly+eyO7JkTBSG
 wmosldMTutuvrtzGuO/eccFWCYHocCTfvp8XHZI/tsCpZ5jQBZJ/pri5rt112RYr6ONI
 AsUgNXSfdaIS6M4shC1n/kTNH0syb3rmOqo6jghX5/hhg+++I3nAYDZJEz1SOlA+WYny
 8YiCiHFhaiQFEEboLs/weBCBQ9ROkUva3XLFKB6BjEUVEPCIxrmBg6q9olZN81y8I7tw
 WstQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PwC35A8D
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself to dtc
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

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fa27155510b37745f8fb0bdbb959eb2ca6661134..1d70e46e8d4d0b20548975a34d80db8e048862bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -557,6 +557,10 @@ F:	package/vmtouch/
 F:	support/testing/tests/package/test_atftp.py
 F:	support/testing/tests/package/test_zip.py
 
+N:	Brandon Maier <brandon.maier@gmail.com>
+F:	package/dtc/
+F:	support/testing/tests/package/test_dtc*
+
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
