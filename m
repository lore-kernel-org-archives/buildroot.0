Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A757C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBDA460B4C;
	Fri, 31 Jul 2026 12:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr2xtTbEwxkG; Fri, 31 Jul 2026 12:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D61360B3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499526;
	bh=VfdUx/ptqykmc1XSX/+TOxM6HRAkFEmtyu/dVyQYWs4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YbiwHMwVUvyKNpXtgjINVFwXmIahABeo/q0dBJuc89zWKOamY6F4drbxfqwMddbWW
	 5cbpyI+otsoPlemp4aAUp1N4V1r/BDmZThILcLIwLQudrx4tBNrgc8jjjPU8jkXkbg
	 yz1Gu2DBH61el5j4v+2V3IGCyJd6crPNBXd20n1QR5IjfZGs/T6wD9Pf9w6dbgO/gu
	 5qZWhaXWqfHJRgQE6GZW8GkFDeSyZmjE12Yx56hdvJQP1T2+CY52sOdM/Aay+tmhIb
	 PhDh+VAAEsfI0thacHNjWZpPPzOwB9rpIQbfb085YkwLnjYnlkC0pYJxZj271M2x0r
	 VqReABy3LeFlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D61360B3B;
	Fri, 31 Jul 2026 12:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BED627B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 118F340463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPhX9pm3251V for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF536400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF536400DA
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF536400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47f59f25ec4so422694f8f.2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499522; x=1786104322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N0q2Xjs28QAw9JPXliQh1NCVaqcd8jUK1IXzEigkrQg=;
 b=loN5AVA16Eebx5YCCGdVE+rqb0fLyQ8f92i8fmE3mxM4it1+ZApQRj5P2aJWTLCT+p
 9fJpse4x1WZRpE1FgS27o1ZsPT4YmWV7j3wBxt4Ds74C1TiXEn4cz1nmKw0dW5Pu1H3s
 RyqDrjpNwTYnskOr//fD4HZRFe/k/PK7d0hnCxFuDVZHrvomQRKzmfXAdFYCg7Km6uzE
 ozQ0nwhP7Kf5chuLehw+2J737FknWN7DZI++OzElktYF+KohvWcPap03BPD8LDDC+Ouf
 6b9C0cG9bdaInb/z3t8KThOhuP21zEP5LObRhK6MvWH4OCnoU3lxfcCq/sO8uRoeAsL6
 85Zg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXf2CmVNSFF6kfWDBDb/5zDMMyM61x7P5VIUj6og09cPg85xAFYU3xsquxo9NGptF/d8Jq6uBlvBg=@buildroot.org
X-Gm-Message-State: AOJu0YwACth84TvJKch+ya6zt6WPtYZ2hzfQK5gZcpjQgiJiLmyiRvxc
 ii5Y/29DhvYg2G6+jjKV5ZPQAFG4Imzp0cRTVTO/Rrct1Wye5+AIiphl1tjfgpNU/oM=
X-Gm-Gg: AR+sD120YtV1Mt4uUQ9LkWLMZH6zkwYvHA0CIzFmRaioOkQSSkltv3PITEawj8U+Pjd
 CCR6dsXREJChvW0Nh9cvhwoxEyS41NQEB7oj7yWFNTLcZ62joVFaOBEesoun0yDnsrk3gF9HhsY
 MBVhzG7NVWkaVDjgj050DzjV9NnayEWYjh5upEjKBCkgmdmxug4L2sKFQKIvgNp8vPtvynKi7Gl
 B+QYOBsDVbBNM10WzKiyMdQH7537Q1AWY2jfQQ8mlstXwbXvXE15lZK7nxX18hI1hgi1SA953L5
 Oj2fAbijNi1cQ97QrWjsEdFxfZ4iJE3QMNltkpgUjK4pNA3ENDJnO/aVr/GQEOaLEmXxPH3GU5C
 5bw6/DEwwPveNPHzFNE2ZcXwfMv3Q5701cCUiZRnLQKmXG9WsoXpS7m1LkOjnJ+oXXJp6Y++idV
 xWhLp5uAKCR+Xz3rhuOteWTsH/0QXWK9fwGrUE64fIsboF510eAKxWsbj+jQC2MZ+1SjIiaytgV
 +nUaIfH9rjKLKsjEEkiGc9Hhg==
X-Received: by 2002:a05:6000:2892:b0:475:f100:35ff with SMTP id
 ffacd0b85a97d-47fd2b698b9mr3818083f8f.60.1785499517156; 
 Fri, 31 Jul 2026 05:05:17 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd42d91b3sm4549114f8f.14.2026.07.31.05.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:16 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:16 +0200
Message-ID: <20260731120516.3490-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720170437.133823-3-fiona.klute@gmx.de>
References: <20260720170437.133823-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499522; x=1786104322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N0q2Xjs28QAw9JPXliQh1NCVaqcd8jUK1IXzEigkrQg=;
 b=MuCW80Bl0wvej5CHtyk/Kw2th/D21jBtGS7Kg8hvgMYvHCQpb4dGGt7fQdBlWKIj9b
 eAikTCZHOjwYowmIPxhSx4Xa1n/icCaykBJ6LC4rrISl+PvWfnUXgnAP44OA6KFScrN2
 nZy5C46dkXNR71XO3VOrjNWrsZ5FWL/fRhu6bzmaqRokblHECITs847u9hqA7i5LUw81
 4fdLQx9Q1IQoCUTVVkOumP39g/VqMuRNzU7SSliskyLkPPOiS1ADS3Kmuu7pDcpYB7R2
 yy3+ZSw6kk1IxHjIKhc41NXQJ7XSjwpByHxxr/bW54Mhf/959M94s43DW3Aj11cwifUB
 cyGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MuCW80Bl
Subject: Re: [Buildroot] [PATCH 3/4] package/nettle: clarify license info
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
> The Nettle manual (nettle.html in the source archive) states:
> 
> > Nettle is dual licenced under the GNU General Public License version
> > 2 or later, and the GNU Lesser General Public License version 3 or
> > later. When using Nettle, you must comply fully with all conditions
> > of at least one of these licenses. [...]
> 
> This means "or" is the correct description. Ellipsis covers a note
> that a few files are licensed more permissively.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/nettle/nettle.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
> index 93c638a4cd..dbbd60622d 100644
> --- a/package/nettle/nettle.mk
> +++ b/package/nettle/nettle.mk
> @@ -8,7 +8,7 @@ NETTLE_VERSION = 3.10.2
>  NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
>  NETTLE_DEPENDENCIES = host-m4 gmp
>  NETTLE_INSTALL_STAGING = YES
> -NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
> +NETTLE_LICENSE = GPL-2.0+ or LGPL-3.0+
>  NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
>  NETTLE_CPE_ID_VALID = YES
>  # don't include openssl support for (unused) examples as it has problems
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
