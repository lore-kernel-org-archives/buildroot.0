Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A9AC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05321612FE;
	Thu,  9 May 2024 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEtwNsVTwn3j; Thu,  9 May 2024 20:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C8260EC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C8260EC6;
	Thu,  9 May 2024 20:19:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8B51BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15A0841E0A
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSpcXCW357dA for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6B2741DEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B2741DEA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6B2741DEA
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:19:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA45BFF803;
 Thu,  9 May 2024 20:19:03 +0000 (UTC)
Date: Thu, 9 May 2024 22:19:02 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240509221902.54ba2907@windsurf>
In-Reply-To: <20240427140941.381333-2-peter@korsgaard.com>
References: <20240427140941.381333-1-peter@korsgaard.com>
 <20240427140941.381333-2-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715285944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N/e7FtjZZHXoSMI6nzzy5hXLJ1kjdQ8bk/icBqK2PQ=;
 b=pzO1iEPuTvcYvKJuM6lUZcOBLZkGFaIRPpGrJPUfYcsvxXeAnI7BFQharlepDxPwqhSvWJ
 ZLMQRQNisMUaoa9nl5e1XfzscJdSXE16OsLs+jimqvLI39EVdXxiNNkokqaHoHRMacUZqL
 VCwou+Yto5QJsWd1abKRnO+/pnfvdlYIQbCnKlsWlcyyvcw6aYkQC04IX1eSaCmS5C5ruA
 WydQhGLfcX7szA/q6LqkCJ6kRDoQgENAlrGiu3wTj1j4b9Ga41h+XgD45OWhOGTDaHBK1T
 4XMhkpgu+tnKl5wRp8brKErGU6QVMPaRoZTB2aPIuX+YnIrmFdJfpI4+vuiIzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pzO1iEPu
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add python-hid test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Apr 2024 16:09:40 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  DEVELOPERS                                         |  1 +
>  support/testing/tests/package/sample_python_hid.py |  3 +++
>  support/testing/tests/package/test_python_hid.py   | 13 +++++++++++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_hid.py
>  create mode 100644 support/testing/tests/package/test_python_hid.py

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
