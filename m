Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3EDC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FBB810DC;
	Tue, 14 Jul 2026 09:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ds9NQ051jni3; Tue, 14 Jul 2026 09:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E2B81053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784022367;
	bh=p5B34rWTezN6bmAnI/z1/rQcQl7wKTWZcp2b9SkmDDU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DU3ttEwOA+D2xjIJfP7CMxk7oYPRMicNJ62B6lVJOVdRzVmOtTCHicNke3wJv5WjU
	 4u16vtFeSHXrTzwNRkFdfsJ6SFCilBzD0nnTbUke6bGSzw8rGKY1hFOHNBHuNKV19M
	 zCf11XktxYqabQoxipt2UNkHhwMnscB5lzah5UqGcw8J2T1N9RmKDah8h1Q07HZYoL
	 7exH/H9TvWu6F81EK1rEe91Q8Wck3N69thTnw+ZjymMEZiRxBb0TO096Nt5+uwaoDG
	 pRae87BlZlFbDlKQ4XsWRpKwHTUoFmzLBY0b25ZZJcp1Nbl7DnvTJxEGMl+m1cpBey
	 uIHM//4uff+SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E2B81053;
	Tue, 14 Jul 2026 09:46:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC93996C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE3B8608C5
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxrvrnASRbMb for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAA1760650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA1760650
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA1760650
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:46:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7B7EDB00539;
 Tue, 14 Jul 2026 11:46:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 11:46:01 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 11:46:01 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <akqN5nYTLz7l3S9S@waldemar-brodkorb.de>
References: <akqN5nYTLz7l3S9S@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <0563be4306d0cfb021654b15559a82f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784022362;
 bh=JjYi9DL0qISdQ7o652kvu/CWRXumydi6WXK9+Mq5FNM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ULffvkONVk8osD81c+oRMLZknuUyBVlP8xDXnqK0rxQmQtGl0XrxZyujvBHZvNQGo
 1HtmL01Iz0JVfSp5C/oN8Eqf3uKEcFABgpPbe7SYh7raS9MdAqr9M51pqSyj9ZIg6f
 hW5eiVzqkV54oZMSfSu4tGaPj5EEaIt8TFw+l/M7uIqqFfi7v5ydZOTEKINC8svQLM
 8dmRd/9b2ciA6JUe5vzvZIqoms47LKGWfbkFuSH+tnp5g3CwtfHLeTa7mIKqrh39lp
 mdu1ixS4btgmc5sj4z1y0NTuxB0Pfqbfy0TuD/qUFUXo3Ih1zc0hu1erEXXVyvTygy
 Ekjpp+3dYDu2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ULffvkON
Subject: Re: [Buildroot] [PATCH] package/stunnel: update download site
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

On 05/07/2026 19:01, Waldemar Brodkorb wrote:
> Fix the download site, which seems to be changed after
> a new release. Use the more permanent /archive.
> 
> Fixes:
>  - 
> https://autobuild.buildroot.net/results/a1a/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06/
>  - 
> https://autobuild.buildroot.net/results/b3d/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
