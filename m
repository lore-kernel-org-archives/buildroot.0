Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A804C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4656A60B52;
	Sat, 25 Jan 2025 14:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id at_UcbGph1UG; Sat, 25 Jan 2025 14:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A8560B79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A8560B79;
	Sat, 25 Jan 2025 14:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4310941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FB782B75
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnnCX8kkN_rf for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD04482B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD04482B49
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD04482B49
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B84D72003D0;
 Sat, 25 Jan 2025 15:36:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47700])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:36:22 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:36:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124193012.3814905-1-james.hilliard1@gmail.com>
References: <20250124193012.3814905-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <027be0bc04df7f09c7d37a0c0ea23dc5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815783;
 bh=/telcgjqeJj9sMtV0X+JNFnXHkm4I9JULlMJKYJuvBM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fx2Knf5YR1tEirTOIILiCGp0mBolKA+cIqY5hdk3zvQn+v8WmKHT7WniJ8Op60W5a
 wae6ZBAJmXqIJ7mQtmPS8e+0JnbFk6ozsFO1qgtPDIGR8gzblD/bIOQAMdYDP1yXR8
 bFnvzdl1Z4W4BOFfV0glVbQl5TJLITbXzTc/D6nj2piurMu68gx8mTJlJYsjWOIiM7
 NF81MB6ORdpiGjkuE0MxIiwTfI4y8SolYlv2UMkJehY8UWnQesuKaVKmQll9itS0l3
 a6GAaXWgMow2x5nTjpWwpWL1iskLA/5KDr9ncMAKWXnrFSSvGk5dCe/wyAa0b/5okV
 2KGsqB0HXlP4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fx2Knf5Y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hpack: bump to version
 4.1.0
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

On 24/01/2025 20:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
