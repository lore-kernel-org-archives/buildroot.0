Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52146D2ECF6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 23:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11E0560DCB;
	Mon, 19 Jan 2026 23:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCnxu9u2HL2b; Mon, 19 Jan 2026 23:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486BA6110C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768864735;
	bh=dKJbPKn5YxoUi3Cn/K7iTyjbd5hn7lYT/kpRnap8igU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PmCgiqpP2EQn4OR4rgIV9bsVSQFlZDQlSdogrjOZqlh/m5V8O9VrnkPu7mAB3fYYM
	 AnGjQK2SI5jL9G1z0jPumWqkmimXpwCbj1KbrBxjmjG8TOS70VGIwSsTPvxt8mOW76
	 Mg/XLn6BqESUhZpIhTVFg0MzIHia1rR1WAOvUxLI+0F8XqvBFPNtQp/7RqFKa2ZKO9
	 pymXwVoWTaUCzwJmqqwL4PRL/oMf3EGkOBK9y0b4h/Msnv3+HdXTL/huG1VeA6wdPy
	 RyteYAMF36o/7ibEqgUMOz50L+lmtD7jtaAbgH9+YmYyJbeJ1Gi3kbesbV1MgVApL3
	 OK0CgMnnpEvQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486BA6110C;
	Mon, 19 Jan 2026 23:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 126D0160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8BD341CC3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xz1lQrxczoq9 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 23:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE97D41CCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE97D41CCD
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE97D41CCD
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so31240835e9.1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768864729; x=1769469529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=frAHKu++iiQA+oK4fqVVkQR+YiSps1J2A4HLAk572p8=;
 b=Db5xKsegYKAp6IkyvbDy4OimSVXTESvRFCf7nSGB5N8AV6gTptmx6q02UKCy5XeZKZ
 a/diKOeL9VV70Ypj+ukVVuwz+z8ENCw/9v1ejJsKGZalVOR1lnYSmgvS+Urqw1A4FK/I
 v1V8h+5a6f4wM9ovfTwBLCqyN/uPRA6YDXeH3uj8mpNUkVQfxYs9r2P1L/0R0LQqasO/
 GJQBxmI1/B8lvPQspQUBaFIIE0W5foYMDJvJiZTrlOd9yTTfAUaaIL65p2mwwgd154vO
 gVPbGcwL4YSepxXEGYe3OY0jeCtc0PiWMa05Sq1wJBbNV9m6KLhaxrJZE6sWA8+6ud3z
 bP8w==
X-Gm-Message-State: AOJu0Ywm5UgTzb1kKeKmGAZYcdq6i+NrzZFmP21IqObdm7VWhot18E+L
 hzJ9msfWn47oWqbgM4l4wW1Gn/NqagOI8hLBlkdHZT73+yO9Ga6BnEJw2OLVfg==
X-Gm-Gg: AY/fxX5aM33zvyDug+0hCZPKSs0YmMf5bPpkYahbGvH0bqneZAXL+wkpqz+lUuGuc2M
 o3ZEZVtlukU8+h/Zi1ypkAzRWcSIA7Ksx4ELKR0w8cx5ABq8szliiPLkX/b0alOd+dfx9OeVTxr
 ifLKRZyFb8CkmgBQsW+2HTLHknwQYWbe+XNiY+uMOX4F0jFKskTqqakAsYo1qUO1vs/CtgfVwAu
 aG0sArH5teZxkjwEI8XMn7dK2kah1PV4c22FZo4mThgxp2o6BZR8fdYkQXG29xfEBefVgsZgyLd
 UR6xYTQAHiemqhG8nQS1GgOobNNcPukWAI/6gqAQ5omGGJa0kLNWsrUj8At8Gw/V38VQXOFYbPT
 yShIv6paeuUUg8Hgf/3xklyzqTStQxJjIs2agN0Rn61xOhaFvz5YhzM4mKHGyPqE6lpNW7zySen
 liZHQznAErNGsoeUE=
X-Received: by 2002:a05:600c:4f49:b0:47e:e87b:af8 with SMTP id
 5b1f17b1804b1-4801e3397f5mr175975635e9.21.1768864728696; 
 Mon, 19 Jan 2026 15:18:48 -0800 (PST)
Received: from localhost ([37.163.185.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f429071a2sm270181925e9.11.2026.01.19.15.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 15:18:48 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 00:18:19 +0100
Message-ID: <20260119231830.32276-3-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119231830.32276-1-mattianarducci1@gmail.com>
References: <20260119231830.32276-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768864729; x=1769469529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frAHKu++iiQA+oK4fqVVkQR+YiSps1J2A4HLAk572p8=;
 b=V6vmz4VOrrEeli5Q63K9NegiFX34rwUr57OCxZoPMLMFCgOsCC7f5C4xaozH43Kj1j
 SPwJ1mwO266MCMQpKFNDP1j9E9tZlUi37Z+QwCxvmYJxWHdX4iaUTisSEWggdCwtjm63
 cE/d2bqbsqguxuYblptqo2OCRVPWeGTJVoePCBYUYsBHHXov7wnLtprVsZUL3Nrwag7/
 ZchC9Gl0+sy4ycpcUv8lxVM7627NW06983Zp73ucz7oBSh5UHjXiiEPGFbCFU2QojgVk
 FjXKagA/RbKf1qX/3Y3VyOa5i5G7+GuNbymLmt/OqbyAa49WoZlU7SgRqyA0NX0jbU1X
 EERA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V6vmz4VO
Subject: [Buildroot] [PATCH 3/4] package/gensio: add portaudio optional
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Portaudio is an optional dependency which is enabled by default since
version 2.7.3 when alsa-lib is not available:
https://github.com/cminyard/gensio/commit/71eef5e3cef2232eed85c5cb604bdf5fe3ebf580

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index e928a4dde9..1246749051 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -62,6 +62,13 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GENSIO_DEPENDENCIES += portaudio
+GENSIO_CONF_OPTS += --with-portaudio
+else
+GENSIO_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GENSIO_CONF_ENV += LIBS=-latomic
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
