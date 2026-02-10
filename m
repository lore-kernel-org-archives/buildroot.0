Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0663FEA8123
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 14:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3256070D;
	Tue, 10 Feb 2026 14:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn5IDtOqSIdM; Tue, 10 Feb 2026 14:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C726F60ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770734814;
	bh=X4RNPSfwDIsAhrdph0XsvwEy68f6hrrEgVOmRQycNeI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=RPAEFiT1j5cLCqhEBD5ne4uWrZ/mjY1p7nuQ3pNRXVW4p4yQQkJYYBT36U9cQWqw+
	 xZeQYVC/S5zcY1v03zLP/YF8+75c+FzSY2m/3sOBaIWAqAGjSxGKFsxIhsse/k1q/I
	 idXAesKoFfp6YvNkvDB6erlMEx1/7Uv+xn/ZplUL/N6soD1/IswpglvW9mhl0dgljF
	 VW0Yns9CMu7OuKIUXmo3cJeBJsncx0mWW8070VE3LcfsrWhWobS86vpUhoIYE1ixY1
	 bkSIEsNuMG3vtfSzJh+HXRj3cqJhCm+wF9zH4G3Ss5yf0P7H1c8ZmTBowha7lAxrCk
	 e6qJzdF1jHgcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C726F60ACA;
	Tue, 10 Feb 2026 14:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8E5BF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A22F60ACA
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jP7EXgS33VXl for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 14:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E4AC6070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4AC6070D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E4AC6070D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:46:51 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 02E812C801B0;
 Tue, 10 Feb 2026 15:46:48 +0100 (CET)
Message-ID: <856ac8c9-6743-47a8-902a-2b2e1291bc4f@bubu1.eu>
Date: Tue, 10 Feb 2026 15:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260209203120.3837030-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260209203120.3837030-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770734809; bh=EaF9alB8+Adq54mCoeXbYmj7qZ9KmXjHLKfte35jHsU=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=YTV/jtJsnvEOYRsjaC/GdAfdeME2IkXno6Vo+V5mr4IE9bTjQCwgxXuJMQ5V6WIcf
 hrn4gmBHOZ/T7+2KhL+86BmeGlKkZIKS/Jn3YE97Oxk5mnCgr2NBJIKwRTAjJiqEIF
 IfP2A+Cckq5C3x68fMsfk+LOO8/Hqqkw2d0RHbZnNrwVzTExnrzSMjWO6CCnolAKDL
 Vr/WTq01EMoyks++kN4JP92jtSNrqK1+63Vz98QVq9cVWq5EJ10NtyZXDI+9j5Z/FE
 BXdJnVGIgTy7scUfWtXBxCMXC38NMWd+yTZIN4VkmJA564Dvlkf9HZ18kQC873YmfP
 bTn5liOvgCokA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=YTV/jtJs
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.12.3
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

On 2/9/26 21:31, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_12_3
> 
> Use sha256 tarball hash provided by upstream.
> 
> Updated license hash due to copyright year bump:
> https://github.com/ccache/ccache/commit/ec039169a4d93f7bae3f3f99762bd0248c9d3bd5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
