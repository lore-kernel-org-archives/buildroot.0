Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFAE7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6C583B49;
	Sat, 11 Jan 2025 15:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlgW6aR6HoPZ; Sat, 11 Jan 2025 15:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C28F83B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C28F83B60;
	Sat, 11 Jan 2025 15:12:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A671F940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87DD4610B6
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtKYGWvS7njt for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5FE66109F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5FE66109F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5FE66109F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:12:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9E98AB0051B;
 Sat, 11 Jan 2025 16:12:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51054])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 16:12:30 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 16:12:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109192638.2363626-1-james.hilliard1@gmail.com>
References: <20250109192638.2363626-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7d6f41e549e4af3e93eba4af6320452d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736608351;
 bh=bOGo85ZOrmnz/15gAs7+PIK5KVKY6Da0VrZOf37wPy8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sBJSxOMNOZnCc1FGSqNNtWyxkracXD2LCMVF/knYwUmRxqFnPlJKo2pV56Cbd1fx1
 bwKae/aCFwvOaezxNUknAUyN5cMamKN0aVnbYImYAhO8Lyo214o7/HAVBqHB20YRGh
 YNar/KDPPKP8OymJePo46Iya1ZaW3KVs7dKWTXvK3SVFabJmaH/KjTmtQTgTS8Ko5w
 bOHvjam5i9E8cDkF99rkfLXK+A3gAGTVFSsP8LSHcgILUtv3WstmAriYPAFsSNbFLo
 NVJZMjUrOPdHvaVPtKIkJte2nO0MXOwvaSbg/SvlIUMRuDegjucii8IWUCNlSOJm2z
 HDubMnf9bi5Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sBJSxOMN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 4.3.0
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

On 09/01/2025 20:26, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/scott-griffiths/bitstring/commit/fdc3fbe76862e581997403b9f59c1a2d2ba5d85b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
