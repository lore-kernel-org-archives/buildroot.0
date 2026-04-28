Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B87FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76AEC610DD;
	Tue, 28 Apr 2026 19:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnxW_kmWmbun; Tue, 28 Apr 2026 19:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 234DF610BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777403635;
	bh=xx0KqFIryw8YA6bS5oxSqlZqRPwELuPpNWHdi3/eWJQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B1GxeV8T0bcJFji4vnMNV6UFAovR5FUg+YvGvRPpvEWyK4v8Q2lxJEkimm1q/0s0t
	 OZWF2ZrFW7vcpXQjwAVBqboxW0hH9YhGB2o5ad7rihu52aOPE9QW8Zb/IuytbWTkhO
	 S5vlNM1Ti862DSjfKxgXfvbFgF2vd6xo3mPOctf7suZ64UOXwsZQRelK2Dtu4y3f3A
	 ccveMZ4k0UyWZ1o8swynaTNScKkwII2Cf/NZnrETsMAvfTgGl+qmnr+6fdEYu50PPr
	 BymawJq1swDLUQH8n3s6y1PHywqR0O+RlkuguG5iSzmaBeofhzEO8UvODx8S/hntKs
	 Jd0SZfK/N2QQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234DF610BC;
	Tue, 28 Apr 2026 19:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85C8C1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C47383D6A
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ax-LtT-9tbQD for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68D7883D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D7883D17
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D7883D17
 for <buildroot@busybox.net>; Tue, 28 Apr 2026 19:13:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7CDD878034D;
 Tue, 28 Apr 2026 21:13:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:13:49 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:13:49 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260427110022.71260-1-francois.perrad@gadz.org>
References: <20260427110022.71260-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <c9e620ce1178a3e2936797b1c992d7eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777403630;
 bh=ellXHlTmoj+9XSY/ERvsJPjG5lIrZFSf50hBYEcXAf0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NSF2dB4D0DFbQHbmwJ+MdOtrc75UFThlgmXJJBZkYQZUM0qIbXkEsn8uKD06gt1X/
 uWyaVrRlBdGhh9cGfDiR2vnb22nqH4jd0QkevIVZ/il9QfuZq/183bPytrdoA+JcNY
 O+g4UA8BLVpaNh53TpaF0V80bGUcTUCwmjqYM6Z270UeHYVs2TQ0wGTBx95ec1DywP
 R0WWzEdfM/Q2takWeSWNUdkJYv9YkyWnXgvBUL3DK3TYtF5ol5Go0HRdMmp6UymkhZ
 OpHFLYXAHuPCYq+nBHBHwB3+JxH5Nq3XJMRDHOmn/F5Y1Lfs0f0Y4cgye8gV4WpwfB
 GYEABWgmLLPRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NSF2dB4D
Subject: Re: [Buildroot] [PATCH] package/mstpd: bump to version 0.2.0
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

On 27/04/2026 13:00, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
