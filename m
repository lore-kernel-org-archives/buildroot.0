Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFC9CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AB940761;
	Mon, 15 Jun 2026 19:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLnXeUhaTym4; Mon, 15 Jun 2026 19:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A62AC405F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781552951;
	bh=46OtOErWZP/lBLL/0smi6mdUt6K/7BI/ABJ2TTjptdU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dHWeoNDU0yCZQmHrOFCd7yCaZHpUgudoYgmOiXEgW3MFMldMbxspHpPXrlkMkXjmS
	 357ocxBs0NSzeqLvZm6U2XTGvIgNH5MMKfLF2sseAfab6oc0pCgwICcwKngJd2yY0k
	 Rza4TAtCLxrjl79RtpJNxgyhweZ+B45RuveT9wFsyisHMqbNHeUlLKGMLP/Vk4GuQv
	 c2lDHGZVA3PGcExxk4tCtCKWLutntLzHvu7vkhj0/lfwQBlRWw2UZcuHNA99lnczgi
	 /wYjokW9dhc6poMr1yChmU9g5aQnSC0/LCtjUoIB7Fi/Tg1R/y0geAIA5l2wl+a1h6
	 X8nJX4E6p2bEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62AC405F3;
	Mon, 15 Jun 2026 19:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5545E2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BEAD403FC
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z5GeRdhPYAH for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59C024012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C024012B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59C024012B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:49:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9E585B0053E;
 Mon, 15 Jun 2026 21:49:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 21:49:05 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 21:49:05 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260615163212.2475581-1-romain.naour@smile.fr>
References: <20260615163212.2475581-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <70cbaf040bed00fb4be0eb60ea9ce2ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781552946;
 bh=2Uw2RzIzyPuRn+3sn1ATMlfzW7XeSFGd+YvP+NCASyc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HsTGpwO7bPp4zgfjflWFW3Op+NKjSI18ulFL2496SKCwzdtVuWBKrM6NFaO7aqo7r
 9e+ZR6iA4HVP4TRQLwN7L/VXWsKpAmMDOWvOEsUJQ5hGsikZ9yiFG3Qx0z9p5QnKGH
 x2DG86WoX1CjRFKsT44D8Ylmm5DGFDcQz+d3k5RuCF8IX7DgodYLHFC2c2L9u/gtfw
 scBBkkJ+f9bq3dN82fCwFeUlSL6LSKL+6t674+tF7cXNWYY+v8W0fv9f6x7FGxzlB3
 Jlto4u5bpKsL/Nl8v4wUEP0WckDZpuCEkudyKgO7iy9yCVL54vGh1asukKkDLp9nxW
 6yqoRsTZVvywQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HsTGpwO7
Subject: Re: [Buildroot] [PATCH] Revert
 "support/testing/tests/package/test_kexec.py: fix kexec test for qemu 5.2"
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

On 15/06/2026 18:32, Romain Naour via buildroot wrote:
> Our docker image was finally updated to Debian 12 and now provide Qemu
> 7.2.15. We can safely revert this workaround for older Qemu version.
> 
> [1] e5bbe020ca60789bdb0a16e27bc1a4208d8f6a5a
> 
> This reverts commit 37e23e0dd7187bb27abb329f4fbb29c59c31c672.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
