Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D5FC83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA84E83C43;
	Thu,  3 Jul 2025 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chAfwu-NGRb7; Thu,  3 Jul 2025 20:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 094A383C2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 094A383C2F;
	Thu,  3 Jul 2025 20:51:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80643B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7212E40BA0
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brPZDvnoIvZH for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88DD94082A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88DD94082A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88DD94082A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:51:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7A1F05FFBA;
 Thu,  3 Jul 2025 22:51:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 22:51:13 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 22:51:13 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250703200917.4054251-1-thomas.perale@mind.be>
References: <20250703200917.4054251-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <78db4586ca9c925c099d1dfff81ffda6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751575874;
 bh=sx3c4vb09d/igWsNOzMI/C5aR5XHq1LWDxpOgtZV+bo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c2wIYY7mm3jp+TTJgYAobsuuVzSVp2C3eF2SnGf0YDT67cfCpxPgoSdutYaXkrpiI
 GMMybPOaFozar5vGOQWFkF7K5hnWeSaNzplZCL80zMo5ibXzHLkDLbNlWb3llwfcIq
 G8vzCR6FOaOUD2k+JXE/VMe7vqhB3qpMfgt4XfKxhoHqF/2DLUC3RHYfaolR3JYTR4
 7bfByJaqnuWw0FqmtQIzF0I0W1PM6Bf7TKnMKLhszlRKhy9oxQ0TFBVqViEN1dk1y9
 rmAv+sQElkTmHI+zqRBUuJr63djauGJwNouDQ4NdQL+Uu0JzpKI2QTt/doKaPQBQ21
 MUXwH2+qJxPLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c2wIYY7m
Subject: Re: [Buildroot] [PATCH] package/fwupd: add CPE identifier
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

On 03/07/2025 22:09, Thomas Perale via buildroot wrote:
> The cpe:2.3:a:fwupd:fwupd:*:*:*:*:*:*:*:* is valid for this package.
> 
> See 
> https://nvd.nist.gov/products/cpe/detail/46E1E3C0-2F72-49BA-8374-1FBF203AE0F0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
