Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798C4CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41528607C8;
	Tue, 13 Oct 2026 17:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUMx5KbMi97l; Tue, 13 Oct 2026 17:55:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E78360745
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914102;
	b=XJqCra7aNzvyQY3ZdDY/W00vlU8wdaPZcntn2/ywtF9QgSx7DYsnR3WtGFC6h5687DvB
	 7Fe9dSFTIFeKrUqJAq9NtYnFBqFFUEdYyIoSHNgHR++luY/KGcLEmXZSQszTtN6u+YkUF
	 p4XXjn4252x3g1ZmWyQcgY1aD7P2jGKjG9Id5FK3DCEGPjCsNkM5+h8lKjDkTPwTfC+Ef
	 AQJGjIDXzTDUtqRwYIQ+AqNmmrWq7pTyywucAcxROadHSd7Yxp68s13fZWMDzqSZFLn2u
	 LE7anHtjmDLawfHvuT07ik3wQw15Go0a0ulpXJoEJ80L6dKDNExYa+pJbaDlFVUw6Fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=txHuo8fO6EM19Cqx9XmSW5xwIxjvX2TLiv5uOi0ab9I=;
	b=RV5vEOAXazkwBIeDisb/cL+QpJjjscDXW9hXkeUIcF/uaBq9AfBgrr+U1/XzQS9bTJwi
	 c/0F7znxwA1NpE5Kf4WO2sJDTFLJMwf9XTx4BT551azTKaglBBvnI0wguER1/7xkNX19k
	 lz85BzGa4ZOJJbx51HzdTLkvPW7NC/KKkDpyLO0nrcCG8ca1NOuaIcX2yM4QphYQIQAyw
	 7WEw1qVt5HkhRslaGh+f9UvW1jjD2NnAqixqaiA9CCuRK0Dw6C9YllS++ZsD8/wkzad18
	 mVLTeR0aoZGENC4ePlDYLji6PEkYPsvtNgTeKsCFOvsORMtTR69hBX1KY2mkPuiMVLg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914102;
	bh=txHuo8fO6EM19Cqx9XmSW5xwIxjvX2TLiv5uOi0ab9I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EJXLz4OQn3/g7UsdfvfqkYSjdVPG8WBaWyA2hdbGKFdDiKAOhNrhEYPMlb7p8+gWG
	 wQlqDtAVwegca3BJxJPcPzn8QrKYCMgCKjJYNKHuWUI5zzAztFpG4UOfUIkxM+VDrt
	 pxWmJTtLJjOasEB1mK230oGHUbVloJD47hirBUCFdBmJm9TJGXY3lr23aDtls4F0E0
	 RUQNvu5KkZ2I1TIKiF58t9pwBLRgetUjIppHGKhGaWYA1PVsLiQls95eZvR98SuKfH
	 6J1g2SLXJkxTda4E/BtLADTEJwBVTXUn5Vmns9Q0X3aZ7Lbf76/iPkgqosC4sHIgpW
	 2M85Td79ydkNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E78360745;
	Tue, 13 Oct 2026 17:55:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39EFD2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A9AF60745
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWffU0X1es2G for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3AB7D6073B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914099;
 b=OEb33CNTZJdoUfR07OmpQhyUnxov47EhRxTZtWL2zgMdRYXf91l6KKaYwzxcl9Z76Ljd
 DjjGo1OVKuizEP+cRGQI3/Ij1qDAkacDVeqGwqwq5VdlQUKMUnGqPMogIZWpRUEHzEtVW
 54FPzmbHsf2gbJ6JYFaYkF19AMz/I2xgw+tlXkOsElleUBjDkQErE37oU7Haq6DyBV4sR
 zKNpWMI/CKYP1Vcp3qszwHMpOXeTA9bHTiz4jaz/V0WOIOr4qE/l9mca5SzIQp4Y2wNdD
 ZT8Qt6VBOtiMgriNAJKh5x2iElzKgtEg1H2rPtUO5vDFi9Pg0fn9Iu1MB9MXX7B2ncw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914099;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=m2Vl6Q1/6edhBfJ99p3YiF5Y75wke5vNtv9tjHzCOMA=;
 b=UIWWDilHQrXwdLUlPxHB98N1/GHjoHiyewvgJVkG4BsSmtKAiYX5LGyCm36a/8XrqrLT
 IrKkFhbQG6g6h/VwTTKYFRPyqEG/ti7FcZ8YieGsaDJPaLQbO7Bd8yVmOiVk6oyT7H8+l
 ob9+6n576GcCOk1NsiwssT90KAlQqy2BFk7G2q+Xq/iTA7HUEH5HCpka0v+wwUKDpD4fJ
 sgMb+zyUn80pw6AbXD/fk6//KMqfgYBS2uQjyozswDa3qdfhXxB8P72R05JSI5HmKrp9K
 tcBgyNUQJqTwPHSoan7pKFltB0fV2g2tnwgDL6APRV/F3Fkb2ssSuOAK9z5STLadLBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="tPRZ7Dl/"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AB7D6073B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 51BA2C653F9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B16A860362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:56 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 472D811D703F4; Tue, 13 Oct 2026 19:50:43 +0200 (CEST)
Date: Sat, 10 Oct 2026 18:34:34 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <asppDyOWhx3sIjVt@windsurf>
References: <SY8P300MB0041EEB4A158C2FCD79854B4B5912@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041EEB4A158C2FCD79854B4B5912@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-TUID: Z3JJjJeTxW9Z
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 472D811D703F4
X-Spamd-Result: default: False [-3.27 / 30.00]; BAYES_HAM(-4.67)[97.96%];
 DATE_IN_PAST(1.00)[73]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_ZERO(0.00)[0];
 MIME_TRACE(0.00)[0:+]; TAGGED_RCPT(0.00)[]; BCC(0.00)[];
 FREEMAIL_TO(0.00)[outlook.com]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,gmail.com];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,outlook.com:email,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH v2] configs/visionfive2_defconfig: bump
 Linux to 6.18.55
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 11, 2026 at 12:31:48AM +0800, Fengwei Tan wrote:
> When running iperf3 with Linux 6.18.51 on VisionFive 2, one CPU core
> stays at 100% load during the test, while network throughput is limited
> to approximately 793 Mbits/sec:
> 
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-10.01  sec   945 MBytes   793 Mbits/sec                  receiver
> 
> The regression was introduced in Linux 6.14 by commit df542f669307
> ("net: stmmac: Switch to zero-copy in non-XDP RX path"). It leads to
> misaligned access exceptions when parsing packet headers. During the
> iperf3 test, perf stat reported approximately 9.6 million alignment
> faults over 5 seconds:
> 
> $ perf stat -a -e alignment-faults -- sleep 5
> 
>  Performance counter stats for 'system wide':
> 
>            9620073      alignment-faults
> 
>        5.029337000 seconds time elapsed
> 
> The kernel must emulate these unaligned accesses, resulting in
> significant overhead.
> 
> The issue was fixed in Linux 6.18.52 [1]. Bump Linux to 6.18.55, the
> latest stable release at the time of writing, to include the fix.
> 
> [1] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh
> 
> Fixes: 98aa14a186e1 ("configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1")
> Assisted-by: LLM
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
