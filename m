Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FD5FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC02984DBF;
	Fri, 24 Apr 2026 16:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUkh7PzgPHwh; Fri, 24 Apr 2026 16:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3957384D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048000;
	bh=wvt87une5nCoThiQXkEzrjDhvE0Kt8oqRrfH3z7IE4E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hmNvYEUnRnair9ATBlCpQ9cQTrWeHUTU0gIBB+q+R6KiCaBfVCIP3B7NeICGGMb3M
	 5rFZXnHEV/pEtC/uZL9Lg0YKI/uBKCgYkdUE28ZJhX9OznDm3tlZnjk4kkQFRXhbUF
	 fZN5C/d4FLXYHDTx3BJFnQrw1b4Hbx0MY68vZYyUQoWrBL0eH//2FhoBiboeXjtAdi
	 AFyc2qLaGY90aegGGBZ+jGUL2hSNgJ0epgcfvFoQNDoeF4tDOcJXvpFFiXuO4UFdDK
	 Ne4NKfR+hyZpp1rBmtn/mAjP3VGWQ/oLLduRK04ADcmh9OciIo9K/BRqTS5DSxTGcr
	 /6FM6N6nOzvDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3957384D77;
	Fri, 24 Apr 2026 16:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91B58194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B9C84D86
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwGSmjma-02g for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20F0F84D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F0F84D72
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20F0F84D72
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48374014a77so104792215e9.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777047995; x=1777652795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OjC5+pdgcdBsYJ5YLewSTq/kl/O1avWLET02OHVwvNw=;
 b=WVONDlrVQ2kIRvknR35nG0GnSR6Vrb62wASYMZ8lIVWRdvtBxgvQjPtB9wds81eV5U
 36vXPk8kMgS3kTiYnGhBry2HWDMX1bi4zUEd7l06cbXotnsGDlH/yPKCCLGTTAaZ9J3T
 kSEN+/y3svJZk6PpL8ykQf05GxMKwZBHrAtw5r+pgTTxJh6yG0HyJ46+yfbP7PdyjgIj
 KDAJ0iCbuM4yEvBFhU2Tg6Ig05gTt8F+A2mEbapm831R+7erukoG88iEDbzUKcRRGMUu
 47alab+g3YTMFexrqHJqV/Vs8jAt8bnQksqD+BkkZ9yjoLlbGQ/TJbgYBbGdmLZ3r0v0
 Pk0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XXBIlmrB9Ci1YCIW2hFuInPZVDkDwWKQ7T/E7QpHNplfeu+Xd/RaknB1/0jKW6+2s80gLccEzbuU=@buildroot.org
X-Gm-Message-State: AOJu0Ywj/Lz3Xwdj1wUMcK93jaVS2ooLGpy8H7ITo81SaFVxXjDVJNpr
 7SCMnBxpzohEqzmts6lVmL1NZjn1eHKTDrY5YYeErsOxSCiHZR8kYUrVbyOz2Xvs+5NxsP8IuM7
 D219V
X-Gm-Gg: AeBDietfZUi0tFSRR389owygARqpMdNTiS1UlpUYUfYW+rUa2vzhAgZv2LzN11Eg+2t
 kwWfMGRU1876dF4VLRuTVO/Vh8HHdaXOLhJmExqr/cvUVYwU47sVJQ6ZDi4O5vmKc2R+Iz0Z5er
 rojdbP4mbIEuecGYexE1pxETJK1xy8QdjTdIT/DZTPAnCKVdlK9njr+AZvX8IaME+miQAcYpbic
 0XIPSDp3J8o4JE81jPoMce7BAgtmhjpkvhJk702DUgoGh/DcMF8mZU6mApkE2ukvHfZdVo1ud3Y
 PIdM5b/PjbGxrdUhVu59z83WJvXTZOzEQuvzWZHlKDBQNaPKli6A1pvnQbvX5l+yLs+LKQeCZ0s
 9fySgxo88/J+w3+laLiHe/t9OPntNrAEyd8aDcDE3uy8verFMf1f+n+ha/0siaXjgCiw0eS3/2M
 GxftqrqptL61SHHMIX5f/WIvBLEw==
X-Received: by 2002:a05:600c:a305:b0:48a:53cb:85f4 with SMTP id
 5b1f17b1804b1-48a53cb8734mr212137625e9.24.1777047995072; 
 Fri, 24 Apr 2026 09:26:35 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891df9e50asm323090955e9.0.2026.04.24.09.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:34 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:34 +0200
Message-ID: <20260424162634.160766-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260112082950.2528445-8-bernd@kuhls.net>
References: <20260112082950.2528445-8-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777047995; x=1777652795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OjC5+pdgcdBsYJ5YLewSTq/kl/O1avWLET02OHVwvNw=;
 b=f2zuNEBzSyhDuL+ZfrTPeXFBVBEfURMItG3/OSAAE3E9bwz84BWSSDnQWc/SnMqZAD
 mNdfaSeuzd4MXlCLhLm2KhC2165Ytoaw959WmkNKQhgDiJhciHS/n0iPSbiFJuxbhvHr
 WhTI2eHQmxFpANE69OVRSAkUIW5inegF5lQUEb+C2kB1G/cWeDrBbVtfT3zZ8/vycW33
 esCah06rZbd2BqGTOGnJWiClFQZIq8oqJKH0cABtWAK0dibXuUb8p35ovyFD2YPgX5Hq
 S5vfrSutIytu5KWAG+F3lrrJ1s5nqy4iryp+nK9hhyNwblH38HTBb/LdYdc4GgtqqlpV
 OeJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f2zuNEBz
Subject: Re: [Buildroot] [PATCH 008/102] package/x11r7/xserver_xorg-server:
 bump version to 21.1.21
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
> https://lists.x.org/archives/xorg-announce/2025-November/003643.html
> 
> Switched tarball to xz.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index 92030d4307..ceca9c215b 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg/2025-October/thread.html
> -sha256  a51aea1cbb29cb8122e39c1c8728469d4fd8db71a538565fbf017df11841bf04  xorg-server-21.1.20.tar.gz
> -sha512  dabe7e637df4b964a1ff04a15587157b9596851a722a753447c257253ad0422007078b74053e1a51bdfd2178e3140a52f94dff0f205242a8589b6fe02d27e8a8  xorg-server-21.1.20.tar.gz
> +# From https://lists.x.org/archives/xorg-announce/2025-November/003643.html
> +sha256  c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519  xorg-server-21.1.21.tar.xz
> +sha512  bb2eb4e6756eb9e38b61bd47c017da44bcf5f45f2b7a906b4bb3a56b3d791cec64abb9bf37b224efe1e4fab9cc296f3672c9b2f8e00e1cdfc54337bef63cd16c  xorg-server-21.1.21.tar.xz
>  # Locally calculated
>  sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index c9456c66b5..0dc3a4a5c6 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -XSERVER_XORG_SERVER_VERSION = 21.1.20
> -XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
> +XSERVER_XORG_SERVER_VERSION = 21.1.21
> +XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
>  XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
