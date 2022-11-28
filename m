Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB040C43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 11:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 732E160808;
	Mon, 28 Nov 2022 11:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 732E160808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnOLWn4RuDhd; Mon, 28 Nov 2022 11:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83D0605E9;
	Mon, 28 Nov 2022 11:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83D0605E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85C081BF589
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 11:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7D740179
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 11:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7D740179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XI42RGz6c_j2 for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 11:54:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E57400FE
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1E57400FE
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 11:54:31 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id z192so12985950yba.0
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 03:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zK6or7+ll90yJygvPp0fVBYjPQsowcmxounnyzDjttw=;
 b=fAvzbjYSkK3U17u0NHGE9jaZvfPKPe7dX42II2HCqGBhML8yB3IEgs6PeINjq/6xz8
 jL0WP/uLTaMHLkCH/MCfG55ZHtkK1olmwFakdFWUmCmOBZfzYe2fvCVuXQPfrTtuQdVh
 H/NxuTZ5UcofuwbB4Hy6V4XGqKaAxXijUt75T2sBCvszb2++HhTCd28ynPP/9HNzezWr
 6yYOAOarLRfsegJxaYsfoV8jL8mcsEzC5zndnB/AvXrlktVqje6LlW43YVTyN08+Za7/
 PUp3iKjVO3o0ZyG0VzlMSvHHTDLW62Vtu6t5BnS/JfgKnA914DFt5AjthORs0AMEwLy7
 TcyA==
X-Gm-Message-State: ANoB5pnBXBk3z31EaUnvJ0cgyv8PJNtnKCus1XOEqHloTHDn/GvIPo+7
 m4z3ux3tnVgOWTXKdtrAdv9DFXbcV6B409s6YQM=
X-Google-Smtp-Source: AA0mqf5Y0O0sYXP5binNhqWS3FVGQPcGoPBAA799GXKqUvrY5YXd7OWPAPORG+IX8EVR9UWvwoFuatAX8fIMyaoHC0I=
X-Received: by 2002:a25:2303:0:b0:6f1:b62b:5081 with SMTP id
 j3-20020a252303000000b006f1b62b5081mr19247123ybj.497.1669636470583; Mon, 28
 Nov 2022 03:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20221125191155.111c4ddc@windsurf>
In-Reply-To: <20221125191155.111c4ddc@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 28 Nov 2022 03:54:19 -0800
Message-ID: <CAMo8BfKE9KqDYyFhsKK9M8XjjuR=TtONT8JdKniFKwAgfr4HVg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zK6or7+ll90yJygvPp0fVBYjPQsowcmxounnyzDjttw=;
 b=d0OYPmeeSadeLSTuZs2WcHaqG1wJpFJow11eo16DkG+Y9ooFr3586JfZ4upW7ffJwx
 3PpRKCEf/lvA3sywYXHDOatM57QBYvXvQwHaRkZPue78+M76e9G/S43qJi80ZL0dZgRY
 KGxsNIO5O4fcPSlEvdzU79iFYzYePX3lL7rGnKjOVPGXxAAPr8VxV4NkzsNqyAQuPqGG
 ObDP9m7cY0aIugSPuvvJFTToPkUTzKaLTXmBd0ytYfv0Ll5NX5NrfdzGxaHpks5rVHix
 LInd9tM70s7VPNgyLCCE7oVzFyd0sretT1PeU0MU0YRo92KCMlPXE6H+BtWpOvUZj1em
 5Dxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d0OYPmee
Subject: Re: [Buildroot] Xtensa qemu nommu defconfig not working
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Nov 25, 2022 at 10:11 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> The configs/qemu_xtensa_lx60_nommu_defconfig builds correctly, but
> fails to boot under Qemu:
>
> [    1.158675] Freeing unused kernel image (initmem) memory: 460K
> [    1.159475] This architecture does not have kernel memory protection.
> [    1.160806] Run /init as init process
> [    1.186746] binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20), killing init!

> Max, do you think you could have a look at what is happening?

AFAICS the following commit in the elf2flt
https://github.com/uclinux-dev/elf2flt/commit/5e08f19683163584f23b953e570749964758c439

disabled address endianness fixup for addresses in the text segment for
xtensa which results in the observed failure. I haven't checked, but from
the code it looks like not only the xtensa may be affected.
I can confirm that reverting that change fixes xtensa nommu boot.

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
