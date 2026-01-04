Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A025CC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C49B60728;
	Sun,  4 Jan 2026 10:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zltdw1q-lhLh; Sun,  4 Jan 2026 10:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D22F606F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523601;
	bh=3sftqgBHgRmfr8nrdnOeUKMGt9hDT+pwP12tkPMfCno=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZfUlDhPvMOWLlV9MgYiUnNU2wvHI9LPzMSFOTrHvNjb68NRqhFrAhgWHo2wlElwc8
	 M+xmT4WXjp24/qip6nAGnPZB7GNkO0sB1T8w4jh4fBoAV6X66fIsMPVmrhQm0cBy0C
	 RaKPrcEo2FkWFCgB3nX2n1gKjFiValJ/635jzygg+0MJHwFyaIZdvJu8JmK1PHbPJG
	 xKWMe/6d1lhb/0tJMJbaLMT68hLqY2nN8ZVdKNCceBsnObmwl9Wk1xI9LShH2JFlHp
	 HTh5uWZbfsbQPShEFU+AjSF4m676cU/n3mMja1nshsMxhZWvB8EZEtoFjx+CFM3Hjb
	 YSmqaZ+TFhjfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D22F606F0;
	Sun,  4 Jan 2026 10:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6EC0249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D46C54030B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbwoUMG8Y-DI for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D02554011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02554011C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D02554011C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:46:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B3EA31A261E;
 Sun,  4 Jan 2026 10:46:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8372D6072B;
 Sun,  4 Jan 2026 10:46:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C024113B0449; Sun,  4 Jan 2026 11:46:33 +0100 (CET)
Date: Sun, 4 Jan 2026 11:46:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20260104114632.4276340a@windsurf>
In-Reply-To: <20260104104338.2948272-1-bernd@kuhls.net>
References: <20260104104338.2948272-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767523594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4C8jOvxearXT+w8j3mOx6qREu76M1kqQBYpqfCELwSg=;
 b=UnLgyS2Dfom5SHLo+82rHLF+Vw8e7n2wOu7XdLx8t/LQackfRBXIW3S7SpS4/t1dPV+Tvb
 8At7s9c7ICk6etfq4hUXnH/t5O1THJdsXgo3fgsyeX+53Tn9hW7VCGDKZVHz4oA7x6u3Nb
 JBy+Ivztm8NhcnYdbxTAx5LBJEV1emIKOZOK0nioZ1Qy66JiNVeJYjr1fXxJLpUnpN3VeW
 i8xevks9mrNWOR+u6LapsM88/EJPXvM0kT14wo5h54V4/Hqu00PvV5rwDXiQDWY/4MUOyL
 veqg4WY4MykecjUbpgvO8gaTsJav13qbfUKRY5sWUs0OIs2WD+CGdbPHEf6Ggw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UnLgyS2D
Subject: Re: [Buildroot] [PATCH 1/1] package/brotli: fix LoongArch64 build
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

Thanks for the patch!

On Sun,  4 Jan 2026 11:43:38 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 473c9400a0c7be14e7eb8ba617697a76286915b3 bumped brotli
> to version 1.2.0 causing build errors on loongarch64 which were not seen
> by the autobuilders with the previous brotli version 1.1.0.

Not seen by the autobuilders by luck, or because the issue didn't
exist? Did you reproduce the issue with 1.2.0, and confirmed that with
1.1.0 it didn't exist?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
