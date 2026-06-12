Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37130CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEA7A60F72;
	Fri, 12 Jun 2026 11:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwEJgtnyoWU5; Fri, 12 Jun 2026 11:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62BEC60F6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264211;
	bh=xNjKfX0UAmyFa0wRZmyPREIfy5FD7OFXt5JR11EcLxE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mjNFQOx4/AYs1HUnBTAPdjtASPk1FEWZOmJ7VclRYLgerxOCtET3mRIQ1dhgI0HR3
	 dFCve1gcVH2ERelkgau19j5cOo3A+f0KSVPXwZ+CdvX2myy7htatolaXBycVWekXAI
	 jayT2pLZ3v83h0K0pMtqF1Tr2pysC/3IryOkK/hCa2Qw0Z8cDNqkZF5XH9jjcHgdYM
	 p2h+QY0CSt7t6AngKQ05KBsVAXzuQNNsmBT0AVHlgtklLevB6nmKNmlnyaOcXJsDpO
	 8PMPTa8gRdITU6QMuTr7YD3+EsNuQhbTDY5ZfOcAdnEHkhHrv8PCoSeLBBODlU5Pmx
	 pqjw8gkvniRfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62BEC60F6B;
	Fri, 12 Jun 2026 11:36:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C84712F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E657C60EA9
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UH9Yi2nD9tW for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5073E60F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5073E60F3E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5073E60F3E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so5907395e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264206; x=1781869006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z8whmd93VkPm4dFaWaw2/v0536b6AE1PPNJY2PmQxL8=;
 b=iI7xErDv9zyrg+Zo3NkmBx4w92Xk1eavD9R6Ly+py6MaER0cGYQ0AU+EHF2A5FgRQW
 uXIS77t59TlHjHvCNwnwaevzXqNGQc/QhKiIzWST0e5UxiAMe899gqQ1OEhDPNCs3SpQ
 QWSxT3FuCqyUx5jHE+2DERfCL31MdRCgdE8za6Ihtwa32GCzXOQfuWt7IYRff1hw2SMA
 VUD/0gM3svDASMitC4QcFCmskl0PaqNFHo26aQ5qCNbbeTm3atlEQotMa/M7D6tUgCc5
 /RVbg0I5baGb95znewLwrKXqN1rUX4NzVKqVNjvcR7jevMUaSmaUNeZRg6SnFJ/luZGB
 UiPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4F5cL5HNgmzWmNs6qDUJuIHwZrAa6tUm/EqVj/r97AXOuhjCOq3ido37+hdL+sd0TrpL8eINFRik=@buildroot.org
X-Gm-Message-State: AOJu0YxCP186+DvIVZY4yqPb++2S+nBy2UGp8woS2c2MyYqbu7FsMqxJ
 dDs8Ir7RPYMzHJruwV2SIiwxBdNXz3Z2OzpU0JNh/GOBA4FzA21Ox0qCeo2in5fi6KeALb527Ch
 rpIAe
X-Gm-Gg: Acq92OGuzon9DxOFPMGeD7hg7rpxcPu5ts1s0Zhf60k/ox9SA2dzDw3shQCrQb/Bbin
 G+G2W/sQVOqkSXNv08ONZJQnqZN7yHsKv9oUhZ0voSfPQ/HEtIKy95yA/oAH8j9pE4+wAApPUMw
 SZ5WS4Tv/VO1EqiRhBiwdUtpd2Wc6aUzLLPFEt2D84CiGPymK3YIr997HIrB1hUug2sZ921aGfx
 m+Nkp1CsMsRG4JG77pdPbf1abMv8+wbLPedCd/u1rqXs9DcdJTaCo/AJUjShWbx+Gho5WP4i81v
 l4RP+7oqSoPty2qNFXDsBxPOy9VRCbgstqul77lRSfwfqYgEn+rdzcKrNRvrleNyqOYj2oqE2BF
 kxqN3olgFVTkUj5r1xjGAwF8bSOwW88OallZiXKRuMA7iMX2MjVF7qjx/fqZjT/29VHWT+N5/kk
 DdtED+gi4dj/76a1I=
X-Received: by 2002:a05:600c:c494:b0:490:b2c9:e284 with SMTP id
 5b1f17b1804b1-490ec4f7c07mr32496645e9.30.1781264206029; 
 Fri, 12 Jun 2026 04:36:46 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d046d5sm140902675e9.13.2026.06.12.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:36:45 -0700 (PDT)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:36:44 +0200
Message-ID: <20260612113644.250585-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20250501080924.18726-1-kadambini.nema@gmail.com>
References: <20250501080924.18726-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264206; x=1781869006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8whmd93VkPm4dFaWaw2/v0536b6AE1PPNJY2PmQxL8=;
 b=MUXfncPe66w0Jsdz+5fWfBwBUPvLFm6URTD6QMIHRj9NivHwbDFycxo/YcN6rTwabz
 GeA8W/dL9QgppIrjBjAZvb5XYc81NmYde7FzzggfHzIl8QZO/DalTTjgmHFui3CP69uB
 XCaFqiUzgE5/AlQw87JFwjrpA1jPG1t4zQlqHbsWF3YSw2FtySMFCacScsQ0gNNBPeyb
 I4jdZ3yN7ay+fzk1RFDHt+N/tNVzF5Lf32BtlEwsyoCYwa9WOgSL9VEw8ZPTnNjyIIqL
 vEZtf/T6L5tHpMfooRlU59ABqzqLq0zK/C1ZMiTzjHsQlVqV371mcTCg6sTQJck9H3hi
 ffaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MUXfncPe
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.28
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
> Release notes:
> https://github.com/libusb/libusb/releases/tag/v1.0.28
> 
> Changelog:
> https://github.com/libusb/libusb/blob/a61afe5f75d969c4561a1d0ad753aa23cee6329a/ChangeLog#L4
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libusb/libusb.hash | 2 +-
>  package/libusb/libusb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
> index 8ca68f03ba..3d51244b2c 100644
> --- a/package/libusb/libusb.hash
> +++ b/package/libusb/libusb.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575  libusb-1.0.27.tar.bz2
> +sha256  966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29  libusb-1.0.28.tar.bz2
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index 15649a2ab1..3d809bfb6e 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBUSB_VERSION_MAJOR = 1.0
> -LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).27
> +LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).28
>  LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
>  LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
>  LIBUSB_LICENSE = LGPL-2.1+
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
