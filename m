Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37715CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D63409FE;
	Fri, 16 Oct 2026 15:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjCVvzZTf6qp; Fri, 16 Oct 2026 15:01:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2BB640A08
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162875;
	b=WGgA6gxS8zzMsKAIYuPnj+QH5ovPo1iNyo89zxeojr+tqZWEpL31Iu1DzWQB4fCZQ/aU
	 jT7scl1gx+lpG4qJnLcuLmYIBiMB6ZW6PN7LR1MNnH2+QkwobuCX63O/atcwaWHpOHAof
	 dekC6pOdvQh1X1j007b2CsCW5uanLNZUwyoIo7YAXtunEcxF1YG8aV4YL3cpAXpSjOmmM
	 PXUNyLc7KxzCw5m2pU5mWVpm7G5y2goEaMGgZeZhxrRjYPwkjNJJktCwvnRUBqykFyKto
	 xTuELqiUPT58ZEUpw/z7oJbtF5TgMWLpNmnpBbCYdvQ5pFppV2q9j074OvLBR4mBpFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kBVqwKQORcGxLaEUsRI8mBo1/jh+6hNvjnZm12i6aMY=;
	b=RGfYMUQUon1NBtcaaN4QDDm63ZN9HPjCgyX0fFnFfwAASmvsd6bSAiLgQa+TzhaAscC0
	 LNMbukj4VfLGtbnT1uFqcd7rGEN6RaMtgR/nekODBo3cs2+D8ZjtIRwkubsfc2jO//uFe
	 C8Ie5Q3Qm9Kjt2c73YO0+RaM+WdyJeGc39Ox50de90FyHQjsFCBkTO9qXf/KgSbjX5foE
	 kqHuHgm6wr8R4Dw9AZ6fOEsFD/Vx8/2rWUqkr4s0p0Nmle7+txq0DsmjYGsAHoAeKe+SV
	 GgqDpEM2QxqwcKx40qcxoaa7CZaLkk738fU6NVAJ0/U1zf2TLl5zAJ8SjJfTL+pPnVA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162874;
	bh=kBVqwKQORcGxLaEUsRI8mBo1/jh+6hNvjnZm12i6aMY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N8EpcYGC8xtqc7eW1dD3LWanw0ecHkJJOUIqCji55Q2mg/YssZTeLsyyRQeqdcBkk
	 5A5s2X6qJIz7wkgNFLsf4/4+++h9NtqAbJFqDLwHNZQLxDLEoz3XrxT/J5s9wGRZGh
	 E5dC6QFKVvm7G9aXfcQnIhxJ9s2gqXGZB2KT8kjkk4Ra0NqHtpg7v/foW4PYlgiQpu
	 qH/sigk1QQgl88iCPiTF2GuG7ppKY+5C8saC5sNIIy68mXambMYpdh4GrdV9zdEsog
	 b8iYqbrPlUuBwhHDFIgY6IHFkfUKQ19R7r/u+1MvMMqi3vHteBMpAICG4AMrbjpxdk
	 iWHj75P6oz/TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BB640A08;
	Fri, 16 Oct 2026 15:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62249255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4875940A08
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA345ujASODQ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 19FD4409FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162872;
 b=n2m1Qqibm4FVrbP8iy6W2bN/qjui0aLlBWSAnXvFe91Ls81OPdZUE0a8yH+YVdkQzEL9
 ZLfbRlA7acgSJ/SiFSy6fYCl9QvsRsacwKw2zALXZeX9wwATsJHCaE8aPfs7R7DkXkMtL
 PqTPRYTjSrFtsEif9rH+/AA8ZTSPkfnPPmrhAGZ3fGNCLZUAf7L8vDSBv/857BGa3fswN
 gs/mbo7oGLu51ZPQMzptdQed3v86DX62F4rTnDK/yhvwL9DSFC5k8opOfdNmvHf72qvLm
 p12j6z9Yx2nVX25WZ2cyxBgn4dJ7zx4pk7wcauC3FrtjFTbHU90lVNu6NnMxfvpUbSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162872;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=i56lWoCbjUFV1VyjFv/PfTu1wy+8jqyl5IgL3j4bJ1U=;
 b=ctd/mDkCyoXYfLXllerXIDtl2YP6SaO5YEF46nxTNqK99pSB1b27n26fuA7OSD6CZUBi
 TWDYHwbtGmfKMWc6jRnmddmPu7vVaCWWb/rl3VSLvNwgx0zZYbke3An7ynx8agjF7dCYr
 Gtnq8iN03aULcQ8IqnRYVvwr9IZBLOE++WNXBry0lZkOPW7ty7Gp9VxYacpf46/HM8jry
 rthna7ACx2YuWknISC4vCknosKBOBvhilQVb1LS8PFzR8EfpHSOs6dhJ9nsOsEtxLkNvD
 PYWnaOdjit29vURRM6tiuBj/ThNzzDUiw0qJglnWgU+v92g247aDWDolJIT/+7tCZbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QjIu63Qs; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19FD4409FE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so316775e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162869; x=1792767669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=i56lWoCbjUFV1VyjFv/PfTu1wy+8jqyl5IgL3j4bJ1U=;
 b=Sq5aYNq9YLb3pdMCkUoltuzqJI7STYnAJIb7Dmtw2QMIP3Ds7Ib0naJeBPirR8VUrN
 UUbvmTvT2q58FEuj8Do8p/dEEg5KAdD+cX7iM70LlAjBaZ+MMyyd7TvYbx2u1GGwYgaQ
 D8nYuTSzcmGgKYNZemqZRTn3TvctJeH7Nnt5MICchtfjo5ttljk4dx5vIbh3p0NnZfUh
 ZAcSh2qQ1j1bXqj8cORvysc/Hjdd6GJXpSryi+5dPar9Ik/jFRmhizYKbekyL0MYTvn6
 V0QdiK0Wkch/UcHgapy5VJ8gjEGQqS7Ngyt8GsvZqPnwzcyNxNE1vP+Bx98BYriXhfDm
 sNCA==
