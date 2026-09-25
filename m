Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76A3C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B263A811ED;
	Fri, 25 Sep 2026 14:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5XZ2dsKbZZS; Fri, 25 Sep 2026 14:47:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D4D7181217
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347659;
	b=JOvqKcJMyTvOrGQ8TmE/G6mX4lRTg48lrIee7e7O2sCPypjdB+kUJfbdWVEaZ1wa37+6
	 w4rYGBaPJMzrQTejaYRLtAmFeh3utp1LEsCFaO7OGQyLPsyGTjM8RB8cChZpXSNs/PWzB
	 vrVRJQcjzbmDH9Q3lJbpIMuhlTQvuULVP4hbRkWi2M8M2nGRkwxo5J7eZPsR3dZnkM+6l
	 uLNooSjoI5kVZGWRzlb/h0VuGFS8YHMbkHuoTOVexGFN2AsS8wGsrzTwFi6HqrH5Pw47h
	 djNJFP00nC2e6DWALOtEW8WNpuNoXeP8O0zc9O6P1yImxbt/oa1bpqT1COOxL+xuFvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rfGG5whQDedZIP014LMx6K3H6iMs6VIv2eC0PqhLnS4=;
	b=ml7+q5FGycsVICto5dOns2oWgZGD4yQVYSO1k5/9zW93Bc8h6kXYKVg5B4N65bKIdlFj
	 WEcsaj6fvSG0hCKVhUtFpbVUCs6L+EbkmeMN3t5AqiVTdXFBYGCGLmsVGCw4+3iN+ktKZ
	 wB8FNe4VgfpFHimMfHP5B2Kc6XLRs5/UZ+UeERvhUuHWNCAV8+Ljyia4Z74TIb7g4CPnr
	 6Hz1nXg+K/Tws6in+KQcH2iAMMRha2ngrzaUebKCQBnc+oflCUP/lUuNbNwmqvUsCpcPG
	 NvMgdB2anQKg1Jt+xzNCBfVWgUHTLRyGtS5s//ad8QDueB9azTD1jzzx7Lpozt/DQ5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347658;
	bh=rfGG5whQDedZIP014LMx6K3H6iMs6VIv2eC0PqhLnS4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rs+K2TlRJg+eb+xv1+awpvpEC9MmQ+iUurCBJf6kPl2oFgHoJV5eHDUbJLPdXkzs/
	 66HH5N73G/6tmv38B5HjHmMxG8B3pppzz6fozpL6xF0elmapZQKWc+3YNtVjjXk8H6
	 Ezv0Zod2NGs3xTivTDYXK6F2+dhqZBWk6MUJ8yJ4mrrjkO2w1mM5j/fMHQFIxNlN3L
	 6922Rg9MRFfXgXRJpsCm+958p3fFyoZoPeTQSOvVD4QfKslK9+mS2WbgBgcRfESMnt
	 hbXQZOGGYA9quRr83TA5sNofLqpfbBIPSCLuidX5KORJqEYTjtQf5ERxOhj1+Pc/9y
	 96910Wp4HkR+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D7181217;
	Fri, 25 Sep 2026 14:47:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A880334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00AC260E00
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvU35NV2Mexl for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E915A6081B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347656;
 b=rny/rNUBMqwX66gTgwQKFQguCE9yJuAAB7mtgIB259iqlj7g3wB8TjTqZe/6ZJUWVZbr
 AXwvoUJTh9TjSekCjguKwSwItXWYizae/2bn0Yi5c4ukwe5WNzwUav3o4+QeLEmRkr+vc
 VuYU+yiEhnYB+yZ7VXlQUEPsdSMV0LWnTB+0JEnMFeYo+pwBVH2N60Xnr+Tt4eqOYXTuC
 0LYYQAXJDTFG0GFS9zjdzDLlgyuFUJ8RcWx5L3jc+Dfez7Yl8H+BoRHpXO03LgWe28kYM
 AK+F96mW7eNf8NQqTfg4sZhwaAkTA3Dvh0wTUdFQBy0Awc9yC3+JWGd1vKJ3e31xn3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347656;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=18WUj0WPoqI0GYg7KDK9cTsWZTtSisXdrUOg2WKpCsI=;
 b=dhrNF5rhioUH037vW6J+RGBmhUdG/+SIVHMZph+FbzdhssaSG/NB2YuTuMzKf3qOwFDj
 0cNEIypioQNqDUQM3aUuOWcM/PGEsXUrtgYZHFXzGiANMISlk76N1MYqIY3WXrDHQhbbp
 O2VqSknhqrtLLvuAhPFQV2ndAR+nfkRHH8yuT0ztjufPbTiRFXl2yS0vjukL8MsOh7C80
 Ec6X63Em4r2kjl454aHwoMEGMQUpYqQZe93fIRR9cV9Z1QK7jKn/0IKHRfdTqsyRDD7Xb
 odNd577K50H0sa3En5Zsy84Oqy/AWDK84RJr2OdLGS1MaEDnb/07BAf7D7LcpHH+p3A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MjhZeFvF; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E915A6081B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:35 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48882c1f261so171739f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347653; x=1790952453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=18WUj0WPoqI0GYg7KDK9cTsWZTtSisXdrUOg2WKpCsI=;
 b=hrDjqL7EPJAvkIzVcgDEBGr3SNIEBcfVJTxmzymwtsHnxHlMPRNPZWlRCc26ZKdATc
 r30/yN37m4bDi3pXN3KhzJwq0gwAxmNWUEIvXX9otQl+1+e+9HpVDz2y5oe/38G2/uFn
 9EjjMoa5Q/eux23msFfKC4wqfFrhxIVR1XhJnRG29TngR5pKLKPhCqZJDhpULdBhhDzH
 Da+bjZ72OQfVQyUJSb/glKUkU+gsUiQ/OP8U0uM+ZLPBETtwF19RjMthYA17UCm7FEe4
 hrWjyxdGXA+S1rhsI2sCzp3BJOaHQl47u1ayL4IjconmIaKh0RWguYkGXdhFejsvm++j
 mOlA==
