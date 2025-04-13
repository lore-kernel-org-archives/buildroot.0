Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180E7C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D74A081B36;
	Sun, 13 Apr 2025 09:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2YuWNHwqOrp; Sun, 13 Apr 2025 09:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 279EB8221C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 279EB8221C;
	Sun, 13 Apr 2025 09:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F34B7108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4FA9400CE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afyTJRqi_znq for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B1644014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1644014E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B1644014E
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1C81B6012D;
 Sun, 13 Apr 2025 11:47:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 11:47:40 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 11:47:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-10-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-10-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f7e6465855cf7b408e18cdf111e0849b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744537666;
 bh=zjTSdKyyLBI3KyZPrIYTOT3ly9QaAnkRuH0ovaduTI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oIyimvJsEQA8Nbe59huIqRIALXuBjSXpB8pD+AL6oiWiLThQvL/xxiBpmf8SiOTrm
 +majfD3zrNLmIXmkiyBz45MtgZwB39tpxylNzTeXgf5lkE7oGIMRrTUwaMENIpa+rk
 6h98GtxK1A+Nt7829iOp0uyLjITbjM75O56d5yhCZgJXLGm9NjIIOAMTM3GAaXsWhC
 Rs6VCPCc8wtUCkkhH5O+LgpgqhICr0VxNmFcB8qFAkCMZnlPz6YJABMRkT/UWef83t
 gFsOibLMStiidWZC6+sDyvzd0+k94R/o+n/kyA2hVqp/B2Z5qaQ31lbeNiZDZBxCIV
 ohyGhoAn8KVLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oIyimvJs
Subject: Re: [Buildroot] [PATCH v2 09/18] package/qoriq-rcw: bump to
 lf-6.12.3-1.0.0
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

On 28/03/2025 19:04, Vladimir Oltean wrote:
> Technically, this is lf-6.12.3-1.0.0 plus a few patches on top (the
> current master branch). Change log:
> 
> 45e692536904 rcw: ls1028a: Add configuration for audio codec usage
> 3c51083d0cdf lx2160asi: e100g1_split.rcw: fix parse error
> 
> The second patch is necessary to fix a build error which was signalled
> previously here on the lists:
> https://lore.kernel.org/buildroot/20250318213839.17470-1-vjardin@free.fr/
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
