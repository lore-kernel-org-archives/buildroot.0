Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B1FCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A36F60659;
	Sun, 18 Oct 2026 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXbsgZVBGx_b; Sun, 18 Oct 2026 14:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 54A5060611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333646;
	b=ICdd95tz1RJlrQlD1q8foargnQsESJTIR2CKUpU6vvEa5/wQbD4uwwVk16Qs6Df41xqa
	 qXwCfZMXOwM2wKbhbkDntPgcjhRm7Xo0LZfzjDfDBQqMd8IBRWKLyB6EaV+rKhiGGY9hP
	 0d0Q2obFpCe1veqLYMGQW1ewdjabVnMPZ6B3YcEZH5/eu65TDlSiy9tWwmOgWBwKQNFm9
	 zE6OtT2m9UdQha5SzGCq5owTKfACmDMR+JkNT/t7XnvnRQjCedh3EcFrcTh6ZkRGggQnT
	 PldOgLTq8QyuyXH2iB7YuD1Cr2EjKtm1KaNUdEInfyLh3PMtqAcV47Pq0EDYu+Ubu5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=mGvetu2GH+ykrq7BYN84V1a2HFqu2Bz8ZYMzhckyA6puKRZkEepQzaLapLdy8rgupacp
	 Vb7zD3Ep3z0EZ5UBtP5kPziNmmyfR0+0Gupa17AgwN8bSClZQS6tfXlpuR0LHgFh1jtnn
	 pDf1yVLEwNdmDCFVaFDog8c6hL5d/ENo2L5DDpcMf/GAVZCwhHG0EMHiqEspTXf2O8URr
	 C5x8uTrBpgnNLiv9JPduxnicyT3cdBc4QwHQcK8ocC0nITWU++S+tSoWfqfJN9PqZyZGG
	 yzOqnkpjX04rxZ0eZikVZYz3v5XrU3eoS19v46oqQ9USVELW9Pf0hJQQN8GcJv1STKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333646;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bzpK6Z68fW8A26QAzXsLH7/D5FcMTHyJaMsMQH1sRT2XmDKal2xJTtFOxe2AbPnFj
	 EcFRcuB636l3YsBScJPi9dYDnUh3xs3oLJQXF/KZvgFn4xC5q0Me7gLLls+Uy6IqPb
	 vDzrYm60vhq4bxgTXfpjDyq1yqSMQCIDOQADbXnSf5lBvp9rL3+W3qF7/6Dv/kxk0p
	 zpLSWu+efxSeDKh16OQzhkB1NVfdreIPm5mtlQutk2/PQ4xYZLQuGk4b4Jh4gv5xhw
	 jyzT7jJXRsewDmBQ9r0jqVkgFXZLJ25x2bYsdHDHjS5ZuhonhNoHEtWSShv/XjyaWN
	 1jCDk1STKf9Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A5060611;
	Sun, 18 Oct 2026 14:27:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9CFC2A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB9F280D1B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFqdi5DKymwn for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:27:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F28D80AED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333644;
 b=sKhKiHgKYd0oVJek9PrFih96T1Jofxsue4+dfcnKBBPNaYGTQSrsV57cXHMo5KHEASqi
 GkTxqihaQ7gMq5+U78I/3dn5eSfbF2CIfiuT9JvS/IJ2BDbW8E4FP5x9YPlWAECGvPYWk
 vTtlUQ22Y9P1DUBzwMU/XRyMjNdAbxEbYHcxP2ztQ3d1ZL71VogaWoIELjeu46JSImnwq
 iI5tjuTVE/nEjORIns1MQ1rAQ+yJjZU2hrO0r956rzqAvGlJlGhFLzVGPUCqoma/50/W8
 Jhdlur7Zx4odBH1UFvtvG4oNaLbyYGVZX57ligMKRdU2dPVrDRFDLq+I2PMfCDPsPlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333644;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=SAEl25SRvFRNHx6Jb//vZwJjPyT1b55rtZwLhMhGT7sjbWh0WaDpAG60VCN4OsO67V5j
 1+HeczJBx2o0uMO9UGk44IuBqjstJyy9QtSolbt2KZVtANLzXUTOYk+J7aCU37h0CQrLX
 I1Nl1+e6CCPC7ETB8jJClsZgxtS0bpA1DCnVGuZesG+rtZvoKxrjyKCFIqFFTkTXl538y
 x6zjndB1qOi5+LpWs0O1SkZjZYwxKVoFin6cuKUVnG7gFpRQ/4BK6WFrVodWA9xdTnvlY
 BXRzDuuuYX4CIA3E91Atn1qibO8rIUEpgFX1JJ8R+CWFZZ0nwaNSeWLjy/y5K2mCnCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NYG7Psqw; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F28D80AED
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 50FBCB0053D;
 Sun, 18 Oct 2026 16:27:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:27:19 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:27:19 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-5-james.hilliard1@gmail.com>
References: <20261015215210.3426895-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <40810e9f8fe16ac456818614808f1e22@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-filelock: bump to version
 4.2.0
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
