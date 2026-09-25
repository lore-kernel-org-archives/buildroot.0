Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A563C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180C260D9C;
	Fri, 25 Sep 2026 14:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_6OIoEBxoPy; Fri, 25 Sep 2026 14:44:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 03FC860DA6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347461;
	b=a5eUuBfkihQ2vs6Wt/9UdvSYg2+cS3+6VraLLOKbvG5tZyZguosaZi3YnSnKZRFb9O7o
	 5SXgMyq1y4hnbCbZaqfzO3zR6aM3DDtfrQN63Xjq13PMJmJPj7HXo1iHzc9aS4egLl1OY
	 njW8beHI0z9JVT+voPrWNqiNrx0Y0dFGNuNLqZDWBCteSwlKi5Xt9nqmjKK4fyiNLuJ0T
	 XcUcz56pzVxSowz2z628ryrnwHIK/6XM2atBLevO/86L/N0Nf1mSyDlJyeTFsGfZIJJgO
	 bk6vWfAYAzdwaL62wmBpOk824dPGjyLY0oKaY/5mESrFmXzDEKMEuEofM877GcPDXag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wXBCIF3et0wHaAcyglKf6hLsxFkAaEkpoVlNJ6k1Abs=;
	b=mwnALDpa93QNrMRvyyrOMz9U0RVV6yaMEuPeG/WVM96layNLrkw/hh5IT5bJi5ZX/qLW
	 B6DVs6H7ob5eHcYoZN8WN8ynVhh5oews3etfU9+ciodCU7aydc3ehS8EOnpBTQbK6Hi7q
	 nG445R2ejbbaRmjKYZcu3iFLmri/xQXYbZM3sAEU5jV+XYWt/QeE4ojMLiAGvu7hgylkI
	 C+dnXpL5BsElMnpPnVGzpb3jmmbcVcS6YueSu3RY885Vr9A6qRx9pygwJeK7lh8aI/c1o
	 6ade09Cn4I7A0MkfIf8/o+jbTwHQ/WmwU9+jzepSZ/Sj2gemTvILWugHkSmPzKdQg2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347461;
	bh=wXBCIF3et0wHaAcyglKf6hLsxFkAaEkpoVlNJ6k1Abs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LYi7BqHIkUzwAyjqJ4MXUT0nRqZuaPXnqA4P2ZnwWQhqb0CZxgT4VCl39cAp+et1f
	 OH2zNk0RZNkuiinSyYRU/pLBjvJCGi8m4Lz4unkbGDoQcNIIcrss1miy58K8E6sxNk
	 Ao+iiFnn49VUdkPRy5/QCm8W3hmx+3YTahFffHSeR+W4bK475RwuzRHsUJLYZS3hvU
	 H2vAa65JvaiLOukueRnX3h0KES4MHJDPS7tFPSmWQ97LQ2Cs+TwuYOXaFzne62i2jJ
	 XROrYeJ4V0PGM3Pg5g84Lw2uvV4nmkU7SimhL/PaNPxKo+YcyJS1pY19Oun86quxyx
	 CBV8szKbP4SHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03FC860DA6;
	Fri, 25 Sep 2026 14:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63D97332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D79340475
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eKnj-_oNCD0 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 032E34016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347455;
 b=c36WBaQ2bknywPBLXbLYMqvDON8fR5vTPyVvEvUW26yZBABP+kdIipiK76O73/W6f1NN
 ELjYr01uXFIzGoKddSvwkswXDY9DpYsDQlklaFgiXULyMukKePTBSefSag3HQ6tld94J3
 eRJvCpKBhl6y++KLeJPXU6UjubWp1odtc7o6Xs0PKQ/OdhihAiJ4elk5ogx4H9g6hTABo
 yS8vG4RHZjodVTLOyb1vInP3dgLk9nTM1aao0FHxiFDy8nfbW6YvUpA+RD3T6K6tL7PyJ
 r7f1fqvu9fYTxk9TJ5ot9MDJm2m6L6QB+wzVUvkPNVERprba5MYhJP4zHQs84cZnTIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347455;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3LyQWj2nOGLaAkGessz5DHtxGrn0BpHilLJEf4E9H1E=;
 b=bqzYIfHnUJ8TwvThXHLZxaMXV/Ia80KQv6DDIkNCQTnDNm1gbMGmrskQWjOthImeeNy0
 Zsz9BRPz7gEjt5YyVyGndgYMgyrseGveKBWR7flPX5GB5MxcoXqlVgUJQNubraecud8Yc
 6d7gyvzmJNC+k4rewueEqWY89TAFgJksUW+qhGv1YvzIQmOQdvIkVdISGaGqoNP94BsV2
 J47FEBJpUAVsccNUzPvDmg49SYd4vIFbyp5bZz1j+LDp1+XQRJypoaT97YCDpTzE2S0Oo
 7CjOouU15CuLaEAmv1CdRhA0lD5y0ELO+pFvIwGml/nStv+sjr13Nryp0yN3/o4EClg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IJZVmZwn; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 032E34016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:14 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so5029855e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347453; x=1790952253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3LyQWj2nOGLaAkGessz5DHtxGrn0BpHilLJEf4E9H1E=;
 b=E0oa24tR4qAd3IKMoIploDUkPQ5TJyzQ7EmzTpg1c3sAwJeSRQCYGGJ1Ul1TrCNImo
 FegsHKAgixD51QroAbCswVTcBc07Gd+mqfsEzQnr0UGJHx5H+E+uvqE1Iju6ZlS6DWyk
 gY60mD0wyPeqEmeUZWwTO5jEUtnsIRTVSegCZWgdeF1uixG2DVSk4icGP8MdTwtJ8v2x
 p2f75ZxZ6Q/v76By8oeavmVN+955zY7SsWKMej00ZgRHAJfQu42tE/nSm6PWxfce6old
 M8pCjlmLfSzbazRVBDGIRwahm7tjVF2ZhXdLRby31ee2HXazKwLnqcwr2+GKBdxq+FdG
 v+mw==
