Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E5C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AD4608D8;
	Sun, 14 Jul 2024 15:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plrViuCiUNzP; Sun, 14 Jul 2024 15:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958D1607D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958D1607D0;
	Sun, 14 Jul 2024 15:08:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C97481BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B59DB40165
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2b-FFSnPUkiR for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:08:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57B2E40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B2E40139
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57B2E40139
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:08:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BFBD40004;
 Sun, 14 Jul 2024 15:08:50 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:08:49 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240714170849.09923f18@windsurf>
In-Reply-To: <20240713200159.562870-1-fontaine.fabrice@gmail.com>
References: <20240713200159.562870-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkF6zRCky4gEX+2SVmA+41qPeI9q510O00jIhmIXeCI=;
 b=cIJBmw+gcIs8JpCfo5S5Tq0K9ixeF/pJbl0btm/sctJSCi+LyshgpqhjEKrhNIMDjmA4Zc
 rGRWdmQz3SVcw8+BC1eqj3jNktYC0/AswZ7yxGaFAUIE3afXEhCGaP0zJPFo3p5hVsVDdw
 qGF55wgmudC2g1UJ9gICFi7IoVoUpmd+Xj7AXpIMO52lcKjqsFvS+SVZuLaO8brcYCsQhT
 7LWQR/fgd5H9Hjdfe1C7wJvvXpRNUxZWgzWOcFnRGnhiLFjqoDkHmEO4wJJmaK2trdM59g
 x9kZ4MbYRsrdJjPciV7BgL2d8GgBx4JShsdS0tRUg6XTp/o4a57WDAPgQmIl4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cIJBmw+g
Subject: Re: [Buildroot] [PATCH 1/1] package/skopeo: set SKOPEO_CPE_ID_VALID
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 22:01:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:skopeo_project:skopeo is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/D76885CE-0BE8-4012-A93F-F33A0C5D743E
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/skopeo/skopeo.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
