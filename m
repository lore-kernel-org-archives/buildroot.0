Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D5D5CC9D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 10:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA09E60F9A;
	Tue, 16 Dec 2025 10:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYn8g5D25xdm; Tue, 16 Dec 2025 10:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 911106090C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765879253;
	bh=tFlXWHqGQiSepJuyHLGb5nALDUcnZYw0O0fLLorz2rU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZgTjDeUz8YjC/xJypgCG5otTRSDF7mrvUgIj8gYuqpzmRegExEIy1Ks7Ddyec8mSU
	 eAVe43uRnht7MLUCHw+u1Tpl2BF5DH+ihMCCNa30GW+Q7HlHMkbK7EFReRULaiTCMH
	 QpHfgD+oV9wwIv3VuJpA9UeCIxj0fHgh8/0HgMzgmFn83QS1i9iL3TpJB4zPnQhLJ4
	 1RKIOnQQaXjbuTTRMsChUTibBb2lUsvCmt7KNaiRJ8A3WEM2fSnVISOB5e4OWDM5Ui
	 OnIYz64S4/D4AWLZY3urfOf9Pc+C+1pkcJwPA/FbLfAUHjIWgTV37HU3frk030Y/XC
	 yk5g7pFTu2acw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 911106090C;
	Tue, 16 Dec 2025 10:00:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7416151
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 10:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5B56090C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 10:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-7bZ1fKaw9L for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 10:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 565F1608FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 565F1608FE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 565F1608FE
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 10:00:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 097BB1A2227;
 Tue, 16 Dec 2025 10:00:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D2BEB6071C;
 Tue, 16 Dec 2025 10:00:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8FC511943337; Tue, 16 Dec 2025 11:00:46 +0100 (CET)
Date: Tue, 16 Dec 2025 11:00:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251216110045.099dd2fc@windsurf>
In-Reply-To: <20251202203918.2216989-1-bernd@kuhls.net>
References: <20251202203918.2216989-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765879247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KvIXAGuG9XhEh2PJZDcSvWTURUcI/+nQu1w/+5vrOmY=;
 b=OiFuyB9D0ZH/KYzrvkg9sj7NVKxP2g5tQjF/I5dLJqjQsWHdQ91/aMHBUUTfebPeb30nz2
 oqUeoNI9SWKfkygAv2BQqfYDecnUKMLJPlRiPeUxnE7lyN0uHV9KjAkMsGHjaUiG2i9xHo
 HrLOBFwo3zYTVwZdhMbQ5Hg2Ve67B9r2vPBWyOvJqCk5hGdKYD/OpoEPQjwaZ1bMVtfRf2
 32WYfAamSRX3X+0WIY+RTrUax6uRAj//cCUPGxohogDrcBD90kDnfxFQMA8sY6bwVl7AXO
 TNrXyAF6Jx68rIoEcCio6mmfkAjFOkMvTkj7jpcHI1YncXvM1bZwbSVNuGBvAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=OiFuyB9D
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/libyuv: bump version
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

On Tue,  2 Dec 2025 21:39:18 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> This bump includes a patch which adds cmake4 compatibility.
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: sent for -next

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
