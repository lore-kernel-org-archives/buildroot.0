Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AD8C52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38BF402AA;
	Sat, 17 Aug 2024 10:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeK_sshLw7ic; Sat, 17 Aug 2024 10:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F91B403CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F91B403CF;
	Sat, 17 Aug 2024 10:10:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A44501BF57C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 909124011D
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deL_NU3WNAmT for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B239400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B239400D2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B239400D2
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 10:10:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4597240004;
 Sat, 17 Aug 2024 10:10:32 +0000 (UTC)
Date: Sat, 17 Aug 2024 12:10:31 +0200
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Message-ID: <20240817121031.55afa6c1@windsurf>
In-Reply-To: <20240817000027.654079-1-mmayer@broadcom.com>
References: <20240817000027.654079-1-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723889433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xss1ZsiKKFUf6SnXvi4CPbpnGgQZW59/Ex2LwafUVo8=;
 b=YhQlrrNsmK+gqz3y0ozrHnyY3Zhc0aq03hiWso6rivBYHK3M/87okovZHecES1j5WERMeg
 GpjvgsC014k9RIy+1J/RNN1js/7HyjFFea9tGAY9R827EtG1bIs4qKTjwHeZ+IrPxHdUrQ
 7aFRunkSJllPUc9+Z3k2CU3z4/0hKCRf2Wk1EYpgHr4IVBrpdX/6GZLB9po+xPG/dtijdO
 y4byJvxOaPrVMqgw+rKBpNVO/NdHTgtTO1P5Sq2+iOjXzxdyYgZBdCTHM+lsZVjTprhoJg
 Sq45D8UB8Bek+R0BlFkBk2ieftLdFQQn8W+TQBrDQ1v6CIRNqrGvgTHJpLftmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YhQlrrNs
Subject: Re: [Buildroot] [PATCH] package/dropbear: provide config option to
 turn off SHA1 for RSA
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Peter in Cc.

On Fri, 16 Aug 2024 17:00:26 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 207c1f561700..099f61535aa2 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -67,6 +67,12 @@ config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
>  	    DSA public keys
>  	    Diffie-Hellman Group1 key exchange
>  
> +config BR2_PACKAGE_DROPBEAR_DISABLE_RSA_SHA1
> +	bool "disable SHA1 hashing for RSA"
> +	help
> +	  SHA1 is no longer considered secure. Users may want to disable
> +	  it. However, this may preclude older clients from connecting.

Inverted logic options are always a bit annoying. Wouldn't it be better
to do:

config BR2_PACKAGE_DROPBEAR_RSA_SHA1
	bool "SHA1 hashing for RSA"
	default y
	help
	  SHA1 is no longer considered secure, so users may want to
	  disable it, but the lack of SHA1 support for RSA might
	  preclude older clients from connecting

	  This option defaults to enabled to preserve backward
	  compatibility.

Peter, what do you think? Or should we break backward compatibility for
the sake of security, and leave SHA1 support disabled by default?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
