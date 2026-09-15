Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD0C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A2E80D1F;
	Tue, 15 Sep 2026 12:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nerPEzw1nOrw; Tue, 15 Sep 2026 12:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4D66F80CCA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789476553;
	b=fObuYtES8Rrj30MeATvXs9O+tdNQVa9m+PdvNPsIu+m/NZDFiEnHUcOahvs429hUWNF9
	 Ekxqn4BhX6TYNK9Kq3zZ8QFxTpUIEJt2gineNdMTazc3FGUYoCG4p7JkxEHclHk7LRaKl
	 saaIhtjLZJ662BDopdqPNqJl+TfU9qCcg/+RSEQHdJI3IB5QCiYiYHnL7c8ndZ9RcpPtV
	 irEjpVSjKHqKys4FO2Ku/TqruW6JZrXabcTpAT9es/Q1wFQ0XLkmzkONj0dqVjLFicvug
	 439dUsZYtk0uFsTpssjsoBOl0C4MKE68mlodcxCh9nyH6M7z9ARvXMqqLKKYy4AwHOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789476553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=5X5rrXqvc+BWz8BGcVyCPRRLuv9AiHg920CLiidN1UY=;
	b=Tay2KjkxIYo6a1zrFXagQn6XWcv7g1VR+2gneeRsMR9Ke/rDNhjwjgCypfA+BhAQAcqu
	 4cEU5v5UrYEzNl6ZrJW7CGZLjz6B+b/AlL1VaGXJkf/CWwA/LPphC0zdlPENeJFrEAgQB
	 np/ygQ1wTtuPCzT0k+pv/J9xKAlMkCbRLS1VSU8O8sJuvT8ONRnzhlQxdx6IzlMqKZvRa
	 Pe0he9BB/Z3rKUtUvVUHhjnvMmsI/aX3UtJMjAYuvNzCV4+sliG1NK8eLGMDAvNQcgjCl
	 gLJ4WY6fJCGCtzECtaB4WOKaG19LGbd4TEuCccA5QIMZpNUIDPJjJhsrK9aR1pozqrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ojxEZdZs;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789476553;
	bh=5X5rrXqvc+BWz8BGcVyCPRRLuv9AiHg920CLiidN1UY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7FC4KH3Omgmb+8vX3WC6pGx2L9iPgCDlM8u5QtsW73ve9ytbW38QuQYkZZcQ3TeT
	 SilYk9w1IBcjHEQMAlA7xr5bpbOD2DkWlBLAzyom6TL3UHWg7kqmkIE1GGqQZZca29
	 XZ4+6RRJPSnOonLhJ11rJj6MpyKc1HoOvAC1AyG+dIXDzAD7zStiKLRXoPuEtQKyeE
	 BpdCeBzcn8CPVgFhggfFZvwY6A47FGabpsp4gfBVV9zzs39FJ7LaOspp4zz1CdfvsE
	 Z7Sq8HiGSGllx2iYQXm3JlEZzWtSOa6b5XgCJzYp10tskw6HCZTSnCZkKmyaJNWuJw
	 7PQ5cjqeMqQ2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D66F80CCA;
	Tue, 15 Sep 2026 12:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E2CB259
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F84380CC3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_lGx-mJpNJV for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:49:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7345D80C73
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789476550;
 b=Ck71k+PpCqYXaBBX27Bag1cQlBEdJCKEyBIvWvAa7mEr+HzL581kXWPT28xLoX5GOZ4W
 z1EgBx/I2AshQRtuEW3/p0CXAQWhSw/1R8XTc5GPQeYJWVsuq52I0XRWVRCgUJT0SLggK
 uuwStRgFls77GbanZooKHXjvJeFvUjwgaVXLjZ5YJp1HN2w/gkToVFte0nceFiwJUmkDS
 XJXOMphK/FyrK/h7dp1dLUCkJfogerKHqfGEpd+UNrM67xut7blSa5rWIFkl//5h9Q/Z1
 l7/81ZeZCBXFsh5tKwHbRDyWC8jnein2pGhgJisyyw0qtbUdqZNb8t8YLPTQoc8X7qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789476550;
 h=Received-SPF:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=7uySF+WboW78B322/JM7ea3LzolBMKFCTjEz4s0k3h4=;
 b=XoQx5+unDyocliuxFvwsCLx+5LLmPfUuPxhRQwkWorUsbUV1BveznrpMh2I9SHX5mGmJ
 7JUn7UTqAsEAHXQ6c7hUi+dHgtkRsXTRgkMBzHxXzGEIp5iSOW9A0KXHDNWuf+ZkzIJw4
 eCPI1OXvtE6nTs+HI0SecNSh8ffgNUaDL2zrOczuf7FqUTyc6pMtburPtA1XPvdLeY8UM
 kDEI+rdWmZHL4G700wO7FDqPpkK3Nd8CEspaSFGBpKeagjpIEF4Um0kFhGoalcT7BBeNn
 sgYEax21qy0/7Me92JbgMJxr76rV8Vm1mUpKlGCZHaTNfSLuUAU0z53S9RJnjplNl7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=linux.alibaba.com; 
 dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=ojxEZdZs; 
 arc=none smtp.remote-ip=115.124.30.133
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=ojxEZdZs
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7345D80C73
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1789476525; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 bh=7uySF+WboW78B322/JM7ea3LzolBMKFCTjEz4s0k3h4=;
 b=ojxEZdZsIRAuqiUSJPgdirGDjW6dmy/kw5RHjJc6JIT5Q0+QEp0v69CjOISalutJjvPzyRGrRMZgP/6oVar1esEpC/4NhOh6MmBqj3Aw/QnMfPPAwmssd4MdhSa4dWxbXgFMuxomX9IexNVnx6QE08zxX4rSB7cOCORsVkFoeqY=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037026112;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0XB1irp3_1789476518; 
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0XB1irp3_1789476518 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 15 Sep 2026 20:48:42 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 20:48:27 +0800
Message-ID: <20260915124000.0000001-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
References: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/ndctl: fix Config.in comment
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
Content-Type: multipart/mixed; boundary="===============4460691196548283389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4460691196548283389==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thanks for the fixes. Both patches look good to me.

For the series:

Reviewed-by: Chen Pei <cp0613@linux.alibaba.com>

> On 15 Sep 2026, at 20:29, Thomas Petazzoni via buildroot
> <buildroot@buildroot.org> wrote:
>
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> ndctl selects kmod and keyutils, both of which depend on
> !BR2_STATIC_LIBS, but this dependency was not propagated into ndctl
> when the package was introduced. This commit fixes this issue.
>
> Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've confirmed that both kmod and keyutils carry `depends on
!BR2_STATIC_LIBS`, so the propagation is indeed necessary. The fix is
correct — the `|| BR2_STATIC_LIBS` in the comment's depends block is
the right way to express "show this comment when static libs are
enabled".

Best regards,
Chen

--===============4460691196548283389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4460691196548283389==--