X-Gm-Message-State: AFuF++ndrKK7FKJ7zztfrwbVXlv1iWoRlVOI04ZlimaOSEyKAqWzWvBa
 b2TkhW/xHNH1QTr3LZwArGBH8FsF6pNMR1Cm9OyDmV5EM76Rw1YqSPAq5Yx0UfIUqNOtmEfXG9n
 ELPmeMnRj4w==
X-Gm-Gg: AYBFou32Kdv6raoH7Fl2eCy6TScZ1zqakTh1klMAtah3jN/3vFK27CnnogC9iqm+NDp
 Cvkwa4rTknREErypXXIYJ280pGUszB8py2+7PUP2hr51lZOPZb3zp7PQkOfewRd1r273d4sDlAQ
 oUUscsJYtXlFJqrIpYE9uKqtymY6TRzAFwZrcsNiT2Kz2z9K87qo7zzwExD4978sZbNHtuCsbOI
 zWcIqvtd2M8j7D702vU4Pd60umK57rlAeXVIDLZvfuKlZrp5dBNmi6VjZ3Snz4qBT8/IT4r94z5
 7GbZFsiHU19B3D1S4HvZ+SFPfeo2YQtXvyhRhMr78wtuWfuYoamwLNPt5xgt+bnEs+aZ2T4A4MR
 fZdIdwFRczTkasvmdoH3OncsT6U1XyXaT+gAFl2D4ZP+qeA3OmFzEOJMKV3YNIiMP8sHSk15Mgn
 lMSc4ba4VWQDBXgPfJeEhF2BfRgxYh4igrR7wxUKbxD4ZiBrAk1Bw4rQPG41g2i5zRpQKoA6TyJ
 Vd5NvEoJ5akhwCjUU6YKXc4V9kKSXL02JEYQd9WeA==
X-Received: by 2002:a05:600c:c1d7:20b0:49f:e897:b62b with SMTP id
 5b1f17b1804b1-49fe897b890mr74077335e9.14.1790347653691; 
 Fri, 25 Sep 2026 07:47:33 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a84205esm7560878f8f.37.2026.09.25.07.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:33 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:30 +0200
Message-ID: <20260925144732.4101327-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260921102218.64667-1-titouan.christophe@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/fcft: use release
 tarball instead of archive
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
> Codeberg has changed the way it generate hashes for at least some of
> the generated tarballs (see [1]).
> 
> This change affects tarballs generated by Codeberg, but not release
> artifacts.
> fcft turns out to have a proper release available, so use it.
> 
> [1]: https://codeberg.org/Codeberg/Community/issues/2861
> 
> (alternative to commit b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/fcft/fcft.hash | 2 +-
>  package/fcft/fcft.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
> index 431f2218c6..86d68cb047 100644
> --- a/package/fcft/fcft.hash
> +++ b/package/fcft/fcft.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f48c793f354b8be95477e475dde7c98ac9d2628c52ecb42029dc6d20b52d787c  3.1.8.tar.gz
> +sha256  028099126692625873410889a1d76cd82d5a71b5e350bd618320e48db15a8636  fcft-3.1.8.tar.gz
>  sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
> diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
> index 62c85a15c5..cd31ca5153 100644
> --- a/package/fcft/fcft.mk
> +++ b/package/fcft/fcft.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  FCFT_VERSION = 3.1.8
> -FCFT_SOURCE = $(FCFT_VERSION).tar.gz
> -FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
> +FCFT_SITE = https://codeberg.org/dnkl/fcft/releases/download/$(FCFT_VERSION)
>  FCFT_LICENSE = MIT
>  FCFT_LICENSE_FILES = LICENSE
>  FCFT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
