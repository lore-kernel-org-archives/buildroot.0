Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76059D68BD2
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 10:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADFA41E7D;
	Sat, 16 Nov 2024 10:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cBZ3Pq2AAm7; Sat, 16 Nov 2024 10:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FC741E81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FC741E81;
	Sat, 16 Nov 2024 10:29:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D64BE1EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF228402EB
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQqejnA95RWd for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 10:29:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AD2140289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AD2140289
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AD2140289
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:29:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2EC8019F574;
 Sat, 16 Nov 2024 11:28:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58196])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 11:28:56 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 11:28:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <rdst6ihihplrkwh3gmueiwb3ge5q5kzamczdsi62qsenuijhbj@n44frqrgrkcw>
References: <20241115224753.1074295-1-ju.o@free.fr>
 <rdst6ihihplrkwh3gmueiwb3ge5q5kzamczdsi62qsenuijhbj@n44frqrgrkcw>
User-Agent: Webmail Free/1.6.9
Message-ID: <6c73b165f5bf165e5d63633a25dd6087@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731752937;
 bh=mRa+uRDGj2wXyHau2Z8fSe0sRkkj78Zq10IsXXUuf8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a4hNzYl7LdneokBQ8fZjAYGEPTU9y+Jdi8qZlmnT0lsbN/sPQJdkOXwQKxw04MWeW
 jvGIiXNTBIadTkvEdDGMjjooaZXXGL/vPs2M1oM1KRzTSgu6f744S0bYHYi6nhPbt4
 sj1iya2P9qVxiYfloaYE+iqQoQlUxJYa7+zEnLPsa5GYc2tFYgo+f9uwh0pSIrZhTx
 42wLE97wmYo8Jv4M/vJz7zOcMjRJta99yGwRspnVIcU1VFvRsEs+u3KlGgU2k7qZmm
 vAwP9kGr9UFNj+OnAOm/tFOZyDXvLBp4deqEoZaAI0FYxh/iUIXEJOuk/ISnFm6mW7
 yVUlxBjnTskeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a4hNzYl7
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new ltp-testsuite
 runtime test
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

Hi Vincent,

On 16/11/2024 00:25, Vincent Jardin wrote:
> On Fri, Nov 15, 2024 at 11:47:53PM UTC, Julien Olivain wrote:
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>> Patch tested in:
>> https://gitlab.com/jolivain/buildroot/-/jobs/8388435290
> 
> It is a very good idea to run LTP. How can it be extended to be run 
> with
> more CPU architecture ? To run some wider set of tests ?

The primary intent of this test is to check the Buildroot package recipe
is able to compile the ltp-testsuite correctly and install it on target
properly to be functional. It will be also useful when updating the
package.

This is for this reason I propose only one architecture (the default
armv5), with a very limited test set, to make sure compilation and
execution will be fast.

Conversely, this test is NOT aiming to fully test a given Kernel
version on Qemu. Buildroot is already testing that qemu_*_defconfig
are booting and reaching the user-space login.

What did you have in mind exactly? Testing more extensively a
specific defconfig? This could be done outside the Buildroot Gitlab CI,
for example, by a defconfig maintainer?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
