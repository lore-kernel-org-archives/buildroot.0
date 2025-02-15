Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3A9C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE0C2837C9;
	Sat, 15 Feb 2025 20:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnm9s8zDydgP; Sat, 15 Feb 2025 20:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052058381F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052058381F;
	Sat, 15 Feb 2025 20:30:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBE3DDF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF86B60891
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9PF7UcOAZ8w for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 20:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB3DC607A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3DC607A4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB3DC607A4
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:30:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B96BD5FFAA;
 Sat, 15 Feb 2025 21:30:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 21:30:44 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 21:30:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250215104928.150001-1-peter@korsgaard.com>
References: <20250215104928.150001-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e440a51acca737b83a00ecce158570a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739651447;
 bh=PCnsIuSGZz0nc6dj49ZfUbnMvKtCzK9AR0r72hJZIN8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KEjAINdB3aHoUrai9EhsHFKpwyct9GgR4W56XkmJIMqKjaQlVdXsWydZviNjE5YPJ
 HRIPUl5tK8R5R4wAgvIooqD6+Ko9euf7/KV3uGEim0xI1mx9G4vJ5x2h8wURe9Z1Md
 lrE0ql+tzGr6pCrg39GmphA4W83cOY5qP5VgaYsYehZoxbR409iYmnhNp9mmYPfDQ9
 Mb8Kp9Pit1Ef0IXne6VUsXjXMp2uOOWJj5t9jYTPShWaG0404LLOjkWtUGukZJ7kOt
 hEV9LefKSLQCZdbJWUroTs8Wmh9hUdOZxU5WrmAAqaiJwQyhMFi5deEGHR6cov9Hs0
 z7FpoAbHTI7ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KEjAINdB
Subject: Re: [Buildroot] [PATCH] package/mpg123: security bump to version
 1.32.8
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

On 15/02/2025 11:49, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2024-10573: An out-of-bounds write flaw was found in mpg123 when
> handling crafted streams.  When decoding PCM, the libmpg123 may write 
> past
> the end of a heap-located buffer.  Consequently, heap corruption may 
> happen,
> and arbitrary code execution is not discarded.  The complexity required 
> to
> exploit this flaw is considered high as the payload must be validated 
> by the
> MPEG decoder and the PCM synth before execution.  Additionally, to
> successfully execute the attack, the user must scan through the stream,
> making web live stream content (such as web radios) a very unlikely 
> attack
> vector.
> 
> https://www.openwall.com/lists/oss-security/2024/10/30/2
> 
> Release notes:
> https://sourceforge.net/p/mpg123/mailman/message/58834094/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
