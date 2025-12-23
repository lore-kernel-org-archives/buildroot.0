Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D6EE6FE51
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C3060E9E;
	Tue, 23 Dec 2025 22:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbSnYvmEX6Bz; Tue, 23 Dec 2025 22:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 327DC60E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528661;
	bh=txndzZ9xKCZCiVrDe7q1dWCrXavEBbiA7lgMXEvZW9A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b8ESe6tStM6Us526LePX27WZRZyFiA65J2OfYpXMSB4LD6wnjjTqEuSjldw5GxrrC
	 3oy4vWfVBotwfl8EjqBF/pUF9X4Enyh23/R7C8I0e1DulRDGruRyV6Ehi3QXu0kdTR
	 FVXBWhuGevLDULWxG5+fxpAvWyw5tt+Uq8jSfXYGGkSSFNEwSX7eDJR8kJ+JLslczk
	 g7mexezj9Zzcvb/pXvcyNr0sa86nEGhs+FXhWdNl0Xad0d88x3FQTYIdAldlNcmDr0
	 WB34YWnD+YEmUOU/A8qh5IZw4mXoKxZktcNe5MR/DTteakPW9mwHYdWQw4wMDvK2H0
	 2rxLGHPOmLTfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 327DC60E9B;
	Tue, 23 Dec 2025 22:24:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8DD7B9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A6D60E9B
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqj44iWU0jnE for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99F1660B13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F1660B13
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99F1660B13
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:24:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7A4B44E41D75;
 Tue, 23 Dec 2025 22:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4CB5B60716;
 Tue, 23 Dec 2025 22:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FDA710AB0BD8; Tue, 23 Dec 2025 23:24:12 +0100 (CET)
Date: Tue, 23 Dec 2025 23:24:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251223232411.7a3ed7b0@windsurf>
In-Reply-To: <20251026093250.1042540-1-bernd@kuhls.net>
References: <20251026093250.1042540-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766528654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/hbLTvu8dPuEBRVvQImiE3+pR9sYcKZRWRns74IjQ8Y=;
 b=fztHhyXiRaZyn6y9rzgGVEy3iYPdb5b3bY3jSSsWzOPfAuzex7Chzncqtm8wLyNlZsujiB
 9O186+TERv+HzfPsLmDRzM2PFsIxila81OVRzJuzBgjxupZnN5cUzpS81mHP42RMISSSaQ
 lah4TDbpU2iGWC01hDCRpgXZtNqnG1pgVeo4iWLwOEA0eHUG4cEcQLyQSdlT+x/J6s6xW7
 QLjD3K9wazV4jlE7yWWLBWLp2ztLLkvfxFIF5bRs9aqabMiuOmE+Xm74OUx7OkuhDeI32Z
 /xnmWmH7dGh5HUvb0LyAz3hbexWydFaztG7KxCGgDNkt8k8Jg7MEO/sRdTrLXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fztHhyXi
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: needs libxcrypt with
 glibc
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

On Sun, 26 Oct 2025 10:32:50 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> In contrast to the comment in configure.ac
> https://github.com/openssh/openssh-portable/blob/V_10_2_P1/configure.ac#L3621
> 
> "# Check for crypt() in libcrypt.  If we have it, we only need it for
>  sshd."
> 
> libcrypt is also needed when the server build is not enabled.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9b2/9b2333e40bd4727bcbe23c1949a6b78c59b1dfee/
> 
> The oldest build error to be found on the autobuilders dates back to Sep
> 2024 in version 9.7p1 so a backport should be considered:
> https://autobuild.buildroot.net/results/642/6421d8536ea0940e666ac44ddbdbd8afa95ac856/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for this patch.

So I tried looking into this, but I'm not able to reproduce locally. I
see some build failures on 2025.02.x in the autobuilders, but a basic
build of OpenSSH (with the server disabled) on 2025.02.x works just
fine.

Can you provide a bit more details on which configurations are
affected? Like a minimal defconfig that exhibits the issue?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
