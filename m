Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADB9D10BFB
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964F5403CD;
	Sat, 26 Oct 2024 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlGn3A8Mnapw; Sat, 26 Oct 2024 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B7E403CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64B7E403CE;
	Sat, 26 Oct 2024 20:02:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D90245C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA392403CE
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WtlOwIG3sU5 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:02:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83916403CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83916403CD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83916403CD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:02:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C46DC240003;
 Sat, 26 Oct 2024 20:02:33 +0000 (UTC)
Date: Sat, 26 Oct 2024 22:02:32 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, James Hilliard
 <james.hilliard1@gmail.com>, =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?=
 <raphael.melotte@mind.be>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241026220232.079cf126@windsurf>
In-Reply-To: <20240916133057.1358143-1-buildroot@bubu1.eu>
References: <20240916133057.1358143-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729972954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEYzxldD5dWwVIC4MkssB4VEWh34Jh8FWsTrioJOQIM=;
 b=Iv2O7Z6//Y/PaEKiIJDw4a/yT5YtA41+mH7TGgwiU2cY4oRuHM1d0SzBwadJRs4bFajcnB
 pMzjR9JeaPGL7WGzLoGZ4cgHJWv2LGm6PqaVtNKAojaZaJtUaacI5h+3A/OfQ/FQ7nm12d
 HzKxhhYenJFOBiTB8i4ldAcA/g6pL0dxiJQr9Rp43wO1a7OQVS9e0aqA1zzQCmXuXRqorb
 jM9XdZciiUi/evq+8g8CZYi541YZ6XxkeGXaTb/lJFi86ReYwoWWQ3wrfX9VCFFPOaEa5p
 rjPI6YYbsz5jeGqrDgkp6ylgawkF0DZOCyIiUyKAOoaWljERVCI7pYYCaqOPag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Iv2O7Z6/
Subject: Re: [Buildroot] [PATCH] package/python-sdbus: fix linking on aarch64
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

On Mon, 16 Sep 2024 15:30:57 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> The following config snippet fails to build on arm-aarch64. Adding -fPIC
> to LDFLAGS fixes this. This has also been discussed upstream [1]
> in the past without determining an exact reason/cause.

FYI, I did some further research on this, and commented at:

  https://github.com/python-sdbus/python-sdbus/issues/50

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
