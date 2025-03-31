Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C09C3600C
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 15:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E8980DC0;
	Mon, 31 Mar 2025 15:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByBbnd9NbZkg; Mon, 31 Mar 2025 15:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0687280CDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0687280CDD;
	Mon, 31 Mar 2025 15:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE77D0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 15:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E871640928
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 15:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cz2I6cAJzIZT for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 15:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=tom5760@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D62C4076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D62C4076A
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D62C4076A
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 15:35:05 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-47686580529so47468521cf.2
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 08:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743435304; x=1744040104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Db8+2Yg3bt7Mz4LythjQfoVCDl+xsIgykpfQtI4V7A=;
 b=eBjfE6oP5TJpnE2jV4243AcJXvA9BcdCj8p10qs1ndG+85wmx+6G8tNLB5hAowOxsI
 FbNZ5LTskrq/aHZyCO1G2hfwGPDrpRZH7+qn8HjCQg12TdmJ9byzjBTElN+hmSS55VY1
 yYObdoucWQh0D3UeVuskKOWBbZxVxSA9D7HAKQYG2PXdwz4OMk+KAfSfx4+uvhX7daJ5
 oYvRWJ3MY4YDGn9TQ2eoHU7t4/NSdNvd3UclX2EwNFdbYL5DLuHAOMp9bDCLLwT/ooEq
 AuULuEpZAF1Lg3GiDmZtDAfZ1LMv2qp5qCVfM/mxMjcOidjGs9YF6V2+We5IUKKmm0OR
 Jy2g==
X-Gm-Message-State: AOJu0YzjnWZslp9fySPze8srZUHY8iBEI1S5FLm801c/vPngI7fvdVPF
 Cy78RLzTc+lQ+ofJ+xGqAyfLhTbxqNW/EIVO1joMhCXlII/SClddBJByPAp0rbQ=
X-Gm-Gg: ASbGncuhgfzV+7OR6xrrxukCQCxpohNEeQCsrH9FvaZOppHiKXH7DxpO0BlL+SkWWwN
 eIqZ6vjjwgqnp4EmRIZ+DvmgXT629iR4bqBSiWd8wskc7ivKVtgZBBXmTEb3+IgxSbWdRaIo8ST
 dXdP4oBsc2tcpxoD+3DIUDeNSQDtAD4BYAhr61T5lRnQOzJZDvb469v63XB39oed09mZa5fdE/c
 ow8ZeT8Q2cUCaZA72OAR1Vy2Xcp6Dorr7mSi2V0NIX3pxUl/l+rN6ft6tWPvdFiUM6r9QZ/8uaR
 sHqCqCnjFK8L/haOBToAqVovX9PNQE/eolbKkmAspTlJbznMkOj9Y6wt6mGznw==
X-Google-Smtp-Source: AGHT+IErRBXzavOH0cCVdv1tmv0vcowPPT05CnPKxn28W3NgqETfvPVsnIb49doGsESfI7QhvLJWXA==
X-Received: by 2002:ac8:58d6:0:b0:477:e4e:9186 with SMTP id
 d75a77b69052e-477e4b1ebeamr139628161cf.11.1743435303852; 
 Mon, 31 Mar 2025 08:35:03 -0700 (PDT)
Received: from lithium.cow-mirzam.ts.net
 ([2601:47:4000:119d:8d35:4f4d:8ca5:bb15])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-477916cd4ddsm41478381cf.47.2025.03.31.08.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 08:35:03 -0700 (PDT)
From: Tom Wambold <tom5760@gmail.com>
To: buildroot@buildroot.org
Cc: Tom Wambold <tom5760@gmail.com>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Mon, 31 Mar 2025 11:34:37 -0400
Message-ID: <20250331153438.4103-1-tom5760@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250314154252.10248-1-tom5760@gmail.com>
References: <20250314154252.10248-1-tom5760@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743435304; x=1744040104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Db8+2Yg3bt7Mz4LythjQfoVCDl+xsIgykpfQtI4V7A=;
 b=jO84cF99LxFv+3UhMgC3Kc3cgjuOe8s4okuzoTH6Jsa0cmuTeBJ3FcPLMx66Ks3fqK
 /JjmFcSDo2VSqnMJ80BFVhfxSFg0lmlP4YQvRDdG+Bko4QEQs/7ZXCT6Yfohb9ULKj6C
 BQh7/Hn05utaL7zLFoAQFkznWRBNhV8oe7Eb+d6H3PEsWbq7xjlox1E9oNKrMFCAC7Sg
 cvMJveN57+Ir/jNfQOIEGXLLmRZH0T2+mq9DdOZdYMP4h7wsdBDzji5BqRI93p9saR+C
 vnTAMzkqeJK1QDWruX9DdJ08KaOmFyT8roMRiwhRk5v3AbsbDd+ziWRI49m43uN6c6PF
 jj3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jO84cF99
Subject: [Buildroot] [PATCH v2] package/go: go-bin host-go provider implies
 target support
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

The BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS configuration symbol is
used to determine if we can build Go packages for the target
architecture.  Previously, this depended *only* on the
BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS symbol, which is true
only if the host system can bootstrap the Go compiler.

The go-bin package makes it unnecessary to bootstrap the Go compiler.
Also, some host architectures (i.e. arm64/aarch64) don't support
bootstrapping the compiler anyway.

Add a new symbol BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS to let
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS depend on either being
able to bootstrap the compiler *OR* using the go-bin package.  This
fixes being able to use the Go compiler to build target packages on an
arm64/aarch64 host system.

Signed-off-by: Tom Wambold <tom5760@gmail.com>

---
Changes v1 -> v2:
  - Added missing Signed-off-by
---
 package/go/Config.in.host        | 2 +-
 package/go/go-bin/Config.in.host | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7e354b3298..f9b27cc4d8 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
index 6312c1b950..5fe1686fef 100644
--- a/package/go/go-bin/Config.in.host
+++ b/package/go/go-bin/Config.in.host
@@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
+
+config BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
