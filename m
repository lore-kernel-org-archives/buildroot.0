Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E89C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3728C60F01;
	Wed, 28 May 2025 20:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwEA8lZsb9yv; Wed, 28 May 2025 20:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6816F60EB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6816F60EB3;
	Wed, 28 May 2025 20:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95DF4B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87CDA410CD
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiEvYOfxAbsv for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B253141082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B253141082
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B253141082
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:29:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6E45978035B;
 Wed, 28 May 2025 22:29:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 22:29:11 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 22:29:11 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250527215621.387724-1-kadambini.nema@gmail.com>
References: <20250527215621.387724-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <041ba1cd243ce9d45c31899ab1962871@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748464153;
 bh=5u3F5NfkVNdNL1qCOUlI+9SBroB6naWjt5j2DMcjtlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X43Hxcbn0bKBFvZGNebpMxQmGh9c4rZo8kvdO/cZ3ac9ebTYBucBrG4rR/2KAeZ0y
 wOHZAoN1Qtnbf2ayOSZfJfyUhOIWmy/tU97JX/mazeYhyaA6uJSDsjW83df3nWHNTe
 N7oNP2sqji4yYy9wOrRi+MgsRFmTqZGL4qcWEM0TIeAGOSkk2725w2yZd7F/XDedmM
 HiDv/T/khiS5nK0ycn/LVs6ZRdfYg9WjuOkincgV7duBySW2Ncvcawmro39nwiTv9M
 Z/GGEFU1comrIGAEBBQR3LvZ4wY/FpdC60xo+YzruHcaY76qweDWbM2uOqe7v4QCR/
 bnVxGu0duwOpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X43Hxcbn
Subject: Re: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.6.1
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

On 27/05/2025 23:56, Kadambini Nema wrote:
> Changelog:
> https://github.com/rfc1036/whois/blob/v5.6.1/debian/changelog
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
