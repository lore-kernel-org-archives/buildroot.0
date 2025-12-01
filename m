Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30920D116F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 11:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD7140592;
	Mon,  1 Dec 2025 11:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ka8TbhMTe0tV; Mon,  1 Dec 2025 11:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E344057D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E344057D;
	Mon,  1 Dec 2025 11:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 994891A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 11:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B957812ED
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 11:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_-Ig-Z3Xyi7 for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 11:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.45;
 helo=mail-wr1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C6548128D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C6548128D
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C6548128D
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 11:26:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42e2d5e119fso738978f8f.2
 for <buildroot@buildroot.org>; Mon, 01 Dec 2025 03:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764588388; x=1765193188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m7kdqr4Wt9VBMD/gmZOYkRsydo9fTG26Fa09uURAxPw=;
 b=MJQxomi3y6W/BVL2IkZMW4Nf6VoNfEh/FCHKUJP1pn+OzoNVWNv9CauOjGGLPJb413
 Zk3kckXKrL1Oi49ZbqdgdwQBdwzxOhP3zdoHIOfgauL4jdE7Hc/EqOdeJqMUxnBEgpxJ
 J6BUuQz1owKuc5RwLwzV5WuGikUE3ITdz90cL9VRhoYQcbdRqsA2onCf/Xp9KDLOnTCN
 XgRIHGuI/Ftdxp7SXFdCR9TvSsTnWfPZzGFO3i/dFeSyk1RpojT2YXD7zSkhZk/EoSgS
 IfFLUKBiRlMbmt+PE6WUCne346UwlEykKJRBo8zvTCxzfpmBDGjEfCtGaHafTF5kknrL
 cdjw==
X-Gm-Message-State: AOJu0YzjDLfPmzRnzFu0jQVtzFY7XQUve0z9uCDs5CP2DnIEsP5KJ2gR
 83cFf+/LQomTkDuxXN+ZSTTglI1ZAOIXFxgP67oy6osVap0Dv9BoYTN6rImjRQ==
X-Gm-Gg: ASbGnctWGeWNTXRC+gu/5swz7PJtfYb3OZM4/2FXdRpWOYNkiXk9NfFz2YXKD0Zb9pU
 siCYOCaa6nUHeC0Dc43L4vjTy/jm/3NDTni/34dhVEoEERggji9LTpYUyTr4JuMHF0Lmg9jnfjF
 ZiL1lpbWDoHqZ+Csr96Td7veC0D3Kp5zYzIpa0OLrwsd6k2mcF0r/a8/AoTsmb/yYmrX+d3+gpP
 UDu+hBbS4J5m/baaAM3ZSUTaLZTUJWqae/h/LY6kEiAwaSzmFBFwUtiQB0mjnRg1q3rqFfNpHtg
 scJdzbAtD+x1ancoIRAXKlRokfNQmuNz0p/smXIPNzU08QfipTZoFvidvmMbr90VIAIYZ1OWuW0
 6lT7aJYnQVvq8n1xoA1e3OTWH60PQ3rLxrUzzQlmopIftkyPRQeexAayeyxsrZKSDH0cm5/IgGn
 Hc92wTEkVcqVaT5nycRlCiLJNpY/HCYooLR3vV9r+VZ7TnI9PWfA==
X-Google-Smtp-Source: AGHT+IF5JkIhwmLIzn96L2P5TWtKQ5cZp0rivONqi2crQh5OigovCChQor0LYxqt1lnfUQEbV6bNUg==
X-Received: by 2002:a05:6000:4383:b0:42b:2eb3:c909 with SMTP id
 ffacd0b85a97d-42cc1ac98a9mr38731399f8f.20.1764588388333; 
 Mon, 01 Dec 2025 03:26:28 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c30b8sm25887967f8f.7.2025.12.01.03.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 03:26:28 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: peter@korsgaard.com
Cc: buildroot@buildroot.org, christian@aperture.us, thomas.devoogdt@barco.com,
 thomas@devoogdt.com
Date: Mon,  1 Dec 2025 12:26:21 +0100
Message-ID: <20251201112621.242137-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201112621.242137-1-thomas@devoogdt.com>
References: <877bv7ii70.fsf@dell.be.48ers.dk>
 <20251201112621.242137-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 2/2] package/yq: bump to 4.49.2
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

Notes:
 - https://github.com/mikefarah/yq/releases/tag/v4.45.3
 - https://github.com/mikefarah/yq/releases/tag/v4.45.4
 - https://github.com/mikefarah/yq/releases/tag/v4.46.1
 - https://github.com/mikefarah/yq/releases/tag/v4.47.1
 - https://github.com/mikefarah/yq/releases/tag/v4.47.2
 - https://github.com/mikefarah/yq/releases/tag/v4.48.1
 - https://github.com/mikefarah/yq/releases/tag/v4.48.2
 - https://github.com/mikefarah/yq/releases/tag/v4.49.1
 - https://github.com/mikefarah/yq/releases/tag/v4.49.2

Various regression fixes, as noticed in
https://lore.kernel.org/buildroot/877bv7ii70.fsf@dell.be.48ers.dk/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
 - New patch to fix some regression as noticed in
   https://lore.kernel.org/buildroot/877bv7ii70.fsf@dell.be.48ers.dk/
---
 package/yq/yq.hash | 2 +-
 package/yq/yq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/yq/yq.hash b/package/yq/yq.hash
index bc9dccad81..519d1c9a3e 100644
--- a/package/yq/yq.hash
+++ b/package/yq/yq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39296b55e33962ef838cd8a1bc0e9850e775de4cc3843bf15f099324069d2632  yq-4.45.2-go2.tar.gz
+sha256  291334bc00863c144098b5b0a723a5c769df115c46938e17920917aa24776591  yq-4.49.2-go2.tar.gz
 sha256  697db34dabb21562fe84487a2ccd031fbd45382b89c2cbdec8ef31682c486040  LICENSE
diff --git a/package/yq/yq.mk b/package/yq/yq.mk
index b42b8e652c..10d0959791 100644
--- a/package/yq/yq.mk
+++ b/package/yq/yq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YQ_VERSION = 4.45.2
+YQ_VERSION = 4.49.2
 YQ_SITE = $(call github,mikefarah,yq,v$(YQ_VERSION))
 YQ_LICENSE = MIT
 YQ_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
