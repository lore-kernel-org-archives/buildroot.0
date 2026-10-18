Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB900CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46A0C60656;
	Sun, 18 Oct 2026 13:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ng0ML7i4Sdhq; Sun, 18 Oct 2026 13:40:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D5E46061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330852;
	b=lWxfZhMZLgkmhG4QgZ/r74cQ7/eAJTOJq+RFemhbYkkqSH4MVk075UdvDNY3nr3OKYfE
	 +VP54rEIqYeoxsaWvKD7QVyvIemZzuyqOGYmWMAW7hg9049+vS/IstAdTqy0aJiDTEsyz
	 VNOzOi9RrmRsEwVfcmpc7NaUJ7gk0/cE2CgJ9pO4O7o/X0XotMkTaDEiFe6srGnjzMdBg
	 2aJZPeoiQjsZix0zlFkb+ARCd3J2BIO1QZgqQEsi+IslVuHILsRyjgErnctHhqo4yMG9j
	 kAbku0Ejqb6KVoFTEvyaCpE+TuH26JxGlvE+H5EkoleIQMm+l0M8n8vJJiUeABJtQ4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kFoN55qiQ2QMfxYCwKaYYLIDd+7xdTzMEcJRfFEm/o8=;
	b=K6CztmVPRMRKjfXK1z8zSXBX+dhhtj5s1zLtex12GfwId7tC8V3jTRk8Sn4kMfCbjkkk
	 PjBXzcoo+LJVlLwvRcf0uLtj1oCm4Nt+SswLN4gXkP8CS/hGly7dptfzzciNiqHBa5NJO
	 LteLUvJHDS5mnbRfNJF6VPmwYMxWhgp00rTq1NK9aI//sFn/f7cqxt3CWEXjtiyN0VSlS
	 7+nQbIntf5Geardu7wEjuOzYKdXxxcWbj/l0kbrkUTOq3wGghD9WrALtl1pW1MAYtVGnN
	 J4XEW1XW8I7QusaRAzTc64Zo23LNd8I6EywXAj34cGIO+YETBM564LCpIHAPGpqh7lA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330852;
	bh=kFoN55qiQ2QMfxYCwKaYYLIDd+7xdTzMEcJRfFEm/o8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VZ4zT8ylgwemiErrVTltjB+xnn6xtw4fAKeflBmLAaSYxbgpgsjdtKLL1UXs6KV3g
	 I36k9Yq7Sfyk7qbFCqHVGFW9jYJsOuUfc20KLEDdEvCBjceNPlONmp48PkqmzvcCGj
	 RlE5mk8ZrmvBIbbhnACc9ieqIuwhlxZpyYAn/dSgmKZ1XmRHa//hLpheVSUQ/Cbhps
	 8R0TIDNldXZBT5qIRiyiaTCMZWvwE4HWPm5qg8X3G3rrsn1+sYGf870qqV42K+5Cii
	 MTex2Kvtz896Lqci7NybAm/No7Ldc16y/4M/J1YLJz7IW/Lv2cxT3DOgvuOjaEyoH5
	 dxekdBFtmkTWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5E46061B;
	Sun, 18 Oct 2026 13:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7B4255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17EBF40608
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoCe8AgtbQwE for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7B2A840600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330851;
 b=lzyPzmDJrPk5ysrYCqgrVSB04ZFRLz1Ld1yzYPZUg9IxXWtOcqB5KWzFQZ9S9f5R4FrR
 HVaS57wgrJbjUIq7pEWTqjnNL7g0htiH7ejS3Gj+hvgVEX0v1F2XvknfSTl4iprZ8NOKI
 HIZX1TkC0GYBKXWJ9TAMNBCwPFy2F74vQRCPV9rekstpymJPRL7Ks20YAHuCrszjspIDl
 FHNY2e6+V9c4VE0W6uJ+8mMkLrIm8g0oJpin8AfGmHxF3RkQuSemFu+cgScBGQckXLOCB
 ALLqZy8yDEluhlUVkqrREhpUtoMYnQKwtXPoMT9ftwbmd1i2+zlUHjcv5yO9FOr7stw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330851;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=E0qDbVU2T1g3xHyeP48h1xR7xLJZ29Pkprbw5Vn1e8k=;
 b=De8kKGJqBaMzONzcQnNdWBwI4xVjTXC73LEFRFgdSrCIghvnCg7s1DVutRHSY6isi2pw
 0K8hwDzzcta5+VNpLNj6Pd5HklDbCDx5vztyarVp9evVdegDHmY+Ad7s9TxFDHYzOjBps
 rpr2hzYfu1vL2uzidNWVc8/YeqBU3VeTrtrZIHJZYhoUS8UjStwDcV9Yyt7Sw7A9xFX8r
 QR6TUlPnto4VmHm7nfGuk7m+nl/ST4148dWV7GCrO4zNM+I65UTkZwsgqJ3cUIgTnXv9o
 Mpme9U/b9wl043KVz6Jt7wavYEK8zwEpMvHfu53Y9SEIVDl1RcKy6DBA7J/+W5gH3ig==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A1jpxZC5; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B2A840600
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DEAAF78034D;
 Sun, 18 Oct 2026 15:40:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 15:40:47 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 15:40:47 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015072801.1065248-1-dario.binacchi@amarulasolutions.com>
References: <20261015072801.1065248-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <9b500167d644c3d43c526e81d5e5a428@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: bump Linux
 to 6.18.56 and U-Boot to 2026.10
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

On 15/10/2026 09:28, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.18.56 and U-Boot to
> version 2026.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
