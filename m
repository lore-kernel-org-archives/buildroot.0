Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19721CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 17:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32E342AAE;
	Tue, 16 Jun 2026 17:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rv7462TqHY5z; Tue, 16 Jun 2026 17:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E20F42AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781629202;
	bh=m34jGaTdNKXZ0QNlmR00joMDi8GqliWJXYM0gG56PEA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FJ3ZEZy1zMG7bcJY6itZvbA3ugao0u7YlsWG7yV91X2DtrRxLj5SJoBpKNJH5aIPa
	 eoOf69+8Jvs8zuYgc8D0NVn0DECrb6+WL/WK18c+kC12m9WkJIrXRMJmL26L8tG6oH
	 DI6qYqfCkPGFecPXNSf/da05jHcp2rDA5KBvHHGBaNSLvrd0R0aHvzuegsMvGzHOHB
	 TDfTf4iq8ie/a7nHn3Mo0VPE6KR2lcc4ZG9V3YJHrbx8qukyOVldcTqLbWzcV2aSPQ
	 e2tmnmZRAl1pz9PrKy7dCX13WY2IgTCw3jIvpLyCL+hdeqq2evyBHOF7ivr6jbo7+p
	 rCqCoD/L0VQgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E20F42AB2;
	Tue, 16 Jun 2026 17:00:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 285D92F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19F5040226
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5k2DIOsyhMI1 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 409D54021F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 409D54021F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 409D54021F
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4016F19F5A7;
 Tue, 16 Jun 2026 18:59:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Jun 2026 18:59:56 +0200
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 18:59:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260616072106.1202605-1-bernd@kuhls.net>
References: <20260616072106.1202605-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <faa48b53e6653326cdda84a49ecd94ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781629197;
 bh=SO3jmEfKPQBpYXi74mvoDYQNgQpNy5HMgFLO/Qrz4PU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Flkn49fxLfYs2QIYRv1Y+xgXZEyN+dbUXEsiJU4utS5zU6pfvtvaDLu9F1ikiKK1f
 p94CxIM/t4TvZgMM7NxQ3XfL8U6uew5Usouof0AJgU93o6he4zTSFwbOZmgYRYzRp4
 uFIV8RwpsW8XW4010+JELggO5phOaUHHHdpT2Vqz2muBXz+sbAtQ9lYTO3ppd7xG6R
 rimJFt/U11izn6eXwmfCRln8iGVGc/k9VWHjzoSR/Z3SJ0MICTLxebw+DQ8jA96MST
 kmuxiXMYf6CDuaCMmJvvID9NhzEDy5VC9tkoAo+JF6ctavhZhmiVZECza66CRILght
 md/PKuRCsNONw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Flkn49fx
Subject: Re: [Buildroot] [PATCH 1/2] package/strace: needs headers >= 5.1
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

On 16/06/2026 09:21, Bernd Kuhls wrote:
> Buildroot commit aa5e3eec6384cb73d902a4de3fffc279683ea5a5 bumped the
> package to version 7.0 which includes commit
> https://github.com/strace/strace/commit/33b950714a966bde816a1f1e75c127c3d3ae53cd
> that adds an include of linux/time_types.h.
> 
> This header file was added in linux kernel version 5.1:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ca5e9aba753ed15d173c7a7b88e4d402b7ca8121
> 
> Fixes build errors:
> 
> In file included from 
> ../bundled/linux/include/uapi/linux/cgroupstats.h:20:0,
>                  from netlink_nlctrl.c:11:
> ../bundled/linux/include/uapi/linux/taskstats.h:21:30: fatal error:
>  linux/time_types.h: No such file or directory
> 
> detected by the Gitlab pipelines with the following defconfigs:
> - br-arm-full-static
> - bootlin-aarch64-glibc-old
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
