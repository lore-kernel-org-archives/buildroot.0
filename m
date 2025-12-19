Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BF3E66884
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4BF2612DF;
	Fri, 19 Dec 2025 17:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6TBSzCqt5Ug; Fri, 19 Dec 2025 17:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0648360D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766167009;
	bh=S2H352DMkbfRXQvNK9X54E5pIG+Hsq4eBBi9HRi1570=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RD/A22IfdV4pNC88iaBc48vzCiiQvyNyUoXsJ0udrbhDYNBq04JFFLeKFLbFraXnk
	 4nC8qB6r3yZk8Cyntmu/vUFoYi9lEHIce4gMThEUFA3MtAfVE49eBv76wCM9mUCdiH
	 7FW2mjWBXOWMEpIF9IH38436YC5aE4dc0oQOzx4QAhf2i49qPN5D6zNd5vaUk9qGoT
	 XWahSo82m86lRVGqPzpZOvuEe9CnrsidWIyPVESm2XYuIssHh6eRf0GvXMlIr6fhbT
	 ydjc4oorDCcrUd11D8wFqtU2yRyxcM8ExNP3OXLoVyG5xL1kP+4RuXzHojNUICyZPw
	 LIx4toB+UTgCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0648360D8C;
	Fri, 19 Dec 2025 17:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 243A0293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1645B419F6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Rq9_pdWrnqv for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42FC64010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42FC64010A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FC64010A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:56:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A7E7713F8BA;
 Fri, 19 Dec 2025 18:56:42 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 18:56:42 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 18:56:42 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251219141944.43869-1-pkerbrat@free.fr>
References: <20251219141944.43869-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <ba637b3707ae9f71c4b475b78baac294@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766167004;
 bh=TsyEosB7zCrw9I7jAbPVZvM73bpDfDouAGA2LZGWyBI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VPWpNx2NvQMioiMNiRGS5kDadvf6tqd1CpujQvMMZfYiExMvDBsKLlUnj1fuxpc41
 rzO8wu4rdRPUt44fWrfoxmPnpel1AwEmqju64QpdscNKMXMQR+PuC0E5BMcPj66gFY
 8KTiwfthIHp2ahGnJQLZwzRKbq6yv7Y9fnVt49hfoyY4ZKLj95ybY0eVmqp/9C04Fb
 WqbGLaS+GAB1lkBbU662zhCIHe+Bl4jANqe+EnUQ8V+d6y+KVnxDIPX+k/wVDBoUuW
 oSnhu7JM6P38IdCU956ADukFRO1udEuFYvCfP+7hFQphClifLgquK99d+z5p/hXcCt
 4cRVwvuDR9DnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VPWpNx2N
Subject: Re: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.7
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

On 19/12/2025 15:19, Pierre-Yves Kerbrat via buildroot wrote:
> Release notes:
> https://lists.nongnu.org/archive/html/dmidecode-devel/2025-12/msg00039.html
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
