Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8675FCEFD01
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 533B16062C;
	Tue,  6 Jan 2026 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgPU4Qgme3K3; Tue,  6 Jan 2026 20:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D5E960592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767731454;
	bh=aujJvyjQDKheEn7MTmRgHk1DD046KldpJc31XqEjrCQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XExS+AJVIUMrCxaxnw72HUZplyJHV81BQKKDg/y1sq8KK23REpk7bl7aakcJX+oeW
	 kjS1dd4Lho/pAKcnO0fW3sYLVRDa3hOxZ7UMNjTTBY7qH5r7xKLyYiEZ6MWGM9ZhWq
	 VPQi/a3LQquYLXO1qFOghTA5Z3LBIU478Ax1WymAacU1zt6YLSff+C6WpvZS8Tput0
	 CM1F6E44TaT4bdHNQP7OX6YYxbIjKcdb8RE/cfMHnNrcpOyVRQSSTsHdiga0Mynkob
	 C5Dl18HAiC1Mg8EmgoNjvo9KTKhL7YxpvWzGPbJuKyqHpvxx6mUvziWWxpZOMx6dZh
	 5MwPy7q3b5MCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5E960592;
	Tue,  6 Jan 2026 20:30:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F112A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E61807AA
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYe-4dkeHAYn for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0E5480766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E5480766
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0E5480766
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 92513C1E4BC;
 Tue,  6 Jan 2026 20:30:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BB8860739;
 Tue,  6 Jan 2026 20:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6FC45103C8412; Tue,  6 Jan 2026 21:30:44 +0100 (CET)
Date: Tue, 6 Jan 2026 21:30:43 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <20260106213043.5b2cf126@windsurf>
In-Reply-To: <20260106155630.2404514-1-neal.frager@amd.com>
References: <20260106155630.2404514-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767731447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/H5/D1Do6HQKXd7rjqyW+t2UNKyoFUwfJEyACp36aig=;
 b=nX+Iymr04D7chD5Fbbd+wEJH219U0/lXa3koYE5Z799ciPFReZkpPd8v+MXZ1uBnC+QZkv
 9rxJhedom9IOlzKZhDUBqKHRPzd4wvdzv0EeOH/PnVFIIZ0LeqtRtyt+2QNtZEMZK+d6lC
 SpjyktKSrrV0nF9A0X/xnIw1Ol2Dt9TXr6SAE7ENlivgTORiZ/JQaR28p3zPhVJZ+d7UAA
 6rpJhf8FIXtPAEe5lPaJxt0875uH3Z7Otj2rrYBWqmrMh2LYWIERJCr2OsGbv8kjA4jevS
 e6D8HesCRQqogvAsxti2pvn9uys6vd5vEFHEG3r3irLxOsIzy4tkMte4iOKP2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nX+Iymr0
Subject: Re: [Buildroot] [PATCH v1 1/4] board/xilinx: add Linux 6.12.60 hash
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

Hello Neal,

On Tue, 6 Jan 2026 15:56:27 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Add the hash for the Xilinx Linux 6.12.60 release tag.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied, thanks!

>  # Locally calculated
>  sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz

Can this hash be dropped now? If all defconfigs have been updated to
use the new kernel version?

> +sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz

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
