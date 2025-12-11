Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A9D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEAA41000;
	Thu, 11 Dec 2025 19:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7GjdmN9MP1w; Thu, 11 Dec 2025 19:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96AB740E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481500;
	bh=y+LaF8YCKewJWsO/phQi9GtHpg1odMm4veRAqJppIqA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A5Q0DrDl7wYiER87Ukla29HURd6vdW8FcAGYA/HIzQUYxcMzsWZuUbB42mk/n0J8f
	 Y8Cx0K1ZMjIKVQeIVx5py6ESAjOR4AqeyGzwsGu/F+q+ojCVsgmCqp81jyuBmRtYs/
	 lO0cO9H7JIezxLaOrSqU1QMXxg/CTyVV1iU5DOn9YNzGocyVstLqP7lD5JfjudC05a
	 U10j9ib37EWbLPqG4X/oijOpODUfDExtEcGbCDqVxeVz/Xvwp7pyr/d7+ou4Tm1QV2
	 ADp6MUVysNXqKiw4sN5FaZ0RSNqXbzWp1K5I9AZtgHjOzlPEJKBJn8VGE0B/R8FfLC
	 UpdfofxK2P/mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96AB740E0B;
	Thu, 11 Dec 2025 19:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BADB52C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD02640029
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGngVBivIBcB for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FA1240012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FA1240012
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FA1240012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8DA39B979EEF; Thu, 11 Dec 2025 20:31:35 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:33 +0100
Message-ID: <20251211193133.1100092-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207122324.3523992-1-bernd@kuhls.net>
References: <20251207122324.3523992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481495; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=n8FjeRH7zRMwddCPD61t4VN660Q2ZMrdmeWxdxCfkpA=;
 b=IdlCO1QNHO1n3GWusc3l0l74/Tu5tqBVWj1MG3I4FCGv2KP4ugeWNSuRfhVz3+/xUf9guf
 izP3PL/GSh0I/dzRVk2zuB4CD7TDg3X5rr0zWUON8XlhZoKirb9jyg2Xi/jwLdvisOlv0m
 jyONHh4uSIOVzLy7AZ2QxuEK76Zch7HltHAftncjA8ZQ9sDGMGKkOTCcLCAgWgHhP+2tcI
 AbSVjUbGNokQzJeOIJ9NIk5sI1PgE5FyYp1sgPvzsxyUvco8e6Rk2R5UODosPmd47rvxrS
 OhSAnTQHwHBug0chZXEvqXTdbAgKQiFj59BaVmnmZhCWrnWcZt4WLgSiW0omqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IdlCO1QN
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 update SITE
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
> Updated URL of git server, tarball hash is unchanged.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index 879abdd74d..ddd66598a6 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  XDRIVER_XF86_VIDEO_INTEL_VERSION = 31486f40f8e8f8923ca0799aea84b58799754564
> -XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
> +XDRIVER_XF86_VIDEO_INTEL_SITE = https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git
> +XDRIVER_XF86_VIDEO_INTEL_SITE_METHOD = git
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
>  XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
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
