Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4EAC282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 21:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E6160A54;
	Sat,  8 Mar 2025 21:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFGUlp_yg_QV; Sat,  8 Mar 2025 21:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24D460A68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24D460A68;
	Sat,  8 Mar 2025 21:17:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 703311C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 21:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3EE41513
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 21:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgyLgMv_aCJB for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 21:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CED141512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CED141512
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CED141512
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 21:16:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A6ECA13F899;
 Sat,  8 Mar 2025 22:16:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Mar 2025 22:16:55 +0100
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 22:16:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250307075605.896903-2-dalang@gmx.at>
References: <20250307075605.896903-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <2a64f1f69619fa104ab9decf0091be31@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741468616;
 bh=+Kzx9gW7p9RKrxxnlbH/mSSqQh2gdtU6OmJLi5DESUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qrq3m4HkUo4J5T7KevB/HbWrBgoX49Fwfoxznj5KtwX3iKjd/kcUkgrWXDrDgQLKi
 kZe0KvAJhxOXvLOI0PDWReisFpe9QBrCO2VFnXsO3XRKjfgq118FJw2qRMz5Cy4O8n
 qyI2gIH453GhmQjh33rc7cdZlWPw2cGGaj9BdsNmk3HuIR0jkhwpNX5mF0J3HNAfjz
 agwza2Pu4CKWz5f2+9X5FnJnTK+sO1yIRmgF8IRMty44c1Y03Pr/05LGQbQ5yrV5jq
 /ixc7753DtWyC3wR2Jhii2s4XRYy4PKNbAgbpQcAnxNVbPPYgo9o5oq5xOu9OkZejF
 A8+1BNWCBo1cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qrq3m4Hk
Subject: Re: [Buildroot] [PATCH] package/libsigc2: bump to version 2.12.1
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

On 07/03/2025 08:56, Daniel Lang via buildroot wrote:
> https://github.com/libsigcplusplus/libsigcplusplus/blob/2.12.1/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
