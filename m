Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36A6C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71B56803D1;
	Wed, 10 Jul 2024 20:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-6RXBjv_Ub9; Wed, 10 Jul 2024 20:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD1A81E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD1A81E28;
	Wed, 10 Jul 2024 20:16:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACE441BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9967D81E28
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVzORU-wI20a for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F2D2803D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2D2803D1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F2D2803D1
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:16:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D57F120002;
 Wed, 10 Jul 2024 20:16:08 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:16:08 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240710221608.25fc5f37@windsurf>
In-Reply-To: <20240623102615.20501-1-ju.o@free.fr>
References: <20240623102615.20501-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720642569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Nn0cU63yAvSaHGc1mh0oSP4EVCVnQNYrFcfKE8YGAo=;
 b=WmbP1AF1CIgDa7DEuf20225mV2Y41RqckdrJ/FItn7NJz0yPaDjojGtu/WK5GhyW22KiwF
 LhsmOCXqvSDgRbun6dX88Bcql1501prfSHscL4VT5gn2PQ9a+qzV/MohtE9JdMrjgLcFu+
 G2v/2J0PLaRDdSgNqQpxwk6ABdvGziwt6M8q6/F0EX6E46suUws7goKhyfiDzYNLjHozTW
 i43w99PcLlkHKfdO/zREs+Yay7Oxp4P+5bbfBYnE9LJHfwvjV2UmaGXs7tYjyQyVFbY5nk
 elswDLPn1aasUIHCU/q5HLEQxJWJvFqW9YTe2VkQELa+Ig91J9f9Q18oUZ5iGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WmbP1AF1
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add optional openssl
 support
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

On Sun, 23 Jun 2024 12:26:15 +0200
Julien Olivain <ju.o@free.fr> wrote:

> GNU Octave supports the --with-openssl configure option since v4.0.0.
> 
> For reference, commit 40ea68b4b2 "package/octave: new package"
> introduced the package at v7.1.0.
> 
> This commits adds this optional support.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/octave/octave.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
