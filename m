Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F673C369A2
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4AC80DFB;
	Thu, 10 Apr 2025 19:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VKDPTKAnlsS; Thu, 10 Apr 2025 19:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514F4810A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514F4810A1;
	Thu, 10 Apr 2025 19:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95430138
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A9C3810A1
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Psae--3dwENW for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FF7D80D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF7D80D4D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FF7D80D4D
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:30:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C8D72003DE;
 Thu, 10 Apr 2025 21:30:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 21:30:39 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 21:30:39 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250409171044.775633-1-thomas.perale@mind.be>
References: <20250409171044.775633-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <86df83730e21a394c0a2a75c6bcf03fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744313441;
 bh=nSiJA5Su5BHCn5oNW3YD2P2aeLACo0gqK7rNwEH3FsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dj91zk8m4B0x31Ivuygew4GJI41/Wn8Dnyc98zJe9rJIBIfsSDU4HXP8ZAAi3bTQZ
 WUY3WxmKnCWwCBPmsgsv/YEzOUTVjXOKnrDciI6xvfn6EwXnXRfuLGszJfcNHOeWyt
 E/WXYLGw9mRSPkZvcZvGwh93z5c4C5t4CGk2qnMwSwXkPjr79NdKyjNqtngdA14/So
 jte+j/xilNwd4RWtcvGHQQfyC+kFovTaDjw0uwa24EaonmVWhYh7ktfRHKwdpdmsCl
 rwzsMgp3V9nTdHva5uvVrfdrJ8CwfQT4tmWiCqxkP9mOvVBjRkoijPSulLCYucPEUS
 9qFHdtzGLFO8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dj91zk8m
Subject: Re: [Buildroot] [v2 PATCH 1/1] package/python-jinja2: security bump
 to version 3.1.6
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

On 09/04/2025 19:10, Thomas Perale via buildroot wrote:
> Fixes the following security issue:
> 
> - CVE-2025-27516: Prior to 3.1.6, an oversight in how the Jinja
>     sandboxed environment interacts with the |attr filter allows
>     an attacker that controls the content of a template to execute
>     arbitrary Python code.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27516
>   - 
> https://github.com/pallets/jinja/commit/90457bbf33b8662926ae65cdde4c4c32e756e403
> 
> For more details on the version bump, see the release notes:
> 
> https://github.com/pallets/jinja/releases/tag/3.1.6
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
