Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C5EEB48F0
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 09:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD9160B57;
	Thu, 12 Feb 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQujUw6A9Nvl; Thu, 12 Feb 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B95E260815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770890329;
	bh=2kb6DME9M1bU9gCnUxXXh2k8bzS4jfDBn3r6ELqAYF0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=gpeJbywodQy7giKDhgQby/SwU2JuJmuKWSn3y0v5R5K8LgjFVPmtEVdL+MQWPVbT1
	 6khVDmAy3nbwQwnx+CA370AQ5AhGSFoOgLauPoDDN5Slwikpa9coGQAfTOla4K7CrQ
	 Uua7IgIzyLX3WdYCJivt5i2H2e9KeZS5KMqvigec79F+PPH8IzSkRgiDiJLnvunBu2
	 vnXHR5fA1PkL71a/ywkJ2kgz0WTmVELmqaITEYXrVC0Xl8TZwYz0H/HVKhmbFLBPtN
	 wYfaTBQTcooob42sifP2K+tkhtmYdo/v0OAcVM8ZXtbB/ykiUWyNqv3nazCkMjiUvU
	 z/j3r/yRLTAfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B95E260815;
	Thu, 12 Feb 2026 09:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EF8BE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B889083CD3
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBZhafNTDPqW for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 09:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9E5381E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E5381E03
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E5381E03
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:58:46 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EF4CA2C831BE;
 Thu, 12 Feb 2026 10:58:43 +0100 (CET)
Message-ID: <7955cd2b-9c7d-44a8-964b-62d9f6305b3c@bubu1.eu>
Date: Thu, 12 Feb 2026 10:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>, 
 Thomas Perale <thomas.perale@mind.be>
References: <20260210154501.05EB784212@busybox.osuosl.org>
Content-Language: en-US
In-Reply-To: <20260210154501.05EB784212@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770890324; bh=SpIfa+1fJxnCC5PLqlZvVh1asgyzqvrTjrYKXQBdyi0=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=tuhU8wGwBqppbP7oJXt2u7WihDgqx8UGomc6eLM+uRHVvNyWnNuHIpCOOBYfag6sP
 5/t+pQ9WwidoUyMe7OZK+0C6hh7n60C2Cp1tWVo1RLtRZR4jwv1jpt9jwfp2HC4200
 Ix/AJ2Wy8WJ8jSXZDo07oMiTM49QsJWgC9DOtQfvkMJ2mRQqSLWXcHcbw8irw13c8s
 yjtHzUAScEgJEQrKO1CtF6lD9cVxaDM+8GqdblKL7TKS7o88WgmGox1fZ7WAnbfGBp
 KSwS5qbZ0T03Ayl6wuHYcwtQGCtHxsxhYz7FWImOCMukcwShmE2YXEdT73xzR2R3mV
 5IWIWl0ymClEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=tuhU8wGw
Subject: Re: [Buildroot] [git commit] package/m4: bump version to 1.4.21
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan, Thomas,

On 2/10/26 15:59, Marcus Hoffmann via buildroot wrote:
> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/875d6aedbc639484e9203c5bcda1a55ecb7ad4c9
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html

We probably need this in the stable branches because as of today 
archlinux is shipping gcc 15 built against glibc 2.43 and m4 fails to 
compile before version 1.4.21

 > [...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
