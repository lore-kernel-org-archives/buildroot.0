Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F09C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D76C460F42
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D76C460F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A235B403DA;
	Sun, 25 Jul 2021 14:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofrVMMKs0lZM; Sun, 25 Jul 2021 14:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C301403E4;
	Sun, 25 Jul 2021 14:09:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4280C1BF34C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D44833AE
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aol.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpYOSVw3yv4a for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 14:09:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic307-2.consmr.mail.bf2.yahoo.com
 (sonic307-2.consmr.mail.bf2.yahoo.com [74.6.134.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AD0B833A8
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1627222175; bh=cUYQG5DwM6JJHQBLgY+Gvzc9+Kh8eR+c/BsTS5R7Xgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject:Reply-To;
 b=oL39mhsYJyQRx12jGaLr94MHFbn7kfD3QDHP/wyTCcI7QeJxZopjv5ERTeW0ytsnMkZxwFEOrdT3JhMWUIcBJ04DP6MXW8/CZI/ZTlsnYBp67Mw72jLqF1+Q6Uj7Ztnuqa6VpRJnbOegG9T4BiiGWMgkGGWxeMP6KAs+wR6cG9HcW59xQvDRJP8tgEjpbSaYfULO3WBitURw7AGLkp83arj0DpebQIX6ETSZx/maGd6u1UtScq+uFWoU9IWtWIDG6M3gqSfE8pV4wV7vMUCszkLfPbkJQybIrba6Bo6zKnIj+pCsFvRozW5Ousd7+sB666zReeK7hxWpAp6l4DbyHA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627222175; bh=4HkkknAV0lTHPjkSL2j9eUtXBJnPpMor0UaTs2Kwnx4=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=WRaDkOMz8BWbClqDzyAZnuiOgRuz0Z5YK6wHOBniZBhaSUHMEsZ2200oCK5OVAo6zlxnJJjBhXASEbhxFb4nIv7YMdCh83tA6ymjmfKCZltYEnqHpgpYE0ciUj/vI9L9Aa+nyo6tDBbchVnbpkzM1Oz0oL6Adi4/D3pA67VTLgF/opWz77LGfQmXq8A+U90Wpvuo0yY2aHP5DMz3M+pRgRS9tMUayZHwl6pgRZiWPQDgGXqOE9SA/pDxiWCezde6HhvOh+6u/rorcgtSPDM8FpvMkpzSUf3Cari85FawZewr1VWroBxa+EdfuVtzfhxu0SHP0AYbKnTM7fWgy17pEA==
X-YMail-OSG: tjyxFRAVM1l6bA99KFrBlHaf4wqH0f2Pz4PMZx2krZC5hoTbQ_dhbod3bxEgd.x
 gW4.1RsJNE9AsPgzdFAZKS1E2x6ltTeOgH0fObhUgq5sxa0sBrrTUQpGifkj.5x47kqucnL11axY
 tVPGn2Us4YqBvn62IfvWCzCwN2ykHS3pp92UMQ0yA53Lji1GNvzfaxLTkrBsCAi1h9Z0cdgu3kym
 8C1O.FrHXp1jm85UJmYEznNTYDCbwluVR.czm7QG4jwNculjyS0H7KaXLyLoczhVgIU6gOACKGZf
 wONv3lo7P2ufcxAeyGZAtfVlOlD5t2GoKdpNT.rHBWaJsGqpWezBcBIMqkurhRnlIlpZ2t3ksb8y
 wufAzIGOavfsAoWYyQV.p_cFjupAD1UQfF0kw_PQQFnR_y.Scz6U7z5xwN.wndttNe67IeloG82Z
 y8064WSJGinO8KYNRbNSPLIV8XJyvH8qUw4XFYkXv41OF93cfZJFGOJwlNcCuCp9ugoC2cpxhm_M
 BNJv1sJh9lW7FTilijbplkXfK.LZdaf0tEoMnuvp568ONdw51oE0CtQ87OxY4Uu.A21I.CjJDTaD
 geN0tT2nPoZwZzt5jYoZRbK7l3zQb7ikaCRP4BjlDvDqqrHCSCvIKJ_8Kg6s_ZZTx1VmUZoi2wV2
 ex3QlokmBve_7QlC5qa0r611u2E3Zd87mO4NOKsDurKUVsANqmR1WBZEin78RLL4Crys8VL_ofaf
 BajKvuOCfIUiReZRxoROzSPHhRYEjVjhz0wu6bkaexLR6BAc7JR8TiSHyFg9BsjN8Po_u.ibdTrm
 Ea_Qv2OtoTFfptqLMEmlH9C55MJ_pFlaXcw0fEYlKECnH0vopX37VbV9IcOYq_nyeDezjvnsRn96
 1xSMpMukPekTQiJMTtEBiq4xatGdZJOWcO_xaKmVa3520wJw_p0tDjWvrdG.XIcNqTdrsCZcP8hh
 mNaLmcJoagq0fnnmo7RaCzCLA0DltLOpfLh0HvErDeOdH_t7LH6dr9LgcTWBJ2vzdWfv61AVIRaZ
 asSHBnDLJg_Szn89llKJeumZBO6f1GaYHFNiocFUe3UEmsGicypZUzdNLkMGHhxoHvIKYPv1ceDc
 SgNRHpexn5aWJ6D00xnDMAs.E84b5EfqKvj3eo7NnQcZiM_mJqEaqYuc..UdkWqBeMnYrJxKXC.M
 uaHOHYoRHL0Am1Og1Lxu4.GaC.q4gpbrvf9tmVm55Uyw7Ern2PH0oo9RZoPHSLeWi4tspaviwtyU
 IIMzYUUxwRyw0n_QVTIBFlGrK_i8QajkZE8zyDXAaCiG5111UcdqlXCZ__sIYBPjs8BotpkTXRtD
 ik7.3he5_Tt3_OzKn8QVc9MGZanESTDVfYi3.xatEfTHhgLEEKZ5WBxmS2OdR0c2RE2Zp7esdt.z
 zWWtX_I2ilHdGAiFfBToCZuzq4TdAS886r9GaHW5qzeKWL18dciohsOQRQJDh6eFlVD0_v1gLqR1
 p19nHRx.ohWaZmYMYjf_z8WobZlvnmMrDgrBgJSNBS.1KS3z1Jn5VuY8K7FdukmDixnbqe9wO3fV
 IpBdKdqXi08ttWVLkKZheefS8_88mEidve_6dgDx46XdjSfpdDZ2OappI9e0EzGKfXgclnjGHGcz
 g4d_wRr2FVt5..vp.OVVyVXNQzvfr0oaz4iOdrsrOuCwaTyAHvGP232fqihw7Tk1HqZKaE07d1Vu
 olDDbLa525J1jTo4dSVE8UkmmGiPOdu.aSaS8FNhr5XlPKx68A4aOVu9EL2uTg8WET.B_W2gdONA
 SgHss.rLeJij48cZnreOCspI69S5z44sM9lQN1KYdbSHhzFNNcfoun3R7FfA4wzWpEzcSoZ3JKHM
 TDNnHLTnQynvYykhg0Tm62ynO1NTaLNHWqqiZHnFLk9JPDmgCZ4NKSb7ArQvDj4CJpLfWrf3BWvP
 OkSOeGXBmfNLABResiO1xc8YUBhJJIMJ4Td5OUMv2Erq57_mwGg_GoxFONbCuKm4NOUjlr3UmvHE
 TLwv6GeSWjCVWc0BmuGWZvp3BMu_Q_ynV_Sox2GXrTMNZZqKImelRGzU.bNZ7qK2BqT28Iv7DWiW
 H.VUjoE..7nLLrDB3yyVE2nZhrwZ78C8FsxGHMBBVF2nHMTJK_pF8kL2Mkd_BKDtLaJIXwHTDKpO
 u5LrbxQ4QnEnuKbGDxSqvlI2KP0jWvklH6FnRMs7gRLMI_puhyU5PDv_NIcMe0Qb5rjaVC1K133T
 E3lqemaq0pLic5NmFchDV_pv1p99hLFK8IR9It0FqUEIP52TtnRDG.HxVgvblfA0hv7XGt.7Yr_X
 S3uSQHjMS45x5YPubwIvkueYCLDpBKW48WIZRuYM3vuPqSbrgpxiK1VHNeMn43IMWaJxMfT3MygO
 xp7q6owGPQWxr7WKL8L1W2hnsjM2kV0lzpwRKYUZqTcS5j6F.t4zfm2ibr1lkk1D1FbCE2LbCuZa
 m7Sv9X.dBX61S7WykkJux_YEO3KAim0u8aOzUlnPbgi13iS117XHpRRu9NQqex7n7T46acRIFihp
 aSnuaA_nA
X-Sonic-MF: <hsiangkao@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.bf2.yahoo.com with HTTP; Sun, 25 Jul 2021 14:09:35 +0000
Received: by kubenode511.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 3ca134d43914bad0913a912b0f9f7016; 
 Sun, 25 Jul 2021 13:49:24 +0000 (UTC)
Date: Sun, 25 Jul 2021 21:48:48 +0800
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210725134843.GA2167@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20210714145528.25255-1-hsiangkao.ref@aol.com>
 <20210714145528.25255-1-hsiangkao@aol.com>
 <20210719203517.GB1464219@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719203517.GB1464219@scaer>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.18736
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Subject: Re: [Buildroot] [PATCH] fs/erofs: add big pcluster support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Gao Xiang via buildroot <buildroot@busybox.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Yann,

On Mon, Jul 19, 2021 at 10:35:17PM +0200, Yann E. MORIN wrote:
> Gao, All,
> 
> On 2021-07-14 22:55 +0800, Gao Xiang via buildroot spake thusly:
> > This enables EROFS big pcluster images for buildroot.
> > 
> > Signed-off-by: Gao Xiang <hsiangkao@aol.com>
> > ---
> >  fs/erofs/Config.in | 10 ++++++++++
> >  fs/erofs/erofs.mk  |  4 ++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
> > index d7360edeabfd..7619037c4775 100644
> > --- a/fs/erofs/Config.in
> > +++ b/fs/erofs/Config.in
> > @@ -11,4 +11,14 @@ config BR2_TARGET_ROOTFS_EROFS_LZ4HC
> >  	help
> >  	  Use lz4 high-compression to compress data in the filesystem.
> >  
> > +config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
> > +	int "pcluster size"
> > +	default 0
> > +	help
> > +	  Specify the maximum size of physical cluster in bytes for
> > +	  the big pcluster feature in order to get much better
> > +	  compression ratios (thus better sequential read performance
> > +	  for common storage devices), which has been introduced since
> > +	  Linux 5.13.
> 
> I was wondering if we had to constrain that variable somehow, so I
> looked at the code.
> 
> As far as I understand, this must be a multiple of EROFS_BLKSIZ:
> 
>   297         case 'C':
>   298             i = strtoull(optarg, &endptr, 0);
>   299             if (*endptr != '\0' ||
>   300                 i < EROFS_BLKSIZ || i % EROFS_BLKSIZ) {
>   301                 erofs_err("invalid physical clustersize %s",
> 
> EROFS_BLKSIZ is defined as (1U << LOG_BLOCK_SIZE)
> 
> LOG_BLOCK_SIZE is defined as (12).
> 
> So BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE must be a multiple of 4KiB.
> 
> Which happens to look awfully like PAGE_SIZE on most architectures.
> 
> And bingo, there is this:
> 
>    34 /* no obvious reason to support explicit PAGE_SIZE != 4096 for now */
>    35 #if PAGE_SIZE != 4096
>    36 #error incompatible PAGE_SIZE is already defined
>    37 #endif
> 
> OK, so guess what? Here are a few good reasons to support page size !=
> 4096 ;-)
> 
> In Buildroot@least, I knew of:
> 
>     BR2_ARC_PAGE_SIZE_8K
>     BR2_ARC_PAGE_SIZE_16K
> 
> And if one goes to the kernel tree:
> 
>     config ARM64_PAGE_SHIFT
>         int
>         default 16 if ARM64_64K_PAGES
>         default 14 if ARM64_16K_PAGES
>         default 12
> 
> mips has even more page sizes available:
> 
>     arch/mips/include/asm/page.h:#define PAGE_SHIFT 12
>     arch/mips/include/asm/page.h:#define PAGE_SHIFT 13
>     arch/mips/include/asm/page.h:#define PAGE_SHIFT 14
>     arch/mips/include/asm/page.h:#define PAGE_SHIFT 15
>     arch/mips/include/asm/page.h:#define PAGE_SHIFT 16
> 
> And so on... ;-)
> 
> However, except for ARC, we do not have other page-size settings in
> Buildroot (ARC is special); for all other achs, we do not have the info,
> and if it exists, it is confined to the kernel configuration.
> 
> So, for Buildroot, we have one (really, two) cases where erofs would not
> be usable: non-4K ARC settings.
> 
> And thus I was wondering is we should exclude erofs from the selection
> in that case:
> 
>     config BR2_TARGET_ROOTFS_EROFS
>         depends on !BR2_arc || BR2_ARC_PAGE_SIZE_4K
> 
> However, this is not related to this patch, as the situation is already
> broken in such a case already...

Sorry for late reply since I don't check this email address frequently.

Currently, EROFS_BLKSIZ is same to PAGE_SIZE much due to best overall
performance concern, but it's only heavily tested with 4KiB PAGE_SIZE.

Laterly, we will support non-4KiB blocksize for uncompressed cases at
least (or at least erofsfuse implementation). But that is not quite a
high priority stuff for now.

Thanks,
Gao Xiang

> 
> So: applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
> >  endif # BR2_TARGET_ROOTFS_EROFS
> > diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
> > index 58559d483340..0e9d4401a939 100644
> > --- a/fs/erofs/erofs.mk
> > +++ b/fs/erofs/erofs.mk
> > @@ -10,6 +10,10 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
> >  ROOTFS_EROFS_ARGS += -zlz4hc
> >  endif
> >  
> > +ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
> > +ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
> > +endif
> > +
> >  define ROOTFS_EROFS_CMD
> >  	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
> >  endef
> > -- 
> > 2.20.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
