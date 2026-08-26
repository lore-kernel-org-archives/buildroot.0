Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8ECC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A231F80C27;
	Wed, 26 Aug 2026 12:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDNxe4wFrkoY; Wed, 26 Aug 2026 12:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747833;
	bh=4nB5kjivW/UopAeLubtiMC+Xacpr6dtLRteeNrAqC38=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYnc6I+NYw3lEgIw7dznsXlcYwvQblyfxxJaGRsv8IEFycmWsUFnK/uFJ7e7Z05Qh
	 ZtRmztQ6HLb0kgJ7LCDJVbt8VNxWcxBRsfYf+XNx6IH58kFqk6Pf2Hni+CmTZaLhoI
	 imnADL+k9X/yueJXeSDuBkoAj77/Knh/ShDfDbxCq6+RyalfALW1RwKr7eGWhRGyJQ
	 bVE01r3tgw8QDHc6V8lmeMGLyXASAZCleJ5n50wS4NcqMVxeZtowhnaoHHhcNjPc3I
	 8P6tC87/JOmezKBH1XbqgjqYSKnT7ij44tZjOZI09FBfA3gcBfHG5ql91fOSUnJuvR
	 VrDW1L38WegpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2F180C47;
	Wed, 26 Aug 2026 12:37:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A60E396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 604056062B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hGpL5emE9r7 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51BF7605EB
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6a3819e8be8so2108227a12.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747819; x=1788352619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1EfLFAU3loIBR21caXEh+skEygVXTy+5ydXernjRxaA=;
 b=D5qoGUtPILu0DQa81BEx+v8D+bEPZ1Ji8Urgg9oE8tpyUUKNtfJWD7S+lVwyW0UaJk
 0vHCN6mD0TrIlgJhu7dZRJvMtYwwi+d8pUhlHV4JpIY2CtsbZLrQXeeOgV6JlwdZaObX
 yvvGpqdnRZ0wumI/8O70EP/PQNKu+wm5SnFdUxaPeQpsQrDRAHzO8+DxPTtEzaBsVdaw
 E7ejfDQ8LVmpjvzK6NTg+FyUJyUKwoev6kfyR01KSg2QbelSXrjXhwqiZRYjE7g6me5F
 IzxYAAhUJN4cFZys/G55gm5IJXDVmGRpXcRG7Vdx3B4DjV0HdeYW8G4ByLsvAIw54ixF
 SQlw==
X-Gm-Message-State: AFuF++lkIY+kXQHWXaDpRU2h/9McspGsYdta/o51SWdX66JFWz9j5aym
 EnaYXQESO5SokHg++q6BGvf2K6lX2RAAZz4J20HxITNZVYQNloKGKQNt+5lmXL+1VB3MiCPxZwk
 faCS9/O8=
X-Gm-Gg: AR+sD10a5E5Wr+H3GvGlbxdyiseTDaJm4YTLXCQvMZ8Pv34D0Y1tnCtmg4OUOX/0Wrx
 dbiea+McZ51+Cyb46aqfL7eyea0X5jSd9uIPMT2aO6TmQ/SAtIPVvmfFOegpxJg/sEGZlL/uo0k
 nRTeUnSIcsxvJWHiN3e7iuivPKPphrmH3dc+iVXjjFDGPAv8wXuH40R9uvzMwmjjxxgYWxgpZUm
 1e/d3BgN6pTkFQqp04e64JYo2DkolhmKJE/Kh0+AGqRDDBslwH+KdkjccDfyQIULmLAmddHGnxy
 +oXIOCuVd5o/HQw1vEHBQx3DDQbgtncJXe5nCP3toYEtqaE6VS8XWi23JjSBlymu8M9wmkQgEUr
 M7MrUs+lY8BTSM3Lvfmli/t+0KIjXFb7mizbyAWCS+Mi9MmEmwZREyDena6kpjODAkYBXe4jVqn
 jqIDhk+LSAebSbSOJxKabY3ZZaxihbQqFvH069gKVQE3+dqw6RAweULDssXGsKV1oinT5Viq/kX
 aUY
X-Received: by 2002:a05:6402:a68f:b0:6a0:50d8:142d with SMTP id
 4fb4d7f45d1cf-6a5c3a70ee9mr11547094a12.0.1787747818505; 
 Wed, 26 Aug 2026 05:36:58 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:35 +0200
Message-ID: <20260826123637.410258-15-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 14/16] package/clamav: add patch
 for CVE-2026-20346
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...guard-pdf-hex-string-newline-skip-98.patch | 36 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 package/clamav/0013-libclamav-guard-pdf-hex-string-newline-skip-98.patch

diff --git a/package/clamav/0013-libclamav-guard-pdf-hex-string-newline-skip-98.patch b/package/clamav/0013-libclamav-guard-pdf-hex-string-newline-skip-98.patch
new file mode 100644
index 0000000000..41607a82ee
--- /dev/null
+++ b/package/clamav/0013-libclamav-guard-pdf-hex-string-newline-skip-98.patch
@@ -0,0 +1,36 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 28 Jul 2026 09:05:37 -0400
+Subject: Libclamav: guard PDF hex string newline skip (#98)
+
+The PDF hex-string reader skips newlines immediately after the opening
+angle bracket. A malformed string can consume the remaining bounded input
+before the parser searches for the closing bracket.
+
+Return early when the bounded length is exhausted so the parser does not
+pass an underflowed length to memchr().
+
+Reported-by: Tristan (@TristanInSec)
+
+CLAM-3002
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/354f71e192168b6c966c4d15122b455cbb2d6ecb
+CVE: CVE-2026-20346
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/pdf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libclamav/pdf.c b/libclamav/pdf.c
+index 51b97a0a17..7769a6a6ec 100644
+--- a/libclamav/pdf.c
++++ b/libclamav/pdf.c
+@@ -2680,6 +2680,8 @@ static char *pdf_readstring(const char *q0, int len, const char *key, unsigned *
+             start = ++q;
+             len -= 1;
+         }
++        if (len <= 0)
++            return NULL;
+         q = memchr(q + 1, '>', len - 1);
+         if (!q)
+             return NULL;
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 723b23a99c..b3055b6ce9 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -57,6 +57,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20345
 # 0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20339
 
+# 0013-libclamav-guard-pdf-hex-string-newline-skip-98.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20346
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
