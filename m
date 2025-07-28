Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14C4C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8981040A8D;
	Mon, 28 Jul 2025 22:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mpPlQoF-qwZ; Mon, 28 Jul 2025 22:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14784103F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C14784103F;
	Mon, 28 Jul 2025 22:51:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AAF0D96
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 209494023D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9dh6bt7jN0G for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:51:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4627440209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4627440209
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4627440209
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:51:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 716A413F86E;
 Tue, 29 Jul 2025 00:51:31 +0200 (CEST)
Received: from [192.214.236.6:51408] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 00:51:31 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 00:51:31 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aIPkLxHygRDs7WVw@waldemar-brodkorb.de>
References: <aIPkLxHygRDs7WVw@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <51eec8ccaa4189757180c5be812f179f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753743092;
 bh=m1gr7c5qsQkSCyfHF4xq+MImGXDNcW5o27TmjjbZIzs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ELd7S4iTMAETMr0YJgSGnBHO06dPIjsSEZdAbCflpnGDqSabwaF7r0he1y7qfvG5z
 REot36AooVIwUaycceZpu97HScg9VIab7gw5BAU/4OLnC9IJULFFdS+LNr4MFJWBBn
 6PP38GEOwjFnkN7zaRbRx2q3kLyan8HcZhVuMDPniTGstBpcoI4YdUcIwJIZHBkvmu
 hghkLJL4/1vPhNLm9IYWwV+pWfEMLjSstZjYblX4N5BtUh8dBkSmTeghOspk57U1P+
 uS5FPXwPwDKR6/m4oCn9tfyCng70nd56PgN40J40J3vGs1ZO0l6dzlFfZSWontGcMV
 i2t4KPWdfgLhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ELd7S4iT
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.54
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

On 25/07/2025 22:08, Waldemar Brodkorb wrote:
> See here for release notes:
> https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/FCUVZRWXEWHOREQPCR5OZGGS3R5WVK2Z/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
