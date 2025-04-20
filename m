Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FCBC369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 16:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A579607E8;
	Sun, 20 Apr 2025 16:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62kVq5Owg8AM; Sun, 20 Apr 2025 16:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67396607E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67396607E9;
	Sun, 20 Apr 2025 16:04:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5D268
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00F40400D8
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTrJ3ibReEnK for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 16:04:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13B82400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B82400C7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13B82400C7
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8A17E13F86A;
 Sun, 20 Apr 2025 18:04:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 18:04:40 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 18:04:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250420113955.1143070-1-thomas@devoogdt.com>
References: <20250420113955.1143070-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f35622621996aa146859e6fa60f057eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745165081;
 bh=5qIt5RbQEN+rd1ePaBJqYL5yHBA1xWg1HYu0o3GAfvQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gl5piD9qByNeN0OwOv4A4phkA5GFsXZQ2OX62W4sQb4S1tXsIXzh4n6WDh1HNpKUs
 l35f5+WatMU4vl3nRYgD3PjCxGYFGl3XVHA484NrtosCKjY68bcOKJkq9PY3asHSae
 2nX/FwKSRyMS3yzotbBZcNNv1bcmwfU0m5B6fdl+gx4n2TYXj1QchnfQuCshQcm6vb
 Gic6q2dwFBN2d2vV1uzsf72SL1/vRHxBTDXCEgxX+SIgVspg2VTPcZAtsI1NOghxNJ
 AFObiy143G+S7U5obvn7KHwX6OgYLN3fYLVfT5I42asTIbc1y0a8ZtxrNL5nTPRCjw
 RnqccZSKjCNpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gl5piD9q
Subject: Re: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.79
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

On 20/04/2025 13:39, Thomas Devoogdt wrote:
> News:
> - https://www.lighttpd.net/2025/4/4/1.4.79/
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
