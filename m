Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F370CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6331412BD;
	Tue, 16 Sep 2025 20:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmdfBccCMfGl; Tue, 16 Sep 2025 20:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BEA412BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BEA412BA;
	Tue, 16 Sep 2025 20:53:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02729279
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD4BD41D8E
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcM2C68XJ2or for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9782404F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9782404F8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9782404F8
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1A9CDB0055E;
 Tue, 16 Sep 2025 22:52:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:52:56 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:52:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915221212.1603214-1-james.hilliard1@gmail.com>
References: <20250915221212.1603214-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5aed29a3e3bf9728359185e19c8b40a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758055977;
 bh=5R9zFma3W4IKm0Am1YQR8xoqBoNrLS29eE8RGq2EEEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V5BlZDP8UhauJxTnPBO6McOE0AZrnlmAjEoXUhQ/aDa70iErEMX3ZrWuiXizkt8ew
 OOJ6EEs9v/5T43wgU/kjEPGFCNEHU6MBqlyO8trGDZcQfZEmudOKy68IxflzJw3t1q
 TTjM/zDXbnzOKZmSbutXe8662cMWXlLDv6i0XvLRGLXRU24RAOk+EhGxhWzcpWQwZ7
 l6XTBw06OxWVJMNMsecgvO9mHsFtT7tgDBoZpAs4suhfp/Sotp5kYpXO8q8r7qyaXU
 G/hwBB4XL7fQgczpP1Cc8Y6z0pMac/J3nJCC+pXaMQCLt/LsMQm+2lJClWGO4u2wZX
 GKDPS9J2fk4jQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V5BlZDP8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to
 version 2.21.0
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

On 16/09/2025 00:12, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
