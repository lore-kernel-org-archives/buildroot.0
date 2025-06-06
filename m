Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450A2C61CE7
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 18:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D2885068;
	Fri,  6 Jun 2025 18:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hv6EmhdTJEys; Fri,  6 Jun 2025 18:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3811685063
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3811685063;
	Fri,  6 Jun 2025 18:01:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EF21F2
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 18:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 464A781280
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCgztrDoYHgC for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 18:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 431C685061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431C685061
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 431C685061
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 18:01:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1DD3A19F54D;
 Fri,  6 Jun 2025 20:00:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Jun 2025 20:00:57 +0200
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 20:00:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <aD1K1vCLJt7/3/i4@yd-6wlzhs3>
References: <0cc8c132abc7f2117de95906fc1ae4729100c564.1748355369.git.yann.morin@orange.com>
 <7c0c1993b8789a5c5e2af275c8dc9882@free.fr> <aD1K1vCLJt7/3/i4@yd-6wlzhs3>
User-Agent: Webmail Free/1.6.11
Message-ID: <2a3ddf239d7e5422e401019cb91ecace@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749232858;
 bh=88OnIcKWyu4sOdliDZ8BPLC/VAJa6KNMnA14mPBRL/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=agJbtKra/vN/yiFYMYK3CvzskkWd7Ssy90gVrSU133bRiNgdkC4XUqrBzXApPjD+F
 /57TrcdhFZN3unZfdYyRZubYqX4MNGOYc8t8ua5RZGwRR4P7cYufksQtSylfwNQvRQ
 fn+S/ak0ss/QWbhvm+V+ujSVMgBTFfpSJTuv3U62oplh8NKPAqPkK2V2FXyFp6iDHG
 6Zwk0eqvAUBQVscc1nkf0F+wcDMx+wnPq1Td8QEwrFgWLgdI5BMoP+9qisGKoIW31H
 bVTvnCZkOpHIwR/rW8YjGm7StHjWhif+V8dxX+d91yvnPYu/VPfYVyQZ0LengudeBf
 IYb0IaXapmwog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=agJbtKra
Subject: Re: [Buildroot] [PATCH] package/gpsd: bump to 3.26.1
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

Hi Yann,

On 02/06/2025 08:55, yann.morin@orange.com wrote:
> Julien, All,
> 
> On 2025-05-28 22:56 +0200, Julien Olivain spake thusly:
>> On 27/05/2025 16:16, yann.morin@orange.com wrote:
>> > From: "Yann E. MORIN" <yann.morin@orange.com>
> [--SNIP--]
>> > -GPSD_VERSION = 3.25
>> > +GPSD_VERSION = 3.26.1
>> This new version fails in the gpsd runtime test.
> 
> Damned... I forgot about that runtime test...
> 
>> There is
>> apparently a change of behavior in "gpsfake" in UDP mode, which works
>> for the first client connection, but fails for subsequent calls.
>> I bisected this behavior change to upstream commit:
>> https://gitlab.com/gpsd/gpsd/-/commit/5c080c35fc3d981172a5e4af34d0d92854a5433a
> [--SNIP--]
>> Do you think this behavior change is an upstream bug?
> 
> Definitely.
> 
>> If yes, it would be nice to fix this upstream. Otherwise, we should
>> slightly modify the runtime test (like removing the gpsctl invocation,
>> if gpsfake udp does not support more that one client connection).
>> What do you think?
> 
> I'll open an issue upstream, but last time I did, err.. Let's say the
> experience was far from thrilling... But thanks for your simple and
> obvious reproducer; that will hopefully help.
> 
> We can switch the runtime test over to TCP mode (if it's not broken...)
> to workaround the issue in the meantime...

I tried your suggestion to switch the runtime test to TCP, and it is
working around this bug. So I applied this patch to next, including
this modification. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9188bf42e4e9adde2fd71242843d9207b33c786f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
