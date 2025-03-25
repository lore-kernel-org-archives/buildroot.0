Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CDC36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD3360803;
	Tue, 25 Mar 2025 18:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpqvXdgBe8yq; Tue, 25 Mar 2025 18:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5E36103F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE5E36103F;
	Tue, 25 Mar 2025 18:26:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8612C0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B903F40399
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puMTZOyzzWSJ for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:26:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7352403EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7352403EB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7352403EB
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:26:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E08A713F861;
 Tue, 25 Mar 2025 19:26:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40898])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 19:26:29 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 19:26:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z-Jt72xEQmLTB_n0@waldemar-brodkorb.de>
References: <Z-Jt72xEQmLTB_n0@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <73cc9cedd393bed0a8267b619d9ef363@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742927191;
 bh=kcSEAw+1TVPQck4JkM6m3zfEEncMRtpOqNHcHhuR3o8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SER9lEF5pioJ+Gg8i5DcVLwJiZdvdZDSZ/Eythz9RoDOPvCzFvBvuiNsIXzMbWh97
 Oi30OHVTRaQgPHhc39mYI+MypllK6urfPPi6sPkk8Hm+DeCZA3STFQC1UjWa2KYVTp
 f5GQgJwz+JtBTu+fuWlgRr34TABvDhWNgmOeknke8W2fXG1SqdC0K5WVm8e+oREH1B
 6sRZRMvqQ75FVydl/kUYQK1uov3cvDV8u8f5uV3Hc6BLq7Mw3DvJI9HWszQUtGQqji
 m3ODzb/daWjiQMYnc5JfgixF8VdMh9j7ll5RHWrt7/rAaij4GpVjJ/noVz670BEMEv
 gSpbJnPYCcQ+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SER9lEF5
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.4.2
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

On 25/03/2025 09:48, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://github.com/ruby/ruby/releases/tag/v3_4_2
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
For info, I fixed the LEGAL license hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
