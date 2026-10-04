Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9759ACA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62FF780D1B;
	Sun,  4 Oct 2026 16:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LC2GWGOooz-k; Sun,  4 Oct 2026 16:00:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A349280D52
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129640;
	b=rnTSyjajvfSroN9NwDgYPwNxSdj0pWz77JFlIKGB9hXeqIdXt0yrkdp6jdYuhtJwidye
	 jtJZIHLUHuQ1+EYf7dBL0G0zAqu/LSVqvi7A8D7qpGdeTNgnZZVeeY9wyyqhSZX66h9Ee
	 Jp4sI9GPpxQBMoYjgn+O48s+kMFcdqbIpgCMInkTfGrP5ckp/WTnBndTfawjLmt8YTr+D
	 X3n1f9rqU+rwc6z+n6qHHmkEwAl+niIktCdSxQlajCN8u6mbpuvnj4xhe4Vfv1uH0tuMC
	 B/b749lvk3tUP9NHU23+aON6rRXoT2Xyz35iBFzbaIyZaszucWhZEfAjbPcnfERQbdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sTIKjsHWjwr77iUA/WePVZd7soEqnPC6Lik0rnk4/yY=;
	b=cUYoPGwSwk1vswkO2+1ZBmWhb0K/An3+ilj5k95CWX1Dy1D0kggiwa+3YZHstWOGowzQ
	 w1YijC84UQqU6YPF41sqWjdlZFUFvRGsCe3U7nVHLnbDDvT6RsM0gzdh9cxVhfcRPDK8T
	 RHIOAC5vse8+C2vtnOa7KA2dnKPqmSgBtk9JRG0Iib10SHTnTWqrDehneztfrABygPCWy
	 KW/Hyhik0mZplnIq9L/PVZaCSvMAHTneng4hGDqwzO5glXz8HWsxZ4FmDURPOicTDC2nW
	 0+xayDKpyGG4jyyh9lybZVlRg5JK1p0IRXU13hltlr6bbOIw4pOKVL11wX3/qR8IdHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129640;
	bh=sTIKjsHWjwr77iUA/WePVZd7soEqnPC6Lik0rnk4/yY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qZnaC44UJkqM7iPe9Ib3jNmkzpnLbLgN0nDD5SANOnI6aRjszyUmH6hNoIOsJAMcv
	 Lq07KsjqDvvUGo3rfrYY0gHYM9dUzjJmLLXvcKwD4w4Pcjsz964x/A8ljUho80QPAr
	 PU+gZdP5/M8hAUPwnXqhkwPJwwuZu8yh+78QLj7D5We4oSQ3nIrVAGWWjpJgTvNwM/
	 7rQ66FqU0b18MydkJUb9dpSc2KNochCxSz8gBIsf3GsGWQ1xFWhM9Fgr0fwf9rbp6K
	 Bn3QxZAxxGxkAPYm7lHbEoRK+mlpN98pH+hT+4jhl3AHPeUEOQzp6JdQS4tpMWRvTi
	 v9dlDLpt+Tadg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A349280D52;
	Sun,  4 Oct 2026 16:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2029832F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C3B405A4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qn5OtCJpRdZz for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:00:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F0BA74059E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129638;
 b=StKsl8SoLtjHVBwveelv0CLfOoyI7pXTa+quBTdaMKSRymmOX7OKe6Ko7r1U0D+QMbXp
 SMqZXXG88Gs/9qZhZVz3rI2Y4rerzBk1CIphRqUjTiR5JNjXb5a+XdWwrSiy2nX+5nVcv
 8ZTgEsSoa18RhDqyPuRlRW9CLbQOTJgBLT73TxFTzGb5RH77T1Efnuz6Nt5x853Sjn0ol
 vPn4zBD9A2rNb2UVpCHkOp/GR1whAnXu7VyOkOJkowVHEQKKV/ZqxspSnMWfo9m8DHhX+
 O5nh12d9blETCZTGvrjSqlsm0tH+E6PUmXTdKowVDTAzf3q+wvRrVubgB2e4vFWt6hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129638;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=j/sI+bngvVLDq6izFZE8q9Fl8vWxi4JqUGtoW4r9b9k=;
 b=ntn3FQM3UsI+ngLl96ul98dhkyf2SXNbvTJK+TwwQl08U0gKfsvnh3Z1Z4jZiEkAE6k8
 ol+ZgXXbdYPJbzt55Xo6gfhofEITnuVEY5mULEpmFuvT2Sj03Lwb6hdcv9s+V7FM+on0b
 2gxxWBGce/ABSaLjF2KMrVZrLZs1b/tkRoDJGfRdwsjlAmm4vxPQBRVFNgy+P3UI5tDiI
 iq3z7JOrYKfL0vlOeOSBn3Obsyyt59OSFLtBWdkh2M2kVSbWXo8caU1wB71gOA6kaWxJn
 wbTw+unqqZZOcpWZrDWYheylaon8DgiF5qznIYD4Kf4NaPbq28g0q4f/iS2A19lixhg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qGGgDBTk; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0BA74059E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 034B94E41163
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD5B5604FE;
 Sun,  4 Oct 2026 16:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0E5DC10328192; 
 Sun,  4 Oct 2026 18:00:34 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:00:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4HCBGbBj-5bH5@windsurf>
References: <20261003210833.735937-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-4-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to
 version 4.66.1
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

On Sat, Oct 03, 2026 at 03:07:54PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
