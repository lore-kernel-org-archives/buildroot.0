Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367D7C36011
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15776087D;
	Sat, 29 Mar 2025 10:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rou3z-QpMzRm; Sat, 29 Mar 2025 10:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF0C606EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF0C606EE;
	Sat, 29 Mar 2025 10:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C00D719A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1CE8606EE
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Sy0Yz3Bwhib for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBCB6606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBCB6606EB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBCB6606EB
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:46:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C24ED13F8A9;
 Sat, 29 Mar 2025 11:46:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43680])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 11:46:47 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 11:46:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250328213824.4079072-1-yann.morin.1998@free.fr>
References: <20250328213824.4079072-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <01a8e1db59d558b9467703a0ad6a2c62@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743245208;
 bh=42V1kBRdopmr96NtlPkY3QIRKncmlgZ8esVsZ/u0Db0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UaGU6gdd6xMFjeaceazmiMIK6wuPlgTeWs5WmJca90zrIZNT4V3CwxjkyLtJXteW2
 bJV7rQBTd2qhPNs6h7mO7i84Y5bja9Ya0/Q3GMHXj4lm+2IRfwHfU/OtOSJVEuBLsE
 5aK48QbKDI1BYChSUq0m/ZhbyFujToKAUMJAp0F4z2dx5t447EhKFLwEQd00b+VDIt
 hvR9PlNAUF9xsZjNrdOSa+AX4inaSsiEFHxmyeKwOHleeerDEPu1eEgFXYQtxilKUP
 LI53vU6J+Q+Bug0DkRpabJaPfXnU179HseNBeXK9BIU1d4zsXxiHWYQdKybqoqod2q
 b8JmGZmJWDbgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UaGU6gdd
Subject: Re: [Buildroot] [PATCH] package/freerdp: bump to latest commit on
 legacy stable branch
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

On 28/03/2025 22:38, Yann E. MORIN wrote:
> FreeRDP fails to build on newer gcc:
> 
>     /freerdp-2.11.7/libfreerdp/core/info.c:88:39: error: initialization 
> of 'const WCHAR *' {aka 'const short unsigned int *'} from incompatible 
> pointer type 'BYTE *' {aka 'unsigned char *'} 
> [-Wincompatible-pointer-types]
>        88 |                 const WCHAR* domain = Stream_Pointer(s);
>           |                                       ^~~~~~~~~~~~~~
> 
> There is a patch upstream [0] to fix that one, but then another similar
> build failure triggers, which is also fixed upstream, but then a third
> failre triggers, again fixed upstream [2], but then...
> 
> FreeRDP 2.x has been kinda discontinued, and the new stable is 3.x.
> However, bumping to 3.x looks like a huge leap.
> 
> So, rather than backport, just bump to the latest commit on the
> stable-2.0 branch, which carries 12 non-merge commits with build fixes:
>     562ae3588 [winpr,pubsub] add NULL parameter checks
>     68c7c21b9 X11 client: ignore grab related LeaveNotify events
>     a9deecc99 fix [core]: 'invalid hHandle' errors
>     052c525e0 [core] eliminate rdpRdp::instance
>     be23ed4ba [server,proxy] deactivate capture module
>     5b2b53b15 [warnings] fix -Wincompatible-pointer-types
>     67818bddb [client,wayland] fix const correctness
>     d2b6771c7 X11: fix pointer/integer type mismatch
> [2] 7894a7dfc redirection: Fix incompatible pointer type
> [1] f3ed1f1ac redirection: Fix incompatible pointer type
> [0] 4f411197d info: Fix incompatible pointer type
>     a383740a2 next-dev-2.11.8-dev
> 
> Fixes:
>     
> http://autobuild.buildroot.org/results/e1b/e1b95b4fb0005d4e933b027b508cec9ad510bd73/
>     
> http://autobuild.buildroot.org/results/ba0/ba0beae13e1be2573878ee50b1566f4427b269a3/
>     ...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
