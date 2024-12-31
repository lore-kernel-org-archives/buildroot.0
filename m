Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E724EE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B096360610;
	Tue, 31 Dec 2024 17:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdnNa3XwIqrI; Tue, 31 Dec 2024 17:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B56486063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B56486063C;
	Tue, 31 Dec 2024 17:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E341B968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAF24059B
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brt0Smf4wY06 for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90BC7400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BC7400EF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90BC7400EF
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:24:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 73E3FB00583;
 Tue, 31 Dec 2024 18:24:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42140])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:24:35 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:24:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Alex Michel <alex.michel@wiedemann-group.com>
In-Reply-To: <20241231150509.1763416-1-thomas.petazzoni@bootlin.com>
References: <20241231150509.1763416-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bb6530be2a4d2669ffc7c1ed39b097f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735665877;
 bh=3XzGesDltO7DyE5FAgsCZrmWNvjY1ljSoTFvV3G89Yk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oDmOAVxuurCtKJiQD6pez89Rc5QqBnnTpvDRriA5NVRv95PqzUusbxFNEr1xd/yzA
 sqI3WHtGsYa1KUQyViEtxkLnKHBAa8wnR84Wvah/BVr3C9A5dcr6EzZVovNtybSF9/
 9DksfGNu4MXgq9IjtXTozHl2Hz5Bco5vlDbgc7KEvi2ydCT3Xjj8xxAjU+uSJtetzx
 yzu8dxZe93geUrkw1KzNeJ8cKLmoj8QUWxgarLsGWy6k3+Oa1fswsOp3H212ynxOxF
 mxuqzXJjsp3uIH4V4MUrCgxn4NmRDRaHVcMdtB4qGbDAq92DYlO9qr1FM4GjbXeN22
 tSGnHi4rqZy9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oDmOAVxu
Subject: Re: [Buildroot] [PATCH] package/libzenoh-pico: fix debug+fortify
 glibc builds
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

On 31/12/2024 16:05, Thomas Petazzoni via buildroot wrote:
> The configurations that have:
> - BR2_ENABLE_RUNTIME_DEBUG=y
> - One of BR2_FORTIFY_SOURCE_xyz=y
> 
> Currently fail to build, as libzenoh-pico's build system forces -O0
> when BR2_ENABLE_RUNTIME_DEBUG=y, but -O0 builds aren't compatible with
> _FORTIFY_SOURCE, causing:
> 
> ../../../per-package/libzenoh-pico/host/mips64-buildroot-linux-gnu/sysroot/usr/include/features.h:422:4: 
> error: #warning _FORTIFY_SOURCE requires compiling with optimization 
> (-O) [-Werror=cpp]
>   422 | #  warning _FORTIFY_SOURCE requires compiling with optimization 
> (-O)
>       |    ^~~~~~~
> cc1: all warnings being treated as errors
> 
> We fix this by adding a patch that drops the forced -O3 (release
> builds) and -O0 (debug builds) from the project CMakeLists.txt.
> 
> This issue exists since libzenoh-pico was introduced in Buildroot in
> commit
> a96361901dcc7b962a0c43f163e97a2de65687f3 ("package/libzenoh-pico: new
> package"), but was hidden by other issues until a first occurence in
> November 2024 right after the bump to 1.0.1:
> 
>   
> http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
