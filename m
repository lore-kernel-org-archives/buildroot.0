Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA48CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9911B40990;
	Sat, 10 Oct 2026 09:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ol7ZdYNfE8Nv; Sat, 10 Oct 2026 09:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8ED7840964
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624164;
	b=byEGjo34OzHwuZ5wl3xefd6AQPcam/mwjdTJhKdbeB8Bd3LC3Eb1+XEwVFbKuBN1fQNh
	 YbaDVkZJ6SmziZU+7qZFbTGqkSZhq7SLUeD7GSkVpkQ6qbUK+JD0JW+zJj6iE6Q76ex0n
	 Psm61hejQViljNw+95zzdkgk6mCOZgcrOSKT6lo/yJL9vVZ9pwBoFLAYnAfkuUKeQyHCQ
	 Dy1rv7GGlsGRyEmDBjSE5Ybxuk0EvaBkdPEOr6yWU8kkWPrcrP6F6wWsW4ZLFFrRib/0T
	 nfNSxH/ilnEGkBxs0Ohth8NTIWZXWY50teAWhtjgzhK1CSZMGlp/XSGG3pjvtw3haDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5l2FV9FxyJGc6aC8VQF9uAgYVSfjQAn7Sj4X+C4btSw=;
	b=m8TvL04rm+HqdAoQfWw+Tl5LEQ332Rqr6iT7iOZcnJ2Lhoie8BuVEeJJ6Q652F3PxMo4
	 5IWpypqrQ4gicD/RXZtvelLUz3l/Nk5pfMi6953qFhZ7gIpAuMLX8T/5YEMULvOaXicaK
	 FuftGi2jXcc6Ts0qOTyft7x7C24GBlOnQSQCYHiD4J1y66LJI/CX/58B8QcPo4x+yG5bY
	 Iy2uibzLTZMgypCURVBE4LH7Upr5CHtrZG52l8UyIJ/m5FqnAwpQXmCzJZkrw/mEOARJ2
	 a0J7whOqHWmnGZmHjmGtMeCxHb3SX6wlOSfCDoM8qb3eFcoen7BtSDDQ2qagn7YRifw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624164;
	bh=5l2FV9FxyJGc6aC8VQF9uAgYVSfjQAn7Sj4X+C4btSw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y8b+9K9zQMNp0Uaa6ZBxnnM2++btkGJz059r+FS/4FrbejJUG6gQbbzptt0UKgLgH
	 u6rZO2Bnl2Fklev2DjLyXMOxd51PImbRBB4CbyH+pt26pSE5vXkmqYAi9TQWAco1w0
	 kuEr1OAk5kPMErGjHLGXOklZxu2LoQx9pHeHx9esIG0gzALWkyKaw5MrJgvhO3dWlL
	 JBRKL2Q9W94iyJ9ZBYihk1MAFPGDrcFJDMlZiUfsKJWypiOPE6xeny4s2rMfx9mOuT
	 vtos5uqbBY2zEjSwdGJ7qnk/nkYL86fcSY3cWOnac3bIziwzKoD1mlwPBiKG0Q3rYE
	 uvdxUVCGPqPPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED7840964;
	Sat, 10 Oct 2026 09:22:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F00356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E76C60A9F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGE_uc0nZS1a for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 448D860A89
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624157;
 b=A1ec47RRrcQhEe/7Ex1DTkmoZ6sIj6YZVsexuU/9v6Kl1YQkk4a8CPlrp3nDXy1Hk/jL
 tiESaG6RJugWCSlEriTaJdRIfgdfrqmSCM9lQCv2QB/CuUv5b3GBQbgisLWKuAP4p8fFl
 3WjuxCoFtKeyNwRZG0l/YaLpMktuFDng/vbtGwfM+r6/0f+AQ3J3fgPg8yxvACTKPx75E
 q82ZW55+AVYFTdDanUZhM+xlBidl5LcXRfxTIkYF2ExDCL0bj+7SXZnWRiwoM2zmHiivd
 BwnWYaQRfVjqmpHx9bqZSaWfql2jVCpM6D7HueCsYfC35/JNpHrKnv66kvaJ79dlgog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624157;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=45657HY3khOoDDFOyJ+2pXGtLRHqqYdW32coqJYlmO4=;
 b=maZIgziFk7dTrABvWV56Jd31NpSaz8F88VQ6FDsJPIuaPk5TatO4EWEG5U3XBLRtwnXJ
 /MlT1J2kdP2209bt8JovVsTknk/dUTaRfJmC+x/zBYAQt5cHRrG34XSMJE5T7DbT32wdc
 ocAqr8VZ0ycfJ4DroXnrGBNMeGZz2eiTYKj0i7kDFBGv+C6BN9mIcWgdz+SGpFrScnMIk
 MHNoMqIVw8kGx8n8Z3Kqql75p8BDKQMihcX4XM98V6lFofRnYAw+NBGeI1Pd+XJowNKSZ
 Vp8MdrGPrL17GXMuDDcu0jiaL0YuAE6kYC8mPDLKAaTys9+A3BkKN5DMEXNcnFKz+KQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IIzmrZNI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 448D860A89
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so3908075e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624155; x=1792228955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=45657HY3khOoDDFOyJ+2pXGtLRHqqYdW32coqJYlmO4=;
 b=ZceXHmtxEemFQ4FbRQ48eOmF1d0gqs6drLHw03AtbiXPIXeiyMQJJ37NI6aUI9OjWg
 cFqMRNJvLLO+Fw3VOG0Cz/7/d9L0WeRwu+jilLA1y6R0C7uMjoZlXgEggUi5FfnoZfvD
 nDCwKM9FeoShmRjk9UERRFOk32hDBbQSWGjzvGxM/29P4tVkpO18g2lAQoNQ0tkTAMLh
 gvMgYNndiwphnA/XW5EhZlr2CXjB7GvJQMpMSdCJnYdAdOEWWb9XsMyNYLBmPvh7Sb5v
 3CHMSPtyDX9DSvLsg0ViU4hhdXn7Xw3p3DMzk7IZi+V11cNyasZqUkhQKNICIWzeojnB
 oXwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByfk6pqGnQwHDra2V9KWc15ZdqKkng1j12uFbO0CNlLF3wY+WiP7zKAofZzrpvm70i/7ADgsZmDY3g=@buildroot.org
