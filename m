Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160B4C6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A94E840AE5;
	Fri, 29 Mar 2024 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4PqXbI3Ci8o; Fri, 29 Mar 2024 19:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980D0408D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 980D0408D1;
	Fri, 29 Mar 2024 19:54:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB3E1BF36C
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 19:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A84822EE
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 19:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlB5Jdlai5Yq for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 19:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBDA9822EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBDA9822EA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBDA9822EA
 for <buildroot@busybox.net>; Fri, 29 Mar 2024 19:54:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 98DAC13F88E;
 Fri, 29 Mar 2024 20:54:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Mar 2024 20:54:07 +0100
Date: Fri, 29 Mar 2024 20:54:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZgccX_OQrsUXyfIO@landeda>
References: <20240307165218.10027-1-ps.report@gmx.net>
 <CADvTj4obpt2KevT7pCZ6j=VdOefb8x-iU_-NLRJOVz_MS0Ng1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4obpt2KevT7pCZ6j=VdOefb8x-iU_-NLRJOVz_MS0Ng1A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711742052;
 bh=MQC0ovsx1qHNtHiQGcoEMIaq9664LC56p22nzPWf4Bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2c+qp1oW5Lb4rFZf/BF9iHayS6Xz4RdWgXz/UUbY1aUulRmmAvV84XQLpCCkETEY
 dYzNwm8tE0bXFpJb9sQx+QATDQ4zU21PZuQ56iQ/m78LclWv2mIOdhoR6RvXtDGuCx
 nXYHLxyAAU2bXvKknzyG+Y7ceCCV5gwvvlae8HFuXzl2SJ+JFuvSlyTqE+iv2+O8q3
 7gkDYaA6OFbZMxcEWnX0km1E/4aTYXgss/mVrS5DXQVpbOp9cf85v/xs6bCWFCD8Zx
 YjGEukF29EI75+ZXAhxIvOx1u7s097/ltfvft3cUKR1SJj2ssyCRTuMmAwDtxzNfbr
 8tM1bejpgRlAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W2c+qp1o
Subject: Re: [Buildroot] [PATCH v1 1/4] package/xz: bump version to 5.6.0
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, all,

On 2024-03-29 11:21 -0600, James Hilliard spake thusly:
[--SNIP--]
>     -XZ_VERSION = 5.4.6
>     +XZ_VERSION = 5.6.0
> Is this version backdoored?
> [17]https://www.openwall.com/lists/oss-security/2024/03/29/4

Wahoo. Just, wahoo... thanks for pointing this out, I've marked the
series rejected.

I've been reading on this story, and it is just, well, I don't have
words. I'm stomached.

Thanks a lot for pointing this out.

Regards,
Yann E. MORIN.

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
