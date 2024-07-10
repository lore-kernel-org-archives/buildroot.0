Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6484C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BA060E80;
	Wed, 10 Jul 2024 21:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOAfW6Q2h5dt; Wed, 10 Jul 2024 21:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2148C61062
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2148C61062;
	Wed, 10 Jul 2024 21:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4A211BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D10E2408EB
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqTtlmqtIiiX for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C469408DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C469408DB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C469408DB
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:07:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71525FF803;
 Wed, 10 Jul 2024 21:07:49 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:07:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710230748.20718df7@windsurf>
In-Reply-To: <20240710210448.90301-1-bernd@kuhls.net>
References: <20240710210448.90301-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720645669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UU9aef1jBXmCBlNKsmBV/js4LV6TMjM9NfKzYw3LvA=;
 b=kBHbmJjsii+jOZyltvfQFQOIK66gtQZMffF7LIe8KqdKBp9g3yNkrJxIA0D9mBcVd0k0Bb
 t/TPnLkjaD2Y20XYNEfAWNNPU5e/w9DRb151L8qesuRirSRm5PWlOQYA3zxixd5Po/5uUd
 avLajR9PzwRsDRex2jXMZyG/mXcEEDAHcLyR1uQZ2ScWB1s1FQaukdgvD4pafnG39aCphr
 EtQ4asbcHFMZVU5tfqUI+WIz/UoiChvpv+/65wbWjtQaCMhy/c2y9oYDSbLOxByk04MXx0
 516WMrT1ehg+f3RmzdGP7DDrpqaSHYZQXX4VT5TuhLPG11yybdcAk9YErmu0Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kBHbmJjs
Subject: Re: [Buildroot] [PATCH 1/1] package/leafnode2: bump version
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

On Wed, 10 Jul 2024 23:04:48 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/leafnode2/leafnode2.hash | 2 +-
>  package/leafnode2/leafnode2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
