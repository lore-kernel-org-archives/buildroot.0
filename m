Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EB4C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC8980B57;
	Mon, 29 Jul 2024 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9s5Alk_9wGv; Mon, 29 Jul 2024 20:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE83F80B5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE83F80B5A;
	Mon, 29 Jul 2024 20:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 075F91BF427
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E99CC80B5A
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgH1v6UiSgnD for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 20:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B1AB80B57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B1AB80B57
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B1AB80B57
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 20:44:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB443FF803;
 Mon, 29 Jul 2024 20:44:45 +0000 (UTC)
Date: Mon, 29 Jul 2024 22:44:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240729224444.12110219@windsurf>
In-Reply-To: <20240728115029.1174631-1-bernd@kuhls.net>
References: <20240728115029.1174631-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722285885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNaG6cegeDIeWa+CBtlZJBI4l82X7ZUQscio+wXgwQg=;
 b=PeRxt8hMBShLTANxFokmrtUMdPlU9vn1X3oYyrUdNJ3NXmPOBsgHtTM65bzFeuYbRg9tpg
 7W1/JeGB7JU9UrQrfab5gCVQn6EPiJC6sKFXuQZgJKemcgV2R2HMNIZo6jc5GM6zJXVl70
 X5fZBR5Pn2+J9lnxyfP9BJu6G15fKwvzMyVsIlf/CXMBIls1ySfF8uelGM+k1Msscf+VhG
 3BJqqFqQOA4v70FX5GQ6aXtx1Qt1EhtNsz4lXrZPVFrTulBS65QbT18xjQjNo9UHicytHv
 yM5veCxLSbLJyyfQvYJhrZxHu6/ossUwuRJua1VALXq/xHhpM10O6VF3e4bdgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PeRxt8hM
Subject: Re: [Buildroot] [PATCH 1/1] package/openconnect: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 28 Jul 2024 13:50:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/openconnect/Config.in b/package/openconnect/Config.in
> new file mode 100644
> index 0000000000..502babd5b4
> --- /dev/null
> +++ b/package/openconnect/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_OPENCONNECT
> +	bool "openconnect"
> +	depends on BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBOPENSSL

Instead of this, we do:

        select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
        select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS

in a number of other packages. I've also added a comment above the
"select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL" to explain why it is
selected.

Also, some features of OpenSSL need to be explicitly selected:

+       select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if !BR2_PACKAGE_GNUTLS
+       select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if !BR2_PACKAGE_GNUTLS

Basically for any package that uses libopenssl, make sure to do a test
build with all OpenSSL features disabled, to catch these issues.

Patch applied with those changes. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
