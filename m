Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB410F286F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0951980826;
	Fri, 27 Mar 2026 20:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHr-fGGVfyBP; Fri, 27 Mar 2026 20:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994308061B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774644613;
	bh=VDekHpKJ1vtmiGP6OgjTBcAEHgqw7Bmj2oR/YB1LUf8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BlReQIswD2P6hqPkARd0TiZSv2BSVpgZkkR3iBmmXyuFIf42GBg+BrwYz9SW+1abq
	 AXJM3K6LzZlIi6YjdTsX2opAieeA/shxWYDZ+xXbFiU6UcUF/SGCGyxdlzY7S1x5KL
	 /1J6n82uclCiJDqpAzv4io5bgQuNhE6niZ90lDVoFUCP25jRJatik0T4u6kEYkCErC
	 Rvvd8q7c1VLh1FFZMJS7PnzYO5tjYLj04LqzsEQBTSRcQKb2Bq69D6up96bgPI4U1K
	 ogG76KWPgEDSDruLPsBSSIqp66UzGEWhKf3vlFMl9YJ4j0rpZn5C5KjN3xwfGtFBg1
	 /EOFBWS8fqMMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994308061B;
	Fri, 27 Mar 2026 20:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57B932AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49E208061B
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwRlNWX_oGVO for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96E57805FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E57805FD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96E57805FD
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:50:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CF3E7780333;
 Fri, 27 Mar 2026 21:50:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 21:50:08 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 21:50:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260327175139.1958780-1-bernd@kuhls.net>
References: <20260327175139.1958780-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1eb519434a09c7ebed59ba4545e69d36@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774644609;
 bh=O6Xysw76cOEhjQXCSlQuXRIqUMihj/qfLEAr1ZZIarU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ju5gBZG2YXSW7fsNeW4D3vX7bvwFK73V1acqRyTsfheWMpqjp7hPBseL3ZNPzWj7Y
 40fXlJM55XGI0w5FXBHnWElRQ7EgoslUcOLb8xYBIefP7BrUcRzdgVA48lc0tlWPD8
 MdDkYWbFeM+Yqw08qrFb2zi40f1+Yb3Q+VsVyWyEcEZlrAi6dlC10FfSyh9y/Ci/hp
 5KLU/C/FxL8lUBr4DZF97DZc9uBcDZ9SFzGSJ9rvofSrVfi0YTSjbAGhkErngZKX+8
 3mhJoQ690ycwMqc1ZNLfgX/rA4QmwL7aDwMjEGkgn+OLBR+jWeMgXCZEKEQntujZ4o
 7GvRQWBcmwnvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ju5gBZG2
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12,
 18, 19}.x series
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

On 27/03/2026 18:51, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
