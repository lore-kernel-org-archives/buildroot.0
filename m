Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4033CD5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325F981AAC;
	Sat, 13 Dec 2025 21:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfsthC4NDyTh; Sat, 13 Dec 2025 21:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35A4814DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765660126;
	bh=SMbXH8t1PCQmsvrPKoJ58dMiRmSK7OkY1qDTjDT2XtY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hKohWgiGoaWs6+98KxJd3ESOY6OjSGLi5opG9KnNBL1FCQYt9Z0BB7Dm+HJ9WsxpH
	 8X8LlTdBbS38kxjR6ItSPcYKb46OVMf85eb9JCYU/FUtvq9HsTfdaGIWUjUBfDd6Th
	 J30PdIfF47PhM68wiP0UMc0f2RTm2B0Nn5ZnFs7hwyVAUO0Qo+zqggC+B0aW6ULl2j
	 WMdMfsiUiGIiDhL65+JAfHr9ZOXar8XPtigo0YRX8iyOzKmF5abDCtz8ykvPPnG5tc
	 DaqnlSUXeEHiSB5BBLavATI5k9TAHEJiW7pPoHAvaxms4fFy5lr9ihD+sDmoVFqWth
	 sn7Yt8cPskcNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35A4814DE;
	Sat, 13 Dec 2025 21:08:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41B7C117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FAC1814DE
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AueaInNeGZn for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7047B814DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7047B814DB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7047B814DB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:08:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DBFBF2003C3;
 Sat, 13 Dec 2025 22:08:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 22:08:40 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 22:08:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213115827.1277293-1-bernd@kuhls.net>
References: <20251213115827.1277293-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5704a7809963d7c20f8f21616faa9ae4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765660122;
 bh=Ugk7b+dpkgXIwkuGaQvggJyfIO/G0ly+/nSXszY8Cgo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QTPcMWsCZ+/oEUc7Vaaxf0PAWSaiom4M7KIhG0Vvte6Pfytg+m8bNz8mf2Z/nerP+
 RgB7GYAFx7SL3uEGoFLs8kHaq67ACRaiu3F4su70zPXR8Ivx8euyYDEJOFRzW3EDnb
 LSPvJzhN/N9VSPskYUoPAntm6tiaQqEIsIC330/eCL8F6vXb3bUQCPWFdlT6W6zolc
 MsVCwAoR6x+dBO1KcjG9EvifpL7LhH4I31gk4Op/EKEfNrt6ZADGwrQ0wLKlwJ20Ip
 OxItSp7RJz7dXaYAS8x0Vsoq3aZ4UWcDzCsby6RhM8JSkUSbmZWpXgDCd33/SjoOk2
 gUPmthkCxzgOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QTPcMWsC
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.2
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

On 13/12/2025 12:58, Bernd Kuhls wrote:
> https://sourceforge.net/p/fetchmail/mailman/message/59270832/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
