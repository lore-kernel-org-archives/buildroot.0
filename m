Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9884FFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44A8961C28;
	Sun, 26 Apr 2026 15:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A91T083AzLZv; Sun, 26 Apr 2026 15:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84C661C22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777219135;
	bh=hm293BsI3mgsLhGuIasw8YJyHWAZhZVYhB5guIpE98w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IkqctMHv1ypEbmTp5w3g6redH5YOxSLpUr3f3KRcsq4vdq/h9aAi4qtDsPKnv3Ew7
	 NtLyEE+jXcwmtCh9YxiVeDVMCeVvTGQ3A8DwtD7uXZD0mae/WlQqWU0XEFI5Ej9SpC
	 CorEWvWe+JC2Lq1ns4t7govgFYdZZXA//w+1JOT/JgPFHYSTtGcxUoCeI3G+B2UOR+
	 6aEYf4/XQPp9aopKBPU7An1v9MQoqZRWrhEkrn7S++n1cpbAi+HktLXWdbyh0hTILY
	 ogqSEAy8Zg9IeR8ST73G6Yn55adwO13SO2CnTPD5O8si/ByKMTXYYwcM/LPcn1hPn+
	 iLWI11zxUSC7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84C661C22;
	Sun, 26 Apr 2026 15:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B262DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDE2B429D0
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIT98TXe-O0U for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0625F42997
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0625F42997
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0625F42997
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:58:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0BA282003D3;
 Sun, 26 Apr 2026 17:58:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 17:58:47 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 17:58:47 +0200
To: Maxin John <maxin.john@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260425160922.246044-1-maxin.john@gmail.com>
References: <20260425160922.246044-1-maxin.john@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <81a64dd81c3d3e0f460921610ee3eca6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777219129;
 bh=jfVKWByGWwKeiPOe2VQ4Qx7n1JTCvAAvPdQw6bgpFss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C5+WF3SQKePOWE2RV5k6D7TKoSclDQA1gnv0o+iHL2ATNSICfKU/oY3HxSXVyauhG
 WtgHhp+fINl/C28X3oaKfUhWDhXdzaELUUmaWH5BrFQHnjjc48gvZbjzTnslRhCBNb
 4VUdLuzNHzPsbDlJ0w+z23YkLKmY0yXBjmc8KjTQA92ixJ4wSNe36cji1qxwAhUsuq
 3YqZMADC4srCGBGEXkBMNTDuImRL9VkZjrS90oHy2AhyB25xPdJpMWk8RS4TY6clER
 /TJXHy2DcC6HeL7KkWe+Sgk2U5RDYUHMzB4ilZRT3m4eN6liT1hIsUudfASkq8fEng
 xiAgefqv2OMNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C5+WF3SQ
Subject: Re: [Buildroot] [PATCH v3] package/mdadm: bump to version 4.6
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

On 25/04/2026 18:09, Maxin John wrote:
[...]
> Signed-off-by: Maxin John <maxin.john@gmail.com>

Applied to master. Thanks for you first contribution!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
