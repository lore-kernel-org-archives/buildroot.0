Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131DBC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FE74071E;
	Fri, 16 May 2025 14:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWkp507GngHs; Fri, 16 May 2025 14:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C96C40798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C96C40798;
	Fri, 16 May 2025 14:17:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ABF4185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFF12816A0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aY8jL6-fhKK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10DFD8156C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10DFD8156C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10DFD8156C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:17:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8438013F8A2;
 Fri, 16 May 2025 16:17:25 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 16:17:25 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 16:17:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20250514164040.986222-1-thomas.perale@mind.be>
References: <20250514164040.986222-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <04e5c30fa6c85a41f39e2e51d8f1bdab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747405047;
 bh=e6i3V2WYWfOY8oMwlPxSkFRPGEFUK3+qRdEA270Bi/8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TGz7AmXfUn8TIp9gBycHVrOvx+R1oZ0/Bjg+pXi5mff5idk4W1R863R/t9d4yoma9
 zWGgVC2si7bEVFaLEaV2LFlmT7yjKtAvTtqFwE/8B5k3wISslCeGhiI2P01PbO71Md
 zO6bdu3H3LkAyd/FF1cOOuhMQb16JT9Ew4IGXshtm5mhKAhM8KXUP7O9jQMLOvUK3p
 2lyvhnvvxE+AC3ToJhtXclWBTWMXWL2HEwlvgf2IPzJu9omv17TPYOO8uMqjMeHyCP
 2piiNVgdiOe7DoiTRM+u0kh06u+7Q7Y6c1NsF6K4REqmdZBgf2M7An3wvGVlxAyiTA
 ZUBdg/ZPwV6hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TGz7AmXf
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: fix build with GCC
 15
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

On 14/05/2025 18:40, Thomas Perale via buildroot wrote:
> A set of `unterminated-string-initialization` errors appeared when
> building the micropython package with GCC15 on the host.
> The autobuilder failed to build the package micropython with the
> following error:
> 
> ```
> CC ../py/emitinlinethumb.c
> ../py/emitinlinethumb.c:153:9: error: initializer-string for array of 
> 'unsigned char' truncates NUL terminator but destination lacks 
> 'nonstring' attribute (4 chars into 3 available) 
> [-Werror=unterminated-string-initialization]
>   153 |     {0, "r0\0"},
>       |         ^~~~~~
> ../py/emitinlinethumb.c:154:9: error: initializer-string for array of 
> 'unsigned char' truncates NUL terminator but destination lacks 
> 'nonstring' attribute (4 chars into 3 available) 
> [-Werror=unterminated-string-initialization]
>   154 |     {1, "r1\0"},
>       |         ^~~~~~
> ...
> ```
> 
> This patch adds the set of upstream commits to fix the compatbility 
> with
> GCC15 (see [1]).
> The patches were backported to micropython v1.22.2. The main difference
> with the upstream version is that since the v1.23, the project removed 
> the
> use of the `STATIC` macro (see [2]).
> 
> Also, in the codebase of v1.22.2 the 
> 'unterminated-string-initialization'
> error occured in another file that was reworked in the patch [3] and
> included in v1.25. This patch is included as well to remove the error 
> in
> v1.22.2.
> 
> [1] 
> package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch
> [2] 
> https://github.com/micropython/micropython/commit/decf8e6a8bb940d5829ca3296790631fcece7b21
> [3] 
> package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch
> 
> Fixes: 
> https://autobuild.buildroot.org/results/fdf/fdf1d7c3e3a51e6fc7fa5abea57de6c9ce792015
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
