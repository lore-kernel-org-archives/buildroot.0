Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51D7E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB1883AE6;
	Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez2_LpGa1qzZ; Thu, 19 Feb 2026 17:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E90708386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521994;
	bh=EBR7czuyudrQ8z4rjXtA0hRRc4T/2fqeV4RCCfxq9/0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oHTzQ8qkD76AnYxljyUjWh1Yk2xa58brqPT7nKD6czj8GYotLfeakdqxvf1SPzamQ
	 UKW+egWY4d/UkGjGLgRxv4SG3tk6dmkXhwsaL8jc3/3iTiagUzheruEKx0eW1yDhI4
	 OmEj1CZeBMEzVUIPb2e9ixS2vb7Bj1asV8oQ8w+DkGWDUq76o1Ci5kNKChqqjvBuqn
	 Ezs6HldIsMuDMFrB/fdQRc7lNx0zCB7Gwq+Vgx8do8nSkjNjGq6q3k6wXj3Ykk53GO
	 kHW/sdyCQRCmLLDtlFHIsUx77OLcCwlHvNIELeT6XMImomQijJyGp0XuDVkYYKSHd4
	 MjotRhhW4cICA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E90708386E;
	Thu, 19 Feb 2026 17:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF30355
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B6C8386E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCQwcaQPEF7q for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F7EE809B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F7EE809B7
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F7EE809B7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so832508f8f.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521987; x=1772126787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oi0F+jpY0qJl7V0GwkZujtufEsyMWt9NyT1RXbsXCTc=;
 b=LXvJk+igL5xxCtqcC6o8b/Osmb+G2EOFSFCJmpctMDcbe2bHszzOv16EpFlSl+Q3Kz
 XsL7dfdeFIk/c8JmSVfHY2jLa4l88HqgKCONlID8lJHBFUiAJW8/cpcm1hMfUseMtFXY
 mBBC+kw/2Ev89ZS0j3h3sQSAMPHH73lQF74hX9jTDBKWT5h0/Py+cwHvhNFQSXIU6w2J
 Psv82a+UwaPaFulNXCQ0afzXZWqLienjmZeYJoZXt4lGxEr89bx2kh6oX5HX8lp/FP1B
 XAQz/aUwAMUPNz27FItYNYtMK8r2ZmQAchaI+GWdcKY7DmWVI+NktlM1N5efpWLmNrIl
 hM+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6vKo+UGRN6vmWs+GOOiEMPT8Xa8d3oZLtnGMU2Swz6MLDHtg1mo0/pRwZKzd3YiyZzbwRBlkmrO8=@buildroot.org
X-Gm-Message-State: AOJu0Yx6M4M/X3UggVnFmvQQM+NmSb4XQvwVzn0AefmxRX2qjBXYBm9t
 fErdQs+aPgNyte1bLqsoH7mN6cIVIjGHRsMyS83BPaNG1v+ZeIz3bHlu3KUdX9FplM4JrbVsMve
 k2SMt
X-Gm-Gg: AZuq6aKxHpps/ybwkxPYtyD9phb4l7pujO+4R02ixzObigLVoESTm2F/drN/HaxDpFM
 s11rieHS6cuqa0RBYKYE/yrAC87h6Cm9Ks3MUO5kA669YDVMtF/FINR9a6y2hAOL5epFdiagN1e
 2MrG836323zs+GK0nmeunzwFqb7/vhrveB4oIW9L3GUx7qCetQEsNTRkkhh/KstKmlij9K2yPKe
 cWQGNg9O/FmR6Tws/x54Z2JsWj6+w+bM5oons44K+XvZ2SpAiGCiaKzuNoUS1pvitMUJEmKC/Zv
 dINdnrC/lnByPNFeoOM1Xmfz0hXZiJh6aB8Cz4eiSnNPIdTaP9IOzRbKF4kunVKpQ1oVB3KuL+n
 dEnsqKmSnAlv8LKjzKjoEVfsSpO1qaVlJ0nqTYYMFMLpSYygQ5+4I6Hi97pL/ZnoBUs4TAqJ5qn
 U/5wMGkC7cFe4wvIM=
X-Received: by 2002:a05:6000:2511:b0:432:dc1f:6982 with SMTP id
 ffacd0b85a97d-4395fd35462mr6010190f8f.16.1771521987511; 
 Thu, 19 Feb 2026 09:26:27 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abe3b3sm57243198f8f.18.2026.02.19.09.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:27 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:26 +0100
Message-ID: <20260219172626.340631-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209203132.3837056-1-bernd@kuhls.net>
References: <20260209203132.3837056-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521987; x=1772126787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oi0F+jpY0qJl7V0GwkZujtufEsyMWt9NyT1RXbsXCTc=;
 b=TWBF1CKejELeH4n5gAGwdUjuQwR25S6cQYCrGFWsCBuMLIGo1X72GIxNxphUQMJMum
 Oe+Xdv9vOYQ7JEoJmy62thPXtc+AhXnIpI26rQe/lpfkUumXF1uyvx/ycdmrBfQr5lNG
 b0mkm7/pDRtqdQqwAIhymmno0xmMFHy2bKVvL8jDzmxAeRpfWKLm3H/jLTIe7o1t+dzT
 vyK9KAIp89sgNhGcXFKb9yVjIup+H8n8ZunSPd0eFk1M+/S2+qu2b4O96lrZXa4lr8om
 KUq0rQ0nHhm1LuiGvALLhCNTVJMUghSKaOqB0VHyxlDW7EO1HLck16AvRnZpnUo2By4k
 2Pvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TWBF1CKe
Subject: Re: [Buildroot] [PATCH 1/1] package/m4: bump version to 1.4.21
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
> https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/m4/m4.hash | 2 +-
>  package/m4/m4.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/m4/m4.hash b/package/m4/m4.hash
> index a5b8456cc2..b6dcca6c7d 100644
> --- a/package/m4/m4.hash
> +++ b/package/m4/m4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
> +sha256  f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66  m4-1.4.21.tar.xz
>  # License files, locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/m4/m4.mk b/package/m4/m4.mk
> index 396c2bbee2..d498754b35 100644
> --- a/package/m4/m4.mk
> +++ b/package/m4/m4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -M4_VERSION = 1.4.20
> +M4_VERSION = 1.4.21
>  M4_SOURCE = m4-$(M4_VERSION).tar.xz
>  M4_SITE = $(BR2_GNU_MIRROR)/m4
>  M4_LICENSE = GPL-3.0+
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
