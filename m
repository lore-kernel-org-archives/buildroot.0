Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F58DC83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47DCB41452;
	Wed, 30 Jul 2025 19:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3v4kUrdHp8Di; Wed, 30 Jul 2025 19:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E4441433
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76E4441433;
	Wed, 30 Jul 2025 19:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F5513D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559F74141A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdNlOkUc1lOM for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 19:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E23541411
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E23541411
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E23541411
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:37:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E33DC5FFBA;
 Wed, 30 Jul 2025 21:37:25 +0200 (CEST)
Received: from [192.214.236.6:45718] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Jul 2025 21:37:25 +0200
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 21:37:25 +0200
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
In-Reply-To: <20250730074608.2400345-1-elmehdi.younes@smile.fr>
References: <20250730074608.2400345-1-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <c862a734f1a338698b9c60bdbddf21de@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753904248;
 bh=Yg6Nr42AZp2OJ8Ung01s1INarbM/PE5uEn090wS2Ubc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P5Gc2l1wqpqNw/ZP2jDqDbaZl2+5sGdzAlORR7IlFg82yzXv7K0ZTs6DmGXQy+ur/
 uSya+CtJKEQHq5K2MhA0HwxVycNmtibuKyDPezD066jSdh5uqVRQTIt0jY3xKJPkK5
 hl7LsVN1Oaj3gRDxVvyhyj0JwFPjbBuGG50NsV6foZbpjjKYinxDYmDOeifWF/3T7T
 jr2kV0nsx/Uz8rKYVMAAKVjkREn59jBi8s/hpsylpA/lSCns+M0qlx4d8TIYNtt4iX
 ynoQw75WfoeS/6e25yoFGF4UBtcvnZ77HsAdCL9j9W6FoZjKrMO2O06H0c2ZJ5mihf
 g6GHM9bflZRWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P5Gc2l1w
Subject: Re: [Buildroot] [PATCH 1/1] package/{opencl-headers, opencl-clhpp,
 opencl-icd-loader}: bump version to v2025.07.22
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

On 30/07/2025 09:46, El Mehdi YOUNES via buildroot wrote:
> Synchronizes with OpenCL v3.0.19 specification release.
> 
> Releases:
> https://github.com/KhronosGroup/OpenCL-Headers/releases/tag/v2025.07.22
> https://github.com/KhronosGroup/OpenCL-ICD-Loader/releases/tag/v2025.07.22
> https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2025.07.22
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
