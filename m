Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37915CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78333407E0;
	Tue,  6 Oct 2026 19:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4AWq5w7bel7; Tue,  6 Oct 2026 19:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2C6D3407B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314442;
	b=WuMLxp9QtC21CQwiyA6XJAqamzMbRDooQcgbPWyExSdn2s1xRfkOq2l3E8XNtHXuVKaT
	 mGDrovDbL7NuPmKxopw+tmJ4y7uk0zz+9UF0+Qd5yToH7d2rvj9eqZNfP4FfMJjg8Hctb
	 Ld3wEX6K928exiMnCbkq9mEYEZt7ZEV83V7Nlz7fxAXjKxN0Tt4pKCTMaf0l+L5H5M5aS
	 DBHYC1ZYvu319doUrrAhGDcZ3QAHqd40ELdpunIDJ9VhTxEmjFEynoxhRSe25pjgfUA7z
	 3jWBR//3AE057KeOmTMGnEjbsCGzGjYajJyu5ttx7cy6Py9qyQU754MzWHkzpkrSoeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=bGkh84yV2h2rjwaoyCtAPeXNXy7eUrSxXuxOGD7iF5o=;
	b=DUz4HhPC7WPMncEYNrzyNr/r8VnEKlwSpfQTpHwWSJMvZoHhNgvPLFVX6GYPjMRGZtrJ
	 A21+jmYPpRYrIZULJvXAq4iOMCzWrc4ZEyy+D74yxc+3sB9hTu67qnwLcRW4pddm7jjcU
	 82zu94/glqp+q1tW/4rzhjuM9v+X0Fs5Oh4sXnIECFgk+OjdI2uTm6x8SLZycPOoqrwaI
	 8hRs897RIJLG5YZt6X9iV2+KxJjHnim+mzE6T2k/9mmQmTIK9zCmFOLrbdOMSm09mHOQr
	 JALmersF54nm9KuiFW85lzb2Mo6wzxbJoAO0RUHHCgDSB95PqFl9Rcu4JPop/+14KEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314442;
	bh=bGkh84yV2h2rjwaoyCtAPeXNXy7eUrSxXuxOGD7iF5o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SAspz/u09Nrhk8QKyUGmXyNbfFKUZuqWC05SMmReWm5LlRmArlIYdkWgMfi90F6z+
	 fCM4rH5dvo3pltYVL3NgOD+RxR/dMuuDco+HdD4qpBrsHBVR+Qqk/Rn/TtIUxrfoRa
	 sInjK+6aEug1aatfym5P2YRKlLJ+Q0shKRtjTj4Vk/uhU4H2GAJHMHSo+/P1sISW/K
	 /Vcznpi+C0kYU67gTPUEUnX+jb9DUaA+L5jvHwPv7qw644XnFpdhuc5zRroDl81x4p
	 m/mvl/DNos49w4DxmtXUSf9e88otYCuM2XK8fMDNgm/QbxfdEhvs27Mj1k9AjzT38C
	 zJzXjwaVJAeVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C6D3407B7;
	Tue,  6 Oct 2026 19:20:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B43F01D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99EE180EC2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_HcEGffFDBg for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:19:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2F5F780EA8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791314358;
 b=GwoW3kjGjXGJnFCZB044BStpClFeyJFrWYgGzQ3ypb7+OHcsRCqqsMp4QEkx7eiwOLVp
 59uqFuJcXzBq190DrXS9+VSCOkDlhIYBaz+fmnMwWhAlBNzUGaKbsqOsxfgudW5QYoxL0
 pxBvbzDMQwgr/xmxjVYdu6f8FUkoQs9Kfry6ecdJF/7kGZ3Q1VlJZneQ1jn2lszt9Gmmm
 M/8V96ikLmhB5a7RJjSC8O0pBB7y9tFHq5wq7gjlDOxb/UF3tt+mkASZ6TfVahKaIi7hC
 Vmkm9M0WHfv80wQA72kNjNGsa3qDTaSB/pT8oqAElnrthqo+R6N5FkaAUQtemaW6zGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791314358;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=qJBupG6jJD0W9lAARJwb8X8IyVXD1tUHT8L96kWuVX8=;
 b=gJmu2dVp9ZhmV9I9qHnZQ9aT1BvAwBt6vZsVVZqgKE2RaRkv2ie5sswbR+eVtlGowB/t
 4QX4Hkzfqk5Bm50pIRHhavtAEWbGZrovCjiYDF7rjPH/sDXeH7WaiiRqH33ugebe57lwn
 rr+dsE3mBb/CnYm2rYb7GW5E0CAlnB9bqzWcawCAOgj90xepArLTEF1feBNggmDhf6ilG
 8cw/0G7Za9ZYUvm8ZEHGNOIOPfYeUCHYznEQfoI8ieaSHZCM+eGn+pOFBYj+D+w91n12L
 iOBHcNQsRrNztoP1ClheA19GGHHkgSQH0CMZqrj51d97OFrnqM7nY6dG0q0pA2LrQbQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=p8YBk8pQ; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F5F780EA8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:19:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D02D92003CC;
 Tue,  6 Oct 2026 21:19:12 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:34572])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 21:19:12 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 21:19:12 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
In-Reply-To: <20261004211651.40a998e1@pc-1>
References: <20261004145950.1387519-1-ps.report@gmx.net>
 <asJz0OE5k0gQODfW@windsurf> <20261004211651.40a998e1@pc-1>
User-Agent: Webmail Free/1.6.19
Message-ID: <e623dff610be3fb4704522305d4bb1bb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/gzip: add upstream patch to fix
 build for aarch64
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

Hi Peter,

On 04/10/2026 21:16, Peter Seiderer via buildroot wrote:
> On Sun, 4 Oct 2026 17:42:30 +0200, Thomas Petazzoni 
> <thomas.petazzoni@bootlin.com> wrote:
> 
>> On Sun, Oct 04, 2026 at 04:59:50PM +0200, Peter Seiderer via buildroot 
>> wrote:
>> > - add 0001-build-avoid-failure-to-build-on-linux-aarch64.patch
>> >   (from upstream, see [1])
>> >
>> > Fixes:
>> >
>> >   In file included from gzip.c:61:
>> >   gzip.h:120:21: error: expected ')' before '+' token
>> >     120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
>> >         |                     ^
>> >
>> > [1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7
>> 
>> Which version bump introduced this regression?
> 
> The bump from 1.14 to 1.15 with buildroot commit
> 
> 	fe21a5fe30 package/gzip: bump version to 1.15

I applied this patch to master, by adding this extra info. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6262b9c5bdd50dac61aa68dd980c4e585c2ff60a

> 
> Regards,
> Peter
> 
> 
>> 
>> Thanks!
>> 
>> Thomas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