X-Gm-Message-State: AFq9FYJsIeGD/SZ14/dBKJ5nVePmZwwiWfdPnbXy85i0NBB8G64wcZqX
 Bw77u7uXV83Mk5228afrEstAT1Oq/gQJ7c9I+KpI8fJ7PlrJxgpvit2zqcNnr1eUBuE=
X-Gm-Gg: AYBFou3DpiOdJcLGP2z4eQyt1imrhf/Qng7fkVtCGyK46BLUaImh8SW5/m2qUzr9A4b
 8mc5tOdRoVhLZNsapXPXSmTWI2U44TnNc59yyv3FapIsJDdz5IQ3PN6G56VeFSm2QOQNRddgIyc
 3l6l0nmSlJ2Ptfug+sHG4d7THoH5UOHR6y2vjVfaD1qfB354S1vNuUoBxIePlSBsh0Ox8OkHKIz
 wQGjkXYiCapuRC5VivgcFNQJO4J3liyJT9ozB7toaeC9gqDmrKex+H+B/B/1ZBhaEsSogSux2hO
 kx0lC+icOe3BVVDOcz9VoYcKGMBrYPFkyKjnJa0QViLQg+meGab0OhicsYMyPKB+drGiVDc0kYu
 PRcP2TMILavn6xCkWz75cQK8pl8/g3krJ48IPZTV0OYnBjf+yHUo3U2W605Y5Unyl+ZRdWqaEPG
 sUpYyJFqVkgjEh1K5kAuhC4Iy+b+JFfL8nL2wTJT/MfxX2jnpSmErE9i7Fiycv0n1CjuE9PK5j+
 q1vEz8Syc7HtRY09rtzkyFZdb9x5fRe93l3p0vluyl/F7Bm7CeGpWwV
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id
 5b1f17b1804b1-4a18e4d6636mr83535085e9.29.1791624154636; 
 Sat, 10 Oct 2026 02:22:34 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a190344032sm96243945e9.15.2026.10.10.02.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:34 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:33 +0200
Message-ID: <20261010092233.138528-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920174242.368233-1-bernd@kuhls.net>
References: <20260920174242.368233-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: security bump version
 to 8.0.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://forum.suricata.io/t/suricata-8-0-5-and-7-0-16-released/6315
> 
> Fixes CVE-2026-45764, CVE-2026-45766, CVE-2026-45769, CVE-2026-45768,
> CVE-2026-46387, CVE-2026-45759, CVE-2026-45762, CVE-2026-45765,
> CVE-2026-45747, CVE-2026-45770, CVE-2026-46352, CVE-2026-45767,
> CVE-2026-45763, CVE-2026-45751, CVE-2026-45752 & CVE-2026-45761
> 
> https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391
> 
> Fixes CVE-2026-63452, CVE-2026-63450, CVE-2026-63449, CVE-2026-57227,
> CVE-2026-57229, CVE-2026-63446, CVE-2026-63448, CVE-2026-57224,
> CVE-2026-63447, CVE-2026-63451, CVE-2026-57222 & CVE-2026-57228
> 
> https://forum.suricata.io/t/suricata-8-0-7-released/6467
> 
> Fixes 67 security bugs, all CVEs are pending.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/a3eb57e57db4d4a389de2728ee7f17174ee51772
> 
> with the exception of
> bootlin-x86-64-glibc/build/suricata-8.0.7/.stamp_built:
> 
> error: failed to run custom build command for `proc-macro2 v1.0.95`
> Caused by:
>   process didn't exit successfully:
>  `/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-glibc/build/suricata-8.0.7/rust/target/release/build/proc-macro2-77efca2882855234/build-script-build`
>  (exit status: 1)
>   --- stderr
>   /builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-glibc/build/suricata-8.0.7/rust/target/release/build/proc-macro2-77efca2882855234/build-script-build:
>  /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.39' not found
>  (required by
>  /builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-64-glibc/build/suricata-8.0.7/rust/target/release/build/proc-macro2-77efca2882855234/build-script-build)
> 
> On my Debian host I can not reproduce the problem:
> 
> $ /usr/lib/x86_64-linux-gnu/libc.so.6
> GNU C Library (Debian GLIBC 2.41-12+deb13u4) stable release version 2.41.
> 
>  package/suricata/suricata.hash | 2 +-
>  package/suricata/suricata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
> index 15f7e666b3..a5b7807d60 100644
> --- a/package/suricata/suricata.hash
> +++ b/package/suricata/suricata.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
> +sha256  a9d46a9c8f40e81f8a6df3ecc2c5a9a8e8da985876299108d92da547c013ba8c  suricata-8.0.7.tar.gz
>  
>  # Hash for license files:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index 56bbc0c89b..d77652162c 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SURICATA_VERSION = 8.0.4
> +SURICATA_VERSION = 8.0.7
>  SURICATA_SITE = https://www.openinfosecfoundation.org/download
>  SURICATA_LICENSE = GPL-2.0
>  SURICATA_LICENSE_FILES = COPYING LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
