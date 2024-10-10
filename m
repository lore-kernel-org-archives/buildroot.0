Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DC2D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E08364167B;
	Thu, 10 Oct 2024 21:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2lI9qLK2xiq; Thu, 10 Oct 2024 21:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CE841595
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35CE841595;
	Thu, 10 Oct 2024 21:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8181BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B16A160BE5
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFWbWRvY86o7 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1A4D60BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A4D60BE0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A4D60BE0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D56740005;
 Thu, 10 Oct 2024 21:36:39 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233409.64070160@windsurf>
In-Reply-To: <20241009154658.3777691-1-james.hilliard1@gmail.com>
References: <20241009154658.3777691-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jz9WwMotbZ6QNDPvFZNKwrlHvK0C573zznl7mJDU+5E=;
 b=KfyQnS+b8dd9qM73KeB0lGOb+QUodDZZdb0NzMyXnRdE48aTa7TJaOiLZE0Frlf6NRzkLt
 8TyFIVS4gILx2ijpf7QIvq1m7g8r/kZFGjciWkzEOcQAsJAkho6kaoHKIvnuI7bjrI7TyM
 rBII58YPGYJNZDLLS/k87l3a3Bt5QlRWSx+n0nu8RrRQ9+2C7mRfl/3pySuhWHjt/M0iWF
 EV+EWRaU1qFgiM8pWCUhTUqwajLzYUBqdLM36xFXicPkDFJCyIleYE6YeF8tsF0cAf5A+F
 Le0MNkHv8r/LNwvG+1GYnlwoOAthE3L1doj/WyegRV6v6k3U20K5CphNgrtAkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KfyQnS+b
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: add missing setuptools
 fallback
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

On Wed,  9 Oct 2024 09:46:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Some projects use pyproject.toml without setting a build backend, per
> pep517 we should simply fallback to using setuptools when no build
> backend is specified.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  utils/scanpypi | 3 +++
>  1 file changed, 3 insertions(+)

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
