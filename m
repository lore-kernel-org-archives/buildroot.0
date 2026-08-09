Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD459C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 09:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917CA60693;
	Sun,  9 Aug 2026 09:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79QwXIZlS_fP; Sun,  9 Aug 2026 09:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AD460687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786266993;
	bh=7+CQ64I2ExDqDegEDAIYUUbAb0sZKXSCWCdvZmRleqA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WF4jCq6UpHMDxdOuDL63osOXqhjoz67Yx9tAqTWTxzI31B7u4qDwbLSgW7j8Ho5JE
	 iNLQrdi6/bxm4REHuPpXjifvMddYlzyW19ByOUs9h4F89joAx6ld4hEt9PVeAE0Rtu
	 emwj+bmlooJnDIhIIdMZzwJfZQ8DW0AQbq1YV1kzH1uTXkm/Poi+GUUe1YQLHOLkH7
	 9+PTCV/Kg2LuCsF0ZwMSmooT8RTqmXGZHJqBBhu4Ws12B8tn1MOunPfc11qQIZkwq9
	 s2b+A0Wn3aogGLTiI22AcmTHU/CtKePHVNuM+BkSfUvA0PYsg7HfQP4gnrCw+koyni
	 rh1FI4YVLbSYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AD460687;
	Sun,  9 Aug 2026 09:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A502F5
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9071F400CC
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z27VinFFabDn for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 09:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80CF94005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80CF94005D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80CF94005D
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:16:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F1DC8B00548;
 Sun,  9 Aug 2026 11:16:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 11:16:27 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 11:16:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260715210358.1131846-1-bernd@kuhls.net>
References: <20260715210358.1131846-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <eb4aafef689b34454f58150292c5a053@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786266989;
 bh=/i2GWJSCGHu88+DYgT1p3vH+mCAn9nXioJZ4C1oZaD0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z3aNUi7kh9aJFZEp9wEnd5YQe+Sn9RJNjMtjsD/mPoHKeajH8D0qacWeWFUSKr30N
 evpn1v0Sra/Izcq6h4TKkioulXeVcyJaoPeXRr3tjLefmmfuJcK1F3L5ag3wUMMcun
 sWegQ7wzvqXft9MOBpmrXhxtQJyIL2QDq4lYZ/LBNrWBMEreA0jECONSOdAXtp+YTA
 Z1Dc4RcL7c2C/4dHpDCXUHJi8nvCVUkhHt0PxqfQdC37RyoNQnHs1jzMdeRopXeseh
 pGbAEmXlD+LwzslcQRWGv97kwM44KmjWTzJSCz1uueF6U3oGmc+wYlvlpLqf+zApzS
 IRhOZg+fmrIUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z3aNUi7k
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpl: update configure options
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

On 15/07/2026 23:03, Bernd Kuhls wrote:
> Upstream removed configure option INSTALL_EXAMPLE_CODE with commit
> https://github.com/intel/libvpl/commit/8434de3cbc2c06822e43d4b24cfd543a6bce1bfb
> which was first released with version 2.11.0.
> 
> Upstream re-added a similar configure option named INSTALL_EXAMPLE_CODE
> with commits
> https://github.com/intel/libvpl/commit/f8d989160e3817cd9c18716120dccc1c8c23e915
> https://github.com/intel/libvpl/commit/7c803c85383b011c1552d06585588ab7a8fcc4d3
> which were first released with version 2.15.0.
> 
> Buildroot bumped the package to 2.15.0 with
> 8e713dcc88e24c47593abb84c9aa15f09610ae11 and forgot to rename the
> configure option.
> 
> Remove libva/x11/wayland-related configure option due to upstream 
> commit
> https://github.com/intel/libvpl/commit/8434de3cbc2c06822e43d4b24cfd543a6bce1bfb
> which was first released with version 2.11.0. Remove the selection of
> optional packages for these dependencies as well.
> 
> Removed unneeded libatomic handling.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
