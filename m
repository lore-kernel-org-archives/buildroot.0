Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB0BCAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF1E5616EC;
	Wed, 17 Sep 2025 19:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKWUsh0Gfl6r; Wed, 17 Sep 2025 19:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11FB1616F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FB1616F0;
	Wed, 17 Sep 2025 19:32:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B4D279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43B8D616F0
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJtdOB_75QsH for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 19:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FDB0616EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FDB0616EC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FDB0616EC
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:32:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C560413F899;
 Wed, 17 Sep 2025 21:32:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 21:32:23 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 21:32:23 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250916003319.2510050-1-james.hilliard1@gmail.com>
References: <20250916003319.2510050-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <06632bdb93cb6206bd674c684b9407bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758137546;
 bh=DiZKXAVKCcuK1J1XjvM2o/PT6uwmZhwsA6v6+mHu/jY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aWm8RUqt3+RA2RhXu8yznxLhIbhLPpvWztTBjAuqxsO0jarO7rU2OIKCg/k5yjJ8Z
 Sz03zWBQVHPN/dEI99GjWFW898sK4InElO/N+6OQC/thvo/ymSPpzlnM1lBuvCI5pQ
 24hw4LCzAtIECdWwLQdWhiWB3B3ifFokX897MUsRwmJd9F2zWl0xTV4y++FdIejPIc
 6NLoDVgEs2N2VGcTSaKj/HqDC5iFRSAsT5piK/5x/4qZnlsxPlFuTdpKRUOFGoCijG
 3C/73ARRusYRtdS1QVdrFur49dBtbBXZD/pRvd77KcQpdjNClOs9/+kaoJ3+WOmBg7
 WYlC+Ds96HgVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aWm8RUqt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to
 version 2.11.9
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

On 16/09/2025 02:33, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
