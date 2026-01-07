Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A9BD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BCF240B5B;
	Wed,  7 Jan 2026 17:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_YlN6n2TWxI; Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE9C740328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808251;
	bh=zcRjni97cy3BnhEDl+cg6Wvc7sIIsY/BSVno4MDcxeI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lEQA2cjpAEFXgUVwIBqZWGcOJve8wQ60Eud/gfj+pYR87hA5M+EYdxsaSrCYs1O5O
	 ixzRxqpLcdlVCiArW+JrdC93bemSwdRH28dQwiJrKRyFDuAPAfWdS4uzb14BQ9s/+v
	 l7NgQbXkdNOXYGtnn8jdNPHtyKkSp4F2EeTaYQrbI7BsG0iJ/2VgkUD94GPoUEnL/c
	 QY/i5DV+/8lMzf6BSS1Wx5MbYODCLMvQuxVxpZYJAQN9H7VXboZL8oz2yO0NZv75UE
	 v0PQz1yaV/PH63Wcbj0QoB3Z45HI6MS7O8gtvsJ36A/Q4V6Ebscc46GIfLEorv+BXm
	 uLrAT6Z4Ym84Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE9C740328;
	Wed,  7 Jan 2026 17:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E172625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A97605BE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0SWBxJGXerH for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3421600B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3421600B5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3421600B5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8B40B97A192; Wed,  7 Jan 2026 18:50:45 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:44 +0100
Message-ID: <20260107175044.226864-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222212842.2307235-1-giulio.benetti@benettiengineering.com>
References: <20251222212842.2307235-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808246; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=tN7IhlN0vesPNsfjfqt4RexirYqSqzyhncTepYIIxtY=;
 b=YnGTRcCdj+X2IzeRNTmG+cWiWKbNqJX3hRXWaAzFYZrXRRC//5aMTa3/tIHnc/x4rOzSPE
 zNFlQ0mIjsEnXnKR0Jr7lHUzddB8jkIm88foL264AtOH7irynOQ5Zdv0E8FjuR26bMs7RK
 QRm4mrNdoPWarp8/o9qo6SStUeRnPPK/LzEcDvp7rTmjdYFmKHShUn97+nK+PMHSjFJD1n
 4LSTVYcTWmigGj0AK6V1ngfEd3bcBA5uKY4i8CQjFM26cbv80N/WmFwsst5lBu0ypF0EmU
 I7ztbjyNB65Oa2zOp/NdtugDOpSFHnbdp4vjWTss4YsG/U2ixYCThvJmVDW72g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YnGTRcCd
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to libtirpc
 and rpcbind
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 244463efa4..ac7813fc35 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1304,6 +1304,7 @@ F:	package/liblo/
>  F:	package/libnspr/
>  F:	package/libnss/
>  F:	package/libnvme/
> +F:	package/libtirpc/
>  F:	package/libtraceevent/
>  F:	package/libtracefs
>  F:	package/linux-tools/linux-tool-rtla.mk.in
> @@ -1316,6 +1317,7 @@ F:	package/python-libconf/
>  F:	package/python-uvloop/
>  F:	package/qt5/
>  F:	package/rockchip-mali/
> +F:	package/rpcbind/
>  F:	package/rtl8188eu/
>  F:	package/rtl8189es/
>  F:	package/rtl8192eu/
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
