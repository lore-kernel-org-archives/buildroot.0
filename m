Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECA6C61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 13:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9A380AE8;
	Wed, 26 Aug 2026 13:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5u-f_l37eVo; Wed, 26 Aug 2026 13:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787751402;
	bh=5E86bZbn9Ffvj89e+nDjIk9t7SAMm/bVj3ZaadKn9+g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJawH7FKSrHIVxbSGhd8BmZfNWJn2CK2ERdSTyZob2wTg5+AK4UvLBAJcPKgpJ14I
	 ia9km3lfleaWcNeoOqbZQz0fijMcHef3cshbuxxNSNGZ6NtKhMGQPR+5lAzfZUD4p/
	 uh8g67KuJHS13YZonC+Z3MCG/9jblD7EphRR4HbhP8zFKkPVOMESWZgTeyvl6b/E0t
	 qFpYhGFvZrlephvkUHUquPxVN4q8/DRDSiUP4tMeC5EzdG7TNSSyL2741rupRvTNxw
	 NGSmdCgGt8GHrLW0zAONgvy6PfdwtOg5EtdO6Eed8PvAUxn3kkHok+frmbIaJcNJw4
	 n+hNOXmEZZtJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92AF180AC7;
	Wed, 26 Aug 2026 13:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 390A0323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 13:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B1734047C
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 13:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6ndvvkwNhtx for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 13:36:40 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=kMWAJ+x2
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B98F40434
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 13:36:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6a5e866bca0so1067622a12.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787751396; cv=none;
 d=google.com; s=arc-20260327;
 b=rq/U9BflZ5qEoKUxmwJeeCZNfGN3stUwmn07Iw1L+pe0o1BM6TKkHXkkdiVEjpuRgf
 lEbp5Eu9Pslx/v7K9hFjRTVu93qPalSkZU9qvi0j3IDh+X8Kqgjbt4C34aDRPt4Ti/jr
 xZzdVzoBPCl4OR9trn8xodIP5Z3CLB8+vcwoP9IGD5E27oL3i9uLQJz37jn5PmJi/tAd
 Vfzo4iitrenSLUKic8ii21e+EdZSbX/e989yGj0KsyTS9nmHSaJRnKiT0g/RmMzyQNuS
 ddzulY7ijYaP3rJKeJZNmYeScCPJUrg6DDEeU70Czj3dsX3/R0AWAQ2dseDpFijS1CvJ
 wzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ppl/r8UoiB9pY9+OWa9IyD+DF38z9UrG3rWBKDoXv6I=;
 fh=WMMirCp0IvTESJms/QIymyUekEPCI12ylFwTpt51H/Y=;
 b=o+ilkPTmDMCzzin2G25L9pSsbYGIlgB89cJFnhnU8hp0rv9MPV+NDlyu++vXW8kvCt
 V6+z+J0uDNM2V9ALWOZgUDf/ZOOC2owpii6qHDUw/rwIltIZV8X1B0WmtxcmbE8TW4mT
 9Tf32BicQnZsaVd2QXkqomdQ0VO9e9aa9H0O9E6OkkeDNpJMYxq7WXBC5Jad2YxJUm8j
 iTOpYz88aVAcDl4BPrPzute2V0MMORHqwGzqj3tTXb0hfNTbgGKLGQPq961HpjhYhzFW
 cLzzRxusxO84+O4bSLeBNSpLm6/6svf9pxulXY6sfEhIFsXbiJzm4nGOAV2AbIYjn5UN
 +dxA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1787751396; x=1788356196;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ppl/r8UoiB9pY9+OWa9IyD+DF38z9UrG3rWBKDoXv6I=;
 b=kMWAJ+x2tZST3dlEhsX/uGH3ZqbNkttl0SIruH2/C8mncvz1L8vgQsxDOWiKZ7hNpp
 r3BOPlHusWuP2wBdSs3+rN+Hx6g7McWBCjiI6lD8bJO7CzKQzytzWAIYUirRslBCtUYu
 lJfr71ToNerlUCKXEKWj5m0asphfZD6CzDa6ajuKIBgjMLbo2PbymkNtn7LXd5DWmsL1
 hUcNFbZzvc8xT1+CdEtKAxsv3w4I30qcAqmH46IBYIUnilr/wPohUYh6yfsZd5G0qoN7
 QOjK+ziNftLXxS82kJm4U2TZd36nQpsGAVkT7hnJIdxa9d00oYK6+rsYVmObgLc8qVHc
 DSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787751396; x=1788356196;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ppl/r8UoiB9pY9+OWa9IyD+DF38z9UrG3rWBKDoXv6I=;
 b=E8Kk0w3F3/+1CnojiVvhy4jNGKIuUZCHdH2bpahxNlAFCjpvjIFUuM5JsrvMnVt9Ml
 R0hHrfI+twwhHWJQpQYNyuh1ODhy2Z1dqMtvp0SpDb8bVQbvudWj4VLzTWtwV1jAh6rf
 3cUZ4fTVArAjJ+m5VIjFbkh9smZT8WYCb1NJrR+N4iZCIrYW1CPwfneTaAtew/HTvMkh
 Afz/rj0Pp4+/9YPjfMT7pzLjQbR+x/Ej2I977lidE+MsUzQjDxNF3xRsN5TIU0bEXOA5
 jFY8OuMkikcrMVZPMDbjQNkTmkWCzTYSV3hK98zHUNXalKN001VxHSrNIl3h1CZaa+pT
 LIJw==
