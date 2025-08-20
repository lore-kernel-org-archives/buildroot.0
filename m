Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ECCCA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 17:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73DAC41282;
	Wed, 20 Aug 2025 17:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwdSMkRPgj3m; Wed, 20 Aug 2025 17:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987F941256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987F941256;
	Wed, 20 Aug 2025 17:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B3CDE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB6C24085B
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FQom_OPRP_L for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 17:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 358E040621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358E040621
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 358E040621
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:05:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 078C678034D;
 Wed, 20 Aug 2025 19:05:07 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 20 Aug 2025 19:05:07 +0200
MIME-Version: 1.0
Date: Wed, 20 Aug 2025 19:05:07 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250820132628.681-3-fl@n621.de>
References: <20250820132628.681-3-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <0a116ccdb1c665049a68bbcb320560fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755709509;
 bh=7V+dhBfueoQ1zO/yVmYj0bzVxUKhXGZkNQee98Gssds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dd0FccqQzq+M/zkdxyShUehJfdECYyL7xt13RJQqLHd7q34Tk5lRIJrbXOJUqzVrE
 citUsvs5dDgZL12r5FejS0KXAzRkAMMJnpf3o/1K6WXh0SsbUXrL2Mc/tS9nSwMBEc
 FBW3/19XEvLgarubDk1H/SsPg+QdAsyG+YLrXwROtY0jn/q+Tsc2PXCDk1LB/L7hIo
 dOUKWbpIGhFiIuplHEI3hmcTLygQnSog+j3RoNRMh7i404C/eZwDPsR2voVqWI3BzN
 ECGRPF4uNiaMrZdiesJsnZ1NKJYlCfUaVRYHxLkHY2RHSr0sII5E1QuuLYmtjRKIwJ
 uINBInMdoslbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dd0FccqQ
Subject: Re: [Buildroot] [PATCH next 1/1] package/vorbis-tools: bump to
 version 1.4.3
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

Hi Florian,

On 20/08/2025 15:21, Florian Larysch wrote:
> This is a bugfix release that among other things includes the GCC 14
> build fix and resolves CVE-2023-43361.
> 
> Changelog: https://github.com/xiph/vorbis-tools/blob/v1.4.3/CHANGES
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
> I think this could also go into master, the diff looks like this is
> indeed purely a bugfix release.

Yes, I also think this patch could go into master.
So I applied it, after adding the "security" mention,
and a link to the fixed CVE in the commit log.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ce5d1735710d11b135fc6cb235e976b306833e7d

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
