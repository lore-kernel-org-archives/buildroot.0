Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B11CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A0C60DF5;
	Sat,  3 Oct 2026 11:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KETH3uQzBDg; Sat,  3 Oct 2026 11:05:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CF36060EA0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791025525;
	b=U0FDEGuS7j76ypvx0p1sHmLnxqQglHnsFXiF2qLu2up1z8kO1hR3ufrR0SXD1DaVZol9
	 OjiJyNktbZhIz8iB3dr/XFOTnqiqBnZ//YU0tZAAxyZL+HndsHMpbbbnnAZkfHZK278UR
	 4DBOKzbS8Xfh4ZeX/yZ7sPY/NMMRo4Bx7GTW1fA3appWT1L/5/WYCzrf1vlHbEXxY4Zn/
	 5bmaKeLD62lnP7igx8+KpsRsv2+tcn9sDTz9Zju4h9vHSDifUhlUPYPm7IJ5QB90DQQuB
	 QtP5yAmjIdOhwPwPJVelzFUYWlNEljYtTO2Ucmw33HMT7NjZRgHSLXsl05RKRQgRIig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791025525;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4ZycSdMRN9pmwSRImrB//swV3Aci9ftT5ne+sbiXrVg=;
	b=f6JrKjCDWvrf+MiyTVFg/th59ME7+zaa4/J3FkTNXd8UDe8aYA/5AKlkX2W54VC8jGGl
	 6H+ubQUgIq2LzL/vxeUZXD+TzGLRoDbTf5MClU3VrQOWAANbt0W6L2LzHwQZKl7u+Ml0j
	 WoGrGqaJ/3hwRMpd/zEmy3pmVAnRC1CH5b9MzLg/wSoK4sU0iLxvQSX0dYi84syPkdfFz
	 3uocUYfbX6kS7TdJ+EUOY9dME3o82rIej2c+21Imrw/87I7+aKF9wDxizCQEO8Om0ClgZ
	 3l9TZNbJBwIPvYFdBxjEYI/9SsUzXAHQLk2c8y18F75mE5TqZcicbmUvoQuj8psL5Yw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791025525;
	bh=4ZycSdMRN9pmwSRImrB//swV3Aci9ftT5ne+sbiXrVg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=o+a9NsPHzX+mkeSEod8U9t5wfr58WL2rb6zigZmtC4uC+I5CIvq9F7YHTn0lc+ZLy
	 +c0yGqRRtXAnIM9NLnkJtCHMzTAhZAu+C3jciWCxyr4QmDK6Axq7x+8l6+TCjXP5Ca
	 u0V0FuaPp3ovvHJnxIiflsVKts9YaPvHmEDsi1M3IOH9rlz/6ysm8R17d3E4vWEzI6
	 iICBMHJwZAGuGgIg5blp5pQ3XdR/qgR101d4vtR2TgIorzn6SP3tlUI7KjbK0pAVd2
	 /JRmm4a1h6N548h8A4htpBuDt2XUnwaT17Cnd7cmt6GQ5X+ElFkdjZK9GsAULZkheb
	 TElyraCuDqtRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF36060EA0;
	Sat,  3 Oct 2026 11:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6766263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BFBF412EB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EUjAkt8Q5ss for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1C5F3412E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791025522;
 b=JaB0HnJ3r+MUNE2OaYzANp/ZxFLoJeW0SK0iu+45pSc7H1FMn4dXDj5hWD1mrYNlqa56
 D5oeLQ+EjoIXI7fTugbIDhK/irPKmNGk5CCa9P6+QxBKQ46wj2MHg+cw1mFarh3FCRC9a
 xnRpy3ZtdPez+OxFWXqjP+O/5fFzbGfCde/mBut8eGIvSH7QxyD26XpVNO0tDPVhoPjd+
 7zQ6r0mFzVHZUsVzFrygtT2KnbIYI1zOyDsczYnZ9gXOa3oq3BhSeaJRcr0drDiKBwpsO
 aI8Hy/tgitt/jky/r5m905fJvhqSDHeLYKIDVkJ6s2iFMbHb3KcDO/PJNwEHV283EEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791025522;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Qfm9A622sh7fRS81QiSPJ04atr15YFvUjIi4+Yt8m1U=;
 b=XXXEsiSocAjIbLzdWUuNJvL8GC3HumI2MMBv9c667BRg5SgzyJGedhdFmgYyTZ8r8Qvr
 qDILDXy81S9zdNdmxx/2lXWP+Di8JVeV8EceFe9prj0rbcly3PWC9+TzvxC85iDxVfFTt
 73lLx+KLsFscd+ag6ihrmHVzQ29FUMmXv6rRL8R0agijP6bDvHT9FDpUP9+RmTMffM0NH
 2c2DnsMsK9Zat0l5io9IFwtiOoCE9ad07X23A61M9A2vppMMHSAWw8KFfSunSx5XFuQIe
 l/w0CPMJdn4JQYVwC39d0M3Z8BtCT3tj4/0O0JFQ1q0cF0WGXFPWNn7wNnr8y+/WZNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=F4pJCCXX; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C5F3412E8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:05:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1wgwBX0GcO-00eTfp; Sat, 03
 Oct 2026 13:05:19 +0200
Message-ID: <939f32a9-f5f8-488c-957f-6e7c461319dd@gmx.de>
Date: Sat, 3 Oct 2026 13:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261003013304.400979-10-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261003013304.400979-10-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:elPhs+2iPTNYTAgU+Hk0w+yDFVtQORvDLfp4fk8zkZ2F3tUrmnz
 aLaMtxbfPv+NIY7R3VnJqZ1BdIwJxdJkVENf6lhzsIaYldldoECk0P2EFN3CVKFTpeymHyC
 JiKwROmg+KuZBImpE/rERYQdXljS+qu5p7gpHYiLgNhhnA651qtKJkLdPZpQTp3J9kxy1Kf
 ESFiZTNRuxA55LcKyLL6Q==
UI-OutboundReport: notjunk:1;M01:P0:suQnkSVmtFU=;i/uo/qW+qKMdu3gfZn5yknSVNyI
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.58.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 03.10.26 um 03:32 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you.

> ---
>   package/python-gobject/python-gobject.hash | 4 ++--
>   package/python-gobject/python-gobject.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
> index 6b26e289e7..755b51bb32 100644
> --- a/package/python-gobject/python-gobject.hash
> +++ b/package/python-gobject/python-gobject.hash
> @@ -1,3 +1,3 @@
> -# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
> -sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
> +# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.0.sha256sum
> +sha256  45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca  pygobject-3.58.0.tar.gz
>   sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
> diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
> index 310cde24a7..f15129a076 100644
> --- a/package/python-gobject/python-gobject.mk
> +++ b/package/python-gobject/python-gobject.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_GOBJECT_VERSION_MAJOR = 3.56
> -PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
> +PYTHON_GOBJECT_VERSION_MAJOR = 3.58
> +PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
>   PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
>   PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
>   PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
