Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAC8EF99FF
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D53A60A3B;
	Sat, 14 Feb 2026 11:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMj--nZY3fLC; Sat, 14 Feb 2026 11:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FFEF6070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771069703;
	bh=zFkkzu1KghliLS3Mr8+JcFB5ybI0qAHLzdzGmz67ec0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IATg/9zLyYxoN645KHKsMfzWRFwQiY6pgASb2KW8yDEOvqCOSRS+IcXNVbp1PIB1v
	 aKMFF3p8hQ6ALIC7cEoN7xC8D8pn6GpAuSNvQ6TecjoLpTizhw/8FX+c3JwMJDcLfj
	 ZO6XK+5Y8IZYtyQ0jAG3XrzGkuBsQ9MNedjLgCAqFIspZJAtBNAku55ncdqoaLdYe6
	 6k03wTrDeEbise4HcV4f8Z2ypkbxb0aSuyGohrq/o5YM6vG4Ri8SGSqLTMi5cEOhry
	 mvXFwKhqFa3t88JIMlmn+Ydk+KH16y3v9pUBH1D+4dHlnhJLKHySrsdkMFNOACxpaG
	 WSiVL6fjhUv9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FFEF6070C;
	Sat, 14 Feb 2026 11:48:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63ACA69
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4891583CBF
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXpEhUXBQTmP for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C5A582656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5A582656
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C5A582656
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:48:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6AB312003B4;
 Sat, 14 Feb 2026 12:48:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 12:48:13 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 12:48:13 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Vadim Kochan <vadim4j@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260213143500.528726-1-thomas.perale@mind.be>
References: <20260213143500.528726-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <b17e29cbfcea981ffca31acd12573c98@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771069697;
 bh=BGKUbR+PtBWifmCT2ppqJhBlMWUwFgBkR1QPu1SPhfI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OBq2RyVSxTL9XiMa0+S8qZtPiw19DYuEaMaM4TGwF2XHX7k+yP2EZ97t/y9CVeyt/
 UGLQ26UNVPkMkPf+bv4XoWsS6xpC6LkKqP5Ojk2jz/xuCIplqejCc2Y3x6hsdvXi6W
 7bEkQtQviaOePr32gV0sH7Ie/V3Bx51VTJR1XIAgMYXPOX4wo4LpbqpsPVFq7q5qPb
 JRaMuUj2pQ925NZE6Aharxclk5bCtZUdpgF1m+c5Q5T8g8SaoDAfPyIxCgh/NvgA/Y
 xTh6CFdoEduXeY6YhOGpQ8BQb02jgTUh8bzYcg/zqbtlaiJD9+dptiM3PEVZbnHCEz
 Nrm457cqTEJvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OBq2RyVS
Subject: Re: [Buildroot] [PATCH 1/3] package/dash: add CPE
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

On 13/02/2026 15:34, Thomas Perale via buildroot wrote:
> The CPE `dash:dash` is valid and has a single CVE associated to it. See
> [1] & [2].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2009-0854
> [2] https://security-tracker.debian.org/tracker/source-package/dash
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
