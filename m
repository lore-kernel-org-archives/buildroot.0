Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A86BC3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E98BF80ECD;
	Tue, 30 Jul 2024 07:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl6Y7hXuDt76; Tue, 30 Jul 2024 07:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDFD08128F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDFD08128F;
	Tue, 30 Jul 2024 07:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E65BF1BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A2040384
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwYQxRK8Jyeo for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EC7340363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC7340363
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC7340363
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:08:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 445761C0004;
 Tue, 30 Jul 2024 07:08:55 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:08:53 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240730090853.1a124735@windsurf>
In-Reply-To: <20240730064202.72774-2-egorenar@linux.ibm.com>
References: <20240730064202.72774-1-egorenar@linux.ibm.com>
 <20240730064202.72774-2-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722323335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRFWdBz6LB9sn7FMS0/1s5noyB/JWLGnzrB3h1eRt/c=;
 b=BiT9sT6BBJj8lqeZnvf464rB0kZ7XIzQyI7O3Yp4jA4PsteXtToJm8EDKvjBh9hsg3IEkm
 dSN+DE5WzGX72N27baAp0imrWH22Rnp0/kkNUcILi/K+AivTXJJoNv93M1bTavQEJaR5Om
 stSgf7Ojqqu34phsAcZPri+tUx2pZ9ZiCeOETM1WFBCnBJfJWjsHU4QJYIeBHUSQ30bcfT
 Ze3Fx2sCQCRJtUI50eivYwM6qK08XXpNzARKJbigZImky9x2DcOmxcBHbW3D4BfdeFIsvm
 DdJdNbf0C04SYX94Lpqm2PrI85299+qRg922qGsWXh8FfPoKzgGXD9FH4mpYAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BiT9sT6B
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/qemu_s390x_defconfig: update
 to Linux 6.10.1
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

Hello Alexander,

On Tue, 30 Jul 2024 08:42:02 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Thanks for this update, but you need to also update the hash of the
Linux kernel tarball? Indeed since commit
d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37, we check all hashes,
including the hash of the Linux kernel tarball. By chance, maybe at the
time you tested this, linux/linux.hash contained the hash of Linux
6.10.1, but now it has been updated to 6.10.2, so linux/linux.hash no
longer contains the hash of the Linux tarball used by this defconfig.
Instead the hash of the Linux kernel tarball should be put in
board/qemu/patches/linux/linux.hash (which be careful is shared by all
Qemu defconfigs, so don't remove hashes that are still in use).

d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37 also aligned all Qemu
defconfigs to a single kernel version. I'm wondering if we shouldn't
keep this idea. It isn't super consistent to use a random kernel
version for each Qemu defconfig.

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
