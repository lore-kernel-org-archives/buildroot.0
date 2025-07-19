Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCBDC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 14:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C309440550;
	Sat, 19 Jul 2025 14:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoFDqBC12c7F; Sat, 19 Jul 2025 14:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159A14090B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159A14090B;
	Sat, 19 Jul 2025 14:29:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BB01117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5128582084
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXKG_glgD42O for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 14:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6626D812C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6626D812C7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6626D812C7
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:29:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EB196780371;
 Sat, 19 Jul 2025 16:29:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 16:29:07 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 16:29:07 +0200
To: Federico Pellegrin <fede@evolware.org>
In-Reply-To: <20250718085517.48149-1-fede@evolware.org>
References: <20250718085517.48149-1-fede@evolware.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <f9619e3a68429ed8f0c4dce18541b164@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752935351;
 bh=WJONQP3AlCdItGcPtYHVrXC79oTFFoNcK/UMu8VU7O0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JzGoeQYgMwDgfghboaPNAZdlET32M8ssm0Dg+wNGkutSz/MzrecTsxpbIRA3j6U7k
 YHz5uJNDHEK3cm3A70UQwjSj32PNdQVvRC2F8NwxmNi5AhZySPb3rwYTuhhv9jj57Z
 R9s+Nakepcrj5DNiDLR3gvVa7C7QTIXNWfQKe8I4OgY8UfD02aJZMWWElpeu29fv7u
 M3Sk8g0vKkOEBv7juBDZW1nWFmS4Z6lKlGwX7Cg+kw2O7AC4AyGY8vzRk0Po9A3rXJ
 xCLO0Zx0bFc+IIByS6oQDFOfTx0dm30MAL9AAZEEoHfYAtgwtd1olpa73YuhOWfHWk
 ALdFjlGIxISCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JzGoeQYg
Subject: Re: [Buildroot] [PATCH v2 1/1] package/netsniff-ng: bump to 0.6.9
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
Cc: joris.lijssens@gmail.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/07/2025 10:55, Federico Pellegrin wrote:
> Changes: https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.9
> 
> Remove now upstreamed patch 
> 0001-Detect-libpcap-dependencies-using-pkg-config.patch.
> Fixes also: 
> https://patchwork-proxy.ozlabs.org/project/buildroot/patch/20240829075015.39164-1-fede@evolware.org/
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
