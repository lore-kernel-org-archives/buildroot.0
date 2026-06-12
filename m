Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B00ACD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639C5419B3;
	Fri, 12 Jun 2026 16:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67vCEOERfVWR; Fri, 12 Jun 2026 16:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF4A419A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282376;
	bh=jOQmfEfJArCstPV3E0BU5v1LD/xNpqLx5X/CTF0nlWk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PprUn0kZ77IQY1+uEuRgNqQWXffZFksCELKAut+UuQRAj6OJlkdh5RVumu4KDSrTn
	 y0Y1LBBZs0AVuPw+r+SM7yQhSlyXVpuofQDSwP1UiHjXyHYVZAumYF88fHveEHEd54
	 ff1CZWa5hBic33aqGg9RmEGbbSobCCG307DZQHko7Ve0lSy7nX3l0eqgORJKZJm3tP
	 Fw/bAnF5j10oTh8RbKeqZv2MqNSFSkpalAxcGnBcNg9YSX1u3b5UA+y944icwjis/s
	 0Oyi/Cyveop6/S1L4ZiqfMsDAV6xNcAYKQZHeEZoqy51+zJ5e629GmM82BnHGjr4rd
	 KYEmRStBYA/yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF4A419A7;
	Fri, 12 Jun 2026 16:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C3C12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3774380DB4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zACtVFcq8JE7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23AC680D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23AC680D9C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23AC680D9C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:39:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DB4362003ED;
 Fri, 12 Jun 2026 18:39:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:39:28 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:39:28 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260603120656.738212-1-manuel.diener@oss.othermo.de>
References: <20260603120656.738212-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.16
Message-ID: <c8f816b88523d02374cd3100f5c60ae7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781282371;
 bh=JJH43x6AIATkqvIX3Qc7nt1M1JnpueLCtsSLUbXRYz0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KVdVnChkgkRwwKEG71OVtnC9XMcKeDDxzeMRBTGmTbPDZ0ClA8q1vGjhYC+Rx6xzE
 KBDHISDygiMrlkQG6aUHAVtXxzMvolx84kzeXYwpOB4vVkEK2pzxD4FmOmr+vzJNlp
 u2jG0/2TRvHOjh0k0kPOT6JQzjH4K8TIIAuTsVHYOsqM2arxZ1JYvgEBUKeDhSvcMU
 +iRJNRMaJvSGWy4LPBn6njUbNoWciO6Z++XI3cNo7ATWEoG1RKR/XoNi1Ai8IJp8Gq
 VLheD+y9vO8XY5tGWhGmy4nt11Szzwg9G/qbuSO3K7BDJjcOpNkZEiqKr0dND5F5xL
 KVnfA0DQmPQPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KVdVnChk
Subject: Re: [Buildroot] [PATCH] package/python-sdbus-modemmanager: bump to
 version 1.0.5
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

On 03/06/2026 14:06, Manuel Diener wrote:
> See the release notes here: 
> https://github.com/zhanglongqi/python-sdbus-modemmanager/blob/master/changelog.md#105
> 
> Patchfile removed as it is fixed upstream.

Applied to master.

After applying, I just realized the patch were missing the
Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Could you make sure to add it in the future, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
