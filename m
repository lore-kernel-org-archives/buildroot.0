Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EBAC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92734401C9;
	Mon, 22 Jul 2024 16:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1emho_EzaX71; Mon, 22 Jul 2024 16:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6618140276
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6618140276;
	Mon, 22 Jul 2024 16:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9A6D1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB7340276
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtAXKVq8mrqL for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ABB5401C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABB5401C5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ABB5401C5
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:27:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1245E0005;
 Mon, 22 Jul 2024 16:27:24 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:27:24 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722182724.5d7f38db@windsurf>
In-Reply-To: <20240722124507.248444-1-fontaine.fabrice@gmail.com>
References: <20240722124507.248444-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6d1WAlUljO5Q3zGPKsg3Pc2QUFDe1A6CRIdc/MdkcE=;
 b=NySU5H0wdh3w67C5sniUjrsvFnVvnxCiJXvgTO6btUX1YjFLIa/4UOOcQ/JZfHaeOL1yLD
 QpFHc03mQqB6A4CfZkn9Nv5KGETtygd/hZ/V+UgTjtHCXx2fBv/GF3QKQkCv3p/hfYSlUz
 qb3pCBn+si8NPyiI8o588ojtsN7nNXzFovyiN+0+di91AX7gS7t61YlmiBAdxyPcGEpCmD
 UnS6O1SpI/5jXSw5gyMN+Qdc06GgcP9obhrQcbb0RW14M4k62ia6ze2d35H5tL5oZQAG0p
 8MbTqWyUxXARnxFgEuY5JjmUB/EtSjW8gKvZYWvqcSPlHad/qLFmnidZnykYDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NySU5H0w
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: add tpm2-tss comment
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

On Mon, 22 Jul 2024 14:45:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As suggested by Thomas Petazzoni, add a comment about tpm2-tss
> dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnutls/gnutls.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after slightly improving the comment. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
