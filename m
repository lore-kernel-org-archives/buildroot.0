Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4767D20681
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 22:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153674067D;
	Tue, 15 Oct 2024 22:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SoB_r3JDFLA; Tue, 15 Oct 2024 22:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238F340676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238F340676;
	Tue, 15 Oct 2024 22:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 055F61BF2FC
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 22:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3B05608BE
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 22:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XI_LDw7xJ6OS for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 22:12:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5D58608A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D58608A2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5D58608A2
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 22:12:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4d1b48f3so3773781f8f.1
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 15:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729030363; x=1729635163;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QV/3pnZt8WQ8zQcPDS9KMLe5YjlRnhK0DmPgJ7jxOoE=;
 b=FIGnXm1gzPKje49nfgpRqDKNwHbfvx8AHqHjzolXn1OqswlNwgCBcL6DuEvAFs4zfo
 4QIB5gJcXeBO4M5feqfX5d46wVKltT+UVnIgXfRi9d2J7pAn7/Qy6XART6i7sFH+VDS8
 FQYaOZCdt//xsd9jV7Dug5vnP6jqv8C16ToyHlqdTJgLSFOzIhw8x0dPql/RsQQrHFxu
 i9kHsNYMJngqORMg2wB064q2XSCkrpycBnGP8NlROdPJV0bzu25vt6/9v8o3fOI+8mQP
 1ExX6WeMhpE1NygEEDXJ0uHkHx1qs0xz91Jm5wV/fPMtk3rKhCEWObnf2e68D1m8+RUH
 E4gw==
X-Gm-Message-State: AOJu0YxhL2spJTgDhbPMg7zSF5c7rAsenot5pBQdbdrvO8GVxlDLFxZe
 Xf+AyaJm0dfS3/jxNLpjse0j9WEngg5Zd1Xllody9r7xEMFrJM8FAhW/XQ==
X-Google-Smtp-Source: AGHT+IEgsIyBAE9/yxqSiz48Hql/I3d2td6FapVBLS+eIa01obPrz+cx2aOsai7y7yXElXE0rRBSeA==
X-Received: by 2002:adf:db46:0:b0:374:c84d:1cfe with SMTP id
 ffacd0b85a97d-37d5519e0c5mr12535148f8f.21.1729030362389; 
 Tue, 15 Oct 2024 15:12:42 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa7a1a3sm2613275f8f.12.2024.10.15.15.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 15:12:41 -0700 (PDT)
Date: Wed, 16 Oct 2024 00:12:39 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241015221239.GA67018@pevik>
References: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729030363; x=1729635163; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QV/3pnZt8WQ8zQcPDS9KMLe5YjlRnhK0DmPgJ7jxOoE=;
 b=J/MPCkFJCDKTE2IKtQf7+9lEijUmh6/tNNffLDXcQk+UZvoZ/WDhpquccN6uhtRO5d
 nsVyS86Nwy8hAMlegqVGoSZsElk/Q0iYACkGjSyWQ6lYAppTIKl2rdzh52pHXaa44tJE
 5M82U4tBo1dpjgn12/rBUebE9n6P8VaLG8BglgUmWJpnMvKsnUT39t6X+9KX4PbTmte1
 jsBp1TN3MXKLMi8ZiRi1bZpeEEDrblfKRb9z+76EO0RJxPpbXhIXA5LHrVwmIFBAoLBX
 awM1+EnvnuNl5nyhTLgNZq0j6qbzw5PdyOi6EXnzEIFzy/TcIIRrddNkzpZEnr0p2D4C
 n/Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J/MPCkFJ
Subject: Re: [Buildroot] [PATCH v3 1/2] package/iproute2: fix building error
 using designated initializers
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

...
> +diff --git a/misc/arpd.c b/misc/arpd.c
> +index e77ef53928a2..b4935c23eebb 100644
> +--- a/misc/arpd.c
> ++++ b/misc/arpd.c
> +@@ -437,10 +437,10 @@ static void get_kern_msg(void)
> + 	struct iovec iov;
> + 	char   buf[8192];
> + 	struct msghdr msg = {
> +-		(void *)&nladdr, sizeof(nladdr),
> +-		&iov,	1,
> +-		NULL,	0,
> +-		0
> ++		.msg_name = &nladdr, .msg_namelen = sizeof(nladdr),
> ++		.msg_iov = &iov, .msg_iovlen = 1,
> ++		.msg_control = (void *)NULL, .msg_controllen = 0,
> ++		.msg_flags = 0

Thanks for fixing this. You used v1 of your patch in netdev ML. You send to ML
second patch which removes useless initializers.

IMHO it's better to have a single patch where these 0 and NLL initializers are
removed. And that in the end Stephen Hemminger merged [1]. Could you please send
new version, which uses this patch and mentions the upstream commit?

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=9c9824bcaf092cb99988d59717674b73b5d0d19c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
