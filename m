Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60745CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2973F60687;
	Sun, 18 Oct 2026 13:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cM-5B6BQE-LJ; Sun, 18 Oct 2026 13:41:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4D3C360653
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330866;
	b=llycSgGI/2GrZseDZdLiC8e45zb4ElpDNG1WO5WYYzbl+i7FbZoTNG8doePT2AX2MJ81
	 nUxvn30QZysjF8WdpFJYxm0cMM5s1XK15JmJpSJQwA3kj5puqkUSPsabT7u5/tBNRG3Lk
	 6lWdQZLFWA5GZKsNJW3DKKJKx70CPguORmOTnhgd/zW4nGb8bgzFk/XEi2TGgC52BO+o6
	 clBQ356vFWS/l/+Dkxw5BCyDkJyGdSYFKNC+dELL9AwD5CJGVkdCuNVs/odPcKmaxJxSO
	 0xH9Zzq/qd0Fpgh9ye0XQl375N6o97BlLmL9x8b8YZjNxEA8Apubechj3Zv3rqWOoRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=BHPqNY53bH1J/0GtsuAaZZi+hF/Yafv4yoC4fM7Zp3o=;
	b=Oc4hB2kSqMmwSpuQkjX+eLul4UT+MQQZFTccpBwcYYi1ycyf2wa2fiv7VDCj2SN295Sn
	 1WFNc5N8qY3VEx1uPXrR9qVZ0No6DFCqs2cKaYPLhgD//f2PoUn3yqqkIEH9aI9xDUbqc
	 VJyMwkVDneQc9PEeHegoqG4J3uljWTlm5Ca8nMawEvUHU9kL7Y+GoXI9Ch81Dtewj/mBC
	 yn+tk+fJ6I9sS5bm/LuJaFOvlx/pMGaMVx13arusbJWa2o8/G/s9QiU4bURD6oCqu7utC
	 y3gwPQt44HB9XzIKASz7Q6KUnNWu2VQqlW1Yug/Ms3kXFe3CPkugaWTTTLxLpTtyApw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330866;
	bh=BHPqNY53bH1J/0GtsuAaZZi+hF/Yafv4yoC4fM7Zp3o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kMm+cPPp///hpScZ1Oey27RWy1X1hT7fytwe73PSShJpgojXcOQYNTPhAx+JNxkWC
	 cbJlluP6EYd7+VHxBrmjFpAU05iyDmwSKfGvd4IPGyt6KlirFDZvUunzyK5RTK+WXY
	 KFkveTVWbKli1zwxps4zcr9l4A3UkevzTVX0yiQI95aH1JA75UTtoUp2xaESZ0RYK1
	 TRS7ALfN7fnayDFNlXpp9UlC2HnGkdyBYuuH3/JgY1G+DgTux+P5zykhVfaerfA3t7
	 SUnGDPrIjMstODC/Wx4G82gir6xYuhXti/HUZO5/un6xhFBLQQ6yiz2btzZLrTRMvP
	 npd6dxpKpW3IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3C360653;
	Sun, 18 Oct 2026 13:41:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0200E61
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D0C810AE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oX7MaALGIvJr for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:41:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 25FC0810A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330863;
 b=kUpKAsMeutLZ3NtfS5f7kZIFMPgfZuLTot162UVQ0e5lQ7CzqgLxGfOyfL06nAuJnhSK
 xkgYWNDKhtNC8U+/WasWcV0eKzMXFuRNadU4XNQBy70kR/efcLssh9svDpOqfzNmKtYLc
 auy9K48mksl+bnm/hWjLDVAcEQudbJr1aGITj0LnUdKGTtu9fPH9jfsP72FDrkssFVojO
 Cw6xauDVcJEQgDFG2D9Oao+AF/nfnxltPdd7gYDyl9FnFA/IWCFQzJJ3RSGkygT6XUFI7
 LgoSf2W2LmIMJYyevdYgQSbb7Hl7blHna3K2wmPQc59GR8kUaEHip+J/LG0sSCnhHkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330863;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=2+WL8ed9O8URNY3YoyVOBTClRnIDWN8lAQOp4EjohbE=;
 b=HMOYnWG5Lk/Yi5andMwRxrgFI1EWhj3GYBz3a80D3B3xPa3EZFGVspVzG8ERHvyHmDBj
 z2bdQWs5D1wR1dEp8p1A7lhfyDLgPV89fErET2lkJlbNiVtFkwOlr5qPJmYrvG/buVc+J
 3VuGYOPpkBJnRMyyjAsRHPK0bR72kXnkwxdFnNokxc8tIi1+ouLc4S6sGAGw+zPZQQDrF
 RtS5QayETQskvAQOt0zHTZrTDbGULt+Hd8Y0LeftNtZ5N/+rTdF1XwQNqk+IJt5A/iIRE
 sRlfr6iJHFcS5ahg+1SDvWkjdY9OcDj3iYtGeV7ZYFRMkQSgWaYutDUJh9/MORI4Bng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HVYNQ2oe; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25FC0810A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:41:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0C08D13F88E;
 Sun, 18 Oct 2026 15:40:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 15:40:58 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 15:40:58 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015082520.1070915-1-dario.binacchi@amarulasolutions.com>
References: <20261015082520.1070915-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <6e5c07c634e634fdc52f213b5b735762@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux
 to 5.15.222 and U-Boot to 2026.10
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/10/2026 10:25, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.222 and U-Boot to
> version 2026.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
