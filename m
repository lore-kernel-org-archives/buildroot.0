Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34047FED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 18:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2627811A5;
	Fri, 24 Apr 2026 18:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpGzrTyBEMGn; Fri, 24 Apr 2026 18:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BEFC811A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777055284;
	bh=lwspcW3r4JepGhf8kiud57bCYkUR4qluvb7UvOLKekw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H+BzKjaPWLktVlilE77eOMmhQhZrvsgNfVi0KDNFakJWVK3loFsp/yai5qSZeXeR9
	 gBGglGi1w6zFyR2/48096uG5ci34MqxhDKaI6+WWTeJJxfiYhoa+ZaVi+xi4/VHn0h
	 amGhsmJB+vNFZ+l3v07IOmrkRlZl2AZkRJkxuxHDvVJGj+3E0mae1SEFcFCwBXcwOh
	 3x446DECcoaykMK3S+QVtaefOMYvf01sZuTOAVHnDNimXq6KHhFOWZsmEgrn36e4XT
	 ASBsr3g5vy5GGvaV6CcHIrAsUdMTWQf1x2tRSqGGxccMD47/rfrTxJjXfi+Z1TvLrA
	 R4AQDaR9gNNeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BEFC811A1;
	Fri, 24 Apr 2026 18:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97F9A231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 18:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A034811A1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 18:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmWlMkn0mK2V for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 18:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 653B48119D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 653B48119D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 653B48119D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 18:27:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1vbSaX1tWe-00fqMd; Fri, 24
 Apr 2026 20:27:57 +0200
Message-ID: <9f1a36ad-a8ad-44d9-96cc-c176d910eb1c@gmx.de>
Date: Fri, 24 Apr 2026 20:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260405185608.1357633-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260405185608.1357633-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:vO9aQMubP8eft2dTpR9rU+BzUESVTW7nG1nLRCP4npQSbKZsYZp
 Ib5X03UTgVpQJvj+DycRU+17zrU/TDo3mykv4fWXTGjI10miRQCJi/Wl3hABh1xChWcG6mT
 sno55SbPO7okrSEcbPsdNgOCR2mAIwZVREIHGW1y9N1+FRsr55Xd453gHtkFZMiQT8KA6jB
 WmTmsZ31QvecHXWUK7iYQ==
UI-OutboundReport: notjunk:1;M01:P0:sC2DjtcidlY=;iK7FuABkauq1Kr1091Ap2VTdIeA
 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
 Diu+Mg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777055277; x=1777660077; i=fiona.klute@gmx.de;
 bh=UG3Ig9Wdj+d+21c76GoVGa+gvFlmM1VYgo69UiTm0wQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EtYB0NGgP1+dOOCnml5v+xGZow0CyDyi0JMxhqTp19HCq0dtMfS20nsSIR9zBpzs
 SRGGJ5DCdzJvSPzWqhf39OPTxyVBPQN8w8+hVViKVPp4Y27wZRcwyYczVSi5ic1aE
 BT5Y1ESmfnX/qeMTLrXJ2h+FatDy7YIJq5vge24qx4EuLvH2bJocrnub3KHYwHeas
 3B5fXur1Nom9sVEmFbcIkRM/XtlE7RZchvGrl09ShUeqxNjaHV8seqE1OBund8+I3
 XwMgzdBHXOPFB9qMfjCnXSRoJLOrNiNqrDN3GkgZbSXByv35EukmwJuymHdoPAexq
 AhWGbPVPPG3ao2vp1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=EtYB0NGg
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.04.26 um 20:56 schrieb Fiona Klute:
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Gentle ping about this. Would be nice if it could be merged before 
reaching 2 years since v1. ;-)

Best regards,
Fiona

> ---
> Changes v4 -> v5:
> * Avoid Bashism in "does BR2_EXTERNAL variable exist" check, suggested
>    by Yann E. Morin.
> * Make relative paths in BR2_EXTERNAL absolute for container bind
>    mounts.
> 
> Changes v3 -> v4:
> * Split BR2_EXTERNAL on spaces OR colons
> * Revert changes to mountpoints processing loop
> 
> Changes v2 -> v3:
> * Use read to make the loop that creates mount options more robust,
>    removing pre-exisiting shellcheck override. Suggested by Brandon
>    Maier.
> 
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
> 
>   utils/docker-run | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 27c169db72..37f6c12c0d 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -97,6 +97,17 @@ if [ "${BR2_DL_DIR}" ]; then
>       docker_opts+=( --env BR2_DL_DIR )
>   fi
>   
> +# Testing the existence of the variable instead of a non-empty value
> +# allows passing an empty BR2_EXTERNAL variable to disable currently
> +# set external trees.
> +if [ "${BR2_EXTERNAL+set}" ]; then
> +    docker_opts+=( --env BR2_EXTERNAL )
> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> +        # bind volume source paths must be absolute
> +        mountpoints+=( "$(realpath "$br2_ext")" )
> +    done
> +fi
> +
>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
