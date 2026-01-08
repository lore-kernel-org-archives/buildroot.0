Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DBBD1D48A
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 981F383126;
	Thu,  8 Jan 2026 20:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaA5P-dWfUVx; Thu,  8 Jan 2026 20:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3BE830E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767905368;
	bh=L0G/7JJp1mXJ8sogyeIkt1TMe2F8WSqUO9pO52RwhLc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iScSNl3sG9t5Q+Xle1i9WLZEZuO90djACODVUdOZ2xLqfBQ+lumXNaWwXwKVOwr7t
	 1jLT4ec6TIXa9mSmv1dMqfDkIbjrnjcIhIwvy24/kWxD//4YYWpnnqFH/DkYdW/mNn
	 Tx0FB75ACLUyyHPxnYrGoh4/LcyuDPCAzstT75qJokBULiGif0kPPJ+krpH8gOFA+N
	 ZNFTFjfYm/NmD8g/LEMOTomqVrwJc65EXew/ME3X9yl8JfWOE/5nZ8mkuL3EfEBQ/J
	 1+gROIhq4MrsNDUE+3nyRpCqG//T1on1SyD6ctu237eZElbRkOqbDAZHaoMJhT/lxJ
	 U7c6o/MNZ1epQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3BE830E3;
	Thu,  8 Jan 2026 20:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C80777B1
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE58B60E58
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-wyxw3JRBH5 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAB2B60E50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB2B60E50
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAB2B60E50
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:49:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D4EF113F86E;
 Thu,  8 Jan 2026 21:49:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 21:49:20 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 21:49:20 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260108080903.149441-1-buildroot@heine.tech>
References: <20260108080903.149441-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.12
Message-ID: <39cb0c4aa649a0f0e77c1d3ccbdc993c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767905363;
 bh=9Zf6kcYO+L1l8OdcE6cDQZjsqVnRWXpf19fP+ndOvGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MCK28Wnryycyz818J6x7VAHr8TWXF/bTZyN9hhdWpWfcL+mHenwPioIkhNYjzbfmR
 osp44fUN/CiFSz9ZeN+4M0ezyOqjugCRV6Z4FlZS6nHqgiufo/TE4bnv2FNeXzPyBY
 mPHUpHR8s9yKGwytZQvtxh0XlJqrYA3FatlLjWqYxUqEK2aBDwdM1h+Zhm33s7wYK8
 btK7oLoq3fuRiZdtugV6UrtnWfGVPZsIOuPr0Xr2vUz/bo0oxNgMNEJ8uRtdnYhCsi
 ioTZqwyOvdU7SG7ZFW6fzrhdDObYHWL6GCMCM3yR38NGeDsyaCPB6evfNh9nkQw+uF
 8TReprSHzxrXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MCK28Wnr
Subject: Re: [Buildroot] [PATCH v2] package/spdlog: bump to version 1.17.0
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

On 08/01/2026 09:08, Michael Nosthoff via buildroot wrote:
> Update LICENSE hash due to changed line endings, updated date (" - 
> present")
> and updated contributors ("spdlog contributors").
> 
> Changelog: https://github.com/gabime/spdlog/releases/tag/v1.17.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
