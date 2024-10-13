Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85796CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 09:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18ECB81BD6;
	Sun, 13 Oct 2024 09:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSdnDmR_idoy; Sun, 13 Oct 2024 09:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A33A81B14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A33A81B14;
	Sun, 13 Oct 2024 09:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDE2A1BF37F
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 09:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7025401D8
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 09:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6tB-cRnGwb5 for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 09:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48F774000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F774000B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48F774000B
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 09:00:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0FF9013F86E
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:59:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Oct 2024 10:59:56 +0200
Date: Sun, 13 Oct 2024 10:59:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Buildroot ML <buildroot@buildroot.org>
Message-ID: <ZwuMDPcgFOLNVRqn@landeda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728809998;
 bh=EDPe1+ucCpctvHDRy6VqfE1gid75Yup6wLM0LUONRJQ=;
 h=Date:From:To:Subject:From;
 b=h9wut/8I/ekCL6RLd/zMIU4dxDJpFi1akskOutHxCA/6PPajBIX0RIn+JG4TU8EY/
 e+0ghQAFzgNn6TfUyFgOUyBwkPw6oRZUs0yJuhuCu+KWU+n6JvgvKcRTpeY1LuoglT
 +18tqU/WziencMfQBwZ3mhFTWz/T3pbAzVRmDS0KDzBn/O8G7h0jSaS7hveTt2tQ8u
 XPKFsKl0fliYEgNKqSzDB5NzsfIfP2PZkBn3rP4PctKKT3RD3N6yM13KQhSoGmnF15
 v9JXZYUsPIbFFNWOwOkEn/Od8oSjCVx8dTc3czTYQ62Cgl3/YQDa5JF1h4HVD8RRNl
 O6QYXgoEKRwNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h9wut/8I
Subject: [Buildroot] Resigning as a maintainer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

Events and changes, more or less recent, both organisational and
technical, have made me reconsider whether I should continue
contributing, interacting with the community, and being a maintainer.

I've thought about it quite a bit, for quite some time now, and I
see now that merely asking the question begs only one possible
answer: no.

As a consequence, I have resigned from my position as a maintainer. The
other maintainers have been informed of my decision a few days ago now.

As for contributing, I don't see how the time I will regain from no
longer being a maintainer, could be applied to bring in evolutions to
Buildroot given the circumstances.

For the time being, I have no idea what will replace the many hours
a week I was spending on Buildroot on my own time; maybe a future
personal project will require that I use Buildroot again, but until
then, I will no longer be an active contributor either.

I will still keep my entries in the DEVELOPERS file for a while, so that
I can at least try and help fix the mess I leave behind me.

I am grateful to all the contributors, past and present, for the many
years we've been all together working toward making Buildroot better,
and building a great community; I've learned a lot along the ride.
I wish you all the best with your continued use of Buildroot and your
future contributions!

Peter, Thomas, Arnout, Romain: I wish you all the best in your future
endeavours with Buildroot maintenance.

So long, and thanks for all the fish.

Regards,
Yann E. MORIN.

P.S. To avoid any future confusion: this is my own personal position and
decision, and has no connection to my professional activities that may
be related to Buildroot.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
