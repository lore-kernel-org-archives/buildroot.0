Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676EDCD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 23:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2115080E2F;
	Thu, 18 Jun 2026 23:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7pXLNLAz1_m; Thu, 18 Jun 2026 23:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D34280E30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781824187;
	bh=ODYlV01mHDOA5bLJUk4BXo4HCzEa+6rFImaJCwNO43Y=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=dZXNEFTjKSYIYHASwr0guXxJ82I5NNGoqxJ/f58arEdNPLeNAPdgS0z/EhAmgHFv6
	 5gkisuow+6IUkFyLYsN2YzkKje3WyF+9AdNdF5VxNcMkJ383OBHBVbFiH5l5+exjH7
	 7j24mQ63o+aZ2K3/aEjzeZZrN8WtB6xEjJDgK5uUIPdAVJ7onwhsbSq/jz61cRQjno
	 IqDvC2X0Vf+iaCto9dGXDaNNzxr966GJGTv7jO+2FCAJeJzE1mhqhyru8oVoflTzvc
	 ivjex90Bqs21GUBglV4MmPiziurKDe3Vg9+XuhFYlAaT/1GTjxbR2i6xkEy76wMOKZ
	 lR5vQkM0X6d9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D34280E30;
	Thu, 18 Jun 2026 23:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CA7A367
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 23:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E5980E2F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 23:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kn11jZshssD for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 23:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08BD380E2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BD380E2A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08BD380E2A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 23:09:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1x6uex44qM-00pnv5; Fri, 19
 Jun 2026 01:09:42 +0200
Message-ID: <516eb520-cd83-477f-aaff-b839e32b3792@gmx.de>
Date: Fri, 19 Jun 2026 01:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20260606024011.4645-1-tianyuanhao3@163.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260606024011.4645-1-tianyuanhao3@163.com>
X-Provags-ID: V03:K1:05t4C6592VorZNUd7L75qaCyufTPTEm4Rt21o1sb3b3aup95xP/
 zVvWv//ZhS8hD+uXmFN1vaYoPrIZZY0AudwYyHWf+YTIyoRMhXreQ5rN2WqbM+WtP3UiXc0
 btJxtUaXhlxJwX9Zq5zTchm+HijjW+UPceDbHrSXY3k9iTXWY7ElPCurdn4usxTIsJGNgQE
 I0rwArq1+HQYKUiEY49UQ==
UI-OutboundReport: notjunk:1;M01:P0:w8vr3nR6uFE=;Fo4M3bjZvVSqrQCBU1ABXpP5GKV
 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
 qsb+MZjARrXnqxwfsgO1PQkTllSEc5C+azqMgOI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781824182; x=1782428982; i=fiona.klute@gmx.de;
 bh=bIMXdFnND9bHR/M3kOSwAOLpbnFyAW6uQWZVzCRxALI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HcuGMeT7PFeDqpnjpdwl7b8o/NQk0h5wY+va0Kb9b5DsPaT4eSvWXf/6okUBUGU6
 LSnTBWfuIpV/uCfXoYaSXazmvyZmMJdr5/zXI/VJlh502jwv4hH0jm6yilf71R0cY
 DUeILdmuqIW3cghrJgo1resB5J46jo4Y7582jE/tHsSSaObXHK2/3yKE8C5zYGmed
 OtR9iJJzpBN6CqOh0xT2s0dqWMZzLK7+W1pL9ytFv6IzY4jpc5TVrP2H3j0zDjIp/
 vlNpuNBTU56ovm3kupx//3TgakYAXQ77vE2c/z7i9yvi7OJ1OTJa7kRjF+hidPifG
 7/IbvG7CLsH98/M3jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HcuGMeT7
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: remove initrd
 specific service files
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

Am 06.06.26 um 04:40 schrieb TIAN Yuanhao:
> NetworkManager upstream added initrd-specific service files in 1.54:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2089
> 
> These services are intended for use inside an initrd, not a rootfs.
> When present in a rootfs, they conflict with the main NetworkManager
> service since both claim the same D-Bus name
> org.freedesktop.NetworkManager, leading to confusing error messages:
> 
>    systemd[1]: Failed to put bus name to hashmap: File exists
>    systemd[1]: NetworkManager-initrd.service: Two services allocated
>    for the same bus name org.freedesktop.NetworkManager, refusing
>    operation.
> 
> Remove them to avoid these issues.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

I've merged Yann's patch with your Acked-by, so I've marked this one as 
Superseded.

Thank you,
Fiona

> ---
>   package/network-manager/network-manager.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 301c1ad43e..2dd40980e7 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -191,4 +191,12 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
>   
>   endef
>   
> +define NETWORK_MANAGER_REMOVE_INITRD_SERVICES
> +	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-config-initrd.service
> +	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-initrd.service
> +	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-wait-online-initrd.service
> +endef
> +
> +NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_REMOVE_INITRD_SERVICES
> +
>   $(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
