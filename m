Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E02EEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CFB41262;
	Thu, 12 Feb 2026 19:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjmoe3iyTdnQ; Thu, 12 Feb 2026 19:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06B0C4116D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770926098;
	bh=TGRNMyJXjhgiLEGzAVnPQUdfIeroc1d2pTGD3iIsHY4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jJEe/PpHaUMkibAQDBMIpaYdibORk3VdvdTV0msp+cJSWGKG8De6eCsRSA8/+XNU+
	 3tQ0Coes92jOOIP8ft+VJKlRFcsFZsOGS9LjVNzZaCnsMvtpOd6yUpkD+wd208vKdk
	 YCmDykqSkErWrfKEGDXxxr16CaCFrNt5KYfLytfg5cNWrTGcJXjfPmLw9iBoa6aWAl
	 waILuElEDbdfcmZUuZonEHLX4cHUu5GYoIjasE1oANjRb8FrET4TChR4KuXgvLy826
	 AegbVjyApK9fl1ZYxjS1QsV+SpnQLH4BOnvmbUyD9gLI1nxxKDd9cK3oyrSSdbFvNO
	 ReQGLycSr6oGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B0C4116D;
	Thu, 12 Feb 2026 19:54:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF921D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D2B60B2E
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0jniPoNqvpH for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AB2560606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB2560606
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AB2560606
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:54:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 30AEE19F5A7;
 Thu, 12 Feb 2026 20:54:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 20:54:51 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 20:54:51 +0100
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <b4ed96753ffed1bd3aa7cd3149c94f448bfbc582.1770619392.git.yann.morin@orange.com>
References: <b4ed96753ffed1bd3aa7cd3149c94f448bfbc582.1770619392.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <d70284f4cbc1e251e5f414457948280b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770926092;
 bh=Pb4u3PECHsaUfnH5L8rEKIbPrBGzpaeFxnnExHqGMLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dt+RogTPV7V9bp69pHt25AMOeCk0CtuL1p0/0effoWq0WZUZyFOUYn0y8FuRJUVm+
 3A/DuiaYmeLxWsQALyQesMi+XCtdKRxcOUyraccmkbHwRfTR1CcExbvjnsf2yN4rpc
 efBbG7dW/T7ZA6UKYYASpJEvZ/LEGOY71zyjUTsbTWIuV1eBGESq8+IZA150wEHpTW
 guuNUWFyWREmF/Rj1YEGLif0DY6QGOj1UQlnXHbHQIg1JzfRLcmB86zaQaqUamAjgg
 PmAqScVZJ1r1J6m2Aqedj6WmBTVEqIo+Mekf3htZjlfvduQ7gSEj87fCaWcLaIi2Ni
 DI4auHgu/iNhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dt+RogTP
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump to 1.21.0
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

On 09/02/2026 07:43, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
