Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F95CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E521960601;
	Sun, 18 Oct 2026 14:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xOTC6Q7w7hS; Sun, 18 Oct 2026 14:26:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D99D6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333575;
	b=lNTbXuo6dSPTw5fNLpoGxWZEaxOmMt7Vx1B0wGfLiX7iPdtJbkNhUCgfITfFhhmkruA0
	 tEauu+0B5OfTvh4MYue6qcNq1yYncKrtBrrCCqKrwYmH8ItCRsHOZOS14K3PnB8Pl7Bl5
	 UMf8k2AG3wuSJGc8qyL8bijLELISMQRd2w4oO2r7tx+fDwU5OUI9c8uL08xlw2pSyQMls
	 TjW8qNpo6TtQ3xt1X5uLAT6nqaVjOyoW7Pin9U3QwL6T7VR1qkx9ebcTw9YfuvDqGKrLH
	 nZVz90oo7lNzZ0HvKewa8oZJPonVvQ0mDl296TssW397XSFnDjBrhc9rfF7fUAdzsfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=ef5z/v/+exgzue0m2ZyawvAxCB4uYDRfXlPhf1aXFpV8Tp4uaTqVopxAudHoz1wnX4ba
	 vM3EVMP6J1uVnhpQLHeDylZn/lFCVDvl0zGA8oOzYceATcTsN5BIhiAwK2JF+9xrz5/S5
	 57xrNh2IVW4oO8XamhHd7PdKBEZwSUaFrpVNcQWR3a7nFmL2+8Nr1BTf+VBRxbKywjA0S
	 Kj9gD5GYxbJProRZLsynWsnxT2DoPqMDimRoM/ugGQNiIJHtMdSAt+jmNXBDamyJgT/8o
	 b6ArJx4l6c/Xjjxmd16Y5OnQqGs1S6dkxo0Edeu43EFktJUTcFBgDqzFkp0pMmoypgA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333575;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KNmfbGO1SAWOKxPwdBoQrUNBIZFZjbptDYrvZKuFRQn2vLXSyJpmDfxike/+wFABe
	 dfyqK9nH9WorHJNnXgHmxcdJik4Xq5bgcBlKZ7bLbTVU7oQoXK/fTW9doJpP9d/oVm
	 fQ3hWHqI6gLUIFFjKiic+iF9mKQ91T8cV2yJTFGYFsLjYABggMikiD1mkkNbpDDXU8
	 Gr6AnKGXOZ69SuzrBk6u56rxomzsWEfP9tzzSS8UGCTk/Po33dufebW+TfAcFzo81q
	 BGxTyTg4dsuu8llaNDNuP4cYQBkEhdsYZU0O8JW7jgu/sIbvBJG9WS3XA2d1QFNJFh
	 xOnSNlGK0EOlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D99D6060C;
	Sun, 18 Oct 2026 14:26:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC10255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB5A4009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVAXVtvskfML for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:26:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8C8524005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333572;
 b=nR1aYr443e6TRurY5u2iXP9nfraV2kgXsDbsaFCsD1Gb5iTKBTe7qLXUZqtfs9SdTk5A
 68RB8jMId0/LSK1/PVq+IxRnXcw3IpN9Zvq6hnKhdx6DxggBtasXYCBaSFNRm8WQhhtj5
 FTCFR6IAZNlRtXVY9nHNJzgyX7MKQHCCOOUplLSiBkfFPvxolBjWyDZqfnhnCrrX4J5gY
 hb6JiMnSqKQuDHTry3bSvA2TUuSK9XD96ZcOqct3nYuB4MRi5Df3IlwL+rDAlzOYXU0kD
 x2UC1s/s2+RKd6qmBHosB0UxKjOwcZuT1iyySe2bLiFNVdrRyEeO621mj6S3Iu91wWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333572;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=atiMKNQzl90ZxeqAePjiMhmgvZGxCQOZpMsljf7k65uJbnqlihQ8Twsuhc76VXMDMAx0
 p5gMeyl+KBqIUMLXeNSgmTuU39PjDAaomVc2nc3+YsNua6s2nNXfvSqFkmlh/d26h9QEF
 Dz90vYj+5xPPSujHRVRRHBy/welh3AuRSCkuKEAFpQGuRz88qz1E15ggN0nu8S6xtGASq
 G9TD+quX4yYSLsR6jPq86SfCjyCZBCYDjJ9nAGew5pvnvpNaNQbDsClm8GqOofiRA5Qbd
 uC99fWt7TNH3awHPV6X90TqTlNK6ZsQgtFyKv2k3rxEXhyVHpzJLcMBpWs5+XyoKZ6w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ofXvm41d; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C8524005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1C218780503;
 Sun, 18 Oct 2026 16:26:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:26:09 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:26:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-1-james.hilliard1@gmail.com>
References: <20261015215210.3426895-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <952c9fcc85be86b879e5286575266980@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-bitarray: bump to version
 3.12.2
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
