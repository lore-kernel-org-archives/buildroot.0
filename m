Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4155EC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D5B760825;
	Sun, 15 Jun 2025 10:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kz7ktoBdqv5P; Sun, 15 Jun 2025 10:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BDED607B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BDED607B9;
	Sun, 15 Jun 2025 10:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EDF8198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 603BC80B24
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwgDVi9_sxhY for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CDCF809B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CDCF809B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CDCF809B7
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:08:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4A946B0056A;
 Sun, 15 Jun 2025 12:08:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 12:08:18 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 12:08:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250612113404.1565705-1-neal.frager@amd.com>
References: <20250612113404.1565705-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <529a8c3b15a1117ad7e28bcda349b353@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749982107;
 bh=xahOaQ2HhZ87GO+ZNfu5/jcd9OVEbiRlCuMORU+niqs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G+AZDVe/ojGTTk5tkK6d3vB4L+nBxKbNHaepqUVOdByqIhHYfuIecPJVVacgnSHro
 cJoa3luxJr6YJWsm+s/nZ/ufiXSpJR2E5WiRynMw97vUBYaVfmS4lTdwSxAo0uoqLQ
 E4OQJq8KoUYqfJgAoMYHi1K1EkXu+RR9NZqESuqslo8G6V2byl+B42eIE0+b+72Eng
 NDiUaRyPvB0RLeZvv48dhLkIgduYZnYuavvxb4gBjcBd5956NbT+47/6qwUH9o0gJ6
 DIG+13dYALfXNYE4q2eCXBcJEK/Bf//pmCyqXcp2rtqtIk17MMRY2ten7y1hkZtGfL
 GRnvzdGpBozjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=G+AZDVe/
Subject: Re: [Buildroot] [PATCH v1 1/1] board/xilinx/linux_6.12: rename dir
 to linux_6.12.10
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

On 12/06/2025 13:34, Neal Frager via buildroot wrote:
> The following patch is specific to the Xilinx Linux 6.12.10 release, 
> and will
> not apply to all Linux 6.12 releases.  Starting with the next release 
> based on
> Linux 6.12.30, this patch will already be included.
> 
> For this reason, it is better to change the directory name to 
> linux_6.12.10,
> so that it is clear that it is only to be used with the Xilinx 2025.1 
> release
> based on Linux 6.12.10 and not future Linux 6.12 releases.
> 
> So this patch moves:
> board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
> to:
> board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
