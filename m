Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A082FC36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F5648332A;
	Wed, 26 Mar 2025 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPSrfrAv82fR; Wed, 26 Mar 2025 20:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E78A81FA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E78A81FA7;
	Wed, 26 Mar 2025 20:16:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 542311B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51908608EA
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEydfpi-j7LL for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 20:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53A8D60899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A8D60899
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53A8D60899
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:16:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7A7DF13F8CE;
 Wed, 26 Mar 2025 21:16:06 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Mar 2025 21:16:06 +0100
MIME-Version: 1.0
Date: Wed, 26 Mar 2025 21:16:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250326080506.3467586-1-yegorslists@googlemail.com>
References: <20250326080506.3467586-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a128c9823cc6dec3eb25aecf75837d92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743020167;
 bh=ZOgGztsN5CyQMsH9wdLJbYdoP6GAxoWVurektcoL69E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N2sAuubJhTmRFFWCyggXRxg/mUP6xW0YRdQqLOK2cdErukJI/wPCtQGpxyV4LTJ3V
 dZ7A/dP0Zr7x06+QTBvVggHh0bTyMNSq5LZ29/tsvb2fD8sX3S/4CmNnXHOzJ/hfvA
 kuoTM5AxeQ0J7kbLkcJtpQsKfDtDCq15hfGjdFCPszxyTo0V0d+9lkx2aiVEGWgZW+
 jjKPNWNo/XL3rpCu130R1CVDNa5iZIMW2KygitRr3SXvL3/4oU7avao0KuWFMQcQg5
 M5UtK+zoZAYycMkXwXn1kyeAQ9e+rsGm1HWdtDkiowpMNIIR/roSWCnSF7DXLSr/Xo
 7TS6hSIyp5PAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N2sAuubJ
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.9
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

On 26/03/2025 09:05, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed patches.
> 
> Autoreconf is broken. Hence, use the configure script directly.
> 
> Fixes:
> https://autobuild.buildroot.org/results/60c3dbe02af354ff9820258ffd00eec088114d69/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
