Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C21E92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC2160890;
	Mon, 29 Dec 2025 14:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIUqtebrAETP; Mon, 29 Dec 2025 14:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A9F260A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017595;
	bh=UJJ8B3RXt+0QXuVNghh2hTYAO4iT981MKVoQhyeVTDs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YNVQLSWYScINFcqMX1oIax78SUwG9LR+00kTmLNtUhm5rw5hJ56S3Dp3t55kuZuhM
	 oUePgZJUEGgFxq80+Ivj+YcT40fuFy9iyQjW0bqKxjPcB9jzWZaNR/pWc4P49E1JJh
	 SO+aHDMAGMcvo2Th+6EXB2kN52e+YtkPRAMGjGf5nFIOngcnY8XkBU3E1J3+RyDV3b
	 mV0OYPtlUkDBoeVDnmVCHuAhcQumZZi5dh7J2k7wwZqs2YKrxBGZzJWwQdBMFtP0sI
	 qmbqjA25Ua06eWGpGwG2dyo/dZM7mv4dy5pfPZB3TsiPlhDX4Te/JFeafZbEn0Fed8
	 vOeKLM7NqNTlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9F260A58;
	Mon, 29 Dec 2025 14:13:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F144D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2210403C1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIPUxM2Cz-1U for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED79240242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED79240242
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED79240242
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:13:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2BAEA4E41E50;
 Mon, 29 Dec 2025 14:13:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9FE660725;
 Mon, 29 Dec 2025 14:13:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4251113B062D; Mon, 29 Dec 2025 15:13:05 +0100 (CET)
Date: Mon, 29 Dec 2025 15:12:59 +0100
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, =?UTF-8?B?UmFwaGHDq2wgTcOpbG90?=
 =?UTF-8?B?dGU=?= <raphael.melotte@mind.be>, Bernd Kuhls <bernd@kuhls.net>,
 Gilles Talis <gilles.talis@gmail.com>, Martin Kepplinger
 <martink@posteo.de>, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>
Message-ID: <20251229151259.37dfa7e8@windsurf>
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767017589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6eGm2PNgC90NbcELn8fRJhF0DEE3DqkzMsUnoEcxbh0=;
 b=cTIstZ6lOL+AyKaKSLkBuYWIfolyp95CiJ4bvvtSOiH2UeyFNlODigTH6zmO0jgn9fldqE
 2Jh9dSp37xu23in+FTEKRpFjK3HxvOCFC8FB6Nvef4vYDMhTwd0RfmuQbmq4oOFk1usq0L
 VR+T/fKJEarB7Ri+jGrQlKhh27iF18qWo+wTkhXXDnPW6dSqyGY6FwLZjZ+F5yWAm8IL7N
 Cjs7pxw2hhBDJI2PmYobksn1GxGxZ7vN6vW+qrKhohUNkY+TyeZO/+X/r6ErKCX+8Q3d87
 2aVdieTgG9PA2cRJ9177RU5XKaW07FYQtwlDGz+TXcJjoUJsxplYjhaCsH9gtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=cTIstZ6l
Subject: Re: [Buildroot] [PATCH 01/14] package/sox: add CVE trailer in
 patches
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

Hello Thomas,

On Mon, 29 Dec 2025 10:07:06 +0100
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patches header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  ...voc-word-width-should-never-be-0-to-avoid-division-b.patch | 2 ++
>  package/sox/0007-hcom-validate-dictsize.patch                 | 4 ++++
>  package/sox/0008-phere-avoid-integer-underflow.patch          | 1 +
>  ...formats-aiff-reject-implausibly-large-number-of-chan.patch | 2 ++
>  package/sox/0010-formats-reject-implausible-rate.patch        | 1 +
>  ...CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch | 1 +
>  6 files changed, 11 insertions(+)

Series applied, thanks!

Two notes:

- When you add the Upstream: header, make sure to update the
  .checkpackageignore file as well. You can run "make check-package",
  or have a Git commit hook that checks it for you.

- Also, when you add the Upstream: header, if there's already the same
  information in the patch, but in a non-machine parseable form, drop
  this additional info. For example in this series:

+CVE: CVE-2021-42260
+Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
 [Retrieved (and backported) from:
 https://sourceforge.net/p/tinyxml/git/merge-requests/1]

  You should drop the [Retrieved (and backported) from  ...], because
  that information is now provided by the Upstream: tag.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
