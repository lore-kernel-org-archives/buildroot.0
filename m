Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C5E7FDE0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D947A80D56;
	Mon,  2 Feb 2026 22:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xqZY7bqaDz7; Mon,  2 Feb 2026 22:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C0680BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070176;
	bh=gkpeT9tcrDeSvuoetTteT/iljZvKvq3VA2TmiTC/vrE=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hh/5SLywxdeIHw2yTRI1ycfpDigU6Rn7wm348FCSEjuBLX1kFx/lFbk5P+MCai8QG
	 PS8adDRewrE4gwk1ph4bwMganjwokdg10C2fIJmv9mUKFRnyZXbUxUiLQVY7xs0SOb
	 U8HpdggRJLkRmp+A2+jcwra6PIVz5jLlMg+NfRIsHSsmRrk8DqW75Kby58y6RdsQdz
	 WP5iY5zGmauR7XB4Gi9v1VypzyjDadrwOOB7WhK6vq4IuB3tL8JSx8txiTSMVBVhEX
	 RMkiCNR28Ayw+0NuUtcNJj+ejmObYSgqIZX5MC3KBbWjBvGWpRrwW5nUk3GmXxFZYK
	 Pb7YV1FIBzv8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C0680BC0;
	Mon,  2 Feb 2026 22:09:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B76A41A6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B19EC4037E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JLNzhFuqQgR for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0F2340362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F2340362
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0F2340362
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:09:30 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id n26ovv3RQzFIWn26pvMIc2; Mon, 02 Feb 2026 23:09:27 +0100
Message-ID: <639e030b-5ebc-4412-963b-dbd0327d676f@benettiengineering.com>
Date: Mon, 2 Feb 2026 23:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-2-giulio.benetti@benettiengineering.com>
 <aYB4i6UL6oI32BDV@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <aYB4i6UL6oI32BDV@windsurf>
X-CMAE-Envelope: MS4xfPZWzyptPQ4HEXu8XQERM3159+70XNKtAdr4WN+5e7MkL1wnXr43kc4b4kJ0kjCpPtB25K0NV3lv9Akj7n7T6CoxNLyHjkr7zV/aXaaKo89WgE8J68aX
 UFK4FrPYEcHlx8EwXOGWGFljsF7Xc1iueIJ1i4J7Kg481l6FjSSkBdKfUCXxalCtfxmRHr1yEwMCqzQxUrlE0fF6pu5xtKCttA62Q0mkNjcyKiICCXgxATdw
 co2ovcyYUhiWIR0T+lilMePpwZ+viAfYumfU9T3+vhF4W7XqIh6WhY1xbEVk1/CzesXUDS1aoUUaMU99hLCix09PdMpmtB94m4sKFElb74MUt2qec6R2mKa0
 4L5E6w9S1aBiXaWeWQSz4XqhIZ6nYw+Y9e089x/w98yldKZx1TrTz9ZcvL2Xf3+fM1dxZi/cMKPW6rVuoOMJkdef6eb/tVxqio6nXH0Dn1byhm8wA9E1Q3N+
 Ymy+FgWq6bHtuLbO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770070167; bh=PEoHRiq2B8IabpQvPb/2GTD8w/HZrZOkrBmnzJx4r4E=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OQ2PTWJ4Xhnf5+dU82nvsgd/tYN+T6+7+rcYVX2yZBbwZd9rLHy7NoB1ZOZsViIJg
 Gv/S/4e4tm4LXQRqyaDDUylHXDjQkcWad7sZfvM3t88Kp7KUJhodTtwuPQ9pBgkjUy
 bRJmFkqPH3p2pkCUSrjzDtzntaBAddkJhPBE09VFeS+VLGCrxfOaEPt5P2UbosZs46
 bxIRAoJAKLfhgkVhsPiuGz8SCu91SbUgxGA6zTwjFJlJayUvQYat3OFxZscbl4X+6V
 pQccYEtpLwQqtq/lla49yWxz6z5V8SaIzL9r/takcI6t7e/jy6trXIARQPub+rXF+J
 8sthoPDizoYBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OQ2PTWJ4
Subject: Re: [Buildroot] [PATCH 01/17] configs/amarula_vyasa_rk3288: bump
 Linux to 6.18.5 and U-Boot to 2026.01
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

Hi Thomas,

On 2/2/26 11:13, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, Jan 14, 2026 at 08:54:34PM +0100, Giulio Benetti wrote:
>> The patch:
>> * bumps Linux kernel to version 6.18.5
>> * bumps U-Boot to version 2026.01
>> * forces check hashes
>> * switches to extlinux
> 
> Unless I'm missing something, this patch is not changing force check
> hashes, and also I don't see anything related to extlinux.
> 
> Are you sure this commit log is matching the changes?

I'm very sorry you have reviewed the entire wrong patchset.

I'm going to send them corrected soon.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
https://www.linkedin.com/company/benetti-engineering/
https://www.linkedin.com/in/giulio-benetti-79975951/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
