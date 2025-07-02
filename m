Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA02FC83013
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 08:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7148D80F9F;
	Wed,  2 Jul 2025 08:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5m8DKZ7BSZB; Wed,  2 Jul 2025 08:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C09580F26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C09580F26;
	Wed,  2 Jul 2025 08:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB04196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B134040066
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmLEOdw92rwO for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 08:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE93E400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE93E400EC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE93E400EC
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:38:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so4124519f8f.2
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 01:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751445502; x=1752050302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDDlztW40tYsd7gL04AWwJMeZKBN2hxKgASB2uc0wWs=;
 b=OsNFNmmG9Ae5jxGuXrJVtDSiuGNUgds+XeN0ehHcWDKdaLVRkE1UD6NKiocHPNcgrw
 fSbOX6FW1ZAEzOULqnBRyLC948kZnwq0nlyhXHTGbCY9E4VuoIXBpM0peejeCOBZMMR6
 Y9X18g1TaFsKRF2HNNBVkKsRKPsm9RwMlZk1thYAXjvsiF7NlAfVkfa3k3con/p456zs
 5NU1FlEtjIOetZ+9GYi7uUMIbLqG6znAqJ0OOGpAYFwY4Nnx2PXvW8nTfA3KDy5ICJ9c
 h+OOLoBpRQZKbKBG971zK5eX9XS2VkwqwBGweGY3GJeCc1fH7A4al1X23RZ5GgBfwhD4
 juzw==
X-Gm-Message-State: AOJu0YzCHyZ1KyijGxJDF+FNxTSDFm+NqEAYBMTuckmfkEk5Glpt3CqX
 auJJ9NR0EtIlTJpuANRV9Ygyxexq8eyMg6ncCA7PUS0mCaNhrtUQbKB9sTy5tBiS/sNTdG1fgOI
 NimVW
X-Gm-Gg: ASbGncv30U6/EOlS6iVJSu7uBfsdbYUPL+u2usQiN7q652TXM3WGoS5wUD6HYPN50nF
 kkvtLK5+5WgYDxcNtteuTQtHrMXthsm3fO2nAKjKJPg8LeTmWfL6luoA5U8xy2gtAbFFZo1OO9N
 ikegu4v0sdydL7mNUimMrKkLI/x8PNSnPRbtyPagdmDh8MQSP4lDgmHbbHkDgSRKGI4BxCRP5gT
 VMfxsSqtZLlMfd1qWMHXwFi6u0Yv4UG5MtTO20NpwMEA313vTTXSlY7WeTQgOnufr6joiyUU+gi
 hN6QQK2uy9+w0kiu6DQxpavJN0TB/wbqrbAC3kdwRzpvRz7Y+yUd76OsnEo4LSrd7XOlLRYnOyz
 jm4dUJUTSlLnWvCZzwA==
X-Google-Smtp-Source: AGHT+IH+KLmliJVbSQGunoLUjHl9Lufb8Zq+OIEFD61YpiNY/DKE+aTDqb2WFPz2hbMKV37StKERTg==
X-Received: by 2002:a05:6000:480b:b0:3a4:dc2a:924e with SMTP id
 ffacd0b85a97d-3b1fdc20a8amr1423280f8f.6.1751445501737; 
 Wed, 02 Jul 2025 01:38:21 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453a1914d10sm81253725e9.4.2025.07.02.01.38.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 01:38:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 10:38:05 +0200
Message-ID: <20250702083805.1553261-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702083805.1553261-1-titouan.christophe@mind.be>
References: <20250702083805.1553261-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751445502; x=1752050302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oDDlztW40tYsd7gL04AWwJMeZKBN2hxKgASB2uc0wWs=;
 b=YfKUIT+9rGDhfdO2BLNaxROGX1/Xjr4VAK4eW3B6ceMGABNWs5FdnJ84VpjxqcmI/4
 fdNG/u8ToYUnkNs2qn8CBMO29lKFm5yYcbD0sFyII3PvJ8cn+IcevzOoHGfFtn61ewcR
 tbS4qW+bOZ9B8b4qs3VJ1rGealdY+lKwp5Z98CDgrCsxTvigbNoK5KWsNKx7Y0VZD+Z+
 SjyS221azfE/cfqm50QWzc29bsItUW/XKPJ3bSqZUF4+fVL12a145M1FfOYai8BLTIzO
 cxCBipCMng+XcYF+8NdUtkxMRNUhQL4jyM7kRDtIDzMl03/adIjao5DY7KIkyKDU0QbE
 KROg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YfKUIT+9
Subject: [Buildroot] [PATCH 2/2] package/gvfs: update website URL
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

The website URL was outdated, resulting in an HTTP error 403 Forbidden

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/gvfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 68ad291436..720b8e6c20 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_GVFS
 	  all applications using the gio API. It also supports exposing
 	  the gvfs mounts to non-gio applications using fuse.
 
-	  https://wiki.gnome.org/action/show/Projects/gvfs
+	  https://wiki.gnome.org/Projects/gvfs
 
 comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
