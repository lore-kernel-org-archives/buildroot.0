Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC9CCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7778B40C54;
	Wed,  8 Oct 2025 16:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLRI9ZD3XRUU; Wed,  8 Oct 2025 16:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E5740C2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E5740C2D;
	Wed,  8 Oct 2025 16:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 028449DA
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC6E340071
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsIZnJ2uHpAq for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71EB140C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71EB140C2D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71EB140C2D
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:57:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BD1E02003E3;
 Wed,  8 Oct 2025 18:57:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 18:57:29 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 18:57:29 +0200
To: Andy Yan <andyshrk@163.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251008080256.4337-1-andyshrk@163.com>
References: <20251008080256.4337-1-andyshrk@163.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <42d282330883efaa8f9d4a9be5a9d528@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759942650;
 bh=j6v0q2MSV1kE+Tz80nCXgoJWZJeM5/Urt6+FIZzp60Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OpY+4fRI7hxV2PHlsQOHKlL7+6eDfpZUCogJ4ixybD8xBYJzT6wJ5WIc1krI/nFeM
 fWcEtCEStygsf/xmuajCiOaGrhDAsdHTzSQ/RRM/jqtZDcfvPU7VUNUCty8FvKaFNu
 yNReyYb+/A8FTiu2IoWUiFoVCFApp+Wpaj+BL//IKsCnkS5KZRlbzuNJh05wdfBFMd
 e3xE2mlTOhgKcrSOWdM14UjMG8ITPqfZR8dDei0CtKnKc+uNZQScWx0IArjfnOTU6V
 QGjj4EC1NI/vf0Pk7WCdWDbd0/GW7TUnR9UaqoXto173RsevUVs7H/cN2Ga+yuG1rI
 CkNGNbS2ldThw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OpY+4fRI
Subject: Re: [Buildroot] [RESEND PATCH v2] package/linux-firmware: Add
 option to install cadence MHDP8546 DPI/DP bridge firmware
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/10/2025 10:02, Andy Yan wrote:
> Cadence MHDP8546 DPTX IP used in TI J721E SoC needs the firmware to
> work.
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

Applied to master, thanks. For info, I moved the Config.in entry from
the Wifi to the Video section, which seemed more appropriate. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/054b49a26fe594e808ab0bf5f28629f9ca0f02ce

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
