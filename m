Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DBECD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C8840742;
	Tue, 19 May 2026 19:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LD29Z7q8m9Pj; Tue, 19 May 2026 19:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B493B4064E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779218039;
	bh=mGqgUfJ+Pw7sMkSbPPJsySX2nMR4e+XYHzhpoiVjTgE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CMhk2/5jp3WqYpOBgc4c+RdggQ8KxxlHqZpZRUOABOhVC/g0SiVxYkEX5/oW1PizN
	 arhAFm3EhOyKcWXiljPpBqfrXzin6u9ODepCTl1T/kxP7nWmZc8Rf2peryiR1HIFZe
	 DIP6bMPWL09HdV01sOdenrtUFh8EY07Hm/+RFbiLpvr5Dvfy8kdXTtZhi4ZhhT040R
	 ofqacq7cb0dfn67fDutMgG/XCxqexIozTEgUNwUL0fF4rPQtAMyob7vq5OlQTk0Tjz
	 KQgjKeE0KOTWtDHA0i4HnqY6AfgDGFneKrCI9EeSUcuM3PY0Z6dHoqwdcUna8aG9vz
	 HVm9nrOJzATDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B493B4064E;
	Tue, 19 May 2026 19:13:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49BCF1B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC3240509
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvOnjan0StNl for <buildroot@buildroot.org>;
 Tue, 19 May 2026 19:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FF5D404D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF5D404D3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF5D404D3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 307C878050A;
 Tue, 19 May 2026 21:13:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 May 2026 21:13:53 +0200
MIME-Version: 1.0
Date: Tue, 19 May 2026 21:13:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260518180726.110871-1-bernd@kuhls.net>
References: <20260518180726.110871-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <aaad70155b115f8a9bedfb70dd54dad3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779218034;
 bh=J+J81vobEXLqlGJA3zwpByDJP4biiz/zPOGaoJkCKG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OCqDNi/U1nby/ofO3K458GiItENP5vVUTiqOzXRzEuUI8TtH3Lq7H4ZR8XtHCqhuE
 y7yT6cdsIFYOsepfTILaLpQlWEzY3bMtigodtZ+yvO15UzkKAj3tiTNAIm2MiMFmuB
 PSpMnv5PlQGjdVrklczkFQLcoBhTR4SYGZJkKjCQD4xz/bUyYsUca8UslV94prLQgZ
 axsR9IaTpN5HMbmlmiIJisQkzBPIGUlWj7XXcgj/o/NwG7abZqCO48CSY7RFf2f7aZ
 yeHRGdAY0Q8W2AgB0G3V5MljfhGQnhA6giIx7UfNvtOl8VumHIF7Y5Xlcim6IZ6E39
 mOyURQp000vhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OCqDNi/U
Subject: Re: [Buildroot] [PATCH/next 1/1] package/utfcpp: bump version to
 4.1.0
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

On 18/05/2026 20:07, Bernd Kuhls wrote:
> https://github.com/nemtrif/utfcpp/releases/tag/v4.1.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
