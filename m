Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3B7EE36B2
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A11D842BC;
	Thu, 12 Feb 2026 18:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASjg3ZekbfyU; Thu, 12 Feb 2026 18:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58ED984326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770919658;
	bh=+hoyGthiWTU18y502P4nuXvpqwkDdbuHyVkrkuRrYRA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rqqk5xkbVhl2LnNS/kw9k+lzCUQ3QJp4WAXo59DPJZ3sxb7f9GA7vzvVtqAJpxG59
	 Bd++j/7oiVrBgiOXSUbdb6s/J8BtPoqIv6WP2b/RIhIvsx9xQo6hfSVl8Cn5/RlUK6
	 MiRCmTo92AdAjDSP+P6OPwI8sr1EMYkL8asqx5lwvL/kjGJYfkMJnw7AhRszFoOShp
	 3LtpdDYnfand9xmX6XL+xo2Nirp+hDErW9+Sppq5sLUT5Zmvd7/rFgFRrA5ptsHmMD
	 adJVTa/U9lkQOCp0WoM0VuTCH2v1+4itiAH6ICgaqSwq/1+gS1F/63pePLHdD/GIRH
	 6iXD8xfjAZ2Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58ED984326;
	Thu, 12 Feb 2026 18:07:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B699CE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFD4402DF
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a6YFvT4em4Z for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 18:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB63C402AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB63C402AA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB63C402AA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:07:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4C5932003CC;
 Thu, 12 Feb 2026 19:07:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 19:07:31 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 19:07:31 +0100
To: alistair23@gmail.com
Cc: buildroot@buildroot.org, Alistair Francis <alistair.francis@wdc.com>
In-Reply-To: <20260212025845.207257-1-alistair.francis@wdc.com>
References: <20260212025845.207257-1-alistair.francis@wdc.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <5a32ec90bac70b0b9a3d9f4fea58d7a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770919653;
 bh=Tw4fkuuXGPPVSCNuH3h3Xxwm4I7WJklktPXKClC/G7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DQVXv2R6GHlJp5lKvAA/xGOBZRxUBiZR7LYeRBuEEOCFcbJzYYVJo+W9NtqKkEasT
 Zn0m+94BRTU1Hv48z1sb+l/D1QvT6jFw4sSYm947wFzwYcIZBN8Lq/jAiQubr7Pfnu
 lvHr2tldQgOuglZ/8EYURyaekd/eq4dOyxPpz8i4thoQ45CD0069N73xKDnYcbB43m
 qQqzPZoHVLeeZwIqCo6zGCHX+FcmaERrl1Y9rPTvSKAIdQMwrQeZsCG/TOhduI3gnB
 fEZZJFBe04LlUT3ZX/jw2kATtf5vInJDkma3tkdEbnmbShyQXXLlurpmGURTK7nISK
 vATGz9J3cHc3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DQVXv2R6
Subject: Re: [Buildroot] [PATCH] package/libspdm: bump version to 3.8.1
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

On 12/02/2026 03:58, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Fixes two issues:
> 
>  * Unaligned memory access in VENDOR_DEFINED_* : #3196
>  * Build failure when mutual authentication is disabled : #3178
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
