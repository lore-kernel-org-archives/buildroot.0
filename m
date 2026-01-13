Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BE9D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E28B28439E;
	Tue, 13 Jan 2026 19:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmlHGGrGGzD3; Tue, 13 Jan 2026 19:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24BE1843A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333654;
	bh=XHfVF6i4Yjlr7tQbrEWwmg9yEQ+9T/BlwfklkCpDJD8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZrE9VIcYpheVwtOP6YTZ/1JzAbqRqB9GpB9J6z5ETyd3fNPIBXB/Z8CkHifsA2B8a
	 GB8tMBvpkLVS97iQGL2JAJGj09kJFlKmf9CjG7bGqgRVDrJywdV6Fr3w0QYSkTp1F8
	 oyOlvMsGA2HjB4aqs59t3jvr87aLPNqs0+GEzrnO6Ok6ocvf5woDg1gjWJgNVEaxc+
	 tX7w7cCyoIP8I4En8Nn1+njMg7vqvIaNW7+qyfEM6A+wBe3E6bm2VVeaEFhXuGKNeV
	 4+3OOPpB6UVS+tMPfDNWe1Yc/+HRBuBMA5xCFspwq5x9u2/3tjRZxdrfx02iczZU1I
	 QzdwnfZrk5Qrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24BE1843A0;
	Tue, 13 Jan 2026 19:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E9FC231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15EEC60BD6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alMK-98KjmPI for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 135C960BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135C960BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 135C960BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28492B97A887; Tue, 13 Jan 2026 20:47:28 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:26 +0100
Message-ID: <20260113194726.99914-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-8-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-8-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333648; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=VB5+QkqjllLkc2jEWh8mI8zYaSxNiL1PECRXz3H3/cQ=;
 b=pa6jMeXBn+/KzVVx4ygeCp4Za1I/OesL0RwF0dh6TTOC46Jn6F55TfoSzmRgq2dw59YYTq
 ZrFG9AGuDosnwbXdg2GcUViQWddAz28fI3ci5aod6n222GrwmqA7OCCQ20700w9Kp8cKEA
 xDuNVmwXf5NFWM3Xdv5/RDIOFSk5h9+8fUxrHDIGf5/KLZ3+CfySivO9XwyCtO+vyO/Ag1
 t94KD3KDiQoxex0WgnvcjS62NXRZXw5nSDKuqCwh8l/jT6PpGLScqGil7SXYLD3yjVUqM4
 FiWeUzm+vRO1U2ZjyIa7dHrTKURVDDmdZXJqAFeHNwSfF4y0+OUFgVBqo43/Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pa6jMeXB
Subject: Re: [Buildroot] [PATCH 08/11] package/libgtk4: add missing
 dependency for BR2_PACKAGE_LIBGTK4_GSTREAMER
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Back when the libgtk4 package was introduced in commit
> faf2a1d2abfbff79fc0603def835066587144420, its
> BR2_PACKAGE_LIBGTK4_GSTREAMER option did not properly propagate the
> dependencies of BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL, causing the
> following Config.in warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
>   Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && (BR2_PACKAGE_HAS_LIBGL [=n] || BR2_PACKAGE_HAS_LIBGLES [=n])
>   Selected by [y]:
>   - BR2_PACKAGE_LIBGTK4_GSTREAMER [=y] && BR2_PACKAGE_LIBGTK4 [=y]
> 
> Fix that by properly propagating the dependency.
> 
> Fixes: faf2a1d2abfbff79fc0603def835066587144420 ("package/libgtk4: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libgtk4/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> index 259226e0e4..6d871b8517 100644
> --- a/package/libgtk4/Config.in
> +++ b/package/libgtk4/Config.in
> @@ -87,6 +87,7 @@ config BR2_PACKAGE_LIBGTK4_X11
>  
>  config BR2_PACKAGE_LIBGTK4_GSTREAMER
>  	bool "gstreamer support"
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
> @@ -94,6 +95,9 @@ config BR2_PACKAGE_LIBGTK4_GSTREAMER
>  	help
>  	  Enable gstreamer support.
>  
> +comment "gstreamer support needs an OpenGL or OpenGL ES backend"
> +	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
> +
>  config BR2_PACKAGE_LIBGTK4_DEMO
>  	bool "Install libgtk4 demo/example programs"
>  	select BR2_PACKAGE_SHARED_MIME_INFO
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
