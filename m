Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E92E7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 17:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D2E81F82;
	Sun, 22 Dec 2024 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Afdao0iqEVO; Sun, 22 Dec 2024 17:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A5781F80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A5781F80;
	Sun, 22 Dec 2024 17:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1A85E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1241A81F7E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-pQ2IB6166f for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 17:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EDEF81F80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDEF81F80
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EDEF81F80
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:20:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1A4E32003F2;
 Sun, 22 Dec 2024 18:20:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45116])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 18:20:38 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 18:20:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <4bd5b931-b405-4b17-9e58-b637e4a49afb@korsgaard.com>
References: <6764f1fc.050a0220.142ef5.521b@mx.google.com>
 <CAGm1_ktiWPLOXr6cTGyBxiywHk1Jy8hNKhyS+Vb9dsebNtiqSQ@mail.gmail.com>
 <4bd5b931-b405-4b17-9e58-b637e4a49afb@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a81d287ec24eb47ad57dffcb5ef75d42@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734888041;
 bh=lF6FtfLWS6mvWOYyEzr/P0Mpjk/VmvNI3vGwHp/cSiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kjb6CnW3RB26R5xOFX1nu14fs0Fx83xXmwQCVbZd11kYCeLFkVtSQkXZiukfnFBhb
 x9mRwvoATinnSuwTJ6HsyA5V0UL4zMTDnMU3xKC0KmIXCd+Q5RNfpDFyzJJFa7QMqI
 aqRR5X1pf4sdlM9D1zkUOKzYI/8IrjszkRdHPH4WaLlI/AGoqBDZM2koBRXJoizpXM
 /VM4r0TPgKUCnK+5WIhj509d29r/a9KbXnNEVYPJDkQavKNWUOq+GXgggg35s4NvKt
 f/9IdGWvGQQv5YZr/AKn/EIg9BvphjezV1KiaBR/MWGlTrp2//9Udq1EefOB7q4Fgs
 xMCkXa23bnfDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kjb6CnW3
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2024-12-19
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Yegor,

On 20/12/2024 10:52, Peter Korsgaard wrote:
> On 12/20/24 09:56, Yegor Yefremov wrote:
> 
>>> Build failures related to your packages:
>>> 
>>>      arch     |             reason             |                      
>>>                  url
>>> -------------+--------------------------------+---------------------------------------------------------------------------------
>>>    riscv64    |   host-python-greenlet-3.1.1   | 
>>> https://autobuild.buildroot.org/results/6e47383f00b224ddc3be5e56c92f774d79496453
>>>     x86_64    |   host-python-greenlet-3.1.1   | 
>>> https://autobuild.buildroot.org/results/d369c28aea66d1fbb73fbe5817c50a2ed7ef7df6
>>>     armeb     |   host-python-greenlet-3.1.1   | 
>>> https://autobuild.buildroot.org/results/2a41c2d71b51699f47341a0bfc28f50e3d4a32cd
>>>    aarch64    |    python-autocommand-2.2.2    | 
>>> https://autobuild.buildroot.org/results/02670424fd44f10b5ab07f4318172cf0e125debe
>>>      arc      |    python-autocommand-2.2.2    | 
>>> https://autobuild.buildroot.org/results/e33b405df913a0f9ba7e706ea68034186a62af1c
>>>      arm      |    python-autocommand-2.2.2    | 
>>> https://autobuild.buildroot.org/results/7dc2d73b124fdbf1e8560857f53d9c31602e7e12
>> 
>> Solved via 
>> https://patchwork.ozlabs.org/project/buildroot/patch/20241212070845.1623350-1-yegorslists@googlemail.com/
> 
> Thanks. Can you add some more details about what triggered this issue? 
> Is it related to a version bump of python / setuptools?

For info, I merged the patch from Thomas [1] in [2] which was containing 
the
information you were asking.

Best regards,

Julien.

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20241222162615.1872897-1-thomas.petazzoni@bootlin.com/
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/621ebccf3f1ca70443160103ae12ab3ea89f63bd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
