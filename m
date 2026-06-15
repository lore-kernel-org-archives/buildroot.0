Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D060ECD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A55841925;
	Mon, 15 Jun 2026 19:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oRmYZaRRvBy; Mon, 15 Jun 2026 19:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC2A40887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781553032;
	bh=FfowcoVX9LXcqOwu3H71UIP1Cg6reap8OMspskfUN3Q=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LtF40b+8otH8V8VtzrNamrZlCtzETB4G9IZRt7uHlpuFKRBUVe3B7DRj60x3QkQHh
	 KGfqQPZcT4qBguev6edgXdA/FlEtVBcE4qshFfLfYSKXXWjIplFrlbtUqb/VVFLleq
	 sUO+G1/adnLnaVtA3+RzOwBqELsrVMqw/nUOlfAbIm9fnIiQoZ9jYTxQ2QP6ek0FLm
	 yJVGN0zNdlSksuxgdlV6qQYEH9CQCmkv4ha4jlzjcI2oIpAoSAtk7I9is1QlFIsSwd
	 cptdDUZN7MEe+i/DEBl/zQdnOJCZ/FCLS+PAHXfz8chPz8iy6ZNJR6YvsWYrMayCq4
	 FaKIDusXrgGvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC2A40887;
	Mon, 15 Jun 2026 19:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 187BC169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1682C8446A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTy5efRJtHIF for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 439698446B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439698446B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 439698446B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:50:30 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 10D262C891D3;
 Mon, 15 Jun 2026 21:50:28 +0200 (CEST)
Message-ID: <b3f68e78-4210-420e-957d-0be2bb36a662@bubu1.eu>
Date: Mon, 15 Jun 2026 21:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260601191954.55781-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260601191954.55781-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781553028; bh=hqL3YPMu76atAuTDw4zK4xCGmOp9dPkxHM6BRLY0t1I=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=H58zECgTQVWgfqz0d9gercFq0Mb47W4CBEd3P8x1djN1kGOkuvxcF/nL3pDqAzg0l
 DonrrBymX9eBfdOIMw7NYvXaakmDOGPuOQp2PzGdbKf2l7haVYf7f6fOwvuW5NSCtl
 /DTPsPDVRRiX/tn6HkbuIOxB9UKzFAJLzCZEZHFEmQgn0R0kw1XjvFyAz3LOMcGO5I
 0QjcL3LYy/o3VwQr0N7/1bUCzwwvfjODu6xeS7Sg0mijx6Jp1o+IqJVV2nPXFeyVDU
 QZ1TnPSbZdYAWr0FGxDHn8VGaM2eygvNvLgjlbMVmudYGxqroxAPIzv5CZjUfhxVXs
 j648nxuqwOgVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=H58zECgT
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump to version 2026.05
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 6/1/26 21:19, Giulio Benetti wrote:
> For release note, see:
> https://github.com/sbabic/swupdate/releases/tag/2026.05
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
You forgot to mark this as a security bump.
Applied to master after expanding the commit message with this, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
