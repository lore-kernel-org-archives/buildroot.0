Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9224DC54E58
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 18:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4239F405A0;
	Mon, 11 Mar 2024 18:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzJp-67S0MHW; Mon, 11 Mar 2024 18:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 015594059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 015594059E;
	Mon, 11 Mar 2024 18:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC3CB1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 18:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4CA58176B
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 18:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb5CQhXWhduV for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 18:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E019814B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E019814B6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E019814B6
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 18:38:27 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp2-g21.free.fr (Postfix) with ESMTP id E365920041C
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 19:38:24 +0100 (CET)
Date: Mon, 11 Mar 2024 19:38:24 +0100 (CET)
From: friedtj@free.fr
To: buildroot@buildroot.org
Message-ID: <2121496549.940679677.1710182304835.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.167.45.227]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF123 (Linux)/9.0.0_GA_1337)
Thread-Index: n3s5AHA5FgKktL3jwhEdNlhWmSCjqA==
Thread-Topic: host-python-numpy: correct implied host-lapack/host-blas
 dependency.
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710182304;
 bh=5zks6s8Ylcacm5HbqhQ/FFwUnMsRhJ9e1hAFJqorngM=;
 h=Date:From:To:Subject:From;
 b=O4QH9Op4Gm1zUmTqDmu74T6mXIYYT5jTdi7yupE/E9SI3R2rjcUetIdhNjT6SR6gB
 JGmngYv30ZepSv9o6ovtEWpWtpUIpP0uL8dyBxy3IVa3etcLbw4yzGbkiLFC3IxII9
 6jg82tzhLVtQZlYwDvFZwCI5aEYQXG/PUPBnEKJNlqJRTFyvouE7pLFPaOxJruySyU
 TavTvtcRtYLIeuuLRg96kncY+Gon/x5RXOFhwJqmPfIhLIo1kMiocJ79LKlEKsUimA
 G5++VR/Qys00tkITTIZ5fP/hkuYOhbLj1JC7JcAF6dl+m5zqvy57eESI11LgH8JX1D
 y5Moj1V0WoCCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=O4QH9Op4
Subject: Re: [Buildroot] [git commit branch/2023.11.x] host-python-numpy:
 correct implied host-lapack/host-blas dependency.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package python-numpy is failing with the latest buildroot-2024.02 with 

Run-time dependency openblas found: YES 0.3.26 
Run-time dependency lapack found: YES 3.10.1 
Program _build_utils/process_src_template.py found: YES (.../buildroot-2024.02/output/host/bin/python3 .../buildroot-2024.02/output/build/python-numpy-1.25.0/numpy/_build_utils/process_src_template.py) 
Program _build_utils/tempita.py found: YES (.../buildroot-2024.02/output/build/python-numpy-1.25.0/numpy/_build_utils/tempita.py) 

output/build/python-numpy-1.25.0/numpy/meson.build:203:49: ERROR: Could not get pkg-config variable and no default provided for <PkgConfigDependency lapack: True None>

which seems related but not similar to https://lists.buildroot.org/pipermail/buildroot/2024-February/686592.html

Unrelated: gr-osmosdr needed host-python-six to complete compilation.

Thanks, Jean-Michel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
