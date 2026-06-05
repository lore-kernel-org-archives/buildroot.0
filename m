Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F88CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 21:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C36C880AC8;
	Fri,  5 Jun 2026 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-8dTyKWi22u; Fri,  5 Jun 2026 21:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A33B180A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780694182;
	bh=F83ND9slMLi+vO0jrG61+LXjSAw1+GT845BwWVZN44w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wz8jogwNQ768Bj0weWwDJYbnk87TpX6r8E0cWfMLtQhm0aI+WNSONlgJc1IHk0Mft
	 2q09STYPUnAXXs9wkctLjVS8DxIXT195zs6sYUq/44hSygGSrNvcudyz84kfVbhgE9
	 XVzzUJuYl0uHCAmk+DEo+6QmSErWNzIv2dikA9lTdt8WX+XT3AJXE+z20nG2yQTTm+
	 b8jomspVWXzHHT/A1KUIO6suSHyfM6e7GOYNZ4n23jt09rVyHOgQOzxJtZ0GTfKI2l
	 68algyyOEM2z3rNkzL94By1/OBT2WyjbLEjoqFxDAskrBr44E/2IjQ/9a8w/Vw07l8
	 XSlObKF5r14IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A33B180A96;
	Fri,  5 Jun 2026 21:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65431DE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF6060E3A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYHvxGS7YhK9 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 21:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BA6460E25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA6460E25
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BA6460E25
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:16:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0627B20039E;
 Fri,  5 Jun 2026 23:16:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Jun 2026 23:16:14 +0200
MIME-Version: 1.0
Date: Fri, 05 Jun 2026 23:16:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260604191642.2162777-1-bernd@kuhls.net>
References: <20260604191642.2162777-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <acd46546a70b6a7cdce5ab9cc7a1fb98@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780694176;
 bh=JuSxdg+W8s5sU5DjJ7rzQmZbZaLAVTWlcEbd6qWRUDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pI9mFstvFmLNTqrm0hFvHN3ZjMZR3cZrOpwjl0wpYrgVLf038SgVXNTYmCVO/z5+f
 3x3Qd5e3YkwpE5w/APFbksFGBcliyrudtlwckEe6GQhzb0ePIvGwmrqfGi1/v0PuTY
 xmm1DV4Ro2ly/j2+7XPr+Qt55oKsD7Hbe9IWu1ErHq6mgpAIHb2Lyf46suopMnkyo4
 Lu01hfTAip8ry8NjUgCOUkTwizcIzBjhRcm4Rm4sh/+PVmzGa+sHdmbKgqOsphR0D7
 p1jPKKFZDaKnYZVZwn033D2GOr/fDFbOw4KrlKo86yvWlRR2pvdOyNdm1kayHdqqtm
 mN5UXUKbIN1Ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pI9mFstv
Subject: Re: [Buildroot] [PATCH 1/2] package/libinput: bump version to 1.31.2
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

On 04/06/2026 21:16, Bernd Kuhls wrote:
> https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
