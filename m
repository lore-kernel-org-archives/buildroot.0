Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8065DC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FB881F4C;
	Fri, 24 Jan 2025 20:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzbECCFb_e99; Fri, 24 Jan 2025 20:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDDD681F45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDDD681F45;
	Fri, 24 Jan 2025 20:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7CC1183
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13AA81F42
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVOP7zPksc_i for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25AA781F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AA781F3A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25AA781F3A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:41:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 24C4C2003CC;
 Fri, 24 Jan 2025 21:41:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47072])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 21:41:28 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 21:41:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250120124342.233492-1-neal.frager@amd.com>
References: <20250120124342.233492-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <031078085626187cf6211de6b8520627@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737751295;
 bh=2w3TngUL4EnVAToQ3LaYLkaT0LinRUNsMD7F+Xhr2J4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rcLcT4oVxLMcr2J5Bw7BFEfYVlaT0gCULTQT5NAdDFkOT7MQjgjRSKa9h71r3fd+D
 rk2pr+P3d03F+BdddvTCBy5/CjPigYkVE0wL/A/+f88ewluIklOcFxjpEw2L4XXEF5
 DAL9T7HXOtqoaQKjbn3tOX+g2fAg84z3EHtLW59nzS+4uG6kQONn8tZxcXDAlwwsou
 Y5JsQGEsuL+6t2oSxiMh0i0MCc38aBJj3tjAQys2OVpMkC0Hbd/6MmsJlvgKoycBzk
 a5uHFq+XOSBISPKs7wieQ5bu4Ag65QKsGHbhzJ0DFzgx5AHoLG8eOEZnTate0MTTfP
 ObKx3HF1EjzBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rcLcT4oV
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add hash for
 LICENSE file
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

On 20/01/2025 13:43, Neal Frager via buildroot wrote:
> Add hash for xilinx-prebuilt LICENSE file.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
