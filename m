Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EFEC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C01360762;
	Sat, 31 May 2025 16:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6pAu8kPSn5W; Sat, 31 May 2025 16:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C84F16072A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84F16072A;
	Sat, 31 May 2025 16:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8305235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98C806064E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qkeomBLh8gR for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 004DF6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004DF6064B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 004DF6064B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 093431C00DB; Sat, 31 May 2025 18:53:57 +0200 (CEST)
Message-ID: <92f77436-7200-42ff-8432-148a54bdb051@rnout.be>
Date: Sat, 31 May 2025 18:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250516150830.313732-1-dungeonlords789@naver.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516150830.313732-1-dungeonlords789@naver.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xMTxBkcIYuzKjRaK5oPxHBa/pQX8+YIRXbLOL+nMI50=;
 b=KhKb5LCuVSUGwf20PLAwU52gv5NVNEFS63An20LfBiLt1/rp9ns+D6wK3l1uP+W1YjkS+O
 +4cKgah9z58knEzGF2HfbDzmIgZ52VpOjtcU6itw+cCmhr+dzph6JmYSYumz1uHADXHQMz
 suzyC99AFuAnTWFWROzT1a74H/Q55Vjd5vBOh5iBDbWWcysUqJYmQALjSKYp5t86bBCs+m
 i6dtyOCRk9ma1VyI32oWcYEXUlph4UCBnKgk7ZFSEczzxuUcbOuW0vNLVscdyqcEkl6ra9
 G+LOj0WugONSPNhIUpdrp5s6ndmK3Ff+RTzcItuaZ0ocYvA8QwAKfeyO8J2Y/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=KhKb5LCu
Subject: Re: [Buildroot] [PATCH] boot/grub2/readme.txt: fix script
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



On 16/05/2025 17:08, Cherniaev Andrei wrote:
> Fix regression of commit 552ba600eef0884bb7bf7f09a67cd66747d1efa8 Without `--show` loop_dev variable will be empty so the script never works...
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   boot/grub2/readme.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
> index d0999ec390..3b7df3a47d 100644
> --- a/boot/grub2/readme.txt
> +++ b/boot/grub2/readme.txt
> @@ -10,7 +10,7 @@ Notes on using Grub2 for BIOS-based platforms
>         is enough free space *before* the first partition to
>         store Grub2. Leaving 1 MB of free space is safe.
>   3. Setup loop device and loop partitions
> -   loop_dev=$(sudo losetup -f disk.img)
> +   loop_dev=$(sudo losetup -f --show disk.img)
>      sudo partx -a "$loop_dev"
>   4. Prepare the root partition
>      sudo mkfs.ext3 -L root "${loop_dev}p1"
> @@ -65,7 +65,7 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
>       - Create a second partition, type 8300, for the root
>         filesystem.
>   3. Setup loop device and loop partitions
> -   loop_dev=$(sudo losetup -f disk.img)
> +   loop_dev=$(sudo losetup -f --show disk.img)
>      sudo partx -a "$loop_dev"
>   4. Prepare the boot partition
>      sudo mkfs.vfat -n boot "${loop_dev}p1"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
