Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4528CA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C464160642;
	Sun, 11 Oct 2026 21:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CIEs2o3_3GV; Sun, 11 Oct 2026 21:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4A8C860601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752889;
	b=tIyETqAcvs/0ASpUlVruCGsyFFGoHIHwGvIU5Hc+AVA5G2xKrim/hRmetfBCMmOoevzj
	 mlvhLDvckCsR30zowL/XhvPlLT6F40AM6cWxt1ToftPW86PaWHDWWUSbZHY8oWM/XjZLN
	 YeqQnNdG7OZ/t9YpD75x57E5iRj88ChCEQB2iPypRkqzimjUTE/28/lD0tyQ7unXhWKn4
	 D5+XX++1wqPnYKY2XtnPsq/xSmZDeWkSB7CYFpbHe8tldN5VDgsK3mHYxWdRxcyxb+fvS
	 EHDsUepWDcQnOPQPpUdAnN0AK8N3Yo9DkhrSo6T0yzLra44RqU43GeWzudHpCaTiO7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752889;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:Message-Id:Date:MIME-Version:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=SgUrRTin3FvLMnZuJJlcFQxXeX0lBdgwK4gad/P7u78=;
	b=sVT5eJwuwYCvbm3fmp5Sjsk39E5H3zRpbErHRhXot14HcTFSf501zpFUD2/k7PS0vjpt
	 Nhl96D6IF5JqfUJTTGP9hrrYb+2s2rtgl+JAXmS88UK35T7aB6E0Mt7CA+h+3k3FZD253
	 Hl4xx3CsfGAAiO14KoOEE7dhBGPc+2dJldutRS9QcOAHrfl1H8nwDzd0mFf0lll0APqWR
	 sCuyrPeoFkHdtSr2qLbInHZCiL1SrXnG1z3RJqJus9u69JbV2vHwCaF4t/pN8THwr4fA/
	 vGq5PlOka6tR7rv/d9WhKCaFMCDALExRDlpxF2gwG2EuBmZHiUTnsH/WliC5ed1kWnw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752889;
	bh=SgUrRTin3FvLMnZuJJlcFQxXeX0lBdgwK4gad/P7u78=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qeOb6fNNHoGnUachw1701EEvPEUq09fvvsKdzFhRlHa30hfGMuebg8e8NzdKuisYr
	 2WzKTfohw7E+0bGic2lia+Vl9eTtNTcNCaLPhFeR2JivER0hOu7DYrSyCQrBP5KDVg
	 bTL17CvviU4KKyDgd4sxUbflkPX/DsH74l9bTt7zacKmGt4/eH5l+DvbCe/TewFI7f
	 Bcq3QJR5zKRY+GkwO+1rcT7oIjhD0wOuuhSGgFhs+IsnNTKIWvDljRDCI018PKgIJN
	 bZwWcaAeELsEwjucsEjWUJ+CeI/eYwnK6REesycktv07kg1CbvQBvL+RdZ8ndmHUn6
	 nCh43ZawCcP9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A8C860601;
	Sun, 11 Oct 2026 21:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 906E9380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75EFC60601
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0QopCa5baQr for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96EE3605A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752887;
 b=TwUvPBi/5r2J4EBvlSBS/WTqxS03fdfnsD9b946iKWtAtvbFIegx+fg0cJZt0cuz6Bwn
 6gf0L0akyeCOZ6QMjxpfzcTp9XpK5jZqIrsKoNpJS+/PQrBGWKzETKFSpwW2S/p4mBEaM
 FGf0QUupu3DSNKXH66ma9VliWSOv9V+xg/Oey0NPnmLDPdCZ5KOF88C+oChpTTvHR7zqu
 ekh/V9IwDDpyJwHOlZ/kVkeXRNQSUVIualknJdoOwqOsw7i2Ao0vpnvV7Qj/TD14ZzDOz
 bzI57Whs10/qxoH5Bwu8fQXyAQvoE07q4omRXoRmMtcJCehhaSc/hP3aX3vj8TpC7Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752887;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Mailer:X-Last-TLS-Session-Version;
 bh=lkAh0K4VORhWKnzwSVnsEap71wsW4EHAag74xB38r0E=;
 b=M6KHFhMHynpC71Z+rRe7MEhTL2F8LXg+2VivEWntwcLCxtbq4fL1if2Jing67DD76bcY
 +qc/1oTaYtpDuKNU2T5mUlyqg5k58T3MEciaOI6mhIeR9Gw1Bxvp78lmFgflETFO/Z7zH
 WNUi385TW6KQB/BSNuXoZqrGwvLCdqjA4PeuzzXihKhsKnfQ1BWISmEiqug5DTq1lN7GM
 w/DMzHuidE9IJ+vZBs3v8Id8OaN6F+BD+hQ3jbiSL3k0vvoOtDXrmGpxt1ju4qI4N2rmM
 PsOlnm80NI/MWHaOYdkwLhPxpnilxfjLFGZiDiaJXRZXJ/HbJ2/zxT7ykh98wcPzhvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=dPJbL3lq; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96EE3605A7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:08:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21E18B978F6F; Sun, 11 Oct 2026 23:08:03 +0200 (CEST)
To: buildroot@buildroot.org, Thibaut Collet <thbt.cllt@gmail.com>
Cc: thomas.petazzoni@bootlin.com, vjardin@free.fr
In-Reply-To: <20260930072441.174807-1-thbt.cllt@gmail.com>
References: <20260930072441.174807-1-thbt.cllt@gmail.com>
Message-Id: <179175288258.261540.8534585939339497534.b4-ty@b4>
Date: Sun, 11 Oct 2026 23:08:02 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/lldpd: fix compilation issue
 with kernel 7.3 on aarch64
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

On Wed, 30 Sep 2026 09:24:41 +0200, Thibaut Collet wrote:
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
> The uapi linux files bundled by lldpd are the ones of kernel 4.19
> (https://github.com/lldpd/lldpd/commit/a192a2e91f81), and they are
> prepended to the include path, so they shadow the sysroot ones.
>
> Remove them so that lldpd uses the uapi files of the sysroot, but only
> when the toolchain provides kernel headers 4.19 or later. With older
> headers the bundled files are kept, so those configurations are left
> unchanged.
>
> Signed-off-by: Thibaut Collet <thbt.cllt@gmail.com>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>
> Changes v1 -> v2:
>   - Only remove the bundled headers for kernel headers >= 4.19
>
>  package/lldpd/lldpd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> index f0cbc7e436..9ecf622b22 100644
> --- a/package/lldpd/lldpd.mk
> +++ b/package/lldpd/lldpd.mk
> @@ -61,6 +61,13 @@ else
>  LLDPD_CONF_OPTS += --without-readline
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),y)
> +define LLDPD_DROP_UAPI_FILES
> +	rm -rf $(@D)/include/linux
> +endef
> +LLDPD_POST_PATCH_HOOKS += LLDPD_DROP_UAPI_FILES
> +endif
> +
>  define LLDPD_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/lldpd/S60lldpd \
>  		$(TARGET_DIR)/etc/init.d/S60lldpd
> -- 
> 2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
