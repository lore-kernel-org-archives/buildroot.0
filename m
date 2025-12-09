Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A317DD3B7EA
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 08:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56EDF40CE8;
	Tue,  9 Dec 2025 08:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNRyZ5DTle1Z; Tue,  9 Dec 2025 08:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC6F40CC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765269605;
	bh=QbUYXiuhQypKeM5+YAwxV/HEt/ZBNrl7Dz0/tAQT5d0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G47SexPgAm//IYK1yhIRCT8CP/cDrMqS7b+ZhL5Y4FCHXNXIGCevj+Mos4ocb3ORv
	 qcIsUapQtnBlb250UbWLwXsrH4ZJCoXkGU9tksBXrrVSPww7LLAlXFXBwoF2irub4l
	 aA9mWDOFSyrCbMXJtiCUAi0QKImklbhpVG/hr9csQawUjybQgafOiVGxmyxzF43t4t
	 KNoUVo1xJ+zxz1qv3h6gBgXSYZxBmEo7DpTjgmADJpiDoa0H1l9wqhMJtMWMhwH5PJ
	 RE8EdQze5MOFLrvDisghxhxQ3PmLv5Yz6699nB3rKv0SLC02rNxAa6yM0LLgppxD5p
	 Eg43IZvMITP9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC6F40CC1;
	Tue,  9 Dec 2025 08:40:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BBE2197
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 665E640CC1
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy4UHxXHchGl for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 08:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D0B040CAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0B040CAA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D0B040CAA
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:40:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 96BE6C180DF
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:39:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A04A606E2;
 Tue,  9 Dec 2025 08:39:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1234A102F0BF6; Tue,  9 Dec 2025 09:39:56 +0100 (CET)
Date: Tue, 9 Dec 2025 09:39:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20251209093955.75fc0716@windsurf>
In-Reply-To: <20251106204737.3273902-1-bernd@kuhls.net>
References: <20251106204737.3273902-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765269599; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=I2g0hUwHF5zIPHGLm5AuRZ477sYtcr88U8nNwXX/hwA=;
 b=DfSDBDffQJiI/m7YQAuRq6y8uZt8zwESVKPduasFA+FMxWPc+WpkFU+2osdQLQ8QaDxhUq
 JDiSCt/qIY/17LUMji2xk9wD1IPsUEYZs1X+EAghE4xWBAPUNSis6QDPJRWwdsLxr1/SOC
 0eCeR48xU7rwckgUFQWbFSXkKnL8xwfruC2eJB51nN5iIAb+r7gZ40pDJe9VB0PfcvhfV+
 dbH6plcv4YqFIBV7hc2eZ8y2s9Xt6c0ZCTsHOKB4EzAZVuZSBqZ/duGGYvIIoUMdbTteHo
 V8l7H7LOrJ4nu6mMNws0UF1gKaNWNePzduTlSwgDuQQ+sdcfDG92raUE4HmKtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DfSDBDff
Subject: Re: [Buildroot] [PATCH v2 1/1] package/asterisk: security bump
 version to 22.5.2
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

Hello Bernd,

On Thu,  6 Nov 2025 21:47:37 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2025-1131:
> https://github.com/asterisk/asterisk/security/advisories/GHSA-v9q8-9j8m-5xwp
> 
> Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I'm not sure it's been introduced by this version bump, but Asterisk is
still causing quite a few build failures in the autobuilders.

I briefly looked into two of them:

- https://autobuild.buildroot.net/results/426/426336052c50768b06dd047ce4b8283e6da377d4/build-end.log

  menuselect/menuselect: error while loading shared libraries: libxml2.so.16: cannot open shared object file: No such file or directory

  The target asterisk package builds "menuselect" as a host tool, but
  our $(HOST_LDFLAGS) are not passed when building menuselect, so it
  doesn't have the right -Wl,-rpath flag passed, and therefore when it
  tries to *run* menuselect, it doesn't find libxml2 in $(HOST_DIR)/lib

  Not sure how to pass our HOST_LDFLAGS.

  Also, since it builds menuselect for the host, is it still needed for
  the target asterisk to depend on host-asterisk ?

- https://autobuild.buildroot.net/results/af9/af9c127965260044095f1fa98db88e1d1d762646/build-end.log

  Invalid configuration `or1k-buildroot-linux-gnu': machine `or1k-buildroot' not recognized

  The config.sub part of the pjsip code (downloaded as EXTRA_DOWNLOADS)
  is very old, and doesn't know about or1k. It would have to be
  overridden by our copy in support/gnuconfig/ (also config.guess).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
