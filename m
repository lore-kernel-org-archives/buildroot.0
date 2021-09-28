Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C558C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 02:43:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B50611CA
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 02:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4B50611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A56605AF;
	Tue, 28 Sep 2021 02:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6lkRAXFf9Xs; Tue, 28 Sep 2021 02:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97BB608CB;
	Tue, 28 Sep 2021 02:43:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6C91BF861
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 02:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DA3A80F49
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 02:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ozlabs.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pG3-NABksrOP for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 02:43:51 +0000 (UTC)
X-Greylist: delayed 00:09:36 by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AE3580F3C
 for <buildroot@busybox.net>; Tue, 28 Sep 2021 02:43:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJNqZ6XBwz4xLs;
 Tue, 28 Sep 2021 12:34:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1632796444;
 bh=+r97giSKST4ZoQLVlP6Eqfu3ondWte/e+GjIy0x3J1c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eBXnJPh3rV+d6nzLswYydcQVamPQkjsEkZlJTuqSPxa7fU3i307AzobB/9X9okgPS
 xmjOChmzB2cazXwp/wM81ivQnYS5XaG7WPEnYrmvGEFIeLKXCFclB+0eJXuVfxAlkA
 A8q9I/5+rF+3kq5b19/WSznY+Z8dJ7/nNXtX1KYM4Ro7F1mkJ/bHHRJMfh5SLnBABt
 HlFudM8zGT5aUaUL4ODX39U/4boBkCsvpfNz3DYCz2A6WIKu5ueNcUFFp/TehZDoZM
 Gxm24cozlXLxnrrz/tZ3021sx7D7ZidkkiCtKq9zTZcsMKD4JyD+vLwFxzo3pd7efL
 vfd70I+0pl2hQ==
Message-ID: <71621598266144b34d011dd8e24605ced76b9afb.camel@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Sep 2021 10:34:01 +0800
In-Reply-To: <CACPK8XeWmhxOoXT0XUHkjgygnvvA0Rr0bMRCR-2UVPDz3gEKcg@mail.gmail.com>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
 <CACPK8XeWmhxOoXT0XUHkjgygnvvA0Rr0bMRCR-2UVPDz3gEKcg@mail.gmail.com>
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: multipart/mixed; boundary="===============6731581861601125535=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6731581861601125535==
Content-Type: multipart/alternative; boundary="=-L58J4WHaihcD5X6mikOc"


--=-L58J4WHaihcD5X6mikOc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Joel,

> It looks like the list-id changed again over the weekend.

OK, thanks for the ping!

> It is now:
> 
>  buildroot.buildroot.org

Buildroot folks: is this an intentional & permanent change? Do you want
patchwork updated for this new ID?

Cheers,


Jeremy

--=-L58J4WHaihcD5X6mikOc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><pre>Hi Joel,</pre><pre><br></pre><=
pre>&gt; It looks like the list-id changed again over the weekend.</pre><pr=
e><br></pre><pre>OK, thanks for the ping!</pre><pre><br></pre><pre>&gt; It =
is now:</pre><pre>&gt; </pre><pre>&gt; &nbsp;buildroot.buildroot.org</pre><=
pre><br></pre><pre>Buildroot folks: is this an intentional &amp; permanent =
change? Do you want</pre><pre>patchwork updated for this new ID?</pre><pre>=
<br></pre><pre>Cheers,</pre><pre><br></pre><pre><br></pre><pre>Jeremy</pre>=
</body></html>

--=-L58J4WHaihcD5X6mikOc--


--===============6731581861601125535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6731581861601125535==--

