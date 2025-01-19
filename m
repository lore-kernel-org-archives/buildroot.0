Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B7C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 14:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE45960EA2;
	Sun, 19 Jan 2025 14:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bO8IvRPE7GdH; Sun, 19 Jan 2025 14:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D3C60EA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D3C60EA0;
	Sun, 19 Jan 2025 14:26:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6D869
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B969D41456
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEIqNUVIzfsI for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 14:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D6A2413EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D6A2413EB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D6A2413EB
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:26:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 691062003DE;
 Sun, 19 Jan 2025 15:26:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41426])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 15:26:29 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 15:26:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119133938.868173-1-thomas@devoogdt.com>
References: <20250119133938.868173-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ad15d632894664e31090dd6a8a4e8b2e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737296790;
 bh=8GbXTCYElrbQGpJqbEZUURlbVeSdbumObC5em3PoSgg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V1Gnj+hVLTUy6gi5+TljW/BGdmLx5jWlpHIulkU3CY2EpMQa+vkDFxmfAEUldmvAl
 v7dsQxb5qnJkiIg10myg4L7NCws8DujXTUfRB7tr8rUQUirDHi2dXPJbGg2RPhlImt
 XAuy7GW6EtuzUWzBlI2kgX5GHPkFh3Pzmi5IBljTyl20xjN0C/rDAB8iq4o4nONe5b
 0nipfixLwmFVdgeBU8xQglmBrL9L9/e0bzhjll4UhIeLuitB0jgYD+tA30AH/96tcB
 VpRSud65lQLNcdX/IVhrjPX3B5Zi9RCFNeA+hqkB6as/AeU6zjyuUMYoNlqSoNC4e7
 7jZykjVXZOLIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V1Gnj+hV
Subject: Re: [Buildroot] [PATCH] package/lighttpd: fix missing conf install
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/01/2025 14:39, Thomas Devoogdt wrote:
> Commit 2c94ed37fb4d20d3a8e485e972ccdc2aef43e59a bumped lighttpd,
> but forgot to include the lighttpd.annotated.conf file to the install 
> list.
> 
> See the news: https://www.lighttpd.net/2025/1/10/1.4.77/
> "doc/config/lighttpd.conf has been renamed to
>  doc/config/lighttpd.annotated.conf, and doc/config/lighttpd.conf
>  is now a simpler header which includes lighttpd.annotated.conf."
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