X-Gm-Message-State: AFuF++nvRMqA6ENAubkDtcoMBdg1GUpuKadyzlVC6UDjS3v2jaQIm09S
 LJGXZ+nQV4p4mQIM5Y0UkG52Tuj2NSOzrOqt8TWBsz0pWPLnqmiuFDBPep2AyYeON3hsUd9V90I
 Olt+cTlTSmMv7M0KxIVkrQ1lhGBFKnH4h0mQjtvS4OQ==
X-Gm-Gg: AR+sD12bcXOHAhY8qoYHHADWchpwguyEhgob0zqA3H9KzJGMjqzxf3SbPFkKjT/xOns
 iis6w1m3El5CpRhhaAlMb8zkyqDWaaunYS8ETAaQ1IbRvKFzrt2Z8lZzUB8rKY6GtZFPXTuUbrW
 M+6YT+RaMQh18lBa+8bcsxRNsV3CGkpowYFouRhP+bLZrxtLjeBUZX0q0HEGJmcly7PcI5IKsdL
 n/Vz/TqvmQ+yydSwiqBeplblnirlRryZ31xubXGdoSwO2EP2zB32El8JaMLQdQIGER+CbbSeWMJ
 YM4c/L1Xcr76DwVC/26fEwme4r1zYWeuOlliAAzBP4lf/FKgKtWWFNUFbkzKnEcHrsAdsRA/arF
 JTk0=
X-Received: by 2002:a05:6402:a0d9:b0:6a1:f092:3c1e with SMTP id
 4fb4d7f45d1cf-6a5df6410cemr8165521a12.13.1787751396097; Wed, 26 Aug 2026
 06:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260825143045.3860877-1-rhidian.dewit@openpixelsystems.org>
 <b1733911-86a5-4e32-bf75-9c025792093c@gmx.de>
In-Reply-To: <b1733911-86a5-4e32-bf75-9c025792093c@gmx.de>
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Wed, 26 Aug 2026 15:36:24 +0200
X-Gm-Features: AcwNN1XAif_OINMb0b3vknVGs5JDWi9dw7CNV7hYZVzlOTzyDsD4PY4MT53FmCQ
Message-ID: <CAKWiKxHo-+NNtgXg1a=PXUF15PvEBKGkyA+qb_USU77g3cTO1Q@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] Avoid segfault on x86-64 with invalid EFI
 boot entries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks for the pointers! Will fix them!


Op di 25 aug 2026 om 20:11 schreef Fiona Klute <fiona.klute@gmx.de>:
>
> Hi Rhidian!
>
> Am 25.08.26 um 16:30 schrieb Rhidian De Wit:
> > Upstream: https://github.com/rauc/rauc/pull/2029
>
> The "Upstream" trailer needs to be in the patch file (see below, or [1]
> for an example).
>
> > Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> > ---
> >   ...bootcurrent-is-valid-before-using-it.patch | 43 +++++++++++++++++++
> >   1 file changed, 43 insertions(+)
> >   create mode 100644 package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
> >
> > diff --git a/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
> > new file mode 100644
> > index 0000000000..38fc02c5bf
> > --- /dev/null
> > +++ b/package/rauc/0001-Check-if-bootcurrent-is-valid-before-using-it.patch
> > @@ -0,0 +1,43 @@
> > +From 931d0af0f66b9afd2a7c9d9532abef1ec67b1f69 Mon Sep 17 00:00:00 2001
> > +From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> > +Date: Mon, 24 Aug 2026 10:04:24 +0200
> > +Subject: [PATCH] Check if bootcurrent is valid before using it
> > +
>
> This is were the "Upstream:" should be.
>
> > +Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
> > +---
> > + src/bootloaders/efi.c | 19 +++++++++++--------
> > + 1 file changed, 11 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
> > +index 19224118..6de5f73d 100644
> > +--- a/src/bootloaders/efi.c
> > ++++ b/src/bootloaders/efi.c
> > +@@ -625,14 +625,17 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
> > +             return NULL;
> > +     }
> > +
> > +-    GHashTableIter iter;
> > +-    g_hash_table_iter_init(&iter, config->slots);
> > +-    RaucSlot *slot = NULL;
> > +-    while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
> > +-            if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
> > +-                    return slot->bootname;
> > +-            }
> > +-    }
> > ++  if (bootcurrent != NULL)
> > ++  {
> > ++    GHashTableIter iter;
> > ++    g_hash_table_iter_init(&iter, config->slots);
> > ++    RaucSlot *slot = NULL;
> > ++    while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
> > ++      if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
> > ++        return slot->bootname;
> > ++      }
> > ++    }
> > ++  }
>
> Indentation is very different from the surrounding code (tab vs. 2
> spaces per level), I assume upstream will want that fixed, too.
>
> Best regards,
> Fiona
>
>
> [1]
> https://gitlab.com/buildroot.org/buildroot/-/blob/9dc567aa78e6381ff7100b696535f1ffdd8447f7/package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch#L44
>
> > +
> > +     g_set_error(error,
> > +                     R_BOOTCHOOSER_ERROR,
> > +--
> > +2.51.0
> > +
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
