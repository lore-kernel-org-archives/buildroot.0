Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BD0CD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B07185989;
	Wed, 17 Jun 2026 12:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmvIcTF5iras; Wed, 17 Jun 2026 12:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874B285982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781700860;
	bh=FBMf/+Gqd1/TnNOK3lu+aKxBUE0YpOBdLYc44OYpf4c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rJGAuwP255Z1wh71Kk9yGhL2Lp+I5NLwhxXR8tIBUHa9sVq6k6VGh6i1rJAI/LBw/
	 +qM01e4hvKs03t26IVWRHNoAHVFJqTZeIhHoOVdqVlMwVrNdCa/IWUAXDmrGSnmUcg
	 hAUEKaB3zxa0ru8Gug/CdqgO5cQo1vNzmJapl7hJvnuDlsciZ2fqfi919N6s2Hqn+L
	 KBUA9iue9BLF0Zn9l9eEAxDaHn+5EGO3UZ2YuYFVt1hEUHwSPuKT+cuP4wUGf6993e
	 zbQ+vsjhCIusLV0dE3dAHbcjBmLBCvzB0eP5zUyW+hql6gF7mX8mxwv9K+UkY1fKVf
	 Ry/OaaDQz+fpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874B285982;
	Wed, 17 Jun 2026 12:54:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E9E233C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344CA408DB
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1x55m7AHDgZ for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 714FC408C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 714FC408C2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 714FC408C2
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:54:18 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4F6EE2C80C5F;
 Wed, 17 Jun 2026 14:54:16 +0200 (CEST)
Message-ID: <6d617b68-07ea-4612-b15c-8f1ba119b890@bubu1.eu>
Date: Wed, 17 Jun 2026 14:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260604144230.840387-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260604144230.840387-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781700856; bh=ex2Y80pGQPd7IkSWiSaxmrvZXD1zikHjsjnFaeR6t5s=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=JdDrqULGo1PH7xJQt+9sWsfsnnXWSN+KSUDupg52cM3Be6Dt2SG071Ev1SdMCDzLc
 hBRS1SjD0pg9XmKJSFHXNMU52RwNbzTclE9I/Qqycj3cxUxST+yRQRlUhX/fkzGGza
 FzwBtl+3+WDcRvtZYC1cap4yde4dYOjd2OcfFUhOUrnhEXXoOWA+RK0aF6C0POo2BI
 1wU4gPd4gDyLEk8J1nyxZinvfsSIQ8zn0QpUzJ4AMA55VoNPCRKhTFaJbaQmmt0Nmq
 4bj1IIqObKXIIajScLwqzVEynSpq/h4bEkbFSfDeEpvf6plz/g7FtHJSRHIUbqmQun
 MP8WR6Aq1r1Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=JdDrqULG
Subject: Re: [Buildroot] [PATCH 1/3] package/iwd/S40iwd: log to syslog by
 default
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

On 6/4/26 16:42, Fiona Klute via buildroot wrote:
> The built-in default of iwd is to log to stderr, which is lost when
> sent to the background.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Series applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
