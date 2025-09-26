Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94892CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67ABD4235E;
	Fri, 26 Sep 2025 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJzsfkBkn_Hs; Fri, 26 Sep 2025 19:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85B654235B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85B654235B;
	Fri, 26 Sep 2025 19:37:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B95E12D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D21941F1D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDNg62_UL-6Y for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 19:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37B6941F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B6941F0E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37B6941F0E
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:37:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 13D0278034D;
 Fri, 26 Sep 2025 21:37:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 21:37:10 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 21:37:10 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250926163239.162734-1-thomas.perale@mind.be>
References: <20250926163239.162734-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <7fae7ce789847e62424d851b8f279c7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758915432;
 bh=/RRTRVDVM4vWqBbUEPi09M+O76Dd4rwlQHUxUREH+wQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FIw+pMHkDbbmzN3IcWa3/00ZMxiutY2EYRT/COz31G4wDfull8QDjsVal+edpt/B+
 T74briP9svJIVjzfx1Gd8H7zvLtcpyi0RafBNoKvyI0WEBRJIoHYDuEa0FxZbHvMqm
 yraicFPpfebFP+R9no0Y+vvYZEyFt2ZOuVJQeM/21YhB6RXIC5Gki2/gEo8g7OlM92
 ykUVoSLspDDhlRfnqS3BctYrVEJmJPfjLH++v8elT2i8bmWcohlYGSBaboLqfoh6lI
 NcclScK+HPo6K/7rRb5Xk+RTJ8qn334pUFwm2sdV/piTPLaYGGanVOotS6z+OFf6VZ
 ykkagtPJvYJJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FIw+pMHk
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: ignore CVE-2025-8851
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

On 26/09/2025 18:32, Thomas Perale via buildroot wrote:
> The CVE-2025-8851 [1] has been fixed in upstream commit [2] that is 
> part
> of the v4.7.0 release.
> 
> Because the NVD reference includes the version '<2024-08-11' most of 
> CVE
> checker will fail to compare it against 4.7.0 and report it as a
> positive.
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2025-8851
> [2] 
> https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
For info, I fixed the license hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
