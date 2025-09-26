Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03F9CAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 09:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0F861C00;
	Fri, 26 Sep 2025 09:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IVfutVGqT-v; Fri, 26 Sep 2025 09:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF0261BF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CF0261BF0;
	Fri, 26 Sep 2025 09:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0F2D177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6A1384AE6
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5xfW8hkb5p9 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 09:12:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 064CC84AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064CC84AE3
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 064CC84AE3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b3727611c1bso238156866b.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 02:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758877958; x=1759482758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AvlBe0Jwx/QPlpL7ZJ8cXAUwm9Q4gAR4l+BeUx8myw=;
 b=fGLspxLVwYueB9Gn/3avVFkQOxbqmM/PwjzxvFGPMMVTZw7ZEw3XKxQZ6UgMtd7Q4X
 EPItwu8qf6XnBTqzk4WkfxoOWRcsKD4gCoPcoGVwTZGWbKXgAIKanZzrimP6PITV+8L5
 AP9L9bHfGrFEGuLhWgdg+0rvQisKXRi4B9/0vePvVFXuv+EM3iqK+AQAtscWT2MBlPXY
 5OcxdYzz+ZCTzRg7cwH+SzvVAxK69ATKFoKkn9XshGR2Ex9qFzXcXbtWwHhDhCIcqNru
 tvjw+f+jltZc5+ks7XMqom51geiPMlUu/dX+P3euhXZpIcddR9CqNR/URIC6zUInDA+Z
 3nOA==
X-Gm-Message-State: AOJu0Ywlde/8Cwu2lN3O82RWJ9xFYT8t16pXZSCb6WM0dHsGQUYbWsgx
 ZKwq/4nNfFFybyEa5omag8XQ4Gkc7c5jy1k7oM1vzgAJxTsEfQeesXz7Y5+JYJYZOyw=
X-Gm-Gg: ASbGncuxCgXRn1S56s5JVNiPMIJ9kg8dSJR4QPL9NjRSyGEw3fdRJPDgo/UbkVW6j5A
 dby2Cu+Ncg97r+o28IG2EarI0WEh92ocgZVvj+ECZfqjQzJkOkLs+Mvttja24qMxpoV2CLbi+zn
 8gnH27ddeD4Bt0iqwyFWoTuFl/NuYSRy7WQ7WuptiMZPW+KEZRvLA0ae+4M0BE0i8fGDM74lABh
 hu+7beApSykgEocF/tkTEXCFt/dZr7ubcpqnrMsa1dknbwc9Xe7obMBwW0cgN2uBy74iL98pElM
 qntHy05kw+U4ob2+JuehFMN9x5KARjTGyeiOFeHhBALoRSDdqtd2MavSG1WVZv0LAAQeJ+gQpmS
 pXqJbN9z9NNX6
X-Google-Smtp-Source: AGHT+IGGgyMa73MjalCD/5Q04VVkPNna0MEKr7CcpX7DyGUawpUnkGsYb99w0+0N5zWF65kx++B2AA==
X-Received: by 2002:a17:906:c106:b0:b34:2942:d96a with SMTP id
 a640c23a62f3a-b34b80b32d7mr699263866b.29.1758877957840; 
 Fri, 26 Sep 2025 02:12:37 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545c8510bsm328256466b.108.2025.09.26.02.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:12:37 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 26 Sep 2025 11:11:20 +0000
Message-ID: <20250926111120.357053-4-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
References: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758877958; x=1759482758; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AvlBe0Jwx/QPlpL7ZJ8cXAUwm9Q4gAR4l+BeUx8myw=;
 b=UyBgd0XPstgOpPgpENPoKzGzoIXm8VwSqVQFLqL8q0+sTZDsi/jo7/fut79EqxOxHN
 YJdPK2kjcXwgw+5pn+lnbc897z8CC7UNxtK+9GKJ6QWY6JamY8nI93eZen4SFyQGKNUH
 ZSwVqjSEJAvnsiwWTkdyU3PcZ1UjIloxvS0C/3HYUYPMz1su5e4VyXIa65veLOgMF44O
 CwW982g+GkhuZv9HUFNVgrKUqe0JQg6IpOp0GAl0B+vymeU6qSVeuHQ2HSTXs/SskXJG
 AbAd7WHRrzqzR44kjc8rAnnlZKxcbW/RqEFQcK9fe39NQiQngGnoQP9Y1yb5iaSDyaj1
 lOEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UyBgd0XP
Subject: [Buildroot] [PATCH v2 4/4] package/sway: bump to version 1.11
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

Changelog:
https://github.com/swaywm/sway/releases/tag/1.11
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/sway/sway.hash | 4 ++--
 package/sway/sway.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 379180b0de..46f2bee753 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/swaywm/sway/releases/download/1.10/sway-1.10.tar.gz.sig
+# https://github.com/swaywm/sway/releases/download/1.11/sway-1.11.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  7472a7f11150212e0bed0bd0af9f591c9caac9f9ea87c35486e475a21f5ce81f  sway-1.10.tar.gz
+sha256  0e37a55b7c3379230e97e1ad982542b75016a0c7d6676198604e557f9b373dae  sway-1.11.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 74614b0c7f..f27d147852 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.10
+SWAY_VERSION = 1.11
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
