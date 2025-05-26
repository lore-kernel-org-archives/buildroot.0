Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70439C5AD49
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 20:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B80805EC;
	Mon, 26 May 2025 20:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUgXdaDp0Tva; Mon, 26 May 2025 20:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1FE80670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1FE80670;
	Mon, 26 May 2025 20:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9224528B
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EEB3403B2
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTwpqNvmorTh for <buildroot@buildroot.org>;
 Mon, 26 May 2025 20:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABC7440663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC7440663
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABC7440663
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:15:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 99A6A13F89A;
 Mon, 26 May 2025 22:15:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 May 2025 22:15:36 +0200
MIME-Version: 1.0
Date: Mon, 26 May 2025 22:15:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250526161403.1305438-1-dario.binacchi@amarulasolutions.com>
References: <20250526161403.1305438-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <eae9cebc9f07b01aadbd8a71cec384db@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748290538;
 bh=vH7r/RpNY9vF4NjSUE24f9z8Buetprg+l/kfbToJMlA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M/Jp8YjqASwFA3Lz+9Sl1HUih78J6tot/8qBI3mhL3nmVb6ihcZZl9F+dADfl849G
 rgEWd2aoe3pRE77UdJ+2L705p0Ze7pXNP1k28UiEfT2MPXXO5LhGYUi6UqgTP+OCQ5
 eTXtdcS2jZLvgODmu8zs+ZFdKW0WM8yymkLY5LaqKXtOG6pUHVjvEkbx115ZkyksZQ
 qQLBtmiQp4yTyUvTJp0dygTL//xTzJBqgKfjGQObcbyF0VUwGB42bknm1mAIrXikIt
 Yv/uAAP2dmlxk2Nn3QEd2zV3+eHzw6awzCXezn5fT9zs3VWMX4KTUJhrgudketTsu9
 3CrbtDyUuIdMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M/Jp8Yjq
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: fix gcc-15 compile errors
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

On 26/05/2025 18:14, Dario Binacchi wrote:
> Fix the following compilation errors:
> 
> In file included from 
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.cpp:32:
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:52:9: 
> error: 'uint32_t' does not name a type
>    52 |         uint32_t m_offset = 0;
>       |         ^~~~~~~~
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:33:1: 
> note: 'uint32_t' is defined in header '<cstdint>'; this is probably 
> fixable by adding '#include <cstdint>'
>    32 | #include "cmd.h"
>   +++ |+#include <cstdint>
>    33 |
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: 
> error: 'uint64_t' does not name a type
>    53 |         uint64_t m_scan_limited = UINT64_MAX;
>       |         ^~~~~~~~
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: 
> note: 'uint64_t' is defined in header '<cstdint>'; this is probably 
> fixable by adding '#include <cstdint>'
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h: In 
> constructor 'SDPSCmd::SDPSCmd(char*)':
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:41:47: 
> error: 'm_offset' was not declared in this scope
>    41 |                 insert_param_info("-offset", &m_offset, 
> Param::Type::e_uint32);
> 
> Fixes:
> - 
> https://autobuild.buildroot.org/results/b7b/b7bd052a0137a2e2d5606d66a0dc563789999364/
> - 
> https://autobuild.buildroot.org/results/350/3500f573427545e51bfc4fc708f769966d95bf1e/
> - 
> https://autobuild.buildroot.org/results/6dc/6dc2b0585e8e1900e5a977cd0b9e26b2ee1e90d4/
> - 
> https://autobuild.buildroot.org/results/d1f/d1f82cae003cddefae0c49f673768cd8601449f2/
> - 
> https://autobuild.buildroot.org/results/9ed/9edc245d0a03089812d631708a4294ff293a461d/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
