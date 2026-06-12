Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17BBCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C9D61208;
	Fri, 12 Jun 2026 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU2RG_NafX2K; Fri, 12 Jun 2026 20:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A9306104B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781294547;
	bh=WRLPcvYAZyQeLD0XMrNAetbTklIFC3JBTZ+npevXxEA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kpvZ3gHvbNMGW81sYsLlbCUAFXBIVccZq0ryGXrUWNcPq2h6u00fqHunVNdXzmn+R
	 p2ufGCU9WUHveca5uUH91kQtV99db5y/CHt3gpehRM7BFhmkAY8gxjacu1w6TpcbU2
	 +6DC83Qd/zESHX5VJYZ8ov0gVkcHxRysoi+XfC+oq2YtG/KpUzQ8ccvcepoctwnqNO
	 JvSzg8Dz/GH6qZsI98pCdQ9qDa//7eIDvlk59yEjFWXyBJYvKfsymKgReCta4Wp8BI
	 IFuvcD97Hmyo+1MKNLdp2gtU/V/8wz3oM9A0hk0cqJMGSFFhF0blsTwqiCthqMOxQh
	 ECijKKjoBEM3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9306104B;
	Fri, 12 Jun 2026 20:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70895237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 568B36104B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKx2Jnf0scgp for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7776760E88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7776760E88
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7776760E88
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:02:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 25F59780368;
 Fri, 12 Jun 2026 22:02:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 22:02:20 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 22:02:20 +0200
To: Daniel Houck <Software@drhouck.me>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260601083827.2545221-1-Software@DRHouck.me>
References: <20260508235516.3028284-1-Software@DRHouck.me>
 <20260601083827.2545221-1-Software@DRHouck.me>
User-Agent: Webmail Free/1.6.16
Message-ID: <5ab2ee2829ff2f40bb249c1d1d539018@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781294543;
 bh=pjPKHo0teimGkzpSCKg0vTZQDW59s2pbUk4yWytxrQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GSrTqFuLglXzVf9OMwHzjm2I2NpMFo7++u+hKm3t+i5HnfW5P0IFm5rLhQVU55fqb
 Zfsva6Kp6zZ7egnsX88c+t4oIE5jcccUaDKseptrM5f8TMpvGD00HezLncCuQExsPW
 XubOLNkayhIUkzdcmxlBwjbWAWoeEdzRbtIq/MGLAImoGxeiAjlDkacsHeY8ET//2t
 yWiBQWsnOIX7la63/AVd6XylDarQKqFQu5KbMUzlo78AlwJGiNJBLdgrepTdNtPQLQ
 3vKZWEw2qBrkLdxHjRt2wes4TrYlRwe6GFI1nuis6gtSTTyRFtV/5/6edDO5lDMm4b
 RH5W//cwdpbhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GSrTqFuL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/micropython: bump to version
 1.28.0
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

On 01/06/2026 10:38, Daniel Houck wrote:
> This allows us to fix packaging issue with micropython-lib, which was
> not packaging the correct versions of some libraries.  The new version
> makes changes to the `manifestfile` tool/library used by our
> collect_micropython_libs.py script, which makes it easier to collect 
> the
> correct library version.  This fixes #166.
> 
> To better support alternate use cases, the option to package the 
> modules
> in unix-ffi has been split into a separate option, instead of assuming
> it's needed if and only if libffi is selected.
> 
> Both the upstream changes and the unix-ffi split require changes to
> collect_micropython_libs.py.  First, since we might not want the
> unix-ffi libraries, the script takes an extra argument for whether or
> not to include them.  Next, since the manifest.require function no
> longer takes a unix_ffi optional parameter, we use manifest.add_library
> as recommended in the micropython-lib/unix-ffi directory README, if we
> are are actually packaging those libraries.
> 
> All of the patches we have been maintaining have also been merged 
> upstream
> by 1.28.0, so they are removed.  Their respective Upstream: trailers 
> all
> point to the relevant commits, except for
> 0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch, from
> https://github.com/micropython/micropython/commit/ae6062a45a776e193e8c02ece62d058b64f2b4f5
> 
> The LICENSE hash has been updated, as the year and the licenses used 
> for
> the ports and libraries have also been updated in the LICENSE file.
> 
> For more details on the version bump, see the release notes:
>   - https://github.com/micropython/micropython/releases/tag/v1.23.0
>   - https://github.com/micropython/micropython/releases/tag/v1.24.0
>   - https://github.com/micropython/micropython/releases/tag/v1.24.1
>   - https://github.com/micropython/micropython/releases/tag/v1.25.0
>   - https://github.com/micropython/micropython/releases/tag/v1.26.0
>   - https://github.com/micropython/micropython/releases/tag/v1.26.1
>   - https://github.com/micropython/micropython/releases/tag/v1.27.0
>   - https://github.com/micropython/micropython/releases/tag/v1.28.0
> 
> Signed-off-by: Daniel Houck <Software@DRHouck.me>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
