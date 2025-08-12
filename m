Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21121CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 15:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64A4611E2;
	Tue, 12 Aug 2025 15:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjJ0WlLL9byA; Tue, 12 Aug 2025 15:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F203961147
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F203961147;
	Tue, 12 Aug 2025 15:31:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3645C158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C7FB61147
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nopjncI1-hXw for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 15:31:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0895F611B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0895F611B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0895F611B3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:31:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7977E13F879;
 Tue, 12 Aug 2025 17:30:58 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 17:30:58 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 17:30:58 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
In-Reply-To: <20250812055914.1152386-1-nemaakhilesh@gmail.com>
References: <20250812055914.1152386-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <753ae3102a55493c4ee005d107af6368@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755012661;
 bh=y9IKJDS+TvG1nB4ZPSRIe85wg7KDQoe+oKH5LUKIQKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mgt1U35TkOkAZDfLCXdbmgMLPpfPwZmeOkg6or36JFCFDdThglHVl0162LeMZaLWS
 0uKqs9+l4cjmKHjAY+k7RMjg4AUaaBfonJbG4Vv9bJ/DCb0BPDc/sBd28t5gASFWnZ
 pZSAtlFcXfiQQPkkKzjUdtB2MCHOS3asBPR2kbx46r6HjHuGDHI+0pagqpx6j/n0k2
 iUXOAhrXkUxKWbM0x5XPJ5Tz0x+5YoRjbRnbWYwYZdRjU8SFmtKqtM/q1ewVCeF48g
 sEHMC7JNhpbvTWOjgPtZLZWLVLSnmreC58pOQlN28ZQzDR5LpqpS9jhOnNtdnTSu+W
 tFpg3OBVbBkmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Mgt1U35T
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: bump to version
 1.24.2
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

On 12/08/2025 07:59, Akhilesh Nema wrote:
> Changelog:
> https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-24/NEWS
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Since this bump is mostly bugfixes, I applied on master. Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
