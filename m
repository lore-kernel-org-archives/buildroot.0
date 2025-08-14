Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C30CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E54180E43;
	Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-jS2zfUEQor; Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C41380DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C41380DB4;
	Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2051B228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B998B60785
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnXmFKCbyCfy for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3888607B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3888607B3
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3888607B3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c6521so763645f8f.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203510; x=1755808310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJEwiloUqr1K3NR+0bzCsR8GJVEKDLTeA+8L7tm+alg=;
 b=eo4rz99AUwj69f8sa8ycMYPvt95KGdDHs6wvIYdEfXib9OElciPElAr4IroKe8W9eL
 xsUYzA8txo8RqMYtaci8SB+WgQZx379G5vLExugr/9hQ5fPcBwLFh7fRSHKXy1JbcUIl
 vWb+6xD25E8RUyNVcvvZrKNkAomXGmItkwoC1CuifaagHeUVevRlpfs8nYtLMKK3sIwt
 W0L9hBKFcOHKodKe+8Y7nk+BrrXWUOWIYOvmKnpjrfrDbClBWMyDtjl63Lbhgi1Rh3kg
 rMux0pc2WtH7Dakir19VPUywkScXjhbzBP9Y5oDKBPkF0pJWvkS8S9w9fzaE8Thn7LYb
 ZKzA==
X-Gm-Message-State: AOJu0Yz00gqQsTjKMKIxwBDmWGfxMoEpiUZziO7ihEwSv8Il5Q8U3Dpi
 LltXLE7k7xzrbnUNAOZbhH+q2DItWubpUFQW75gH3FrPZE8icN3OZRfRln7Vl7r56Cw=
X-Gm-Gg: ASbGnct1ua4UCLNnjlBnrXhrGKINF1VRUhyWO1XWiiMeIgnNDj49w/I5W/N9KbsNs+a
 5x9eHgqx8jjsDpulPqYQZysaSXaJZfOm+Z4DZOVeP6ZkLQXkk6DmAxe6k68i9DVHBmn3yn5SXe+
 /r4hQuVGKU9lSSSEZ1YnoDeKT4wZviXA/1MVpx/fVGCIAJNmXnbBKOjVnPbZDudUVfnPkZaj4N/
 1HrkbOTqkb26ZvIgLRoYVa095JfgO5uF8QxUM6iRDps1m+ti/dk6HoKj/CuIO6qMHIFXA6qyHYf
 txAWzHMM65vr5WShw4bnzBgxbRF50R9G0FGBMDmAaRdO/iACatQE/sBENKjBPy0Jq+v6pDDuN7M
 tWrAEGF9ho1rX6w==
X-Google-Smtp-Source: AGHT+IF826FMPD/cq2e1i+8G59UB7ipvM82kTxHFVqkzXIRMxmaClmyO6nWHubDgdepzIDH/DGN2Jg==
X-Received: by 2002:a05:6000:240a:b0:3b8:d1a4:bacb with SMTP id
 ffacd0b85a97d-3bb261118a6mr70174f8f.42.1755203510007; 
 Thu, 14 Aug 2025 13:31:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ba50f369ecsm3344270f8f.48.2025.08.14.13.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:49 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:49 +0200
Message-ID: <20250814203149.2815520-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726093105.692181-1-thomas.perale@mind.be>
References: <20250726093105.692181-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203510; x=1755808310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJEwiloUqr1K3NR+0bzCsR8GJVEKDLTeA+8L7tm+alg=;
 b=dRVlv7stHuzLb5yR4BUlO+mMVwoSjdJuNaPG6Gle14YRHw1rZP03TQJ+kpmAScQ3OR
 xXQvM3Yw84KoED18AVM3mVF0DnoWhO0q+oXDtoilQTEuNs17EIfvAfwu03U1AHngg6T5
 A6A537j/qrFheGMQpLN6adihvZyVhzu8MRJ/b7yarnuvvW2ZO/7pD3EMO4uV4O/f5GZm
 FSi+pOlFsJazIiqfiZKT4TlZNbgupHKMHhZndjQgv4HExyds6wKlMUp/vmOwrckW1vze
 eb+vHUgadZ86Xen0I3PX+Kqjo+1TZM03pkLQpgZkGTsiP880eZiVcr2o4BpeFJpRfkqN
 s/9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dRVlv7st
Subject: Re: [Buildroot] [PATCH] package/ghostscript: fix xlib dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since the package bump to v10.05.0 the xlib libraries detection has been
> improved to error missing x libraries (see [2]).
> 
> The following error is happening on the autobuilder when building
> ghostscript with xlib_libX11:
> 
> ```
> checking for XOpenDisplay in -lX11... yes
> checking for XdbeQueryExtension in -lXext... yes
> checking for XtAppCreateShell in -lXt... no
> configure: error: X11 libraries (libX11, libXt, libXext) not available, either install them, or rerun configure with "--without-x"
> make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/ghostscript-10.05.1/.stamp_configured] Error 1
> ```
> 
> This error can be reproduced with the following config:
> 
> ```
> cat <<EOF >.config
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XLIB_LIBX11=y
> BR2_PACKAGE_GHOSTSCRIPT=y
> EOF
> make olddefconfig
> make
> ```
> 
> This patch fixes the xlib dependencies of the ghostscript package to
> correctly build with X support:
> 
> - The 'XtAppCreateShell' function is provided by the package
>   'xlib_libXt'.
> - The 'XdbeQueryExtension' function is provided by the package
>   'xlib_libXext'.
> 
> They both select the 'xlib_libX11' package.
> 
> [1] 9abf662cfd package/ghostscript: security bump to version 10.05.0
> [2] https://github.com/ArtifexSoftware/ghostpdl/commit/37eede31e12814fae69744e7842a5640004e5a65
> 
> Fixes: https://autobuild.buildroot.org/results/45d/45d0414f341feb2354478b145396fe137f9cc6a6
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/ghostscript/ghostscript.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 0ddcb950ff..c9d13f5545 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -85,8 +85,8 @@ else
>  GHOSTSCRIPT_CONF_OPTS += --disable-cups
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXT)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
> +GHOSTSCRIPT_DEPENDENCIES += xlib_libXt xlib_libXext
>  GHOSTSCRIPT_CONF_OPTS += --with-x
>  else
>  GHOSTSCRIPT_CONF_OPTS += --without-x
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