X-Gm-Message-State: AFuF++kWeb/E7+UEpz3cgjZKU8Sr1pyEiA/Xo+qS42eFzoeTIRQSyX8Q
 p4bdyiwmMUb6SYN7mHzxOrv9IqhQQtjnl2cJpHuRQRDmI+xDVBIaCWyXIWzvtWfhzggUS6tK/pM
 Yy+22AzG6xw==
X-Gm-Gg: AYBFou2V05vCL3EB2HCgb43AfSkIAz0QfecG6ayrcc5SZOwIy8A3HehBibbDuG09/pP
 XcBy8uVozKY19XH0s++vqjuKoUxTAY/QQX3+IBTDIuaSXfRFAbUkVyDtIfZ38vsq4xyUttQywiR
 MfkqYhlMiRbFvrzbBXXe2LQRbLSN7RhwzLssSQfs4eA+fAgqeqWGc+ENlFx01bxumphB/YQW7Yt
 2WD5l8IEQbULXcHKck55lhWizpxe4uQQaak9hg0UXQ21WxY5f2W1odBzygHgXzaz9okqyDGfhe6
 MV2iVdSMUP9yJu1usCJs0nODL02CwC8SznzC+/thantpy8rXNPuESpKpscwpfSAgWQmsYXdtNjk
 aEkoUVrxTRF+IiYmza/cNQMEFKrS9QcA8qgwlQUY4fVFUUya3irgSk16uJXvQlsQsDGGcNE6rYW
 jXCQswz0hfeRV3zEvx2gJhZcynkPyssXfgbSp5gXDi/pvYZDrC3DyE+hR89ke6L0rWiPHV8FtHm
 /ugjBkl6A+qXyEgG798eWEN0CWx+cjvF0syYXm8TQ==
X-Received: by 2002:a05:600c:8b74:b0:49c:fc6e:a3d7 with SMTP id
 5b1f17b1804b1-49fe66e87damr99866925e9.22.1790347452680; 
 Fri, 25 Sep 2026 07:44:12 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff06b6108sm77592205e9.8.2026.09.25.07.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:12 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:09 +0200
Message-ID: <20260925144411.4095787-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908191348.1892945-3-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/libest: bump version to
 r3.2.0-9-ga464ba8a6
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The only commit in this bump
> https://github.com/cisco/libest/commits/main/
> is patch 0005 which was removed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commit/bdbdbd0557ae43c5cc6f186ee93a01eb7610c1b5
> 
>  ....h-add-missing-extern-on-e_ctx_ssl_e.patch | 42 -------------------
>  package/libest/libest.hash                    |  2 +-
>  package/libest/libest.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 44 deletions(-)
>  delete mode 100644 package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
> 
> diff --git a/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
> deleted file mode 100644
> index ba0ecb4a86..0000000000
> --- a/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 32fe99fa403d2f51931615745a64f8aede1ca46f Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Sat, 8 Jan 2022 13:38:17 +0100
> -Subject: [PATCH] src/est/est_locl.h: add missing extern on
> - e_ctx_ssl_exdata_index
> -
> -Without this extern, the variable gets re-declared in each compilation
> -unit including est_locl.h, causing gcc >= 10 to complain with:
> -
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client.o:(.data+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server.o:(.bss+0xc): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server_http.o:(.bss+0x3b8): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_proxy.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client_http.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_ossl_util.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client_proxy.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_enhcd_cert_auth.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server_coap.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
> -collect2: error: ld returned 1 exit status
> -
> -Upstream: https://github.com/cisco/libest/pull/107
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - src/est/est_locl.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/est/est_locl.h b/src/est/est_locl.h
> -index 62dcbea..b16f62d 100644
> ---- a/src/est/est_locl.h
> -+++ b/src/est/est_locl.h
> -@@ -590,7 +590,7 @@ typedef struct est_oid_list {
> - /*
> -  * Index used to link the EST Ctx into the SSL structures
> -  */
> --int e_ctx_ssl_exdata_index;
> -+extern int e_ctx_ssl_exdata_index;
> - 
> - LIBEST_TEST_API void est_log (EST_LOG_LEVEL lvl, char *format, ...);
> - LIBEST_TEST_API void est_log_backtrace (void);
> --- 
> -2.33.1
> -
> diff --git a/package/libest/libest.hash b/package/libest/libest.hash
> index dc9bc05255..2c2804a76f 100644
> --- a/package/libest/libest.hash
> +++ b/package/libest/libest.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  83983ac05137fd73586ddcb4874e30689fe694ee9a329797b60b3defc9a87327  libest-f8a6e5b53a5f70e72fe4029981df0693b17cbb32.tar.gz
> +sha256  2e5c46610f6a3c12c1916c8a84de77421a88c9722e776e862a716f4a48220f2a  libest-r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006.tar.gz
>  sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
> diff --git a/package/libest/libest.mk b/package/libest/libest.mk
> index 9f3168767d..5f93b2ab32 100644
> --- a/package/libest/libest.mk
> +++ b/package/libest/libest.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
> +LIBEST_VERSION = r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006
>  LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
>  # We don't build examples, so we're not affected by the OpenSSL
>  # license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
