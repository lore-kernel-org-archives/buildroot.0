Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849F9E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BF804053D;
	Sun, 29 Dec 2024 12:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xv9A96n-7P6D; Sun, 29 Dec 2024 12:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 206964050B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206964050B;
	Sun, 29 Dec 2024 12:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6913CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8171940491
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tMAFQXDIO-w for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9015A4026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9015A4026A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9015A4026A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:45:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7CBFC2003F7;
 Sun, 29 Dec 2024 13:44:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46900])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 13:44:55 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 13:44:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org, mark@dibsco.co.uk, alistair@alistair23.me
In-Reply-To: <2763196.mvXUDI8C0e@kilian-laptop>
References: <4632342.LvFx2qVVIh@kilian-laptop>
 <ead4cfe5eaae652ae308c78b6b23e66b@free.fr>
 <1990935.PYKUYFuaPT@kilian-laptop> <2763196.mvXUDI8C0e@kilian-laptop>
User-Agent: Webmail Free/1.6.9
Message-ID: <d517a62b7f7c074f5d9beaa05a84c4d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735476298;
 bh=o84ET+rJ5Miyjk5l7qHLZSlaq6SXrECtq2JGoKVJlPU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D63p2MG0fqs6aFOJCAoKnLZsoC4158XoqKMqwKrIqKgObWHnFnHzysIJKrThetuBf
 pbAGwpUmH2tCqNXyK7Z/Lhk3yUQKpqqDmclvXP+OYfPvBtxOXyhjLayW539jtIqCo0
 y3QycNUR+r73tDivq59E3LhrQ43QpB5Uecx8p0WHlgPradkqdga2STDskRTtfEG1N/
 W28LR0UKDgrNXfpinlXI+EOfw95eIcnCmFgg+V+XjIxy4RueHO1ekesR45WhGxlCDA
 VPA73HmsjcUNPAMiCfTo+PgPWfxZVXOo7mv8/qQO9p2bOBYuVLFELgzO61jsz4F7Ls
 CMded5KnjHk5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D63p2MG0
Subject: Re: [Buildroot] [Help] How to bump a package, e.g., OpenSBI?
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

On 29/12/2024 12:40, Kilian Zinnecker wrote:
> Hello Julien,
> 
> [--SNIP--]
> 
>> Do you want to adjust the defconfigs or shall I give it a shot? If the
>> later, shall I add you also with a signed-off-by to the patch, as if I
>> assemlbe the patch, I heavily rely on the information you provided?
> 
> I prepared a patch to also update the qemu board defconfigs. Will send 
> it after
> the OpenSBI patch was accepted. Tell me, whether I should add your 
> signed-off-
> by as well.

You can send your patches, I just merged the opensbi-1.6 bump. There is 
no need
to add me in the "Signed-off-by". It will be added automatically by 
patchwork
if it's me merging the patch.

> Thanks and best regards,
> Kilian

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
