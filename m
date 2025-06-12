Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8A0C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7B84092D;
	Thu, 12 Jun 2025 20:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MBNiL0I-Zgs; Thu, 12 Jun 2025 20:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2024140939
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2024140939;
	Thu, 12 Jun 2025 20:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 701F5183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614FD83C15
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Umw-6jNSnOlZ for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 771C283BB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 771C283BB5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 771C283BB5
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DDFE1C1178; Thu, 12 Jun 2025 22:10:51 +0200 (CEST)
Message-ID: <c7f967d8-fc35-4233-bb0a-676653d00162@rnout.be>
Date: Thu, 12 Jun 2025 22:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
References: <20250608110935.18887-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250608110935.18887-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dCwkhvLIYTbIyUDB5C3K/+78RRpvclyF5XxJE85eDdA=;
 b=UrHYN0c9lTLCH+sE2XFLpVh4a5233sZOBwHYvcy0qq4G1iARIJWKzoRRKnAsqRMVsZ7Elx
 c02tV4hG/BliVWumyL2Np9jUQBOc3pHUycoRW13VHeJibTgAAn8EPmDAtIW6xR5Jlq16mF
 J7tDedUSzDYtb7HJBDjXUeA1Z82YrALQbKZoi5pBfYiLMRiSsU+P4sUXPHw6IpGLD/OON1
 jcZNA5lkqucTS2HsBEJnNrrhA9qR8IOgCWlwQHIu8Y5Um5LxhUMTXLrwjZSygkg1AW+ibB
 TggfEhCGtI2G6AHhn4qAXby14Y8OeLEhloGlwtFbxl1WQVUN2PW0W+6gc+/39Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UrHYN0c9
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 webrtc needs sync_4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/06/2025 13:09, Julien Olivain wrote:
> Commit [1] "package/gstreamer1/gst1-plugins-bad: bump version
> to 1.24.11" added new requirements for webrtc which selects the
> sctp plugin, but forgot to propagate its dependencies. The sctp
> plugin depends on BR2_TOOLCHAIN_HAS_SYNC_4.
> 
> This commit fixes this issue.
> 
> Fixes:
> 
>      WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCTP
>        Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
>        Selected by [y]:
>        - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && !BR2_STATIC_LIBS [=n]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/90b3cfedf44cc92289746aa30e439be409ca3747
> 
> Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-plugins-bad/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 4c4e993714..89db860f87 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -659,6 +659,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
>   config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
>   	bool "webrtc"
>   	depends on !BR2_STATIC_LIBS # libnice -> gnutls
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # gst1-plugins-bad sctp
>   	select BR2_PACKAGE_GST1_PLUGINS_BASE # libgstsdp
>   	select BR2_PACKAGE_LIBNICE
>   	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
> @@ -669,6 +670,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
>   
>   comment "webrtc needs a toolchain w/ dynamic library"
>   	depends on BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   
>   config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
>   	bool "webrtcdsp"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
