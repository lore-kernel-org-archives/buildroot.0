Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B1BC9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A698406DE;
	Mon, 28 Sep 2026 08:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezCR7ZvEJIdE; Mon, 28 Sep 2026 08:50:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5D6B140692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790585434;
	b=IaFqtBx/Y7eqZ6zyRmJuqhi3ZdPvj8cdXeKRYbcgRCYSmCg4UO38sJVj7MErkWbavXGH
	 /ih5DsFopTrw7MHt1khNpXDN5WgZ4QO0y63iSLMufbjIPwx7ZgQLpsIg9liuyhX0e4VHY
	 jORWaGSYwZf8Fg+t8HEU1sVwCq0R2qy2W88cMzZH64mAkXV9Ut5Ao5gI5gvuyy/iuvU+D
	 fYRRkMLMVZrKcdwUcbkurioGqszYD4hqUov9OEgLhVnTX6AGHz1lVeAIlQSMnuYNJrrUj
	 3rPyMh+qrFouFsk8bMYhJXNoxwFgvTlCd4c3/SZytoyN3vaVtCw8GflEVhXab475j9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790585434;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y+3D/jYDQhFvWcFEVq0Yhcn0sqzp9UjGIxdZMIlP0oQ=;
	b=mF6D6Qr/qjFi45TJlE3PnlLzYU7nMl7euE5xAdpFAT/BRby8yiCz8hbGo/131EgwKM0O
	 aiMXkNc7jmkyow2HhqfPF5clm6yXJRzzEa0WSO4K44/kAsXm9M1YZ0oprsZMkLJ0anCjI
	 HiH/ytxbWEk30z3ZRuGzksn7q4K0YojyTvG7oK+V61R/pJ0Abo2XAtEBAhyCLkt+3qjNP
	 99cYHGZMc4wvx8uxwNe9N+t+HZY76qSgR2EEAhCrZ6yRpWaWMiAUXiKg62r40UM3rCro0
	 p6AD/7CWarU+Cg1SNyK8mvhF5dfQ0UaBhWmNMbl2IO9DYEaj3j286WqDwX/ykac5fyQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790585434;
	bh=y+3D/jYDQhFvWcFEVq0Yhcn0sqzp9UjGIxdZMIlP0oQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SzpQF1EmI72NB/yP8N/yw7kf64qNTzY6BqAkhts0NPXwGI7O2VJTPKaTOEgoBX8n6
	 O3sQwE5V6jAc2gfCoBdIfAXxJDtug+wxc7v5CZ/afEYEuBsVeCYJTUOIqJx2jSdIol
	 tVwQemJ53z2WTEn5P/i9qFsXwL+Hugeaxjijd7szouMFbG22c7KUFdPZkjg+/t+Hfr
	 /zXuNKDEe6U+EmbYGvoklRHaqdDbmrwD3rVc5eZ9WECXxF77ujAW1Rfz6X4AtlCsIt
	 0S+C/40JOi8gtbawnFSQzptcJQLCWfvSo5bITm+rfrSAeDtQicCOhlVtqWqLg/hgQC
	 HtkAmnR2iW9cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D6B140692;
	Mon, 28 Sep 2026 08:50:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A923335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67FD260662
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUzu_AqlOqzH for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:50:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D9D5060601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790585432;
 b=hxP07f+QFXGsu043yUfuSGDQh7xS+Cuav1EFL/u09hCuPyOMBY4cxtWar62ORb9XZtzy
 JGz2wNprSPppJk8Rudb0Ecp2Ml4lxIfAnPODzK+5pm5sOaV/sKzq1kPwZCXyfpR2KPklq
 fRGH5iF30y7ian0IAD4bJg1DxYrsr/zyFxz9Qe4/bWRx0qHkMcuUwnqTPloB1oIWnlJ1Z
 gHgOlwRwGvjzde23G/JUvVKGSnUXArZr5RQMLx/KaIFXkNF0J0XWfeBNjfYWBovrFc5ea
 lr9rVKHFkClSUbTL1SBWnMjOzOXILG+n563zwjWq6zyNuVE8Ta2sRxzTe7eUZhcRSlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790585432;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=z4z56ndv9JLDbRsRTfxGbTOF5n0f4AyX0w8xN0xYGxA=;
 b=CUAfBwJL6/H1j3+DdqhtvugilPAVu28IzMoLC8pghVRKErRENZTpHxJfk7klKuttcIfd
 ULotdjh+pPgQQ1PkFJIMPhMigomkdGjrGDJD+yeyPCglyLST1yhUdWrWtcZXLLJ4KV+pJ
 poXXBRk9PA3+092qsmYnDPNDayn8svlhV6T4+6EwWduNM8d8D9qiodTSePR0ER51AnpJn
 OtrflG0pZgR8KSTJyyC6kMS7GzJWlhVquB9o6JgOgOvmovBNqCmLX/8CejNgNAdV9xXHP
 THJZWXpuCJ+8tFDn1Ad74EsXgGkh+1IeV8ffIGCdHtnxkI/9PKzdQYKIt03rHfdXX/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ENqIk4uJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9D5060601
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:50:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9652F1A0D72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:50:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A192601BD;
 Mon, 28 Sep 2026 08:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66BA2102F1EA8; 
 Mon, 28 Sep 2026 10:50:27 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:50:26 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org
Message-ID: <aropi3gsdof7NK3g@windsurf>
References: <20260927204842.1113860-1-j@j-ernberg.se>
 <20260927204842.1113860-2-j@j-ernberg.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927204842.1113860-2-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: glx
 depend on mesa3d{, -headers}
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

Hello John,

On Sun, Sep 27, 2026 at 10:48:41PM +0200, John Ernberg wrote:

> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index d1596a8a3f..7bf9b65f58 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -99,7 +99,10 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
> -XSERVER_XORG_SERVER_DEPENDENCIES += libgl
> +XSERVER_XORG_SERVER_DEPENDENCIES += \
> +	libgl \
> +	$(if $(BR2_PACKAGE_MESA3D),mesa3d) \
> +	$(if $(BR2_PACKAGE_MESA3D_HEADERS),mesa3d-headers)

Thanks a lot for the patch. However, this cannot be correct as mesa3d
is not the only OpenGL provider. BR2_PACKAGE_HAS_LIBGL only tells you
"some OpenGL provider is available" and that "libgl" depends on this
OpenGL provider. But there are plenty of OpenGL providers which are
not mesa3d.

What is the failure that you are seeing, with which configuration?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
