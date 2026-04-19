Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD83EA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1483561002;
	Sun, 19 Apr 2026 19:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnDOEGvi1HzT; Sun, 19 Apr 2026 19:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A504C60FF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627256;
	bh=kG6aPWzav/g6hVdgeoHwoY57Pqdx8NZVMbNH6i+EHQo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jA1ncsE8R7bpNYQAcwDXyjZi21AW2zYQAZyOTysahg/e+bxY+xiFK3RKUY3urFOK1
	 l6+hFi3WFDvRKK/NqudUi0tYhug373pIrD2WRug/0ghzADDtHhbwIX2BpeW/BCvLnW
	 7niW5/ST00aKDQ7qa/qTXoMoqww5ezzJ0pSiae10GuzAF+5ktA2v/KBZBSGbUclNIz
	 PfeMFtnep34lAFHC+3HyMFjhxaeUsDhMlSZ1cYT8fp+j6CRPo+S6DlYr6DMAhrhF6r
	 yhXhYft5oVg17fUoDrRGJa9CiC4mVF3yJHhZc3W3v8JAcdTTlSGttQnrWkPQ5E7PPl
	 xteGr2lWlCGMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A504C60FF5;
	Sun, 19 Apr 2026 19:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AFD1259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CAE4407B5
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV49V1rye4wc for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97AAF407B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97AAF407B1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97AAF407B1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:34:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 72BDC13F8B3;
 Sun, 19 Apr 2026 21:34:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:34:11 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:34:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260419160729.3281153-1-bernd@kuhls.net>
References: <20260419160729.3281153-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <3d1dd1d970e19830b4f939f113f79f77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776627252;
 bh=SeoNavgUg0HT9A0NykMZPRt4vma2A7R9DhKpPWcaPew=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ihz+NWaczTS34gOeSM4aQJFMW56KuCeuD8qWsi+tS+XLTIjSL3VqCVBpU59tYxHTz
 ic6pJqz51vvQv1eMhI9RBkLygnvLq54YhlA6O3EFssjkrxfUruiJ5x+eceNkpuwt1j
 Mx46Kjk2uLUnh9dHiBYnoeLwgWac3K3w+yv6DNRuZglY04xkjjTa8n5h4mWy8KM9QM
 Hcu8ZukrOgh/SHjvdF8NyFSU2uCtS5Jg6tfgD7J8Z4gPNqwl5xaO5aAJQFHmnoWwDq
 H2vqQ+D8MxV/O5RVZ9/9BGrbRRnUjp8wZtb+PejUqqWNGD5dKM8TLC1JwlXyLHxTSv
 dzQpxsdrEdcqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ihz+NWac
Subject: Re: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump version to
 1.31.0
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

On 19/04/2026 18:07, Bernd Kuhls wrote:
> https://github.com/OpenSC/pkcs11-helper/blob/pkcs11-helper-1.31.0/ChangeLog
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Updated license hash due to upstream commit:
> https://github.com/OpenSC/pkcs11-helper/commit/909ab8babcab354ee3d3ceff2c900b21722b9066
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
