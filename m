Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931B6CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC0641305;
	Mon, 17 Nov 2025 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FitKtrrghYBt; Mon, 17 Nov 2025 19:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8FD402F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C8FD402F8;
	Mon, 17 Nov 2025 19:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 845DD158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7696D408C5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgO-Z5X_nj2w for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63BBD40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63BBD40027
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63BBD40027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:59:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6729BB979430; Mon, 17 Nov 2025 20:59:09 +0100 (CET)
Message-ID: <6cb9c8eb-36b4-421d-bb83-4bdd59f74986@rnout.be>
Date: Mon, 17 Nov 2025 20:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yu-Chi Liang <ycliang@andestech.com>, buildroot@buildroot.org
Cc: tim609@andestech.com
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-2-ycliang@andestech.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251027033242.1797230-2-ycliang@andestech.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=J4Mku9lV5QDXjA7N5RcrFCPk1ZpoisjMd5XjKSz8WiM=;
 b=CX+zm2IFTaA2vflYZmE/wg3XlCHx8dOH/0x7jQkpHVGLF2QLzRs7Yi2KRy9PMTlfItv2UZ
 MPgciZFAfNeK947TiqqqQDuKMHlV+Tr5RxCj988LJaRQTrqK3QpxDsek0OeozFsyzgLG8D
 4mkpnJp16xdJh5xxzQcpAR0owHM5Kgxc9V4NEQjvCYL9uJPj/VT0fMwucoHhvKfILoTiNd
 KHg1IPK0Pzgl7F++I5Sufg81I2cmw4n7bVrGICvExi230XLvVvIj5eHSky1iD6dCNv+NzI
 Gy8VYVcAplqAjQCsTnYVGNT030NlxSt1tbOUJOHHuIaarIlghEuE2Q/1j74Vbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CX+zm2IF
Subject: Re: [Buildroot] [PATCH 1/4] configs/andes_ae350_45_defconfig: Fix
 post-build.sh Shellcheck error
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/10/2025 04:32, Leo Yu-Chi Liang via buildroot wrote:
> Add quotation mark to fix Shellcheck error.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   board/andes/ae350/post-build.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/andes/ae350/post-build.sh b/board/andes/ae350/post-build.sh
> index 84187a064b..e1669c2bcd 100755
> --- a/board/andes/ae350/post-build.sh
> +++ b/board/andes/ae350/post-build.sh
> @@ -1,3 +1,3 @@
>   #!/bin/sh
> -cp $BINARIES_DIR/Image $TARGET_DIR/boot
> -cp $BINARIES_DIR/ae350_ax45mp.dtb $TARGET_DIR/boot
> +cp "$BINARIES_DIR"/Image "$TARGET_DIR"/boot
> +cp "$BINARIES_DIR"/ae350_ax45mp.dtb "$TARGET_DIR"/boot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
