Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FFFCD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E28C40561;
	Mon,  1 Apr 2024 18:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EX-EGdwdT2wa; Mon,  1 Apr 2024 18:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C6D4068E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C6D4068E;
	Mon,  1 Apr 2024 18:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1123E1BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B50781379
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvOIszyjuKzS for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.44;
 helo=mail-lf1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D1C28135B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1C28135B
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D1C28135B
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:39:36 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-516b0c5a7faso408622e87.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 11:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711996774; x=1712601574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hurho33op0zmtzgczZeWmnq4eDd8Pv5SJkQXJRo3zSY=;
 b=WXe38M/zO4Y7G0NNCWwKqK7ac7pqiryWb9wr0MNz2nWdsQVWrBz5XltowQvAfMqydZ
 MBakmIaSGpBxj8/+5s5MJ5ORaPrZ2JR5obDF7CXBpf+KwHBsJeYiAhzjJp2/YqHZqSnm
 TRkYsOzZ8sy2Dy/dVglow3oKYy/3dxkoWiZNlqmenIHsbgiLnDugZubiVYwpjYl+2HOT
 WaGHYI272zrrQvI4hvBo6Vwy+xJC8JH5evNK7VDNePbaGehcGoLIpfZJYpUpeCyFMqMF
 SShSuKgxMZLT1VE/VybbXEcZ/Mn6muq/bJvgkyVVdIVJ1Z8S9n1iwoY4CLjrRtuMUtTd
 CQjA==
X-Gm-Message-State: AOJu0Yyn0gP1C1NCX6eQ30PDAiEbBb27DVssM5SZOGG2DxR9d/CE0JgK
 TqcZtPUKa2DsefHEMT2DURtsnzHw162BabkKw3efBXLFVCo1IbF+NRer8y6h
X-Google-Smtp-Source: AGHT+IED3Wv0TmR2VhbYVRGlEFsgdIS4IFcLkBmjEMtqgiUFQ2c7v07mUAFjVMu3mrnuxExAYGSWZA==
X-Received: by 2002:a05:6512:1588:b0:515:d1f9:983b with SMTP id
 bp8-20020a056512158800b00515d1f9983bmr10568167lfb.1.1711996773396; 
 Mon, 01 Apr 2024 11:39:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:a80e:b8d9:a912:61ce])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a056402040c00b0056be85c253fsm5731781edv.95.2024.04.01.11.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 11:39:32 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 20:39:29 +0200
Message-Id: <20240401183930.2557159-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/2] package/ruby: add host psych (yaml)
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed to compile webkitgtk 2.44.0.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
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
