Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3FEC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F3A40609;
	Mon, 15 Jul 2024 12:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyZX-VEmiEML; Mon, 15 Jul 2024 12:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64FB7405DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FB7405DE;
	Mon, 15 Jul 2024 12:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4EE1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 125A5405F9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfqB3MK2zsjf for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 486C6405DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486C6405DE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 486C6405DE
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:41:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7614B40003;
 Mon, 15 Jul 2024 12:41:43 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:41:41 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240715144141.19dc5350@windsurf>
In-Reply-To: <e73a9bd517211d64f4c0c167a57b2e578665131d.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
 <e73a9bd517211d64f4c0c167a57b2e578665131d.1712957992.git.ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721047303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00F9wq+Z5pbUqW+1K7/9kyNH6wwnlgN4vlFqffuJRII=;
 b=YxevFoLDU3cuw6OWLjZ3nxorsrNLxLiS5YdumCmw2Bj7cWHvGqIxs8qlptUSKRGwrntmLv
 t7Ki6o8HZubNBsclo6ty+20fscPe5+8JVSvxqsQnWVjWisZjuPsPjwBgQsvx2nCbnzRE8E
 mpMhrQbAwoo4tTlPyJ+d+7Q4g8RoIwzwvItpdkF89bIaBSldF2yaS7iSgaX2N8COlTjOVY
 8VNlClJDmzo9d4pF5LgoBKDvolU/mYd+367NXWwiEUqF5J7W85PFiTSu9G2Hw26GfjncFZ
 YOilsCkHW03gmgxSU/xztga91IIvG8A2HPfZzJBzX5nmuDOHG+Tuwuvlrlx2FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YxevFoLD
Subject: Re: [Buildroot] [PATCH 6/6] package/gnupg2: Add host package
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 23:43:10 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> +HOST_GNUPG2_CONF_OPTS = \
> +	--with-gpg-error-prefix=$(HOST_DIR) \
> +	--with-libgcrypt-prefix=$(HOST_DIR) \
> +	--with-libassuan-prefix=$(HOST_DIR) \
> +	--with-ksba-prefix=$(HOST_DIR) \
> +	--with-npth-prefix=$(HOST_DIR)

I've added a whole bunch of --disable/--without to disable optional
features that we don't support in the host package, to avoid the
./configure from mistakenly detecting stuff provided by the system:

+       --disable-bzip2 \
+       --disable-gnutls \
+       --disable-ccid-driver \
+       --without-readline \
+       --disable-sqlite

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
