Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EBBC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 15:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE026081E;
	Sat, 15 Mar 2025 15:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJC30Q1M8alQ; Sat, 15 Mar 2025 15:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D2C6084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D2C6084B;
	Sat, 15 Mar 2025 15:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D72C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B60400C6
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_-nOOm-YrFu for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 15:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1311C400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1311C400D6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1311C400D6
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:43:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B04832003AE;
 Sat, 15 Mar 2025 16:43:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Mar 2025 16:43:35 +0100
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 16:43:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c83601b6e760c86e787c9d71e7e8c44d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742053418;
 bh=tPkhSyJyQQMMwJXQYBUqJCTTASHNRl0JNfS9T/BCmO0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bEifET2vRu1UluoL/v5kwXU7AoU8ULw8GxTPzMnObTmQI1eKhND/XXbEVjVQ1iIqS
 GKOd5UuIZ07zyeN5yaR9Hk7TWV68F1FtZV4NxY2j1QyZZEvFzttWQJBqBmW/socuRs
 01OheIWA3Zfsls3O28p1DGm6EkKXV3asqLgPr0D1CG7oyD2Z0IOEVndTzpG1lccqTL
 EYW9YLNnnT8O1JM9hVEO981/cOXeYG90C3SMqy2zd+2IhDmqM1UxHxUtHVSME/R4SU
 p365+tBcecsXa/KFNVJiUX2e30PbGvRTD/hWH/5hj3p1iiNrRTtLHJQrQHE+2gvVuN
 1g7ZnYEUPUf7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bEifET2v
Subject: Re: [Buildroot] [PATCH 1/5] package/qoriq-rcw: bump version to
 lf-6.6.52-2.2.0
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

On 11/01/2025 07:37, Akhilesh Nema wrote:
> Changelog:
> https://github.com/nxp-qoriq/rcw/compare/lf-6.6.23-2.0.0...lf-6.6.52-2.2.0
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

I applied this series to the branch next. Thanks.
I also removed fmc and fmlib in the readme.txt in patch #5, as
suggested by Brandon. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ce3dae7a83b2539737cb9a321a6dc73005aece4e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
