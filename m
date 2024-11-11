Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1AAD2E9F1
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 515CE402DB;
	Mon, 11 Nov 2024 13:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOle04bukmxW; Mon, 11 Nov 2024 13:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D707402F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D707402F7;
	Mon, 11 Nov 2024 13:36:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32FBADB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C5C402F7
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BeH4VI9ITuD for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D362402DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D362402DB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D362402DB
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1318233482
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 13:36:17 +0000 (UTC)
Message-ID: <abe7699e-4526-4a31-8937-15005b800fb0@korsgaard.com>
Date: Mon, 11 Nov 2024 14:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240309213348.1646094-1-ju.o@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240309213348.1646094-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bJ7bLxbA9/3wxwv6akcLX0q2cNgH083pGXkJRAXI56z1uFFo/kEYknxdfhzm4DUKNmAGo/BTVax2xQbPMJn+bNCMBhqPEZ8YG+Vmo4/2Kx8yRNPazyZKONYQNw1HoMkXMFwV94qevNRdjOg7mcvcSpqkXeykPbKpKmg2c6xzQW8GKUCo8RWnzAS5ZvNDQAtrA1OGyDTQrOcUK6S1AIPEIYxnO0fbHXw9Ns+dKXyIA+cWqUZx9P9Zz7WoJALe3sTcyPP3ww/pLugjKffzIKIFC39Ao72VaK/efLxGyj7t1wt6jfdp93dyCjMpG2dj0zjveQ9lVnNNz4A8YyTgSzA03Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=guTW+AAYAq4XiebQKdpO4NFnu5ZXD5faUsZ2JzLCQxg=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=bJ7bLxbA
Subject: Re: [Buildroot] [PATCH v2 1/1] support/testing: add python-pyqt5
 test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 3/9/24 22:33, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Bump test kernel to 6.1.81
> - Solve missing font issue by adding
>    - BR2_PACKAGE_DEJAVU=y
>    - BR2_PACKAGE_QT5BASE_FONTCONFIG=y
> - Add a comment for debugging commands with Qt KMS/DRM and virtio-gpu
> 
> Note: this runtime test is expected to fail, if applied alone.
> It needs a fix for pyqt5 to succeed, such as:
> https://patchwork.ozlabs.org/project/buildroot/patch/20231123174024.2435683-1-hypnotoad@lindra.de/
> ---

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
