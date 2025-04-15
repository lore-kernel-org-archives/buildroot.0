Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A0FC369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5434B411CC;
	Tue, 15 Apr 2025 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-1INPcRqDG0; Tue, 15 Apr 2025 19:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0FE411C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0FE411C6;
	Tue, 15 Apr 2025 19:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D479108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CAB240187
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gQK3HfjiTNP for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D42240A86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D42240A86
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D42240A86
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so29157185e9.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746973; x=1745351773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Py4f0cqJs06Y9t1Te+78eJ4YXOhet9DJTChiXHA+85A=;
 b=PhDrHdVUMlSlVAYGxCnKlJBOcZWZPukOcbaAfml0AiCOt0t5gJP2mFjL/lcLMOjDkm
 Aoui1j0f1ZAFn+Q0SVXBx8LJhDNsQu/C3XbPIDyhNrHZYjxPmneCfbhvxfYjP0+X4s2z
 qsmC8vfXtqQqTUjk5OlYWXSM4GBKT5dIeZsnGXeroiGH5F2nG8GrtmNhBrgBq4UlYowR
 Ki+TesFLUhXU0KkUDm79KxTR3afZazs2SSVfZuaCiC6LDh6x5ID0aLwmgvnLZRV6J8+b
 wDsH99BDotL08TW+zcDJxJt00/M8grjQkEoeZuUCSqcJnoKp1GlNnqR8XiUXRHnZ8n7X
 7pug==
X-Gm-Message-State: AOJu0Yxb2LI9FEqwOO5e5zvOl8ezjJ8AHLhv0kihtto+5tOWM5xDeooZ
 fijOgQZRxvz3jjBLufXSQHVlYHJR8t/q1iKINY+SkxzWbBygNLI0hq+UBR8HYp7O9GttE36ojYY
 W
X-Gm-Gg: ASbGncsHlFOKzW3xLtykSmLBwldaewZnfAAdU6B/PekURyJZrsnKFlKds9sKF0hehog
 05cqOkv9847/DbldLzDXkHMkCLdcy1VYeJ2GMQwEAROPCVaCJEXsL8/l4ep8oohLBQ7nqzPTfhj
 SgIQxiqNn+1DHARc1dup3e8402hVjsJ/PuMaSP5Khv8z48nvcyePYZESyET1vVm4YJCXjRJ26s/
 IUEsMkO/b5ke6bHqd2fpWW1iIFZP3j8rySBNGPyzrBjQXVFZb9z7qZ/92fvBVsxBIc6A+pqlIsc
 2YyBwXHAQLrgpRJlrX8RM+gy3HyO/nFieThRxuk+aMLtCiwwxfTMYMw=
X-Google-Smtp-Source: AGHT+IHAqK7sKv4WL5Ro5NgDDmzKSQ27nFzYgI4z8Q+dey3Apw44RwHiiIw4HIA39xp9jtVkBK0qfQ==
X-Received: by 2002:a05:6000:240d:b0:391:3998:2660 with SMTP id
 ffacd0b85a97d-39ee2729f96mr679510f8f.7.1744746973375; 
 Tue, 15 Apr 2025 12:56:13 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:37 +0200
Message-ID: <20250415195547.199428-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746973; x=1745351773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Py4f0cqJs06Y9t1Te+78eJ4YXOhet9DJTChiXHA+85A=;
 b=YEaFMEZZW8g4M+5pdvCcqzYqD8HtsOZ38xx5fgxSsxXu8yKagh0iIz986zSDF+Q7Vw
 anXEOhfvTqTbbEMEw5sj8HAcQlJRYj8WJ5QHjpkN9HsVpdQBUbHjhIZ2tjjV4FLcYGI8
 n44BEGpxSHEdncFVIaY9nNnzBvqL0XR5Q8KGa6AVaMf8CBsrYJXjkmfPeaE8wLL8BiWs
 X2gUptREGTJWUS6UmAUFm45ogeqXcd+cZNBN87g4CxwCk5dgKeMdIita5BU8inOOzBPQ
 S5DXBReIW6NTMojfzH1XPS1ox7YmQ9GU24BQ27lIhwZIeQCHmx6bF1y+xoxbGJKtc7hD
 wuOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YEaFMEZZ
Subject: [Buildroot] [PATCH 3/7] package/pkg-golang: support PURL generation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The PURL specification for Golang packages follows the coordinates from
the sonatype ossindex:

https://ossindex.sonatype.org/ecosystem/golang

- The PURL type is defined as 'golang'.
- The PURL namespace of the packages is made of the source host website,
  the owner.
- The PURL name is the package name.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-golang.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index a4e8bd30cc..f76c976ce3 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -182,6 +182,22 @@ define $(2)_INSTALL_CMDS
 endef
 endif
 
+ifndef $(2)_PURL_TYPE
+ ifdef $(3)_PURL_TYPE
+  $(2)_PURL_TYPE = $$($(3)_PURL_TYPE)
+ else
+  $(2)_PURL_TYPE = golang
+ endif
+endif
+
+ifndef $(2)_PURL_NAMESPACE
+ ifdef $(3)_PURL_NAMESPACE
+  $(2)_PURL_NAMESPACE = $$($(3)_PURL_NAMESPACE)
+ else
+  $(2)_PURL_NAMESPACE = $$(call domain,$$($(2)_SITE))/$$(call owner,$$($(2)_SITE))
+ endif
+endif
+
 # Call the generic package infrastructure to generate the necessary make
 # targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
