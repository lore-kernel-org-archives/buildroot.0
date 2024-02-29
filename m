Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2059C54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 13:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF15822FC;
	Thu, 29 Feb 2024 13:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SZs8SLVNS-m; Thu, 29 Feb 2024 13:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED5658237E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5658237E;
	Thu, 29 Feb 2024 13:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E3B1BF2EF
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0606841770
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckkAleilJQMO for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 13:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D1994027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D1994027F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D1994027F
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 13:11:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412bf3d52d7so3406965e9.2
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 05:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709212272; x=1709817072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmu7WV8LbnrDCbkWWMP+crLdelhWxR/XMPfDA7f8WAE=;
 b=d72LVvqJzL4kmcQCsjMJMVM5Gp4RtHxxDW4AdA2F2sAeILDyFjQCFm7K/1qHXx418+
 xVRcug3wKRAmeY7sRCO+x39NZOB2TRgwhdMMkkdmtUrgurLFWrCYJ5anuR3fzonnUOez
 33p5IUYUYX1rk63i3oi/XlTS9FJuhD3vSVdd/ZEe/H5g9+h8AWWwWqn7ugtgSC4BXF7W
 kdaNLrfTVbgZOh3PQfRMe0uPdWpb66Vnhpa/dEXHVLduFeM3VY8J3VuzrKEmJDjKaKmM
 I0FV01/U+PxrfXaOBQITKfWFPW32K3vIIRZjPdLCqK+vM9MVORr5mTLAFLPiOruFKrbo
 aX8w==
X-Gm-Message-State: AOJu0YwCjNmyT8Nar7N0OAIkNAiUftc946yWVBflooUAkWDL+wTNUBMi
 rp7M85v5V6AII3ZKHBwZPSx1yLaW2hnZPMENjbHbIQVnAPsJqFSHc24GAphWa8N7/OzsDgPUlyX
 b
X-Google-Smtp-Source: AGHT+IGTBcxRf4qIHI8/g94Z4XY+834OR8CDYxULhYotQOpCwkZ5R9KQP6U/U45InidEdpzojT6f0Q==
X-Received: by 2002:a5d:544c:0:b0:33d:87e9:5903 with SMTP id
 w12-20020a5d544c000000b0033d87e95903mr1635763wrv.15.1709212272207; 
 Thu, 29 Feb 2024 05:11:12 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d59c6000000b0033d926bf7b5sm1796562wry.76.2024.02.29.05.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 05:11:11 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 14:11:08 +0100
Message-ID: <20240229131108.363533-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229131108.363533-1-romain.naour@smile.fr>
References: <20240229131108.363533-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709212272; x=1709817072;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmu7WV8LbnrDCbkWWMP+crLdelhWxR/XMPfDA7f8WAE=;
 b=x+FzHOouV9EfP0xPGSpxPFK/AD5/jLB9e80+EiOpsXglzA6r8eef+W1V9QDpvOd7E8
 JaYloDW5qCvPRftcyHsVZRwxf345vkBlgw0/bTBYN9ZJCcmQWjXsNiSIVJvMNI61QZtX
 DaaJdtsZVDcpWrktvn55AnE/yzY2UwnPjZhkkGQHerq312qb7OQ7owep1GKot4HTGlu+
 3ca4CXkc4rm4jN7u5LphcI+N4xXfXOu+zWavmBGRlTMRIzCKWeQfEwGLwv+fSbLa905m
 93sN5Mr0J3DjmOnyF18uXqPFBdFEuMDDi9DqjgTUDakKXvNQ2zNGzL7icjooazwH1+AM
 Jpdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=x+FzHOou
Subject: [Buildroot] [PATCH 2/2] package/rust: provide RUSTFLAGS for cargo
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building the rust toolchain, the build system endup using
cargo (from [...]/output/build/host-rust-bin-1.74.1/cargo/bin/cargo)
to build some tool like rustdoc-tool.

But the host-rust package doesn't use the cargo infractructure (since
it provide cargo binary) and some cargo environment varialble [1] is
not set to crosscompile cargo packages in the rust toolchain.

For exemple, we usually set RUSTFLAGS="-C link-arg=-Wl,-rpath,$(HOST_DIR)/lib"
to force cargo using libraries provided by Buildroot in $(HOST_DIR)/lib.

RUSTFLAGS is actually needed to find zlib library (host-zlib) to link
rustdoc-tool when zlib is not installed on the host.

Fixes:

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02-rc1/package/pkg-cargo.mk?ref_type=tags#L167

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/rust/rust.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index c464e77f4f..cbe79cd8e3 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -69,7 +69,9 @@ define HOST_RUST_CONFIGURE_CMDS
 endef
 
 define HOST_RUST_BUILD_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
+	cd $(@D); $(HOST_MAKE_ENV) \
+		RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
+		$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
 HOST_RUST_INSTALL_OPTS = \
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
