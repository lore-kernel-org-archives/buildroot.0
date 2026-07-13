Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0B5C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E744A81029;
	Mon, 13 Jul 2026 10:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HEbG3cVUd4k; Mon, 13 Jul 2026 10:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7456B8101C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938233;
	bh=L4dVVsA10ChZGdC6O64vW0+j4lqTaWh0nHsQtikiK8w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BBFkyY9oz/44grkrgIQEuOi6Ma9f6Ye0/3lcIcbCdARzeIWnK2VNc05DF62S8a0tW
	 NUUceLz0+t5S2Qde8wf85gIgHwq3iXFye7LNUvct1XO6ecjdMZyywYGfnc5wBH+KOP
	 YUp6PLbW7eAN7gOSD9F+Z4IC8u+4My+qg750YaLzB7ipvD5++1evS9qfyWleqjE13C
	 PM6d48rm9nKMnWNaTIw2td/aCPpbJNyhW8BGYQHObLm+6V/3H9g5eUJiDpwg0Jw6Xe
	 +pinD1MUNgTlnDS2tL38Bczj2C1UPjQPSJDorb8GSQ7YAAFrhDP55h8g5/696uZbeS
	 AP8YLjo0d23ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7456B8101C;
	Mon, 13 Jul 2026 10:23:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9AD828D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC9560717
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Se5MDmbRjmRt for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D21DD606DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21DD606DF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D21DD606DF
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:23:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8F91919F732;
 Mon, 13 Jul 2026 12:23:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 12:23:46 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 12:23:46 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20260413151148.42226-2-maxime@leroys.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
 <20260413151148.42226-2-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <da99fca7529a68e647c65295f9c55e2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783938228;
 bh=Bxu8RCQOWZZj3byc5htoDCWg6pnRIYgHbtqup63jP8U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QmKC0Kb2wFEf7DnlS7f4ufTmoSNme3o9WNq7xXL1YmS7THEtAtGcRwqoozfihjUa0
 saxkzoJwPnHC65qkYqyDDggjrCrUZQj5z1g0jTI1pTep3tyh6Z11h2uXXWV0JOZ/ij
 oejBjW2HxtTd9W8eeOdaPGUmzBF4ntaOx/4iPwjsKf4rjiMDtZqTpJatC0yXaxvUvC
 afmA9yk5yS916nmwnagU6/F6XNvQfLecXyBIWm0imqx00HNmPx4F9iJF7Xz0TNYHUu
 1rwxIjmle6rYqTCtkOFQO1s4ay3SYEbd2Kyc+ekR9Ik/DVxkvO82/lKRQ54p6x+Rn0
 LQlOKXtcwudaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QmKC0Kb2
Subject: Re: [Buildroot] [PATCH 1/3] package/libecoli: bump version to 0.11.3
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

Hi Maxime,

On 13/04/2026 17:11, Maxime Leroy wrote:
> See the release note of the new versions:
> https://github.com/rjarry/libecoli/releases/tag/v0.11.3
> https://github.com/rjarry/libecoli/releases/tag/v0.11.2
> https://github.com/rjarry/libecoli/releases/tag/v0.11.1
> https://github.com/rjarry/libecoli/releases/tag/v0.11.0
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

I applied the patch 1 and 3 of this series (the package bumps).
I'm skipping the patch 2 adding the dpdk install target option for
the time being.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
