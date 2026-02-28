Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6AEFEE4ED
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 15:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9829E4090D;
	Sat, 28 Feb 2026 15:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfcUgKUxiEMs; Sat, 28 Feb 2026 15:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 773C140906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772293072;
	bh=WRVw+ykZh2fNxwVcd63ROIGeZbIyqMWx+zuAVvH+SrY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hiSkSeDQrA5SNi2DTzEvZp2NLzDIgHQmgfS+EwFalzEpZFXuwXMVCvEziRMM5iA+A
	 gUhngFIniZ7GadRahlt0WFyKiVCly9GV5RJ6y/9DO6ahZQnMpqnonSkyzQUPWmbHpy
	 V9bGmTs4PNGmEMQp2/Dpu+yeHy+OOjizJ3HFI0A5mH5hjg9NQlkuV8cV2h6GtwuJRW
	 5Lu+NFcDZTZ/rAXJMfxJBXlSe3vMsDfKVMTVeelAUBJSCcYFMzIdbDDvDmrTQgpGCS
	 5xLTYs7YG0V6ZLQ4b8knl6H8ijYri0GuzqkQ1yLARGY2XEKlYbstkds5AZEjWlLxE2
	 iu1ww0TZqIPwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 773C140906;
	Sat, 28 Feb 2026 15:37:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8A124E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8186F408D7
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiqzjVX8g9hW for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 15:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E0E6408BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E0E6408BE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E0E6408BE
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:37:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8D993780375;
 Sat, 28 Feb 2026 16:37:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 16:37:45 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 16:37:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?=
 <jezz@sysmic.org>
In-Reply-To: <20260226202236.2150026-1-bernd@kuhls.net>
References: <20260226202236.2150026-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <50ab062d0c9b56c91b5a51dc329ebe8a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772293067;
 bh=Uc2xCPWvzazETkgvW58KB42jPdCEBVmJRetGKQZv2wg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RUFovc7j2Unt1BatxiBdos1VsK9qmJ1qZPx1iPK9MeDI5m3cg50QfKzoi7NUYEBw/
 EpP+hfsvA/Pv4B/HwwkaitVZM9hCfHTFY3rXZSFn0p5QGaqpdlZKMuKG/8Jrku8fPq
 b3o3noSZLtojUlko1AHvloMbM2PRvWTqhDXonHSqYGSHv8mSJ1t6HtDr13nYCLGaH9
 2y99f/AzV3CO2LtGGl3C2rK86NE9VV0XzjfEJeAdA4cyZG1twOHWTx1s0sY8jsC3LD
 c8xzrp696JeVk2B04tRinZeoY2ZNne9q/rL5DKdC2sCgi0DMFo5DcMV7XGz/3O9b90
 vJI8g+Ne9Hxtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RUFovc7j
Subject: Re: [Buildroot] [PATCH/next 1/1] package/lxc: bump version to 6.0.5
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

On 26/02/2026 21:22, Bernd Kuhls wrote:
> https://discuss.linuxcontainers.org/t/lxc-6-0-lts-has-been-released/19567
> https://discuss.linuxcontainers.org/t/lxc-6-0-1-lts-has-been-released/20283
> https://discuss.linuxcontainers.org/t/lxc-6-0-2-lts-has-been-released/21632
> https://discuss.linuxcontainers.org/t/lxc-6-0-3-lts-has-been-released/22402
> https://discuss.linuxcontainers.org/t/lxc-6-0-4-lts-has-been-released/23390
> https://discuss.linuxcontainers.org/t/lxc-6-0-5-lts-has-been-released/24438
> 
> Removed patch which is included in this release.
> 
> Systemd support was replaced by dbus:
> https://github.com/lxc/lxc/commit/820d2a2b3a886ebfe46cd256ba8c320e50fcc5cd
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
