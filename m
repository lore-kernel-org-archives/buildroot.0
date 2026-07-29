Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2575C53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 19:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623864075F;
	Wed, 29 Jul 2026 19:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eH80NookqRzD; Wed, 29 Jul 2026 19:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2565B40336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785352429;
	bh=OT11KN2iE66c1XfKIrkjFqSb29LjyZe0PAMJ+h+3cvw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EF09lh1oa+yAuJMK9QgNRVeaEyNZnVvsbKNYc1+YXySQn/XM3T39cPk+1HdZcxjw6
	 wT/KMvzyYGozYjdXPUhH5xmE/SJv/+gVsqYhFpDw2OXv5rPdGTwY5+S8tSNPAjPvul
	 PIDu2QoMrTuwzTy/cd4eml1W55dMJV4dbLXhtvTktJVkc4LPKkKX0o/OA2a3XZEbRQ
	 qRfT0U5aFpNSl61bv+tr7PucPowHx8RfaKPlzYCM1vp+zPubzI1Q9n8ziMfC51J87A
	 43kT/5fsGt/f8oHFC+mJ/1ki9Mmg7DlR/K9P++zAL4WDIU3S+9hmEtv4R/BvTCvpYC
	 8c69cIccF9JtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2565B40336;
	Wed, 29 Jul 2026 19:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E8027F
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B58C540149
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPD3TBYLlGzd for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 19:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFB91400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB91400AF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB91400AF
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F0CD35FFBA;
 Wed, 29 Jul 2026 21:13:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 21:13:43 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 21:13:43 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <908af995a945a17aeb8612058a0b67e97e13231b.1785315694.git.yann.morin@orange.com>
References: <cover.1785315694.git.yann.morin@orange.com>
 <908af995a945a17aeb8612058a0b67e97e13231b.1785315694.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <71892bda8ddc1acae000ae300ef83ef5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785352425;
 bh=pfWw0urGqOrxeun+xLcTUqpqDrtJKeOPAJDEJdEU2r4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gUW4xqRzb1S4+eavrcMnAtfr93ZkolIOVwiNBnjXwpcOsaMvzW4ycPTPXDOXGGY1I
 g9T0gStyv3BCCCUM9/H4csEftCSXQWX0yBwK3eQeeElc1ANzjZG/vMvzVDkyEEbJx2
 gV7rFe5Pvv70Solh4HlX/7KEXY0CJ9W9DDSw1kYN3pbbSQWj/K88DoKexrk3UJnfeq
 w/xlAiIZYQ8N0bKuVhIdLh1zzdlQG6tfhxfVqTTxz/Qhnw47H9OmHU9hl+etuUeLOk
 TVZMbjytKo2I1JK8xCo/CeYZHoc8VUEblhVZb8QB2i6CJ+UN8h7U1Q0lYQa7SVzXab
 IVCtfIMAjgWdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gUW4xqRz
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-credential-gcr: bump to
 2.1.32
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

On 29/07/2026 11:01, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Changelog: 
> https://github.com/GoogleCloudPlatform/docker-credential-gcr/compare/v2.1.30...v2.1.32
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
