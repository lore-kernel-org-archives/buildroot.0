Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE67BCA5FA1
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 08:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A9C5605E0;
	Tue, 29 Sep 2026 08:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88kiX5R6bvna; Tue, 29 Sep 2026 08:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6F9AF605ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790668942;
	b=N6ZZDruIiZybtAklGx6EjDF4Q8fF04RYh4xD2J97l7SiwehGPKLcpdWFfJnXjJXe0myl
	 kw4ZbxNMHaxehXYKhiSQjSMFAVjDKLtyxOJzlGIHndtUb0vLBobWyJsXt1JNnVii3H7WX
	 R/pjlPIi/dXaTIuS4eHpEofEcwWqipJScVEaQuGHFPTdqvlu+6rc6LtbfpnOybx+4r6OH
	 8cwVE6MToTigT9jYLk3YbZnOYH1d5XMD6JH3O1mMgWfE730L8BUE55TPeI4PwKoM3yIPH
	 aQ7USTrdbi1oT/+OJWyVkqSdAHX1OCnNgSsEXA3JdpSMGF34/mc+Dig2ydB4EWf2ZPg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790668942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=JafoHPQU0Z43YmvD0qD0E2EeQzuqet/3j0eThGo2UD0=;
	b=JoMJ58KHWAHKcJBgGA1fkry/pjOkA2n91ELGoaZH0pgq/JmYYzZh6HImeuXIDLAmha8H
	 MBzyBneA5sNuCI+21WgNpnOpBYO0yOF7HrUBYoBLZemXgEsQ8nyhPaj6RrcZ5YOwxIdeB
	 eyryQuRYT80deJrqYvOdjOpBK6Tbkfe6HOluDkfvKmR1JyXpCWFgDMMruQotpcZhb0LVQ
	 00aLcPHLWfSO8xSfq4Vcf3e3CPSyFFajML1CSmVrBz4VAC1cQAC2SEmHRykmYdVPIUE+l
	 0sswtybOoj1xHssQiEeYxYpfLBKQXKx388SuxJigdtLB+iXxUK39CdmqlkeEWqApPWA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790668942;
	bh=JafoHPQU0Z43YmvD0qD0E2EeQzuqet/3j0eThGo2UD0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mtcIRnnM8P+Yk1NMY6IfbOG8B2DunW/kk4miu7QoU66INj2ZWGcAytOlUsaZp1vTV
	 GsNIUypf9PxshfPcboYm0zfXZQdESFTZOdOi7avbvnx5rvPZBzW1cRKfPAFv9Nag/B
	 nWXwuLKZ8scVYwwQd1WZ1l0cdf7DpvUYc0/Ccpd+cKhcPoB9kZTlBZiaMEAiLiJJuM
	 LEYpPg4F/xlL995pk0iqukTO2y1deAhzAVlYNAYEZsEql8+6Lsim/HL2cUvs7QoK7G
	 ATx7Vq6XjjZWrGrThZoodVHsQTTqqwFMUEN6uZ3699XsI/cDS30f8V7GQMJqxQ6Rji
	 rKA9f9Z+SDtog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F9AF605ED;
	Tue, 29 Sep 2026 08:02:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EED72
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 08:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 595DC40267
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 08:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0dSub7F1aa9 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 08:02:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C293A40265
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:36::11"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790668940;
 b=gHT+oUWS13nSxDOE08z094qMNRGqWQHZNMDvZpJO5vdlDmWq7qj2KSX/XW7Rl3Eju86/
 YjBDvwILEK3yRU51APdnDjnfTeHF1DkbooboImFGbPYeSiyifxpUjKMpIsANoLa/kRQZc
 HG2mpTF2lsZ9pAah69x3ejQ7Zt3CPDAgr13Aw5VP4gAkl/HKiXew91QYMNoo4BsBNEbU/
 8hPpllnfOIc6alby0D9HVHOauN98V5F/yfGU52Vc0UKIv8I9of636gQKHL3nEihhBqtDc
 J43ifK8/3xcs8G0ST5V7HtzwrHZIZhJVRUabE682VDu0NRZAh87GzNumeSo89sDyEMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790668940;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=Ng8S2GlW4s3IslHNjaZ0w+P+R/tKxI8UwoXaPIs46rc=;
 b=BSLO6iCjXHFpwrPs1x7zId9jW6uiT6177RWyxODm+MUeEeLnYCtfv8CZi6h085kWptbz
 PHlHOq9/JTE/5YaXZ28FbI4d5XnVx1C+HoYW3BVSeiWLgTI721b0rS22q8j12ddF2dTmB
 W8cX1Dp0MSLiThnthiTkXgh0njYtp19gQSwcGbWUnwBEL7ayyi5QaWrr9EOKVi2DAwBTB
 YhXuVhhKwINTAZtX7X5z6yLKvMgBIf/Rl88TElY9eTynKjHZoytC1L5BlZsQqow1g8jRM
 56O/UxkrN/S3g/cXoGFu84WqomqUczU4KVfjEAW28HAqKAoU/3X2sDk7Sip3dw7kH6w==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QLxMInSn; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:36::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:36::11; helo=mail-lf2-x11.google.com;
 envelope-from=thbt.cllt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QLxMInSn
