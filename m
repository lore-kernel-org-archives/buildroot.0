Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379AEEE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A68813F1;
	Tue, 30 Dec 2025 17:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4pAecclHkZy; Tue, 30 Dec 2025 17:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24747813F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767116921;
	bh=CVYn1Oi0oA6P+7vAaGwM2ekRJV3FTQfcun1jeSuvBTU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QLs+OCd6vCV7tUSGGpbjTSJzy/n8Oq4Oci2XMafId9YX/EVH1QdAnLHNTFDZFCJXQ
	 i3iw1lvMtepIZasTD6F9QNmk9SL2p0xh1yQqocGkCO8ZQxpfMqN4ypDREYW5XmK+4R
	 MPB16dMdqFZerI/jMvD7yMRWbw+acGbFuvabVB1Mtrls1jMTMG3prqx7QDHioBhJbU
	 PW31gneHhyMG90g/aGhRiC1hf0p/w4bQBVdiu7tikNYI0Ec4doEmNjKfEqw5RhSO2/
	 NSGOKsYmWMuNMjqQmDZXp9PByceGeF9zBAFiF2pvn69YGBNMSii7Zuth+Y1TjcNR4U
	 zuNIDR6iNtOZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24747813F8;
	Tue, 30 Dec 2025 17:48:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ADA9D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BFC66085C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbnUWRfbScAW for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B9E360791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9E360791
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B9E360791
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:48:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1BC3B4E41E73;
 Tue, 30 Dec 2025 17:48:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E71716072C;
 Tue, 30 Dec 2025 17:48:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 89B09113B062C; Tue, 30 Dec 2025 18:48:35 +0100 (CET)
Date: Tue, 30 Dec 2025 18:48:34 +0100
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20251230184834.3e12422c@windsurf>
In-Reply-To: <20251124140704.15108-1-fl@n621.de>
References: <20251124140704.15108-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767116916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SzMaUouGqa3qVrWfuJTtNM1AQhH4uNsFXO32aSxithE=;
 b=R0U9oJUArVDqD957AzgQnmAu+nEgrBkKNvIEw2suJrmm9R/yhr/Flv4+xL9DWe8M+fN45n
 edEdwN/7Fx2doWf8+5eWrzDW88P6bDqFCTgAVBv3Rg4cFRyLsdzG2SsixXLopAw21k2ynK
 ScmrNEIKC294cGdSRtTc7mX6oAy7zVcu0dvthzDcquvk/kcWcCT/CtIwtcAr1PHfcfnFre
 cSD2jaMiwg7u4Z3UMAZO7SZzXuABKoS5afUNYBvvf3IRH2n5mOnW5Dnx5nyLZucSua5wwi
 xPDsTb7Doixt9O4mCpfcA9LWaL/6ekO5f78GKW3x0vp1uC+aRRvF8vb1YRTsjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=R0U9oJUA
Subject: Re: [Buildroot] [PATCH 1/1] package/libconfig: refresh tarball hash
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

On Mon, 24 Nov 2025 15:06:40 +0100
Florian Larysch <fl@n621.de> wrote:

> Upstream has modified the release tarball without bumping the version,
> presumably to fix [1], which is now causing build issues. Refresh the
> hash to match the new tarball.
> 
> The original version is still available on sources.buildroot.net,
> yielding the following diffstat:
> 
>  Makefile.am                 |    1 +
>  Makefile.in                 |    1 +
>  examples/c/Makefile.am      |    2 +-
>  examples/c/Makefile.in      |    2 +-
>  examples/c/pathbuf.h        |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/libconfig++.pc.cmake.in |   12 ++++++++++++
>  lib/libconfig.pc.cmake.in   |   12 ++++++++++++
>  7 files changed, 82 insertions(+), 2 deletions(-)
> 
> Where the Makefile changes only add references to the added header and
> pkg-config files.
> 
> [1] https://github.com/hyperrealm/libconfig/issues/256
> 
> Fixes: https://autobuild.buildroot.org/results/89b/89b15ed871a7d8e2a789d1d9a1bab11b7f50274b/
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
>  package/libconfig/libconfig.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Since then, libconfig 1.8.2 has been released, we have upgraded to it,
which fixes the issue, so I've marked this patch as "Not Applicable" in
patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
