Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C7AE95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F42360B3F;
	Tue, 30 Dec 2025 10:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGTn07PuXSlJ; Tue, 30 Dec 2025 10:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A61D60ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092380;
	bh=IYzCuK0eVjka1nK0zxv/jfVpx4UPkrfPzOPxNn02dIg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SzD68EAxcc1VtcNp19LupyxPsbJw1lUZPv8AdPOTCZIBNvDM0DtDZ5FjXarXZnxKY
	 nr04v3DRGQeasMPsivV02foZ2r0aN+1jEQB0F7xOf6ty2oAHTmsP/vMQHk1Lez1kDo
	 Mu5YJOV1V9QqJWPtW85fLeMEzMbORj1VuZvuCGcLcVzuMQG311fMk17Ef7lrLW/S8t
	 B24J6NkGhWtUoiNFoE2FR+ij1Vi9xTSg+6+UYK+36Psi52yGNQDZmhH6hIH314axsU
	 gJCUsI1LfpTTehTxJYxU6RfJOVZtTmMHeC1tr+8Dhb0TvqgEkTETh0BKL8gvRpdQVI
	 4CgeZrI9QHE8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A61D60ABA;
	Tue, 30 Dec 2025 10:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF0535B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71937402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CptK7XJApXf0 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B2984026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B2984026B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B2984026B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C06E51A252D;
 Tue, 30 Dec 2025 10:59:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8747D6072C;
 Tue, 30 Dec 2025 10:59:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE72D113B0643; Tue, 30 Dec 2025 11:59:30 +0100 (CET)
Date: Tue, 30 Dec 2025 11:59:28 +0100
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Maxim Kochetkov
 <fido_max@inbox.ru>, =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?=
 <flavio.tapajos@newtesc.com.br>, Bernd Kuhls <bernd@kuhls.net>, Olivier
 Singla <olivier.singla@gmail.com>, Danomi Manchego
 <danomimanchego123@gmail.com>, Romain Naour <romain.naour@gmail.com>
Message-ID: <20251230115928.2db85eaf@windsurf>
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767092373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/ilAm8YJ8Yy0pLiys9dy3a/TfdsfawcrPdNC3oxcbc8=;
 b=g7OkFBxXW52lUnxwTy60sN4wlVOdpFKSyLyrOQnymi0Ub2sl5V0bNl868lYNw3uZUelPTF
 aL+XAT1ESCSMDBs6V0IQ7FLhYI6kS0rJaEKCPnFxyOqhRSHbz6079U7fJZkal5938S/q6v
 agi6vDJZVO///JFOVWXFwBRCd3g3qcHjIwojA3zfLQoNGRnz7EtrmUDNaUU7bnk1c8i3Ga
 WBYZZ/kmglqc+wkuzbQy2HUR6jerniwDBaWJdgW6Pd+IoshfK/uDdI5XZRNWc8rwZvIIny
 VERm7+HvFo/xOZF6avp5BcJr6YEcokD439rBxKpSO4i49/0ynPe7tcd+qXmmGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g7OkFBxX
Subject: Re: [Buildroot] [v2 PATCH 00/15] Remaining CVE_IGNORES
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

Hello Thomas,

On Tue, 30 Dec 2025 09:19:02 +0100
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> Thomas Perale (15):
>   package/xinetd: add CVE trailer in patch
>   package/shellinabox: add CVE trailer in patch
>   package/patch: add CVE trailer in patches
>   package/tiff: remove stale IGNORE_CVES
>   package/rsyslog: remove stale IGNORE_CVES
>   package/postgresql: remove stale IGNORE_CVES
>   package/pixman: remove stale IGNORE_CVES
>   package/libssh: remove stale IGNORE_CVES
>   package/libcurl: remove stale IGNORE_CVES
>   boot/grub2: remove stale IGNORE_CVES
>   package/glibc: remove stale IGNORE_CVES
>   package/glibc: remove stale IGNORE_CVES
>   package/freerdp: remove stale IGNORE_CVES
>   package/dovecot: remove stale IGNORE_CVES
>   package/cmake: remove stale IGNORE_CVES

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
