Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16CFCFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBDA81156;
	Wed,  7 Jan 2026 14:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVWnMinXCGOK; Wed,  7 Jan 2026 14:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A85738169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794852;
	bh=pp5o5Mmrf14LfU+kyu+mAuGe/0tIau8jxCyK7JYaqD8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KVDNaUXlZXwtpPv4Vx/BQPFtMe7EXMCAMKveR/OvAcqFg1e4xLXym2CiIEniTbWHm
	 d2IukGC1ZTONFgMwoHvPRsbYAs8Lc5udxU21foCl0H68E5IKZEmUhUj3e0tg8OJdnE
	 tiZGgcyR/uityzcdb7adKVtfKVcSnAECh01LMhCsFa97VVYvFUrys86Wi24K5BiSY5
	 6/ppShMPYLN6HkrDcPJ091SN0ka7xHSZgQ0EgHnZv3QqSozW0kyvSj+hE1IRSpEmeU
	 KbtLp4pHY51sdMV2hjEsdR0Uuyhny8zy0x5H8skSYKpy51/OSawXmQOhNBcD8NXuKd
	 mk3CtZQTzcBwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A85738169A;
	Wed,  7 Jan 2026 14:07:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B839A970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E02460C2E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k64wX6WnbY82 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C02E460BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C02E460BAE
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C02E460BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:07:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7465E4E41FD8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:07:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A0A9606F8;
 Wed,  7 Jan 2026 14:07:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5435D103C803C; Wed,  7 Jan 2026 15:07:26 +0100 (CET)
Date: Wed, 7 Jan 2026 15:07:25 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Alexander Shirokov <shirokovalexs@gmail.com>
Message-ID: <20260107150725.10c0fba7@windsurf>
In-Reply-To: <20260106231110.991548-1-ju.o@free.fr>
References: <20260106231110.991548-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794846; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kPKZN8CgG+UIt1xaKYdXE6nOQH/Q38DlmKtpMGunx/Y=;
 b=HlpCiQaYgDk8e3MKVNwxKecxxEm4xSywxkWiSgioWNBiMR23MVhIaj9v4kCcBpGwxTO1U9
 AEm3/uoE4RDulSDgHE0FJkv2XKkndiMbAvtpNvgaVrLkLTP6Oq9wuRa0huj+MFi7Ly4bdz
 gb5AfOMr7Pk6nhZFoyeKbyGoPEbuMnn9BwcaZrkWBJ6ZRRAbV0z3Hvifdy917qdSxj9W1i
 OL0VcuTH4HqAsrxpk1MibHdwpbIlRJv9urZsVx0S1s9GRYDZ5t8Y5KxJI5reuu3NHRXE2e
 AD3bP/trNheZmpJq04WhEZTNOzqLPz8GH7g5CF4yoqBnSWNAtxsLxuJmrwBb7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HlpCiQaY
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add aichat runtime test
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

Hello Julien,

Thanks for the patch! Obviously looks good, just one question.

On Wed,  7 Jan 2026 00:11:10 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> +    def test_run(self):
> +        self.login()
> +
> +        # Check the program can execute.
> +        self.assertRunOk("aichat --version")
> +
> +        # We define a Hugging Face model to be downloaded.
> +        # We choose a relatively small model, for testing.
> +        hf_model = "ggml-org/gemma-3-270m-it-GGUF"

Does this mean that the model will be downloaded by llama-server when
we run it? I don't think we expect tests to require a network
connection to the Internet, and download "random stuff".

Or did I misunderstand your comment?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
