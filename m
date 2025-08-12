Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539C7CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 15:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28AFE845D7;
	Tue, 12 Aug 2025 15:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdgS_unRHeUR; Tue, 12 Aug 2025 15:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5D3845D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5D3845D4;
	Tue, 12 Aug 2025 15:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3BCE1C9
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5A9742842
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aC-JgMY6xrUb for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 15:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED11742846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED11742846
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED11742846
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:16:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E642719F75A;
 Tue, 12 Aug 2025 17:16:30 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 17:16:30 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 17:16:30 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre Floury <pierre.floury@gmail.com>
In-Reply-To: <20250811231437.470780-1-giulio.benetti@benettiengineering.com>
References: <20250811231437.470780-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <498e96661bb665293090363216f86330@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755011793;
 bh=A0HH7sKcYh0U9VLqbOW6mayOkfTD4X9uJS/SgMoBMII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fbHFhqlJ4+LngLVTRivHqPLJhP+OuhmZJyeF83Kt9VTk/8YooCTpLWzmg7O5J5VCZ
 FBMm1Nz5IDuHl3zii/EGm+aKDmHv+mOj7jljrv+nw3irmESRgpcBmn1qk5Du0Sc6CQ
 wgzaBY7ClU/4VqTFUft+5pVc7mORK9VwMJehOATkl0eIyD+eq7DlHKjJTLjEpngGeV
 Dz/H+P1w51TgCx1XyPzFZhTybvLpR6i5TACjvMLXD9VpwxC8ljPL7A3YW+irN68xSI
 63I0TObXDk8F99/kOetLtpqjycE6nOhp2vn7IkcGqdxLTKc8ykLxyptrk0/ZjltN3F
 /1driAoNGGcmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fbHFhqlJ
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.3
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

On 12/08/2025 01:14, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.3.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Since this bump is mostly bugfixes, I applied on master. Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
