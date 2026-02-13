Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2932AEDF150
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 11:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34C541BBB;
	Fri, 13 Feb 2026 11:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrjcKnQpQPyR; Fri, 13 Feb 2026 11:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0997411F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770981195;
	bh=Tad6vGp4yDkigqGhC0Il/ABiY3zFpdG2lQsuPMJxAKY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qtn4I6+rZwlcaqhel7SnwMPrmc4DSleDZ4bZbbWnVhAzsgzFWvehnXTstfMc6dfgT
	 enWHTqtLpCXvAFCOKVvj2Foosb58f8skn2qDdXP62qbAjv7nhINCKXB8T7e0KD2sHU
	 Rb2tdEcq32vmRAQJA7x1YtPf81TQc5+TpDIUq02PMb3WdRw72dTZvBCAWi3rPu4Yrd
	 qZ4hlX15gzFANnps8xwtWhqSrGojI8XyNmkpUGLQ5xErJijyWYqbDGgDmJcQGPb4aL
	 Ve/tWNeT4259WLzwS3HAaujpn2RwY0AAVYu+ykiz7nBQfkXagBcFtUaNtsNiZvAUS5
	 LpqMbtl4IY5oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0997411F9;
	Fri, 13 Feb 2026 11:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEE47EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCB4B8436F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QL2tK3JW9Ys7 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 11:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7F90842E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F90842E2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7F90842E2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:13:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9815619F574;
 Fri, 13 Feb 2026 12:13:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 12:13:09 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 12:13:09 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260211143236.4018275-2-buildroot@heine.tech>
References: <20260211143236.4018275-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <a28ff3716833847563a3049e7fdad250@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770981191;
 bh=XnW7O5zrPxekd/ZtgiASgQyIikj8tr0ladS7V+Bb1Gc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WkzryFJOLsqIDCK0+D1Amzj2lYXs4grxWOPAmO3i1+ioj0lKV/G3xif3kceXSWPl6
 80nXQZy01RWb8A3XOCxeFzmGjZp89f+Y3u6cbY5DK0SxfxyPyruKZTYZgRvZg8sHx6
 P1cnFO2ug4qrSWDAko7b8L072nUeGg2mYGc0krBAq297GSyTOagQ38V9OcH5JZO1vl
 VpBAcC85ApqmUKKGBeV+t8KA6+znyA6qNbHDkEVlw7ZMKsVhpjcaOfmhlbJ4fAI+0l
 JuHzoLUOW/JPQVL1L7IiQDZJHZU1dMVi2ZThGcNWtx3+cPRxlsonDklw9C+cIBU2Pl
 Bvfj8giT4ytSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WkzryFJO
Subject: Re: [Buildroot] [PATCH v2] package/log4cxx: fix ENABLE_ESMTP flag
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

On 11/02/2026 15:32, Michael Nosthoff via buildroot wrote:
> commit cf686670b99ae0388b27867db64516c09b2de91f introduced a patch that
> was later included in a release which made the usage of libesmtp
> configurable. Later the switch was moved to the main CMakeLists.mk [0].
> 
> while the patch introduced the build flag LOG4CXX_ENABLE_ESMTP the
> change to the .mk file used LOG4CXX_ENABLE_LIBESMTP.
> 
> So correct this.
> 
> Fixes:
> CMake Warning:
>   Manually-specified variables were not used by the project:
>   LOG4CXX_ENABLE_LIBESMTP
> 
> [0] 
> https://github.com/apache/logging-log4cxx/blob/rel/v1.3.1/CMakeLists.txt#L93
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
