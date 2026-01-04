Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE4EC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6131C6072F;
	Sun,  4 Jan 2026 10:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfFZOl25Ue94; Sun,  4 Jan 2026 10:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121B2606E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767524379;
	bh=EuzGhmNtP2RGiD+xD6e26jPnumztRX80mPjzkAh6f4c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q6UWc/3D7qjYJ7ByD4O3D9Zw2MpR9p5pBLbzgzdkrQOfFsRw9tyEH8CFxaow7JqLu
	 S8irMR/VVaBk1XG4LFjX+C3N7fw5GCuue568yKZmqF44l7Z1xI0gqL1kR62mt29PGP
	 S/GYOooMafXqhjaqbsgdK/skx20xn+wP30hk8mfEYt7/2UGtjbL5K9EuQ2ir9lleeT
	 PJtKStmp4RRY71tZC47kKGaairme8rhQ7dys5J7cKSscip1yptaBasPbVGZMpUCLTD
	 Q3PdyQGsORkd8HveM+C15LwYL1G5jcuWB7+LpmM+Nx14PxjUsBfGCF//nxaMMqgy8T
	 SkfwWMlqMGUtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121B2606E2;
	Sun,  4 Jan 2026 10:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86116249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7887A40112
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUy8HuJTc5ox for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 808E74008E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 808E74008E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 808E74008E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:59:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CEE971A261B;
 Sun,  4 Jan 2026 10:59:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F9DC6072B;
 Sun,  4 Jan 2026 10:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A77CC113B0449; Sun,  4 Jan 2026 11:59:32 +0100 (CET)
Date: Sun, 4 Jan 2026 11:59:31 +0100
To: Justin Basinger <justin.m.basinger@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260104115931.67289f66@windsurf>
In-Reply-To: <20250709185956.889-1-justin.m.basinger@gmail.com>
References: <20250709185956.889-1-justin.m.basinger@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767524373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ifxjXRwIL6No6gELkcYj1UWfuyIeXn8NLg0kwL1zNiM=;
 b=Tcy2ewlT/CqjglkTIV/vaJiyS9Z2fkwZuoH5tZQ238SFfcZBqADiZzfn9cE5U87cO2dZ5v
 dbwJK48KjwJt9rsdRgbJN/9cKxTKJ3VloSf4YKKLQZWD+iS8VSEnwYPYAZ4Q3EbhldxPG/
 qpxFOoEmosuBogTmHKghwIyWgrKIf2aq8zjeP28tZdINyD1l2CJ/rpphhN1ZpfrkSpf3ye
 wRfCP/illGN0irimmvqCxbb8eWNZWD+pSMB2gJ0JnM/VIie7ELXxkB/MsyllLDSzthYmYf
 nEdjuD76QlQGz9vpDa57Z41aC8nlCqTXViwGZ3xbAZM+gXHke985iq5SOLwbJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Tcy2ewlT
Subject: Re: [Buildroot] [PATCH] package/libsolv: Adding ability to add
 build option flags
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Justin,

On Wed,  9 Jul 2025 18:59:56 +0000
Justin Basinger <justin.m.basinger@gmail.com> wrote:

> Signed-off-by: Justin Basinger <justin.m.basinger@gmail.com>

Thanks for your patch, and sorry for the very long delay with which we
are getting back to you.

> +config BR2_PACKAGE_LIBSOLV_CONF_OPTS
> +	string "Libsolv option flags"
> +	depends on BR2_PACKAGE_LIBSOLV

Could you clarify which option flags were needed in your case? Indeed
in general, we don't like to add this kind of free-form options, except
for very specific packages that have lots and lots of options (for
example a similar option is under discussion for EDK2, but that's very
different from a usual user-space library).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
