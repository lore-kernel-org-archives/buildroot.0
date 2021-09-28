Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12516C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:30:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4710A61159
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4710A61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B3740555;
	Tue, 28 Sep 2021 05:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXVSnjSpCC5D; Tue, 28 Sep 2021 05:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B584404D9;
	Tue, 28 Sep 2021 05:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A52581BF847
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C4880DE3
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ozlabs.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lrgm_S_fbCUM for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 05:30:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FFFC80DE0
 for <buildroot@busybox.net>; Tue, 28 Sep 2021 05:30:10 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJSkj3xNgz4wgv;
 Tue, 28 Sep 2021 15:30:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1632807006;
 bh=f8wdjSD+02GxuEo/+IbGxvGF4FSIGND5fydjiTiA58M=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CnZCcxfHRzZyg11F1UWU1mqkN9ycyxVTKsbrvzfU+J4530cTi311+3rudFmBrrhwf
 IXcxfFFwZHOlFhrQLjniRqszPMpaSO1rfCR8AY5SXTlfOLtZSKX1VuJJgYmFQQWc9s
 B7Jj/MJ6YhThfMIhwgnjs/k3QzXdbjNlPlRM8EsY50o+yykM042peC6zqZWNjqMZ0i
 W2rsLinFBaV24tp/oFgz4z+zlt2phKCnbpIG3DN/+W6pdplgOr8YvuyT9jXED9E1cu
 uBwFJ9eObJzRoBdhETplQ6v4Es4egtGu701woLuSQctlFYUc5+2PqX6PTMa6n7QUbG
 Yfn1nLOTZx7mg==
Message-ID: <2578458edf86683a89289ed29641ee48299fa399.camel@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue, 28 Sep 2021 13:30:01 +0800
In-Reply-To: <20210928052156.GG1504958@scaer>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
 <CACPK8XeWmhxOoXT0XUHkjgygnvvA0Rr0bMRCR-2UVPDz3gEKcg@mail.gmail.com>
 <71621598266144b34d011dd8e24605ced76b9afb.camel@ozlabs.org>
 <20210928052156.GG1504958@scaer>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Subject: Re: [Buildroot] What's wrong with patchwork
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> So, yes, could you update Patchwork, please?

Sure thing, done!

Cheers,


Jeremy

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
