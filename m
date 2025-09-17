Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A92CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCA961602;
	Wed, 17 Sep 2025 16:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34z2LtRqsuOL; Wed, 17 Sep 2025 16:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64D3611D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64D3611D4;
	Wed, 17 Sep 2025 16:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A19C199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4762B40737
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ljTdihNkfxs for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 504304071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 504304071A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 504304071A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:56:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 81395B00596;
 Wed, 17 Sep 2025 18:56:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:56:13 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:56:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916015500.2621356-1-james.hilliard1@gmail.com>
References: <20250916015500.2621356-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8fe0a9002ed56d34634fdeaa634ab06e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758128174;
 bh=wGLYluLLAWoXkYFfW9E8H3eUQLOxaYNqZZIsaV65jCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qwKCEBfroilMD82voWB/N83ScHXeZqmsOOMAHA2q9PJdAW/NZ3Fn2GdQIlVPcMRl+
 ilWiFczxni7Csrp7kh6hwZkUynL91bphgi0TdPD7wVfgc+2IItB3QjDizt9MLo39Ev
 pMV38/56ul6leow21Se5PiAYwuQdrBLr+OPwncAnwb2U2G/tLkh6jSZ1TDizNME9iS
 HOr/M7WJl3mDGaxNsHWtA1ygtprUWkc1S+PLvtz1oDYyZs/LEUpi+GNzxbZ/9604M4
 FJRwVEUeLBGaX7WxJAnI8XrxsOcPwwxT+wE0DGu2Y4r295EFr9uGEfXJptko8WqymF
 F2dhfckESsCHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qwKCEBfr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mypy: bump to version
 1.18.1
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

On 16/09/2025 03:55, James Hilliard wrote:
> Add new python-pathspec runtime/build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
