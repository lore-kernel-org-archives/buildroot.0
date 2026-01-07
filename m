Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9468D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C08CD8233B;
	Wed,  7 Jan 2026 17:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2YD_q8I_ZOW; Wed,  7 Jan 2026 17:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BC3081DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808187;
	bh=gxh4OjSlmNq1+oAzQUqIcbSnepofuySY2NBAn5WYlsM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T4jUYRCHBZLLNIIIYyObxbdYteS6cBCh3YBpMcIKq4ezvkqAfPvwRcdLK2Zyvwvf5
	 Oy/HkKoA8YdZqiCj6uZBiLcu2y79MzS6t/8YJfzrL5KUrVaaEdY2MSvhJpt8WpgFKo
	 NaV8OTUdoqcLcsY4FGXrsNQoCjrJQvTmi71+oEw7tnOHGEfItZ/yu3RxhyyVbSjlNs
	 6S+7HzdaWP/DAiJOZ8V83VoCkJS8Yk3hjgvWuwXjN637spRgg4+McnG5du278CED+h
	 3lhrij4BZqa6+dSIH9U1EYzK6RSruSGhwn+cHLKPojb/OD26uJ31o+IC4cLpV71qXN
	 kQZlci0j66w0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BC3081DFD;
	Wed,  7 Jan 2026 17:49:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2E9B9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4AB280FAB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7P8J9N-PPp4 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3FA181396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FA181396
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3FA181396
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E764B97A192; Wed,  7 Jan 2026 18:49:42 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:40 +0100
Message-ID: <20260107174940.225462-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219210957.556930-3-ju.o@free.fr>
References: <20251219210957.556930-3-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808182; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=lUSnfxpw5yV0QjGceKqYF9kxp5QyfgvtrgrwPb9J5Kw=;
 b=dEgufWCprDeUwIlBKMMMBchSNwPiWBDp7sjQp5BQ4IqcnYGaKU4GokPJlrfsW6uQSz8DNw
 6GT74FMR1W2UTsprsG/iLX9UzUbasHteu4itf/YCKNfc/A3jq16uxUBMRX5rDdepLovGav
 h02+xM8Gy/uFZjQ2D7CGTh1ygpyimj+RtBDlbPhk+YCRC4zBfX/LxMgAJb7ZgPrvmfj0UH
 vO67AGUdg2UGpeI8kvle1DtW7hx1dyMNuSkuCkSvwypFeyXke80bE+/c2YxsmCLHFYKjnF
 I+IFKFRLQDcXEfeAU5a4lDAsGiEQbmu1aKQxS45sWaUQRnQuYfJf+SGcUuA6ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dEgufWCp
Subject: Re: [Buildroot] [PATCH 3/4] support/testing: ddrescue: use f-string
 for test config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  support/testing/tests/package/test_ddrescue.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
> index eb3f63ae53..bd34694737 100644
> --- a/support/testing/tests/package/test_ddrescue.py
> +++ b/support/testing/tests/package/test_ddrescue.py
> @@ -10,8 +10,10 @@ class TestDdrescue(infra.basetest.BRTest):
>      #   mapper dm-dust, which are used to simulate a failing storage
>      #   block device.
>      # - lvm2 user space package is needed to configure dm-dust with dmsetup
> +    kernel_fragment = \
> +        infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
>      config = \
> -        """
> +        f"""
>          BR2_aarch64=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> @@ -20,16 +22,14 @@ class TestDdrescue(infra.basetest.BRTest):
>          BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.2"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> -        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>          BR2_PACKAGE_DDRESCUE=y
>          BR2_PACKAGE_LVM2=y
>          BR2_TARGET_ROOTFS_CPIO=y
>          BR2_TARGET_ROOTFS_CPIO_GZIP=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> -        """.format(
> -            infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
> -        )
> +        """
>  
>      def test_run(self):
>          img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
