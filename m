Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4767E7719C
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB05960A5B;
	Sun, 12 Jan 2025 11:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqI7BEDNXV8X; Sun, 12 Jan 2025 11:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7BE760AD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7BE760AD2;
	Sun, 12 Jan 2025 11:15:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5488E68
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35D4F403DB
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygC7-QsZHieY for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74BAD40291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74BAD40291
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74BAD40291
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:15:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C85A619F5C6;
 Sun, 12 Jan 2025 12:15:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:15:50 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:15:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111171749.2909756-1-james.hilliard1@gmail.com>
References: <20250111171749.2909756-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6d76be0253add4403d64ca944c35af14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680551;
 bh=1jOjVjuxThLtaBMQhQ4h6WpLvy+1z5TAgPWU/NTc5JQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MxnNRIEj2TE9U8mWC7dFIUkCIaOIVwXjMknK0brdc33Pyq6sgzl6042jOPER8qZWe
 Xn9rBdcsfaXWfIlY9B9MaMHcogzsftu7IFmKCumWt4esSoe0APG4SalDDBDk97QoS4
 uWzj199Z9t2T3NU+kNq8ZXIR2ALrheUomWnpyTlDJCb846FQBYXXBVBRDUVMv62wHy
 oZ+ilZnKoWMmBB42xSkuTefFr94zMAiNaknFKK+9gpFNTeUkEY756DV0pX2nxiqIxr
 y+wIrCM82FsObtHH05jEgXBDXLNPhG++dKCVmc6gf1kkIjb9JMUUUvV2Q4NzhmM74w
 uSQbLJjVgYkXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MxnNRIEj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-smbprotocol: bump to
 version 1.15.0
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

On 11/01/2025 18:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
