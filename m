Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B335EF8FE7
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B1580AEF;
	Wed,  4 Mar 2026 14:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEknfwn7onoK; Wed,  4 Mar 2026 14:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A3180AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772632900;
	bh=8WwjS7oewxAGshb1CB4vFwp+EJ+0h44+i3xoPNjZyiQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=msR8NIud7xp7hJlUHmRafFsiRHgTKp0pLq8NsiyX4cb+sQ7DcM5SNYxmuau2aEyxe
	 Ou0PtIjuGimZ/cjuvR/v4Y7z0YKoMjNK8CmD3nrX5YShuWCJC/08yjHymIKEFe6Ioy
	 j1M4UaGuPy49O9tXLgfoi+FZ3fiQA6rGENlpsB1KT554z9vJGFsd0t1QvkS0PLWuwj
	 lAUokH8oKs8D0X6AX7rQs22ZDhlDgJB2E55Fq+wURrX34WgJT3zmJSzv0bZMKjjs+O
	 dFButzxt5jHOf/JBGI31aMBVOEpPvnr6nV6TkFsI1qK1GyxBa5342ohXzlhAFtb13o
	 yJdFPN+oOVLMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A3180AAF;
	Wed,  4 Mar 2026 14:01:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C251E231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7544E80322
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDYEtXKiT0nA for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 14:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FED18100D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FED18100D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FED18100D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:01:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Fs-1vLvWb0awQ-00fwTm; Wed, 04
 Mar 2026 15:01:11 +0100
Message-ID: <4a2f2b4a-ee67-4049-85cb-56285f02f619@gmx.de>
Date: Wed, 4 Mar 2026 15:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
References: <20260304133241.3389941-1-neal.frager@amd.com>
 <20260304133241.3389941-2-neal.frager@amd.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260304133241.3389941-2-neal.frager@amd.com>
X-Provags-ID: V03:K1:SEwyoUXKPZeSQTMcmgctuAY5KBZGx+3pkBCoVbDRZh0qh4up2UT
 ctWfmUnnGAnzQWjlohuP9EPy/ZLEB/yKAWWUZD10J8Q35N7bhEVEpWKian+63nzzqQLJct8
 5wQcoY1ehqLxw8i0L6+vePH4TlWtHyPtkSJ65rFbfVHruJ3uzpluZXj+d926BkaoQTmTuQV
 ICneW7YdcoDHWQ/dpfiFg==
UI-OutboundReport: notjunk:1;M01:P0:PGb2S8/N4Zc=;dvBLRt8eXsbs73Euti6bQjxAQ6P
 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
 qfhrGk0unkzllqm8g748
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772632871; x=1773237671; i=fiona.klute@gmx.de;
 bh=0rB6A37vGx9GMRTP9xlBz9nBfUVR4rtUdAMxStA4V0w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oPTH5l7YElA7SmW0gQJj+LxKdioCTZ1WWgyni5oAHi0JsaVwbU2dV+MXMgQcgVv6
 iApAvM19SbSjIOjVLLnxQoWjEOHaEbMRNY6HaY4Mlsqe4KiJn3nQVQkDQaaO5Uk1X
 BKVpcnxJ9Z9CpUMUEo46MMFwASWPmmfZ8GbUULfaVkyimHdQpbTIA6M2VF9eMPsuK
 avNsPR+VdM5OZ519GPKGa9EWaAnurkYOQkkSLBcS1mL2t5cjY66dtfE/Omi7L7R42
 p4QDofJU6Hk/rQL4eQvCiIgEfqVK+j5/+Ek+cCtZ5lcYSuRhrOlmMBjEHcR8YfxIO
 bciU5Hme7UGy6G1PCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=oPTH5l7Y
Subject: Re: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.03.26 um 14:32 schrieb Neal Frager via buildroot:
> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
> 
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - removed unnecessary $BINARIES_DIR from symlink source
> ---
>   board/zynqmp/post-image.sh | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..10a3c32b2c 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,8 @@
>   
>   # By default U-Boot loads DTB from a file named "system.dtb", so
>   # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"

The comment and commit message talk about the "first DTB in the 
LINUX_DTBS list", but this command will only work right if LINUX_DTBS 
contains *exactly one* file. With two the second file is interpreted as 
a possible suffix to remove (in practice, probably ignored), with >= 3 
you'll get an error.

That may be fine for the defconfig (I haven't checked), but in that case 
comment & commit message should be clarified.

Same in patch 3.

Best regards,
Fiona

>   BOARD_DIR="$(dirname "$0")"
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