Received: from mail-lf2-x11.google.com (mail-lf2-x11.google.com
 [IPv6:2a00:1450:4864:36::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C293A40265
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 08:02:19 +0000 (UTC)
Received: by mail-lf2-x11.google.com with SMTP id
 2adb3069b0e04-5b8d6489419so3205955e87.3
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 01:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790668937; cv=none;
 d=google.com; s=arc-20260327;
 b=Ul+f2HC1iUIgpHhKzLXCnGJ7p71vf1K78HFu5dv0cXNkLg/Uk0E3dkfhu3XO5A7scI
 F+CSLUfFGvu1XAqIWa/GpzH5OddA+w1gho6uvwkowzFgCD10ZrvEgRteSCFnXFoMykzZ
 /AkiZnCxn8UAehgCKciLlBbTWFbztqJzxLKutvZDDbnWfDX+pZXGoyolGnzMRVuZGS7G
 fKrZXZxoulfX6kMg/eGhfkcjNo+BaQfqhNDk+DpH3QfYNCzVbLvLeX9TxamS9T6BT2pZ
 1MRyQE+4xPdO6ArObWWzY+EtpvgxhhoBwsfJuoIDRqL5KeSP8h8WQoFz9v6npm/SYbZX
 qEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ng8S2GlW4s3IslHNjaZ0w+P+R/tKxI8UwoXaPIs46rc=;
 fh=54wCkxUMw46Su/pr+V4+Cnf37fO6WVTlh76GztTwlZ4=;
 b=D97UvDulQypQ8659XtaTz41kBi8JnVZc+PnsVzdUbowe+JRW9ZSV9OhQybWMJpjJFD
 2PsrU6312j7u/PKZd/umh7MJt6a3jzKxoymMq9l5MqQ02fODTpAtTH5BDRw+3UhatJzi
 nX2ruA2rPkTq+zkl04LCuz8sAhol+9/9Gk0ElCC0TPe7ntF5lal+VWz1ep33MEeqUyuC
 CF1cePor/RzKQVvnc5Jfn9E7rUrxlmjygbhlQ/a1pMU4YnxpnpeQjY4EYeqtP8C0/dPc
 FgbW6Shm7lppGRUhXf8OvxHjO2AAg2sLIuUc6C7VpRbc4EfbKdlhL1/WgxPvKHOeRz/a
 XltA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790668937; x=1791273737; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ng8S2GlW4s3IslHNjaZ0w+P+R/tKxI8UwoXaPIs46rc=;
 b=QLxMInSnQ4/48FLNvVnMZo+gZzre30iROUq4hnwFSHjHMKby9Z/VXGNJoEpq9EBVbL
 5kbSiFO3FznYdqbrMfBhD3+GvPPgUNTsPGLYkkJC5wMuPf3KRvFApNBzrGcu2J2/nMaq
 KV7cJcEbzf7GwBjFfDd9K/E1fw6flsYchKGpIyw3XTteXal2Rya+Q6fpJ7mbZrfSOaeY
 wZI4sK6TGMTDEx5Ju2Tz3HtcjwnvB6KWR41lxpSb6FtF4+wwkI4CKX6+AoGCcMwPtHk4
 KWlGnLj8WNMTy5yvP8o+h0ezH4oIW678VDC5Ryvv1/oKnTF8Jb7zIxc93+IRX94RRi/O
 JEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790668937; x=1791273737;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ng8S2GlW4s3IslHNjaZ0w+P+R/tKxI8UwoXaPIs46rc=;
 b=Rsw7K6SGrGEjgoW97JrO6u2aOWJfJ8Yl8ab4UFNTrNLwvxYmTmXDLEPHoh7nOGep2V
 3OnhhYU4/5aZmHNLwiwGJ9qphS74RZ2PuAQdDHeD2pKOrcOjbiuAfky4hHtQvVHNhDy0
 lNQbl8PMlveGolhNzessD2IOWNtjNp4i8AIrzhA+nRIuNIXGQstkTeBN/vP801mazU2E
 EzE1Fqei9pndH/ATap0jAxrKLn29oBNSSmzTmyrxM5smLcKFb6Knb1o5XRPRCuUex3yA
 iHkVEaBT9Emt5uxDXVMvsloZGdKEUcUi93MrkPbxZLs1fEDtPTXT4NQD0SxtRWTs5NuO
 Qerg==
X-Gm-Message-State: AFq9FYKaYxWuvIaqgg9ASpaST/GbbU7Ayqk8BlUTY81mYt0dFShW34Rm
 WR8D1dTc/CgCzXqh7QuYtNCjly6WR9zpnEJPAIcpW/laLz3atTxIFz+TxoTaN3mvSK4bCCPhrPD
 na7Q6eq0kurxabOp1K27ZUDzx62B9V7Q=
X-Gm-Gg: AYBFou11EtGhHMhazzkH0wBZ9o9T7p34TnRXTawie65d/1W4vY6Vlz4QCOrCB9FJmO/
 8NERwxqAMftJ1wduyEl4pYhOScGkh1LGL/9SI2T2FDR55JF2ZCXluCLR0O/b7OTAex6bjh1vsdh
 6CzLKgBsZtkGvqfgIE83F4gwHvlYuTbrqe/87eO4U/3C+kTIXmMFSDa1ElIp9dQ+8WjQIo7U5m2
 UsdW3AElPqFM9aYdPwY5sOa/DMEmW1IDrneoy8og8gq98RLrsxSRiPAV1Tb9MBasobgI7odsf9X
 oexgoB7DXknj/5lfqAYzoi/S6EVIt7xiXrpaO59/gZ4YvfieVuRSQwRBLPpZPMA=
X-Received: by 2002:a05:6512:39c7:b0:5b8:eed4:d50 with SMTP id
 2adb3069b0e04-5b8eed40db0mr3841874e87.34.1790668936370; Tue, 29 Sep 2026
 01:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260928152218.94978-1-thbt.cllt@gmail.com>
 <arrbTcuJn4IUQQvT@windsurf>
In-Reply-To: <arrbTcuJn4IUQQvT@windsurf>
From: Thibaut Collet <thbt.cllt@gmail.com>
Date: Tue, 29 Sep 2026 10:02:05 +0200
X-Gm-Features: AclHuK_C_lJqeiMBRF9j1IqcTtSvSSbSd5DTupk2BV9EviK5V4Tu0cB5sSI9dVQ
Message-ID: <CABH27u-M+7Cn0MiQRtaZfv7mSwq3sG_1h-Pd5v7ooNTNgcU-+A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "vjardin@free.fr" <vjardin@free.fr>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/lldpd: fix compilation issue with
 kernel 7.3 on aarch64
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
Content-Type: multipart/mixed; boundary="===============7729645613933292004=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7729645613933292004==
Content-Type: multipart/alternative; boundary="000000000000dcdf07065c9a99c1"

--000000000000dcdf07065c9a99c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas and Vincent,

Thanks for your feedbacks.

Le lun. 28 sept. 2026 =C3=A0 23:27, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Thibault,
>
> On Mon, Sep 28, 2026 at 05:22:18PM +0200, Thibaut Collet wrote:
> > lldpd bundles some uapi linux files for old distributions, especially
> > the types.h one.
> >
> > Since kernel commit d4bf9e08d412 ("arm64: uapi: Use __u128 instead of
> > __uint128_t in UAPI headers"), the type __u128 is used by sigcontext.h.
> > This type is defined in types.h, but the old version bundled by lldpd
> > does not provide it. This lack leads to the following compilation error=
:
> >
> >   In file included from
> ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/sig=
context.h:30,
> >                    from
> ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/signal.h=
:301,
> >                    from
> ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/para=
m.h:28,
> >                    from privsep_io.c:5:
> >
>  ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/asm/sig=
context.h:81:9:
> error: unknown type name '__u128'; did you mean '__u32'?
> >      81 |         __u128 vregs[32];
> >         |         ^~~~~~
> >         |         __u32
> >
> > As Buildroot is not an old distribution and always provides the uapi
> > linux files, the lldpd ones are removed at the post patch step to have
> > a consistent set of uapi include files.
> >
> > Signed-off-by: Thibaut Collet <thbt.cllt@gmail.com>
>
> Thanks for the patch!
>
> However, when you say "Buildroot is not an old distribution and always
> provides the uapi linux files": we do allow building with fairly old
> kernels. So which version of the kernel header does lldpd now requires
> after your change? I'm interested to understand what is the chance of
> this patch breaking some other users that are running old kernels.
>
> Thanks for your feedback!
>

I have done some archeology on lldpd project.
- The linux include has been added to fix outdated kernel header (version
3.6.9) on some distributions, see commit
https://github.com/lldpd/lldpd/commit/2516cfb1d6d474d41cd7effa8d2372fb44939=
649.
The solution is similar as the one of iproute2
- The header files have been moved to version 4.19 later (see commit
https://github.com/lldpd/lldpd/commit/a192a2e91f8109bd56519563a41bb72ce9cf9=
b36
)
- These included files create a compilation issue with FreeBSD14 (see
https://github.com/lldpd/lldpd/pull/503/) and remove (see commt
https://github.com/lldpd/lldpd/commit/4da5d52856e150bbc4c3266780dd73d39dfb1=
898
)
- This removal causes some issue with other distribution (like Debian8) and
some files have been re-added (see commit
https://github.com/lldpd/lldpd/commit/2f2ae98ded0c20b049d385e4fa702365eb444=
ad8
)

So removing the uapi include files of lldpd to use the kernel ones is the
best choice for kernel greater or equal to 4.19 to avoid using outdated
include files regarding the kernel version.
Gating the LLDPD_POST_PATCH_HOOKS with 'ifeq
($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),y)' will do the job.
Do you agree with this solution ?

Regarding Vincent question:

> However, could the lldpd's build framework be updated too with a mean to
avoid such patch ?

As spotted in the commit log of lldpd use the right header files to be
compliant with any kernel version and distribution is an endless loop. For
buildroot rather than relying on modifications inside the lldpd project it
can be simpler and faster to just remove them. NB for iproute2 that also
provides some uapi include files the compilation is OK for kernel 7.3 with
aarch64 as the provided types.h is more recent and __u128 is defined.

Best regards

Thibaut

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000dcdf07065c9a99c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas and Vincent,</div><div><br></div><div>Thank=
s for your feedbacks.</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 28 sept. 2026 =C3=
=A0=C2=A023:27, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Thibault,<br>
<br>
On Mon, Sep 28, 2026 at 05:22:18PM +0200, Thibaut Collet wrote:<br>
&gt; lldpd bundles some uapi linux files for old distributions, especially<=
br>
&gt; the types.h one.<br>
&gt; <br>
&gt; Since kernel commit d4bf9e08d412 (&quot;arm64: uapi: Use __u128 instea=
d of<br>
&gt; __uint128_t in UAPI headers&quot;), the type __u128 is used by sigcont=
ext.h.<br>
&gt; This type is defined in types.h, but the old version bundled by lldpd<=
br>
&gt; does not provide it. This lack leads to the following compilation erro=
r:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0In file included from ../../../../host/aarch64-buildroot-l=
inux-gnu/sysroot/usr/include/bits/sigcontext.h:30,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
rom ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/signal=
.h:301,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
rom ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/pa=
ram.h:28,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
rom privsep_io.c:5:<br>
&gt;=C2=A0 =C2=A0../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/i=
nclude/asm/sigcontext.h:81:9: error: unknown type name &#39;__u128&#39;; di=
d you mean &#39;__u32&#39;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 81 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u128 vregs=
[32];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~=
~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__=
u32<br>
&gt; <br>
&gt; As Buildroot is not an old distribution and always provides the uapi<b=
r>
&gt; linux files, the lldpd ones are removed at the post patch step to have=
<br>
&gt; a consistent set of uapi include files.<br>
&gt; <br>
&gt; Signed-off-by: Thibaut Collet &lt;<a href=3D"mailto:thbt.cllt@gmail.co=
m" target=3D"_blank">thbt.cllt@gmail.com</a>&gt;<br>
<br>
Thanks for the patch!<br>
<br>
However, when you say &quot;Buildroot is not an old distribution and always=
<br>
provides the uapi linux files&quot;: we do allow building with fairly old<b=
r>
kernels. So which version of the kernel header does lldpd now requires<br>
after your change? I&#39;m interested to understand what is the chance of<b=
r>
this patch breaking some other users that are running old kernels.<br>
<br>
Thanks for your feedback!<br></blockquote><div><br></div><div>I have done s=
ome archeology on lldpd project.</div><div>- The linux include has been add=
ed to fix outdated kernel header (version 3.6.9) on some distributions, see=
 commit=C2=A0<a href=3D"https://github.com/lldpd/lldpd/commit/2516cfb1d6d47=
4d41cd7effa8d2372fb44939649">https://github.com/lldpd/lldpd/commit/2516cfb1=
d6d474d41cd7effa8d2372fb44939649</a>. The solution is similar as the one of=
 iproute2</div><div>- The header files have been moved to version 4.19 late=
r (see commit=C2=A0<a href=3D"https://github.com/lldpd/lldpd/commit/a192a2e=
91f8109bd56519563a41bb72ce9cf9b36">https://github.com/lldpd/lldpd/commit/a1=
92a2e91f8109bd56519563a41bb72ce9cf9b36</a>)</div><div>- These included file=
s create a compilation issue with FreeBSD14 (see=C2=A0<a href=3D"https://gi=
thub.com/lldpd/lldpd/pull/503/">https://github.com/lldpd/lldpd/pull/503/</a=
>) and remove (see commt=C2=A0<a href=3D"https://github.com/lldpd/lldpd/com=
mit/4da5d52856e150bbc4c3266780dd73d39dfb1898">https://github.com/lldpd/lldp=
d/commit/4da5d52856e150bbc4c3266780dd73d39dfb1898</a>)</div><div>- This rem=
oval causes some issue with other distribution (like Debian8) and some file=
s have been re-added (see commit=C2=A0<a href=3D"https://github.com/lldpd/l=
ldpd/commit/2f2ae98ded0c20b049d385e4fa702365eb444ad8">https://github.com/ll=
dpd/lldpd/commit/2f2ae98ded0c20b049d385e4fa702365eb444ad8</a>)</div><div><b=
r></div><div>So removing the uapi include files of lldpd to use the kernel =
ones is the best choice for kernel greater or equal to 4.19 to avoid using =
outdated include files regarding the kernel version.</div><div>Gating the=
=C2=A0LLDPD_POST_PATCH_HOOKS with &#39;ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEA=
ST_4_19),y)&#39; will do the job.</div><div>Do you agree with this solution=
 ?</div><div><br></div><div>Regarding Vincent question:</div><div><br></div=
><div>&gt; However, could the lldpd&#39;s build framework be updated too wi=
th a mean to avoid such patch ?</div><div><br></div><div>As spotted in the =
commit log of lldpd use the right header files to be compliant with any ker=
nel version and distribution is an endless loop. For buildroot rather than =
relying on modifications inside the lldpd project it can be simpler and fas=
ter to just remove them. NB for iproute2 that also provides some uapi inclu=
de files the compilation is OK for kernel 7.3 with aarch64 as the provided =
types.h is more recent and __u128 is defined.</div><div><br></div><div>Best=
 regards</div><div><br></div><div>Thibaut</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000dcdf07065c9a99c1--

--===============7729645613933292004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7729645613933292004==--
