Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBDCF483F3
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE0540A41;
	Mon, 23 Mar 2026 20:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a84tniAAUOgN; Mon, 23 Mar 2026 20:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B495409E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774296567;
	bh=zVoZnWXBJ/hKvaZrTSGD3HVVBgcxRwGifdLZkTsosZo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ldqyEUL5sCNZb9COQ+JmGOLgwD79ow+O/s/SpCPDWYRPFXRnT+LWExLWhaJY+e2N2
	 /SD56VPRkQTsCp6T+HjeeYukMUhFWZi9juFLn5K1ZgJSmQGWQoX91Ricu5l9yPbcj5
	 zU0qXcoGdeKE+I+dHTyGszlvkENkJupHK3OQYxaQh76l76KSe8vHTcabwCSkUxkvkW
	 /BYjBgV5Jgb63uFUtthYhHTv0T6P0uzpPpwzk9w8DQ2Nv5mBIhBlxDwRtvqFG/vX23
	 EDUQnleOmvsxEoVWs2/jnMs0CLdw1sGhs6zLq7crv6xyglh0y0qdq7B7Q1ctcH0eLk
	 RsRojk++MNNiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B495409E9;
	Mon, 23 Mar 2026 20:09:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C0DDF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81C6D409E9
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADir-9IVo7aM for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:09:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAB5B409E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAB5B409E0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAB5B409E0
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:09:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 005862003CE;
 Mon, 23 Mar 2026 21:09:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:09:20 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:09:20 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <acDe3WDkqsQZlkOK@waldemar-brodkorb.de>
References: <acDe3WDkqsQZlkOK@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <eddb4c77336fff9469ba3fbf2c232ea2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774296562;
 bh=X1wLpk55h73rLmxyrrg8UqyTZI4tSBwa12FTkdDU3U8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ryvh6GcXluml45OrwNjHisPWgjNqT1KGrGDkhXrby0sRJ/MxO2vIsyNOjzug67559
 l+an/Qjc4ZF/g0k0V12+MjLTEt1LsknhhfE6Qxy0qa+hWkXg4s9JLuydBfIkjJCBej
 LTehopFP7HQw35iR56jjQxwGai7X72BsYcBxCV/kWW2fFcn+ZaihhTFMRknDJmJWUs
 quwHlMDoNra0N9UtTjGkU1AYURC8fVbKqIy5TzbNZKiSIe8Z8z0x2re8CKS2AdJqyv
 lZ01zlkT7A0LunN/5eh9qsg057gt7LejaCiOOqLurQWYoR2A3XsENXOfYoBIHCRjNw
 XAWg+d2R9XaVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ryvh6GcX
Subject: Re: [Buildroot] [PATCH] package/ruby: bump to 4.0.2
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

On 23/03/2026 07:34, Waldemar Brodkorb wrote:
> See here for news in the release:
> https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