X-Gm-Message-State: AFq9FYLUngoThkGW2bUnXj56WEonZ7TH4plSQn27dnVz+7UGNhE+prD0
 rNAP2o3hiHaufRsH/e41imUV6JYKm+BQCJjoXYl+bG6PLOYe57Xh/ucIWwDz73Y1pi8k6lNEgQC
 5T1bWZpE=
X-Gm-Gg: AYBFou2yjKrbBvqB3Vj1DB9Q0Bx+ZNxy+p8mdOBSdfBWrvRW2GFagT+wOUNCpo+Mknq
 9vKBpmTfSKPQ4sLYe1FIasmJL/sgoYzryYOUy/jOQHlQynBnk7Qudx3PybFDeka8+rAD9Yk1KIw
 +2ENJPUnOKDzkTUU81x3yT5tGdRvpXnrlExCL5u7SNZsjTR0G7Mxo3Kb+P3RnRxJS47DW3yppU+
 sCilgjEDFGJkAVjQ4vDdraHHoVJEWIAkkOtfKCOXkTUCOK+j1Y0rHLOaifrTg+OUBqKgyjk2DqL
 +SX6T5WjQKCJnsG2PMzcBa3/ssEgcJQpuPMusszQNy59KagC3BlOF0OVKAKi4oZi9WXKp6tNGr0
 MV2HSmmEeuFSixB1FGjavF6jfT7iMO9DLX0uLkyB+UWAqf0tp4je4wTO51fLUkJ1h1lIq7pPds8
 aWR7b0btXwMX0gYEZDRtuHORV+Qx/p0oLjEbxM/efEzJcRLeQi9MTNHmMtkgDv8JVKRIC6CGxaT
 5qBZDhl5XH4ZXUCQTXBnwb1T3ry22GF+LOpM9MduFOGfmK0M2kl
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id
 5b1f17b1804b1-4a1d75ab363mr2033185e9.4.1792162866573; 
 Fri, 16 Oct 2026 08:01:06 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce33ad3fsm47051585e9.5.2026.10.16.08.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:05 -0700 (PDT)
To: buildroot@buildroot.org,
	Brandon Maier <brandon.maier@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:03 +0200
Message-ID: <20261016150104.59875-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] docs/manual/writing-rules: align use of
 genimage partition types
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot boards use a mixture of the GPT Partition Type "L" (generic
> Linux filesystem) and "root-x86", "root-arm", etc (UAPI Root
> Filesystem) for root filesystem partitions.
> 
> To have consistent guidance on building disk images with genimage,
> update the docs to recommend using the UAPI Root Filesystem types. The
> UAPI Root Filesystem types are part of the UAPI Discoverable Partitions
> Specification (DPS) which helps set a wider standard for system boot.
> 
> See https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes in v2:
> - Update docs to call out root-* partition type [Niklas, Thomas]
> - Drop GUID board updates for a later patch series
> - Link to v1: https://lore.kernel.org/r/20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com
> ---
>  docs/manual/writing-rules.adoc | 37 ++++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> 
> ---
> base-commit: 0df7dfb804457a62c7751eec6555ad75158e3e3d
> change-id: 20241109-genimage-partition-type-uuid-8e4c62ee041f
> 
> Best regards,
> 
> diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
> index 03e4f2c61cfe4820fe6d06d193b9215d423bf4d7..3964deca867494ca4df70f3c0d92f9982ec6deec 100644
> --- a/docs/manual/writing-rules.adoc
> +++ b/docs/manual/writing-rules.adoc
> @@ -198,17 +198,32 @@ image sdimage.img {
>    chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
>    (not +kb+) in place of +G+, +M+, +K+.
>  
> -* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
> -  the EFI System Partition (expanded to
> -  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
> -  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
> -  _genimage_) or +L+ for the root filesystem or other filesystems
> -  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
> -  _genimage_). Even though +L+ is the default value of _genimage_, we
> -  prefer to have it explicitly specified in our +genimage.cfg+
> -  files. Finally, these shortcuts should be used without double
> -  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
> -  specified, lower-case letters should be used.
> +* Every +partition+ of a GPT image (e.g. +partition-table-type = gpt+) must
> +  explicitly set +partition-type-uuid+.
> +
> +** Every +partition-type-uuid+ value must not be double quoted
> +
> +** Every +partition-type-uuid+ value must be written with _genimage_ GUID
> +   shortcuts (for example, use +U+ instead of +c12a7328-...+). For a list of
> +   GUID shortcuts, see
> +   https://github.com/pengutronix/genimage/?tab=readme-ov-file#the-image-section
> +   If a GUID shortcut is not supported by _genimage_, the full GUID must be
> +   written in lower-case letters.
> +
> +** Every +partition-type-uuid+ must use a GUID from the
> +   https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[UAPI
> +   Discoverable Partitions Specification] when possible. Some common partition
> +   types are as follows.
> +
> +*** +U+ for the EFI System Partition (expanded to
> +    +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_)
> +
> +*** +root-\{arch\}+ for the root filesystem partition, where +\{arch\}+ is the
> +    system architecture (for example +root-x86+, +root-x86-64+, +root-arm+, or
> +    +root-arm64+)
> +
> +*** +L+ for other Linux filesystem partitions (expanded to
> +    +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).
>  
>  The +genimage.cfg+ files are the input for the genimage tool used in
>  Buildroot to generate the final image file(i.e. sdcard.img). For further
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
