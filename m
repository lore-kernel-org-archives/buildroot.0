Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B55BCA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E36440359;
	Mon, 28 Sep 2026 21:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVVwS1YXxJWP; Mon, 28 Sep 2026 21:27:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 004BA40367
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630848;
	b=Gcb4/4OpiaQEKXryzf4IPxqAkWFFmyOnwhgCOPcZSqwJ7NO5wrKwD8UOoJAO27Q98ZkA
	 M1LbB4/rT/K0wrWFdme7AbwssQUgLWiPVbNFJYMDbKFitvtfefZF3pcd9qjd9T1v42t1n
	 RYNjfPznRWZTyv8LtFfJ6Vq28+ZAJ70KrNaa37HSn58VgB5+SZNiiQMZv+JucwVVJ2IMw
	 VWjLWFNDOTy5EYtWBJzR8F5USUxcFjNJ8Bpe7Gl3oGcnrTYopGCXMaYNjUr6wVZeV2GJ+
	 S7Wxg4dQP54RuAaeUl5tgd+N/E9i4jKTxkgDY0nIi+jWfhHgWgSde2jeDi9cAKjbSQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BrdnzNYTCmZMfnQdLyO82izPx+1w1pXwjcxWUnS5jWw=;
	b=QRKyenIuOQ7/8WFeamOy42p4CpLNKj/8MbI/qzn2piElAAOjpmymQHpp6s8MxW+V1XAk
	 FZb71trznbMWMZz7+8V/1TmsJ72WPD9T5TIqjuSRtC7b5CrWGktXZhXVIe6dygw+IZqjw
	 mXsu1s837nuC84rGKcp5JPBH3E3yI9jNgCvLhMxHvqZ1i/xJrRqaBNWmzfW1OmgAyBwnD
	 WvzkOxUSXSA9eQhezbAQrKyWTVwoGohU0LmkBS9tsWlif+LW3SbZr2Ni9vWNT9iPFl59f
	 ZddO4WGuGXki/Bo9iECDiJ2bNPqbMgIEJ/On/j6X9aWlQMA3S6OKBwUJQnimFN/eTdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630848;
	bh=BrdnzNYTCmZMfnQdLyO82izPx+1w1pXwjcxWUnS5jWw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fi+578cludGQwyLaQZ+8w8xKioZGdvnFR5ObeW6vri6Vg7v/MTFzDItDuDw15v8R5
	 ft9GqirYp8sB8o+Tg2oQlH8h7L3+9cYJrR+KCZj4CkBgidlG2ZLBv8nr5pbjNgDuub
	 T4+ynKls30Qtz6NIFV1iVLCCVW5Y5caHHHQJunLWc1B3z0FAtk0zT21KcHbwVV3Fxs
	 PVf28fXtc2ppkj1ls2Tc0fc51o/oEUjSUv+zSNnD3+k2Yp3FGmFD2NI3JvTTGiH2kv
	 T+BPoOAB5Hfn9/OuSMkBkTfmzGmyaXM4ZQVnzoSnSrKhInvLNJUmaEYsl9Z7K8bior
	 BW64hVqOXt4Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004BA40367;
	Mon, 28 Sep 2026 21:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E05A72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1450605D1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjpZePHVzwoE for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:27:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9D58605C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630845;
 b=Ovog/ikhrKOYNVRh3bQwXLEo0I+F2CGGV9nBdO5WNq2e6VFIsIifDj+Irz/TvHaF7ECc
 9np+QHVuS8SBk5Kpd2cbcaGEW5cx5I5EgWUJtEPVva8riGgxhBTWcS5t/++z1CGieQjQl
 sUVvsJJSl5/eXfOd1Azzlr9fHiWSRgI0vasSisfdsmo+6ZzVeeCsu3Rb+MsqkIQbw38OW
 GoSmo7gcqJexJ2JuiC0Wb3vJwtcN8JofS0eZbxhLOsYiOEBHZ69NCuuL7qiExZCkluYW9
 j2rjjPD1q6WvepQh5HbZyTCGjrSidrle2yTG7h09cZwoE8h6VjCR1LUVWxzc0rcFdjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630845;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xnCPyJ6Uk0jI7eOpPuNbr0HzqvLVhDJObqgBMkbCTPI=;
 b=SRyNxRQZhcWO/SdyfthRFCS0ssif/M/CkPvoa+buXuDe6+/scyddRRcqr99ojzyvanws
 sfGYIyhLmWgTEb8zZK6dndw+43vSt6e5VjA3OWb5hoYQc6DYjlJIAJYQgrRpn4bxIZ7cN
 38SxkmWyCIw29fJ4VLgjZJY9rdjeu+FznSTjACkKreXey7eKBrWVFM+FCKr3aGAcPnXWG
 7Gm+4dz9b3ryU4dXydWvz1wni/+ZvKD0f2WXvMo+Ab4Z0u2dE12E+o31TYpgLcQA8yBqm
 +4LYoT3e6yklVylxGJNnn5C6LaMY9VmKlLIPMdeMXv27e2QvS1mkQ9O8qIsV3eyV7Hw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="bdNyDU6/"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9D58605C9
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:27:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D9EF94E410A4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:27:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D1CF601BD;
 Mon, 28 Sep 2026 21:27:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BE861032951E; 
 Mon, 28 Sep 2026 23:27:15 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:27:15 +0200
To: Thibaut Collet <thbt.cllt@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <arrbTcuJn4IUQQvT@windsurf>
References: <20260928152218.94978-1-thbt.cllt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928152218.94978-1-thbt.cllt@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thibault,

On Mon, Sep 28, 2026 at 05:22:18PM +0200, Thibaut Collet wrote:
> lldpd bundles some uapi linux files for old distributions, especially
> the types.h one.
> 
> Since kernel commit d4bf9e08d412 ("arm64: uapi: Use __u128 instead of
> __uint128_t in UAPI headers"), the type __u128 is used by sigcontext.h.
> This type is defined in types.h, but the old version bundled by lldpd
> does not provide it. This lack leads to the following compilation error:
> 
>   In file included from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/sigcontext.h:30,
>                    from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/signal.h:301,
>                    from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
>                    from privsep_io.c:5:
>   ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
>      81 |         __u128 vregs[32];
>         |         ^~~~~~
>         |         __u32
> 
> As Buildroot is not an old distribution and always provides the uapi
> linux files, the lldpd ones are removed at the post patch step to have
> a consistent set of uapi include files.
> 
> Signed-off-by: Thibaut Collet <thbt.cllt@gmail.com>

Thanks for the patch!

However, when you say "Buildroot is not an old distribution and always
provides the uapi linux files": we do allow building with fairly old
kernels. So which version of the kernel header does lldpd now requires
after your change? I'm interested to understand what is the chance of
this patch breaking some other users that are running old kernels.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
