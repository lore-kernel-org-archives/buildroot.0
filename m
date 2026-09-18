Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56336C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C2460C23;
	Fri, 18 Sep 2026 17:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_6kkvZ2jdg6; Fri, 18 Sep 2026 17:02:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2927560D62
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789750962;
	b=ZqSyK9KCGmBJpMuxXt6ZDc5t/uQd/uQRtim2EElD8KWuioVGE2UWX+GpiHpCqSOzCwZK
	 eXlEONBaMH84GYHxSAaJEFnK/lcnUa2yQ+fRZ2LA1iKosMvNS4bgDHyB0FuJ650ORtcka
	 /r9aSFLAp8FdIyFDAUKuSzLXxUY6u7JybN3bzZHgHwvokk7QQWD40c+DBnZMa9QmYxn49
	 uOYxTMAGmgOY3Q3LqyOQ/wmsnBBhd9brq3r8z1zbwyD9ZY29OInE086QN9w6xUoTcA8/t
	 Gi1MisB50b22I3WMuu7ec4aejyXvPJcw5mTzZr+eJABHHjXqsM5xNMGoKXeSaT9qPrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789750962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FFDKyzJb8uwXO5haK0Slkfqe5/M1+VKdZubtydYhqCA=;
	b=AXICQ2mDkUCXAOTvC4tD2wvut5qY59j0Q2owBCUp1vCq6ypktoIyN8aNZ36DAo/UWzxV
	 SlykEdf0nSGsSq6U4uAi7cHYKTHgbIWYl0LH0b/Mot8IhvzWzZdGMG/NvfD3hwArC1Brk
	 ybqxe0mRUCsQpbNPENm8BLImeWm8pjoqhEOuF+GV+fnu3ogZ8OUlMaia9l9l3m3QGUqSp
	 m94pOcJ9ogiL8THETm+ojVAef6vsK3SWAsfUa7fLcj+YPn1ue71n2whjE+bvuBtEk/9dz
	 O3XkMyp/gH/tOv3DVegrFCMWrJRMj9Dw2VAhG72Rt0QhA8OPPbPlA4ozwMqmY+ldczQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789750962;
	bh=FFDKyzJb8uwXO5haK0Slkfqe5/M1+VKdZubtydYhqCA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T7LaRo6698tEW+arX+O2A+OnENVewwDDyeSlWn+LVuBDrWIkjHf5IETVruV7qAjq1
	 VF/BAnvqp5WfgD/Fd30m79Hzn9YnF/P8kFXWLqbxfisOKKwAnm9cqsyxbGCMspXVwc
	 xKVUme/IfCSgzAGWowfZ9VTVb5zipEDj5pxcUhsxh4w5kxx9r/nGhPgcIpj3kzSNqu
	 njRYZZEUNV44HP/ERtXivhh74dSNO3SPhyUvCZeLYd+C3NNzVKnAq9KAytaLKtI0Mn
	 ix8vjhi4iFq9J5MQE/u21hIvuUz0WTJ4IfE/vPn+GiVK44mOf80CvIsnj8WEOEDpce
	 GzwH2S042OASQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2927560D62;
	Fri, 18 Sep 2026 17:02:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A37B13B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9560D60D62
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FynIvnkxovv0 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:02:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 83FA460C23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789750959;
 b=an9riDmJkY8wZUZRIhHwx4mI4VVIQsITP1VQRLWnm8D//d/n+T2XQlV38z2nFcN2GCld
 Io3edzChoGrJAxAieb3r8yrKh1alVmY4Kt69kqMyFkSJvXnak36KgSV/c9Zq+rIgYr1hu
 C+uzTxwFK29NBqSsfrJw7wscFOHedc3YsLfjB5o4050QzE3FdVuj24F0SkFTzqp677RWw
 0Bg8O7tQLCd0HRHwlZTqZ4to57m7umovTq0hRyH2ZMUHTJvp6/4X6MiktIkrUHzG2nnGO
 +BqmjYqSZR5VUid6V1wHeywaZhv/VSxHgBKiip0PbdqCoD1UB4V6fJTdNuNwdX08ACQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789750959;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=65L+npDoT99PmWyMKQkt4JvWUXCLoa0CwEwFq9mwX9c=;
 b=JrwFoNwUSICLnAfDTlJxoERlXcy0ZLPOZd1yRYCimohiPy5TAj940CERkj3aXNee5a2U
 1L4laqxfF4XBk1XFQCFQS9ijDdHmG8EGJurzkyfcbHHLyY5D5mjXatFEqs5nR8L897o99
 I3Kkifa6wH4SzfJ14zYiOVkoWzbX8V+myTrKmd2UK48MwBHyq52iLqLzTUum/4vSW9xxI
 4VFynxUV1pWtpSI/P2O0BDdqlDyoPF/U0ZgX1X/v6IrhiuDq9F6yQguZLJBLK28n43FJt
 T9n4TPEc+vl1htU8ik9oMX0VlRgcabgpC/y7gUFcf8BxzF2lYII0/WBRbfVhzP/SNOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cd4olGFq; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83FA460C23
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:02:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AFC2219F5A5;
 Fri, 18 Sep 2026 19:02:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 19:02:34 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 19:02:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Stefan Ott <stefan@ott.net>
In-Reply-To: <20260916183948.4069138-1-bernd@kuhls.net>
References: <20260916183948.4069138-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <15fa167359efbdf957b607d283698991@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.26.1
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

On 16/09/2026 20:39, Bernd Kuhls wrote:
> https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-1
> 
> Fixes CVE-2026-81642, CVE-2026-81634, CVE-2026-82717, CVE-2026-77955,
> CVE-2026-78227, CVE-2026-80225, CVE-2026-82720, CVE-2026-85501 &
> CVE-2026-77860.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
