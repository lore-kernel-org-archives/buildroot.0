Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D912AD39011
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9861183D6E;
	Wed, 14 Jan 2026 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOavOdHzJdiX; Wed, 14 Jan 2026 20:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87A980EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768422071;
	bh=mtF1XhYk9qO0OxIZ94RU1ZFrqHOuXm+Cirh2KVA94gs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AeoNpc4HD8ZJ3kxSdTs4jNx/YVu/Ske5AnQhmUfiLO1UbVT6OgG7bCZg5Tqh9A7AO
	 vMWkVPapDlqDrhpG3RoypbejCFT44jfUbUuaDsuAIqpVlka+LVO9IobvG59PQXXCu0
	 k0DJJayqhnCnfar7t2df2PDxKOZEEdT2ebPVSF9HkihDzqGl/Qs7OCo4ihoKuKOdGH
	 p5oQulQzVTZbqhxXdxL+VH6s9SVs0Geaq7dpsuIMczFskoOq/0MMQJQKmd1dkyj8iV
	 nZFXUlB8RRg0f1Tm+hswKBtSNx8Hgo2zRxWIC2aSZm3ZZer6tYNxc07VD/oEd8+dbr
	 Fto55f4ypBasQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87A980EB5;
	Wed, 14 Jan 2026 20:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 286AC232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1980A402DA
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tkqtw7WdR72g for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:21:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4C534028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C534028C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4C534028C
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:21:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1A18F19F5A7;
 Wed, 14 Jan 2026 21:21:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 21:21:05 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:21:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260112210944.3767562-1-bernd@kuhls.net>
References: <20260112210944.3767562-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <e658cca8dd438f30627df3e996555563@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768422066;
 bh=rAGp42VSZvI5zIjmKMSsqCwFnMkrx6Pi3O0vGcr2FhE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rM6wQRvEIg+iNX9Eyv0CCS2Lu14htNfMD7OhccuVv7K+GSFY9DxCqnQQRF9zNu9dH
 6Q1pN7lm4LRz7eI09HYpm8YqsgPQhh5rTj535nna1YZFPH3l/U3mFc5MGjl7szteEY
 o6rki6mVlkzcsTA+4JNE8GRg8Drtj84eVN4UvSuI/UlOeWGpE1VEei5JDeY/KwLZBW
 7+Rm35cv5QxUX3RJquPlGzjIDrxmGPUXsEIBqGo0MZWmYaJgFHUZexmpBFWi+vMoDo
 ol0L15uGi4dNJV5g2oDhL8gqLSijPFSZVGz62ZT30mrqXCcPDpRHDr12SzZK+acIzt
 PuPz2K7o2Vr+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rM6wQRvE
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: bump version to 4.1.0
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

On 12/01/2026 22:09, Bernd Kuhls wrote:
> https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=4a45820271febac332f183dd763749393dc97adf;hb=ad5cec777f1180c28f6fa229f4b587a2f245adf1
> "- Removed support for pcre1."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
