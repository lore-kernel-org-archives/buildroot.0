Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D0FC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B17605BD;
	Wed,  8 May 2024 16:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pq3suJ-n7t0; Wed,  8 May 2024 16:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACED660639
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACED660639;
	Wed,  8 May 2024 16:34:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 266621BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13F9F40377
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TI7V6y6Ecz_i for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D019F40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D019F40147
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D019F40147
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:34:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DF1A60005;
 Wed,  8 May 2024 16:34:01 +0000 (UTC)
Date: Wed, 8 May 2024 18:34:00 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240508183400.0ece4f69@windsurf>
In-Reply-To: <20240508115457.787358-1-fontaine.fabrice@gmail.com>
References: <20240508115457.787358-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715186041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YdrxWLWCVjFyUt0/gP0Sr+JVaC6pV5HyrUGDtnlre0=;
 b=GroZ/NE5iE/qegmw1QzaM3xNfJVZsWC2HWVjtK135csxCLwqK4DNnhTHzBmmXsS6HX5NZr
 M0fEP8NI7NulWhD187c7q80RvciZDuiZ8YpgEfXqtjP+4bdApgyViSS6QrC5whawOavSmX
 cUKyvCkGhOCM5/0mbx58Y82I66Qol7zw99AYrrHjnuoEWfk1mzusqBqPQYui+TwdC60I+p
 aSP+OufZDt+EBKortk6cUvRqlSwXvS+7zxvPLTDDldQW8qTn+Qg7oJt3MrQtIQXAPQMTN2
 BpaNkO/kM1J4okoWYpKwho/ijhtHtTPICeIpmBvZB9kbIX7vucDCQpEl/GQ+Uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GroZ/NE5
Subject: Re: [Buildroot] [PATCH 1/1] package/zeromq: disable perf
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 13:54:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable performance measurement tools which are enabled by default since
> bump to version 4.2.5 in commit d3a8177e175e035ca3b19dca7868859f7cb238a1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zeromq/zeromq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
