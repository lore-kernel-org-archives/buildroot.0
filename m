Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD4AE668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 18:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3E54092E;
	Sat, 20 Dec 2025 18:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b928pDdm_lEl; Sat, 20 Dec 2025 18:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4205040923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766254903;
	bh=w2HnGgfgMWH2YDmSV0RUcfHHbDBea/oqKnhqGNfIXfw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fMqBntnxZPyO6Bc/wkJPmtZROjKzMfWyrRTksuSEEgUfvJ2vvYToj65iIrkzi8qkM
	 878RrTrskez8qWGqcuSk7ZUF5po4cZ/B4X9zr4qkH3d3sdgWeHSGBY9Rs0KCVNnlPJ
	 jr/tc/RTgxYO3nV3tFY3KeU3vqXc/3fiMpcMhzj0KLZQ9wVMGKu5Z4DYAR+Sf7sVyP
	 SZnl+7tVHevArGsRXZdxnPqRF4az0ZfLB/Wja61lPDbfcWihI2LPCX/CWpUOtvretj
	 iC8arGC/NTm1fI9e8GWfnTnhjYcfzconDJmm0bd2DyFtAL1VS5GOxqP5S6lYdzK7Vw
	 uL0lPjmpCy2Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4205040923;
	Sat, 20 Dec 2025 18:21:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D35119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8C4F60DB7
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bY2KaDDPoRP3 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 18:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15D8E60861
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D8E60861
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15D8E60861
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:21:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8B56519F5C2;
 Sat, 20 Dec 2025 19:21:36 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 19:21:36 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 19:21:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215193725.1735453-1-bernd@kuhls.net>
References: <20251215193725.1735453-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <8513b019d5fea3963f4e8c45a93ea241@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766254897;
 bh=fzZ/59WN0m7U9vXQIz8hntqpQliQp/jDlbvzbS/lNAA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kye03dASDF6Pb7cQ70SZf4Msu/gjhLk6B6IdjbE0YbDtolSHW2FbVG0/lpdqWbNWD
 8oDL5NxZ5Lc0jKbp6UAcAmZxpkXal6or819gfeetOMm2WE1VNwQNga/1/bfoT3Th9O
 L05bYUJ7Z7HzKfLkhDIqMFfCAcLZWi1ouot/eK54/BctPPAhPgA9LFvM7rzUC9xu4M
 7e6NHJaJ1/mJE/PeomEiWr2O2apGnlDGlO/53ELa0YZuMZhpwb2csJdbvHCdYnwI6U
 OXkUy1pGSvdi5E2yX7Us1nnhW5pLntEeIWhV0qT6YmN/8hsED21GQvKtWt6VbMNwsS
 LAQF+xJN79JDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kye03dAS
Subject: Re: [Buildroot] [PATCH 1/1] package/gkrellm: bump version to 2.5.0
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

On 15/12/2025 20:37, Bernd Kuhls wrote:
> https://git.srcbox.net/gkrellm/gkrellm/src/tag/gkrellm-2.5.0/CHANGELOG.md
> 
> Added sha256 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
