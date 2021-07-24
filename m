Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AC2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 18:37:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B68D60C41
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 18:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B68D60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C46A606BD;
	Sat, 24 Jul 2021 18:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAHqjEceuQBr; Sat, 24 Jul 2021 18:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E006068C;
	Sat, 24 Jul 2021 18:37:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63F111BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 18:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 536B082612
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 18:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tr3iWvSR1z_V for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 18:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05BB28102D
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627151815;
 bh=5i7ORt7BHboIyT6efQUjoshXZ53JglRGxrknLMI6J1E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GumRcnB4ugEAG3GTVKOlrkuJY5TLZSNGEgifbeLZAjkyKgv/Ob83lLPydurUd+aGY
 +7i8Zr82C4UXMQ9LHvJ8J/m8Y7eI1iCb1pTFAZNrfeSlieK2hAm2lvrb4WXfY7uIxR
 2e+7tYJ2maP3AHryXgG8jwta7ThOYpDsW49LLraQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.240]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1lTKfh0j3e-00fP9Y; Sat, 24
 Jul 2021 20:36:55 +0200
Date: Sat, 24 Jul 2021 20:36:54 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210724203654.70883885@gmx.net>
In-Reply-To: <20210724173422.636905-1-fontaine.fabrice@gmail.com>
References: <20210724173422.636905-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:93iWrV0lqkQf/Mojldddv7FA/zFiNDbmT/b7OYvaa6PBSBCL9Td
 pzuNeGAvEsbU++MFABQAeqvM+Bt3oyvWFiNpUpmrU4vWs53EqHeFR0VhrBcecwm07Hp1HBJ
 1nNDjmGTl3yVB+OWAhlajfFLNvR12JbTIdX9wbxedMJ9DdfDXllFc76zjZunF9R7Y7eQIbP
 6FCH5zDopY7lFGrZI8egw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:krLtqhYzTWA=:Lh5eCR/bd0PL93aKyoDM+S
 Vsj0iBSv5b2vbyJDNrzlXa3r8okflBP2y+vCtWcKFr2V/roaAaTpRq07vQxMaDRaa8VX3J8yD
 +CV8hIWBRlyrEWY1JtjCfvTaGktAU/ukxZ4qA87/fxKPxMQdTYtDw7xvCMirh4H6yqA21GpUf
 /RRFXNirDNcc7dh/E4kp963sAjGMSXsBBd4HKh6Ogar6sae0cZWyI2glLwCvwLfgdN66WjjiH
 JeGqSwpFpDwSXBmOiD3UJPJ+4bpCsMoDBtxOJi0GUIvhZMC3EiRU978KFNEgr1yEg4btzhaPA
 L9vPqvqDvbEshBBssY2sh52bWReSRmj3RLdakAl+zOCVg8VAZVbGIEvNZd3zAFXBO/s5kHIe6
 kLWEn+wwcGPK+fC/rJt7pE2Thlu2u86j617nY5unZdtEPYy5VZLpGXLgKHmJyvxBZpw4tLKAI
 i4UIERdi3X4oEivbqiwl0BjkyBNTYRzO4kMCOHcfbj9BAhLH9yvgBZrfyZcM+g8ou61Lbq1On
 5mCJWUM/aE3/EDxlUUhm7dRTHSI6wgU/AfZWPpBwmxp9pR1cXBiOm1nlzUxF6ILS6tGHKvAfs
 TqOJJWKui2kdFvXOZ4c7cJAWZRQJ+bPIkm0gXEbGsFgG+btYaRrzs7M8FS4tsir505HL8K83q
 s5crKWSq+IE1RII+6NO6rkP6vnmxqdScfXhXxrJvEJsVhbnZEDP4OIiX3cSi8/zIpWJHeaTko
 g8vQII7oSr96SKe1APONBkkq24n9GhxZ8ZQBgGgwWxLmzwy08bNqy3O+Lf1ldl5t00vWly+ne
 70G63ZuzOLiY+qXLxFTTEm4ZtYH7Grt39fKzn1bt214rLUWSEfJpOWS9pYWRD8Qg47YeqiNH6
 tPYpIG2FkMd/9VrOUvKPI6vZ35xpEWMgJrDFCRCWmH5tizkwG6AviCDZfgdNqdPt0ARsDnKK3
 CIhN+SDUrrV4aDwWQm7wKT/36p8W5Zz6NRuCp73ML3VPEBFR2gR8VxUkxsq6FbHI17kvJZH1f
 mSjfK/HaLcWqnLq0H2kf0vBMXNZ20se2FZHokUf8uFLK1PqguLpM6a1HMJYlRyoOoCscxDaUM
 UlOtzWs9JTqXABgCP3LjAQJXPzEdZgRNv4/
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: fix legal info
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Fabrice,

On Sat, 24 Jul 2021 19:34:22 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit a87d99af2f88eb2755959163727584f673483748 forgot to update hash
> of COPYING which was updated to replace master by main reference with
> https://gitlab.freedesktop.org/libinput/libinput/-/commit/354df8bce9874e92de2ad8535fdcedaec0755b27
>
> Fixes:
>  - http://autobuild.buildroot.org/results/b82d53ac70737488dd780a7112fc7ea0153768ba
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libinput/libinput.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index de8e94f9fa..7958cbac88 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -3,4 +3,4 @@ sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinp
>  sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
>
>  # License files
> -sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
> +sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING

Thanks for fixing...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
