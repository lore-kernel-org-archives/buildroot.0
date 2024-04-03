Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE2CD1296
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 17:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF94460E6B;
	Wed,  3 Apr 2024 17:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE2TV1PUP66O; Wed,  3 Apr 2024 17:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F059D60EBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F059D60EBA;
	Wed,  3 Apr 2024 17:14:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFFBC1BF420
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 17:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD42D417E1
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 17:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX1gAklapYdg for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 17:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.44;
 helo=mail-wr1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C389A417DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C389A417DE
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C389A417DE
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:14:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso11585f8f.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 10:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712164470; x=1712769270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WATDLEQ7tjpTUcaihLLV1kKc7nfV1PmJ+r4UoTmoVR4=;
 b=j4ru/jYX/qTUE8kbU0DkC4MZDPGV06XKu0VHeKEsbkSfHegYEzq633iNtygDE+BHhk
 R3Znrb4WtEzgQh7Tju5XfBtOSlmH+rsxWsEKgb/DZxUCXKs4UDVX9bI2UGYTjYPYtX1I
 n8WQmVCmZec/lKr5xDlUA+kvhxxz5DYdoHd1CzRgBbdQ8BNeqClP/o4cm1CNBu8ro8tj
 pGVrLwGWhWRQMkCFbR02RmzxsagxMvVvWxlrSwwtGsOcsiMu13lmFr9P3nLCTdUFITqF
 /V31n2t9sBJlqLKVeHwy6hQlFUoR4CDanq/LaNyTtV9ibZ/b5t+DRM4z6KhhjOdiLsJx
 ratA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoa/r6yI9w9gjMqceFeuvRFMFXecpvQgod/QszK2DFRpqeM1C1+QoBXXHyVZ+hp5UnIG59TEzTRA+Q6lUI47VBAAHbtazCdA==
X-Gm-Message-State: AOJu0Yx3cvbMdM52Xp5QNdKBv7ZChCuVD5RUVZI1FiLSp8F+zQe9ASWl
 O/h5aRNuSg7seKO/8nuwGHolqpt6V41CkSAVFXM7JAOrGl9W+o9kIiNEM7KR
X-Google-Smtp-Source: AGHT+IETF/3y9ItKj86bBkOiTZIPrTFjZBGuXeFfYO6bZH7zshCPBoAdaRROhEbvZPGoyXT2sjkIAg==
X-Received: by 2002:a5d:4535:0:b0:341:907a:bee9 with SMTP id
 j21-20020a5d4535000000b00341907abee9mr92749wra.16.1712164469534; 
 Wed, 03 Apr 2024 10:14:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:eb7f:31b3:c83f:7802])
 by smtp.gmail.com with ESMTPSA id
 dq6-20020a0560000cc600b00341c3071c93sm17729160wrb.73.2024.04.03.10.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 10:14:28 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Date: Wed,  3 Apr 2024 19:14:23 +0200
Message-Id: <20240403171424.44580-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401183930.2557159-2-thomas@devoogdt.com>
References: <20240401183930.2557159-2-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 1/2] package/ruby: add host psych (yaml)
 support
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
Cc: aperez@igalia.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed to compile webkitgtk 2.44.0.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: n/a
---
Question to the reviewer, should I use this:

```
ifeq ($(BR2_PACKAGE_HOST_LIBYAML),y)
HOST_RUBY_DEPENDENCIES += host-libyaml
endif
```
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4b9ce80e67..ac7de38de4 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -20,7 +20,7 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 RUBY_CPE_ID_VENDOR = ruby-lang
 
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
+HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl host-libyaml
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPTS = \
 	--disable-install-doc \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
