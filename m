Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B4DD711C8
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 21:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C25183EDC;
	Thu, 18 Dec 2025 21:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcwL8hAUq3mX; Thu, 18 Dec 2025 21:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F09D183ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766094211;
	bh=2pHOVvAXb/Va4s+dNzFz8VQVmYgtlA2Rs2zBeBkcGHE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HEHuZCZlawycXBYZowvrnDUP4+M8+kFxscoxCejtB2n3OTYtN29hb5aTTfn6joC2p
	 SMbm53uNIWM94yCZypqvXC85InnRAXN9ZrGm3S8x9pJvpZPOWmEBLqJf89jV4GOHQO
	 PxRvbs2sXOCDPzT/NtRncguUcg/TY2zlQURS8UP/f+u4bczF72PMb9Qg4bHWfHILZk
	 Rl1cUXKiryt9QO5dp+G3AgLfA6z5J2+l3MRaZoTlU5DPDZ9P+IWSw+cDVfF65eOIgx
	 CAtXMP04Ry3BKfKhRhjPrwml8ucAzOxnmcHLEvkEKY/i/XCr5DtCP0KJBw54e2nZnO
	 lls65I48xZb4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F09D183ED2;
	Thu, 18 Dec 2025 21:43:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC95293
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E4E401A2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gw3hfKQGFy1w for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 21:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC2FF40132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2FF40132
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC2FF40132
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:43:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 66416B0059A;
 Thu, 18 Dec 2025 22:43:24 +0100 (CET)
Received: from 2a0d:e487:58e:a561:62b7:fc9e:7363:91df
 via 2a0d:e487:58e:a561:62b7:fc9e:7363:91df by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 18 Dec 2025 22:43:24 +0100
MIME-Version: 1.0
Date: Thu, 18 Dec 2025 22:43:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251218185322.3943200-1-bernd@kuhls.net>
References: <20251218185322.3943200-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <5b39093b6073f1964b314fe6eecd7744@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766094206;
 bh=XfItQP+/QUhJMPq2RZI70OT5v0MTeccBFuiYGmoG43U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QK1T+3chP+ZQVsowoCGWQ2miQtRzIJvCEU3UQLW3Ucg0xF0Fu4GWDlDfCUfcGCgC7
 9lDc9eFtelIkHT3LyjkavAAJNpLTc9Vq7IwEXnZXxvuQDFb1Ft/g019bdDBgY9CC8C
 LOOSELdjzwY0eJIYFSuiWCuIMJ+0Wev9XyXgoDqnVzNrjS2plPs12qNjAc6BjiOM9z
 R2/fsuCu73PuOisTy4tSfbG0cNPbNwURNMMvRCWmZA3A64v9oHjNbVBOPmE9bRj6dg
 UjMR2mQWJJgChyVD7D3uHl9h+XBLSO2YF5R7bzaL63mE6E1SF0HK3CcGJQuWZguZpf
 QDZ3M7eBPMfUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QK1T+3ch
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{12, 17,
 18}.x series
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

On 18/12/2025 19:53, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
