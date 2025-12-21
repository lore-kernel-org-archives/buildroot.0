Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39EDE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3841381BC5;
	Sun, 21 Dec 2025 13:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw6P34BXaR0K; Sun, 21 Dec 2025 13:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 316F2816FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766323315;
	bh=jXK1PaCyzkww5H5jd3uNXT80gMocwvhsklf/m/rdoCE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W5VXOYEUgxgQTu2AhXADfZ9ERoIfIsZaJ4SnUSzcZ9KHqyXKQ8frgRcaJ0X+jVeKH
	 h7lKNbovXoIgmxyPq3ODq7XD/w+r4dz/ZGO9uLV0KNp1xd7GDzCrOxaPiz1DfwMHDz
	 W5Yp5w7ZKDoIBFQkkmcqWhMCgaIwJWm5klHX7w+ARLxE+5hc6LNquHR7SSY5oxc+v+
	 UucGLKO1nyTNCI7rqwoLBd+qv2BpepolBaAIhUVQVxaQ3M7KVqE07F/DPzyS0kod6T
	 lY1kQh51WJSgPT44hEkcL1YNg3KYvq90G2Hb5UpBfrKAtEPW0b7YDiLjsEAIRbrFkT
	 cdARim2kK+tZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316F2816FB;
	Sun, 21 Dec 2025 13:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B143B1A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97BA44070A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXwPAbC74gat for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC8E64060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC8E64060A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC8E64060A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:21:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DCA0820039C;
 Sun, 21 Dec 2025 14:21:49 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 14:21:49 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 14:21:49 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251214210114.2523806-1-giulio.benetti@benettiengineering.com>
References: <20251214210114.2523806-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <21f83d663162e6f4a6bd51ebbebe82cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766323311;
 bh=v3EmcHsDA3S7GAZrTneKt/IRwO9OsgivbuJYHrxZtgc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OT7vbqKE/Zkx9PW+AO92Vh0YmJFryzUGkEvVFvcGWT/evZPEBLQEdvRloP7ucU/ww
 6KREaXshKM7aFp0jO5I8AZWYVbqC9DS7C9+C6es3nf8Djhe14++BjihBZkcrCvvs1i
 v9QSy8BmbeL+3wXPGd7nWEC1yA1T2SscRneVc1tYtdttLH2VuEeTpWCjzXj0HZviwA
 SOkfBv0edCTtkO2Ju23FfCN/7qMTU4S2lVuxg2EfI91DyMXbwUDMO/E923Kp9MP6Cp
 KyRUINSGkdjovOrnKoceZWIprS/tfVAip3zrCtSMrNEEU/EbQFwsl9U+fQSZpfVho5
 m3e2qhZsOTPeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OT7vbqKE
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-12-14
 version
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

On 14/12/2025 22:01, Giulio Benetti wrote:
> This version allows to build with Linux 6.18
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
