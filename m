Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE22D3B9AB
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 20:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C812845A6;
	Wed, 10 Dec 2025 20:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JurFwPGD2wdl; Wed, 10 Dec 2025 20:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407A584565
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765400149;
	bh=JXxT2h/X1bUgGS3tjoB8yVh41+mXbFcKB7o3JRFNyx0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WKLI9D9b6dgGZ8MhCr1HT851WNaJKitbQEh3j+jsplr8qJHWZAWVWzflyiEyoiDKe
	 3xVFcjQo3Wam8TRjN2mYjH+UV/JK5Pb3HkVn5KmEp2y7Inc6NItturetbmcEheioYx
	 Ip9/wbmGMQSMrIcdvHhfGPuxL0fh6eSnwXLmyA9uobBh2D7h6WQKkutO649ieIcEAH
	 2Kpa/geQxHd2zbpUmbX+Rcqlv2+O0ej8b6P8ucNsVhSR/DjaxmKPsdQMjb5Iwx8VH0
	 VO/fnxije1al/hX/O+nTSNIoJeclsLyyFEvpvYJIxKLRMYveuPW/XtbRcNoxu3OzPo
	 3lGHgRfpys4lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407A584565;
	Wed, 10 Dec 2025 20:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 023A7237
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E782E61BC4
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNn5FCV2rZei for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 20:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8156C61BB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8156C61BB9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8156C61BB9
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:55:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2071020039C;
 Wed, 10 Dec 2025 21:55:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Dec 2025 21:55:42 +0100
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 21:55:42 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20251210104709.2144823-1-giulio.benetti@benettiengineering.com>
References: <20251210104709.2144823-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d6369a1ab12e6fb9ef93f7422f67e1f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765400144;
 bh=+qiRVyr6MhDJAzaeEjcyoGRuIOTx0Rg+V5ea11aT+kE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e5dJ+2iHTC+fzjJyi71D/6lDtH1g3uIKxCp9YiSMpD5co0Qr7Ywm5PnkPKYmQHUpZ
 Dg9yiXDG1kXx7jXUnZIGJ41JrVv+qB5dY/7XzBb8JjQFxOPEES8hmO7wiLd+IKqhuM
 s9erTOq+n6x2rfNNs2UhsKZkCdi/h7/gI4qxn2tVU7f8gvEJGIqqsai5UBW+bn+poA
 UQ3Wr2dPSErrcjN9+rkpnRdbSQnGb30WXPmngR6W2V2BODrjXI3HjP+kEC1Ed5CYVZ
 5zrOSGO19x3tcYjjqAFyr8oPzO2ZK7EtBozHxJuD6AQ+LGy2RrvzRF8BydMKdRpMm+
 obXbFV4PWL58w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e5dJ+2iH
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure due to
 sha256_init() conflict
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

On 10/12/2025 11:47, Giulio Benetti wrote:
> Bump to version 2025-12-10 on branch v5.2.2.4 to fix build failure due
> to sha256_init() conflict.
> 
> Fixes:
> https://autobuild.buildroot.org/results/12d0a01d3d3ea17bc99ee9aca5b50d20be83a5f4/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
