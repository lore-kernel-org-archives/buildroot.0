Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7707C4332F
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 21:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A958409FD;
	Sat,  3 Dec 2022 21:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A958409FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUreWeuq7A2v; Sat,  3 Dec 2022 21:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDA23410BB;
	Sat,  3 Dec 2022 21:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA23410BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2361BF5DC
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA887400DB
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA887400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wcg2qn5-_2F for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 21:41:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA0CE400C8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA0CE400C8
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 21:41:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C091C19F5A1;
 Sat,  3 Dec 2022 22:41:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 03 Dec 2022 22:41:17 +0100
Date: Sat, 3 Dec 2022 22:41:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20221203214117.GJ3302@scaer>
References: <20221130021821.2660112-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130021821.2660112-1-jcmvbkbc@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670103682;
 bh=7/oBo9228nst5zS7PtMQfUfqqOlFpUYwU/tIYSEEw/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoqM0fVkWSfjDYS5RuvL1cCtfukzjLDieM9jOSI9atJJEVaWr/1yV9pfjxhmigKLG
 OCwN0HslQkCt68m0Du8zOGQyELcXmQdb4oqkflKwvIzyUDXQWnktBNiGo9kftKad2a
 09jw/EG3OeokiYP4SBSFzdIh+A4MIWjoXJLPnd2/YCcdvwTTaRuz/+XbBQd0/ykAhB
 jNN7q6DZe6awX9OTwzxiwAlNPtfKCuc0IWCf+WTQB4XD/h6jIW4dimKF5WgYx6LSK0
 aq/GkO/PsRM+0T0EKbDIYHZNrdqcfJ7RGUcVsvU5q5kg+K6PGgdqaxrBntT2jyyah1
 AUgHsX+P6nJ5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LoqM0fVk
Subject: Re: [Buildroot] [PATCH] package/elf2flt: fix text relocations on
 xtensa
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Max, All,

On 2022-11-29 18:18 -0800, Max Filippov spake thusly:
> elf2flt 2021.08 has changed endianness swapping logic for relocated
> entries in the text segment. This broke little-endian xtensa FLAT images
> which now fail to start with the following message:
> 
>   binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)
> 
> Fix it by restoring old endianness swapping logic for relocated entries
> in the text segment when building for xtensa.
> 
> Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> I've tested a couple other prominent candidates, but it looks like
> only xtensa has this issue. I've submitted pull request to elf2flt
> with the patch below.
> 
>  ...-elf2flt-xtensa-fix-text-relocations.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
> 
> diff --git a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch b/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
> new file mode 100644
> index 000000000000..3664775906ea
> --- /dev/null
> +++ b/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
> @@ -0,0 +1,51 @@
> +From e248d9774506fdd8698b14a7edead113f19ecdb0 Mon Sep 17 00:00:00 2001
> +From: Max Filippov <jcmvbkbc@gmail.com>
> +Date: Tue, 29 Nov 2022 17:47:54 -0800
> +Subject: [PATCH] xtensa: fix text relocations
> +
> +The commit 5e08f1968316 ("Don't always update text in !pic_with_got case")
> +changed good_32bit_resolved_reloc to not do endianness swapping for
> +relocated entries in the text segment. This broke little-endian xtensa
> +FLAT images which after this change fail to start with the following
> +message:
> +
> +  binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)
> +
> +Fix it by preserving 'update_text' when building for xtensa.
> +
> +Fixes: 5e08f1968316 ("Don't always update text in !pic_with_got case")
> +Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
> +Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> +---
> + elf2flt.c | 15 ++++++++++++++-
> + 1 file changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/elf2flt.c b/elf2flt.c
> +index b93aecdaced3..cec3f4a22239 100644
> +--- a/elf2flt.c
> ++++ b/elf2flt.c
> +@@ -808,7 +808,20 @@ output_relocs (
> + 					continue;
> + 				case R_XTENSA_32:
> + 				case R_XTENSA_PLT:
> +-					goto good_32bit_resolved_reloc;
> ++					if (bfd_big_endian (abs_bfd))
> ++						sym_addr =
> ++							(r_mem[0] << 24)
> ++							+ (r_mem[1] << 16)
> ++							+ (r_mem[2] << 8)
> ++							+ r_mem[3];
> ++					else
> ++						sym_addr =
> ++							r_mem[0]
> ++							+ (r_mem[1] << 8)
> ++							+ (r_mem[2] << 16)
> ++							+ (r_mem[3] << 24);
> ++					relocation_needed = 1;
> ++					break;
> + 				default:
> + 					goto bad_resolved_reloc;
> + #else
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
