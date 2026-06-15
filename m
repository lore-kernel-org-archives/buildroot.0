Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A087CD98E0
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9818D41A67;
	Mon, 15 Jun 2026 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mx6BTWjbCRhF; Mon, 15 Jun 2026 20:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946C041A65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556640;
	bh=SdWY2R8PwGQLZlZ6Mc8ukCt5SFeS0bmho9mOqWTG0Rw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W9e0vjy0M3diLXE10y7ILGcqiJQNkPAVwt+IPnHMRUBmmXSU/RSGP1/bg7BM6s94q
	 klwjvFBNqrXvXkHYfj30+Vzz7qguLH4ADyXqka2FyFHAjpGYEgsQOtpjDgfAtOWRsI
	 Wv2eFyyt2IpRq2bm+OfVgHN/XN4MRejLJrusAv2ydwPEjwSAMCB1uPBMc3lesuBdaP
	 YVw9rGXBb4gSAJdnB9jJN2q+1Nd6A89+QrgJ2spTPl0os2wq8Be5UDz0JLzDBZ+AIb
	 TfrMb3k02ZHmrlzteSxWT9aqtvoETqtIZocJYKE0a4D0FB2J+IwX/h2exTWZiVp9vb
	 vShgnswdFm2bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946C041A65;
	Mon, 15 Jun 2026 20:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 373DC2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2963840486
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoDRolPxNG5Y for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:50:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A3BF40430
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A3BF40430
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A3BF40430
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:50:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DD79F2003C6;
 Mon, 15 Jun 2026 22:50:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 22:50:34 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 22:50:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260615194220.518965-1-bernd@kuhls.net>
References: <20260615194220.518965-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <133b905ad6e49358085f7b5aa46a9132@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781556636;
 bh=LQyPDsSpTIeYQh2/7X5prLGUKYaRHpl39zlHFSCw8Fk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mBNXCmVqMpr8/KicG2GSVTdokKHT+IuBOdeSXnDOnGDcf8VGpdjtQMzcb+9tpI03B
 IdDbfoW6t7tYBDSgyB0pLYYqvbaiJnecOOOhIrhOBxYAHZ1FYYseKGxjKFnxIP/lw1
 hvoJK4bsDFeVGDAQw21gUsbXdvPvulN4BIc6wGmaEv3JZNjLlUcocLuntgUPAcaT6v
 Q/t3gnbqbybt3g5tYiiWwowpyYf3scYlXMzCkdn9zm5T2sK2LlHG46O/VNDAI+/nFL
 43OYg189+aEPJqWmgytms8KgP2scDeAgRLyDJiSJPCFiemMbckuJF+TRpKPqrRWMGx
 oNUjQ5Tt2Nihw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mBNXCmVq
Subject: Re: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.13
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

On 15/06/2026 21:42, Bernd Kuhls wrote:
> https://www.han.de/~werner/ytree.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
