Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E613C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB9AE60BB5;
	Thu, 24 Sep 2026 18:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtgIe2BMNFOP; Thu, 24 Sep 2026 18:29:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A846460BBA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790274577;
	b=rcSAungH01YjFVn0AnC1S7oavsRxNXvZrxH3UpZyr6+DGXRxYZ53msoozidVfkwNiX7x
	 hQE/23zwwMFCtl5kcus8B9PkM+hgGwUnPuG/Vqz/H8jOwWfuDdoqxD7mnlkuM36Kd6XsF
	 y8/PbkqD4H/4bSJHs4w3WAqrIlXt9tdEPkRzjUIjFXl1xRimxzfFEYhxJpHKl42ijpM4O
	 iH1HtRmatSe3bonUEgFY1jYOCTVRss5gc4y4cWQ8Lz3z274tqzSh/c+QVtl67DhkOn9Qu
	 mMqOUI7DdhRyVeH4bHH1H+Jx7x3CQk048v+3tiHhclpq05VqGOk3cwQgldzEj2IduiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790274577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=cdINduisRIl5Is1OUXYrFjzwvV7WqrXQVDPIeX82Hp0=;
	b=Z/eLplchhBcuK9TS9Gx4vkpVryjHyOYagolc8Rtb6gB7sEkV7t6cgNBUJKTWfOSzZE85
	 QZnVR6mmh9Mp+Fjpd6wfaEK9AoV9smfOcr/yKJ7WMUWS01pwpMh8QaC9A42c8zP6G4KRg
	 hBbs0U68cjMsrNuCjp70C1OWRWAhbD/T4lkv4QxcB8O/H0vyKQbVS4hGxRspRg9YpcTX6
	 XPV0vMETOqN/ACaJRHHG8u/91pufBYgBc9SoxnR86OjshZNLMNrJPudOdNH8zt18FV3W0
	 02eOqMhcjAV3AknTCBb5DbzFZCkiT697z71+AR7WnnEXV972bNWlQ4O2L1iYnycVseA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790274577;
	bh=cdINduisRIl5Is1OUXYrFjzwvV7WqrXQVDPIeX82Hp0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RsD60rUwdR386SLe3XRh4x85mJjT5oaQ9A/EZM30ClcCTxYaKIcLaVyVb8McTfaTC
	 UrrQJBuhrfqTU5F3TC27MOaVm48dHGfhHUqCpdqqGF3vr2lWl6vJGQPxTTOnukPpj9
	 dY60xMQaNAQrMx1JdLz6TuCsxvdiQqzKLqEC8z5wum04cB/DUNYEVxckWVi4jTb8FQ
	 6CuGSFdM6uX5ZsR7IAsNBP0E/BWT+p3nM6saNcEowSVlAFN0o1W2FedQ8KnK6pVV0K
	 nyBr8RzTewDqw6cpFLGeFD7j9bpNbAIBFD9+PPMw5Jc28a2M7h1UYwiBg6BxCVsSDU
	 TFw/Y4PJB6amg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A846460BBA;
	Thu, 24 Sep 2026 18:29:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 940D8329
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79B4F60BBA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApNtLrORlO_j for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:29:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C1D5660BB5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790274575;
 b=KaeIinfqo6gvs7JQAAU6OiaAZO0WgH48MEGO4HOc+wH1G9mhAcdqFtJDED1zwoI/RNUe
 72/bBnbQM9wrXKzfPcJFkdGGD3yP7QqUz/prdvGynTdYiChX440Uf41eMXf1eu8hkCtgN
 42zN3D/lsQglJwbbwCTixXoJJzZFypJsUsWwOWL9OpfmMTF4s6NIt5IxRhh5n8dNp5xo9
 Pg442ugp3MdDc+ZnMICe8xeLzNS4ATO1tFgQsuhyuln1VUcCMc1+Z7Se9YLSX9KAMOpoP
 II30xZFCmq7jk1bPu8fCjfJt+1Yyca991Ibi+7tHQRj2FOT2NwKqMwVyMBHWdF9d9IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790274575;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IAmsi/zTvzBn3zwfmmZXLW5r0fpJ2w3OXuG8pK5gFmM=;
 b=HBPfBg5x+JAeh2vbDltIiV+NTISFLFKcEz5i1Ngs7ONHoay/vbExWXXsRuOevi+26flX
 SQ4S1HJc4fTBo7EB4TgSlagmXh3xYz7jQsOKQahfl4LaViHO48YYyC8/zp0ZWuKNSdYn6
 hkZCXlOvf7qXvnoVhI2jySbnu8JVNfk9NfucTQfiXPq6NODu+1prnnfKflxfECwH0H7Op
 dZTWeKJsMr6HLR74B/NH7QCf5qoLVkkjv7g2YPWF8G7/XpkE675O6KBj1OYh/cqaGz23+
 0CtBtcvNrjhxKhv5Nsvh0yoDaGnAPzumb0MHqaikXUh4tHozDCZr1/pAIRi792gWeRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PiT20NHu; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1D5660BB5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:29:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 400D219F5BE;
 Thu, 24 Sep 2026 20:29:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Sep 2026 20:29:29 +0200
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 20:29:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
In-Reply-To: <20260922210450.2669612-1-bernd@kuhls.net>
References: <20260922210450.2669612-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <622a0057add60f1a7ad081e3460361c0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/flutter-engine: fix build with
 pango >= 1.58.0
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

On 22/09/2026 23:04, Bernd Kuhls wrote:
> Buildroot commit c3aa6774563d20901fd1370f51ef105180665b54 bumped pango
> to 1.58.0 causing a build error with flutter-engine
> 
> ../../flutter/shell/platform/linux/fl_accessible_text_field.cc:9:1:
>  error: redefinition of 'glib_autoptr_clear_PangoContext'
>     9 | G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
> 
> ../../flutter/shell/platform/linux/fl_accessible_text_field.cc:60:3:
>  error: 'cleanup' argument is not a function
>    60 |   g_autoptr(PangoContext) context = get_pango_context(self);
> 
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_FLUTTER_ENGINE=y
> BR2_PACKAGE_LIBGTK3=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
