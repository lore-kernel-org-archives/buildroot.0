Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78398CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C22F82668;
	Fri, 29 May 2026 16:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZbbpKiqJ1-e; Fri, 29 May 2026 16:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88D22825D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071890;
	bh=jdneutj3U/Nc9t0eqV98Ydqv07HHhO9KGYLHDm9XVP8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lwFxmfdu055fzrE2C/ViXIpOvibN5m2fWQ3WDnsL9Z9oGwO5JMxvgIKKGC73VMgm9
	 /yUF8JSzRpMMXdVzGH+/N4ZmHTeq0C3J2xy6qEO0qnOAGO0ZJuVNN+eKbxTE8OpK6U
	 JVjv2g2ny1FKB/W1YqAqARkLlA1BGqlRLXCl6h3Wp357sOtly0bEw2vqdQyw4dXt0Y
	 lqBuTnBYZPKEoOqW1t7YTYf3vhBdskqqVSH6GtpEWLoBsm6mlQTDBcapu1bjjoukof
	 /GPFlDRKfa4iYBZVeReKE4fkuJMuVUhC25iXQUjmM2cYpgXHXm15YDP3++mXawTeAS
	 LEpfA/y+REpwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D22825D3;
	Fri, 29 May 2026 16:24:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E08288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 712BA41EBA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-UbzAPm6irk for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 768F841EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768F841EA3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 768F841EA3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:24:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0439F4E42D90;
 Fri, 29 May 2026 16:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C1B96601FA;
 Fri, 29 May 2026 16:24:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9F4610888CBC; 
 Fri, 29 May 2026 18:24:44 +0200 (CEST)
Date: Fri, 29 May 2026 18:24:43 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <ahm9vyc4QsKu6e2F@windsurf>
References: <20260516200608.345615-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260516200608.345615-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780071885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=qAIat9GtcaUMnKywc6aJZ280ayZr6v66QO3/O8djyzw=;
 b=1EXye9SHKMOpUdKitbObxIxBNifvf3zqB/xoduRd687s6Yg/IDTA1tx49c4/yABv7LoLdR
 uSY3Sp+C+cG2QPKer2hChHqMLoJEiGRRpQgUfDkvwMi/39LcZvviojfZK/O12wv0U10iEU
 GYNClfOW8cn3JaVyapYFlvENl4Lg8EjMETnA5SaJPefmHVHnXQovJ443pEVQ7jrtCb/sFU
 /FJIHkoJokwEWiqH9gi5aXA6jkKOZZwTD35h6g+TMKVk6IbXL99++3/3y2Kg+OYYJA8THX
 bY4Ju2CbhTYl/aYedIX/33IRmIL69WrEVrpvINcPQtY40bZkPnYEqwt7yZRnEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1EXye9SH
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.124
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 16, 2026 at 10:06:08PM +0200, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/4b5e60e1b567c823a2a9c3a218d7122868d3c4fb/doc/rst/releases/nss_3_124.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
