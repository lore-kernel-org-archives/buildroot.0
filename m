Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE2EC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 20:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9038A4054C;
	Tue, 18 Mar 2025 20:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEjTnN512_OR; Tue, 18 Mar 2025 20:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721E540572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 721E540572;
	Tue, 18 Mar 2025 20:42:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D564D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85FEF4053F
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrEE2FYJrXrn for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 20:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A226540132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A226540132
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A226540132
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:42:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7993C20039E;
 Tue, 18 Mar 2025 21:42:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Mar 2025 21:42:22 +0100
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 21:42:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250318160607.24704-1-bernd@kuhls.net>
References: <20250318160607.24704-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <01c3a002110c942d806e8d3e8d105d02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742330543;
 bh=Qkfb7KuULPEuYlyR2LnCPMsEK51UcCTpDnQ8ftcdBSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DGt11AHx7T8wsyF5v2lW42bcpahDsU+doW/9E0J6hD00N5hAlhQHCoMj9lvrjcwxF
 +j8n/BNv/V/wQDxDrzd6s/1JOl3//7UYvEU4OqFNnD6BOcJqYY8LvRMVxiuZO03ODL
 tyv+uR/N7oSfs1NxqUbj4OjcJFmlF5zTSxtSSyKKW3E8JcaR6pM5V5MyopU9NqW0VU
 AZVYUhNggXvRDnzx2DEAodQz1xkFo1DpCuz0yI4SOkf5wOVIHi1tkk7r0QYRwL99XZ
 kq5jBqnLBViN+lH/z//9XzbR9fz8mNZg92r4+zxHmPtUI/Z0VOMiZsttJE162iIUc4
 NIuzyYL+Tzxbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DGt11AHx
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 6.13.x series
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

On 18/03/2025 17:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
