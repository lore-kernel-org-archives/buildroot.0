Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2797FF8873
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E3DE6075B;
	Wed, 29 Apr 2026 20:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-7c9urWolQl; Wed, 29 Apr 2026 20:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 823E060B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777496121;
	bh=BQOpCB2fZVSvMDnvX+bPM9eoxyLra/8PcOy46S8vhU4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EL0K4SG69kCjavRaxWUKmMwxY6bVaDmIVhEeVDNG5NzIOaNBZ31QunMTjIhmMMe1U
	 gRTA/ez2tFhA60V5bQMJ5d3BbDdahC5cf8OkNxU87T+U5nVHY8Mg4o9B6Uzv6FcQ9U
	 h00cgfwu2k2ckoxPhFWBSsC/C+W5gvLtD8D9JmmIgI/d5FWwZ3zIg15tggGET7kczD
	 5DB30O/MNIdioH2S7V6MZt22pbmjzYvbdhbd1fU/QuR6G5xQYWnepk+Gee4n1UOExM
	 OdSQ2lYtFX7rdfig2e2hShpFww/U/vKM5bsOA7B4F+hL06VWT7xK9jYjZeJIMGuLhH
	 AdyLKL76eYRKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 823E060B8D;
	Wed, 29 Apr 2026 20:55:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F44618E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DFF640F67
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xhEEVo29nlw for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67B6740F62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B6740F62
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67B6740F62
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9CB15B00563;
 Wed, 29 Apr 2026 22:55:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Apr 2026 22:55:14 +0200
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 22:55:14 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260429114608.1129730-2-manuel.diener@oss.othermo.de>
References: <20260428073542.1027653-2-manuel.diener@oss.othermo.de>
 <20260429114608.1129730-2-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <103231db2dcfb70353b17cd008494d2b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777496116;
 bh=7PvRS7+WddPzRg1PgKnywEQDm+BKi5eodlCilNfZZXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UDG01myvyWKc+41BZtKQ8G0Xrb3l7xbiDwVoOrLv9bhXmE7BWFfA+aenpAPZp84Ff
 2+x29A1DJpvTk5wbLhFcziMDRgyKcuE2WBDzTMWFqDCMedNqW07xwfZZqZopPAk0ca
 rvVI7PVmPQIncHCsHZCKDPBUOwjYOF68Qeq7EUFZE3CUTXAkGehoKdOMtja9Fgb7wO
 b4DqvYAGsLEyM8K5295taFxXP9QIO2ABlJVPz+DH74WEl4DK9lCeeHJh1DV4zcdBEf
 hj1In2XieqskCPrPrJdN1tO8eYILX5QKaXMImsiHJjpXkjl36uDtEx8iJbAIuwiGz3
 oRpBqdch/Rvfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UDG01myv
Subject: Re: [Buildroot] [PATCH v2] package/python-pydantic-core: bump to
 version 2.46.3
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

On 29/04/2026 13:46, Manuel Diener wrote:
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
