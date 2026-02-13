Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBF0EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC46846BB;
	Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTK51NmgkYyP; Fri, 13 Feb 2026 19:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 706578473B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011478;
	bh=S7zs4W29T0EicXRHK7+IpSAdWXtiAtJYsJg8RJLHdcs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TwIs14H2V3KBixlUpxPGa2eTB2f6eminDVPAmVQRUB03ZzENkWM+j1FgX7i8Pn9Px
	 HY/xo1ST38CEVILqbZ1ua+8FGTSCewkKP+kXH9n3PC+yA19uBdX4xD1zNUYUI2igoN
	 mZhNjVxSc0f+/SUlU2dI2INxi3cU9n0ZryK0oPVJbhW4IhV/+WTnJloceC5ZaT5biW
	 BI+47o4iafo41MsnfKdCr54WG0vouM1mD34yBe3d9/aecH3PScHJklEkotnVWbnErt
	 f9F+8B1GuhQrG2Pfq257uTP8e3LJYj+90C3hqtldxCREPcZcgW9cR5IjO2Y37S2dVW
	 2buUyQUAJDzMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 706578473B;
	Fri, 13 Feb 2026 19:37:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5B38EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B041641F51
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn8wEi3w8VAh for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 718AA41F54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 718AA41F54
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 718AA41F54
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43767807da6so793797f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011436; x=1771616236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L4ghJhGogAbjND8jRDa71Fr0MTkWDTJ6Labt2WrI2no=;
 b=Pxq2ecPteFwv4A0Z4UZVeIgwnuXF30tWaQrZFsAXW2qRXZYG2X6TPNAQbJPR/Dm+mc
 9eruRxJijL5yuxN5MPNa+p/tnjMwYbPFkVQozrI4/5eft/MzWXcZ8gl4GYKJoWjt+luL
 O1pSv0zW/5YdQH5Ig/yMUHWnq3gmz1fEWor9QxWB+2FrQqnrBLsAkDbwNekg7IGaKWZS
 ZOSGcdnLYeQ4rT7hwPlW2Qrvc+YiDnrRF4wAjEROWyOGuk9cbtWCq4OqFSOKhrfXFjJK
 8ulrVOqU+OA5rHG9IzAq54AAD5qBqPa+u66nvWM1xA0WjnGU9FopWnj7pxPkDaK/cEml
 sipw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Zpqm42tExVFVBBSQajZGGDJcaJVG4ChaCV8unTO+OBRvVPxUsXXMOz5V8eX345tkJgSFPfgYGDk=@buildroot.org
X-Gm-Message-State: AOJu0YwucrX9KDecaZwHt7AO6xpJW5s63k128lUMsiLfgmwnDyLHcl4h
 aAj+AVqdfjI6TyFHhhnc76uGNlLB7vR0FM0yduiqyJrzesH9AQu40Cr7ptSGcB25kLleCAXKhtI
 n0T4a
X-Gm-Gg: AZuq6aJbBXWZ8xruDs3+ZSD24ZDUjEAZuyXwvZ7wlTO0b9r61R7v4k2vJ3m3BjwNv4y
 PDQnf5n9XN4p39pnWWag7upMZedf578ZVup0OjIWe/x+9SC7bS8SYYdyOf2Zq3FYbY4j3QqeOHM
 Gw7Uqow4AmXxie3ZnAIdNk+2eyRM0Nf93H4SmBhaTTDjlmswnA/O/SmS28XJYy83dmvwN9x4p8g
 rpsmm4aGiuKTCT/N3lLZcNQeYyulo55pR+CGus8QLsMC+zYixqFXhBAcfFZ1UgYWg7YSdQfhjFl
 5HwU8rrTBYztPEAih9Ee25n6FX/9iB3HTmwow21vGUvaGmnrj1w19p6BIdCltKxBuSpXYdw4r9d
 rfH9WLHyC3A1srPIpCBx42U7SeWfsYOY9evmqWw4NqVxPyfgMIKFWThCJJtslKiJLPFyt7YqCsV
 hhuC0PjfjadJ5l7pY=
X-Received: by 2002:a05:6000:2585:b0:436:3475:473e with SMTP id
 ffacd0b85a97d-4379791ad09mr5909434f8f.51.1771011436330; 
 Fri, 13 Feb 2026 11:37:16 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac7csm7025133f8f.7.2026.02.13.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:16 -0800 (PST)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:15 +0100
Message-ID: <20260213193715.38925-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250531000554.28543-1-fl@n621.de>
References: <20250531000554.28543-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011436; x=1771616236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4ghJhGogAbjND8jRDa71Fr0MTkWDTJ6Labt2WrI2no=;
 b=C/a7B7+leIpT9fwd2NCIN4EGu46g5A6egX7Jk4bp8uwnXxsp4X2mRWJganwTvThIV7
 a+lMVyDhAZSS8KPaAErV057sgP7WS6IPEmxSsBSP7G6EVq2rpb7wnKkHakZ8WYO4av83
 eIVnYwmcKLwoOBKNAcHhKfvsrFIi984dmQ9xsMUcv11KC6FrbBm3zfTEZPFQr502dLiw
 cHPBom2E0Fee4bIi5SHQpEjncjmrBqA+Bsq0t4UI8PNM9JCUzvdRHDsL+NpnUFkjq91B
 K6Sd6CkjKzV41QHK7807sIlozP5qqpuPZ7y4K1CL+/myEqvd9a0ca/PaqhEDRDYLFwwl
 DqvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C/a7B7+l
Subject: Re: [Buildroot] [PATCH 1/1] core/sdk: pre-calculate files in need
 of relocation
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
> Currently, the relocate-sdk.sh script scans the whole extracted SDK tree
> to find instances of paths it needs to replace, which can take a
> significant amount of time when the SDK is large, particularly relative
> to the number of files that actually need to change.
> 
> However, the resulting list only depends on the SDK tarball itself, so
> we can calculate it at build time and ship it with the tarball so
> relocate-sdk.sh can use it directly.
> 
> Testing this on my machine with somewhat IOPS-limited rotating media,
> the time goes down from:
> 
> $ time ./relocate-sdk.sh
> Relocating the buildroot SDK from [...] to [...] ...
> ./relocate-sdk.sh  5.19s user 26.21s system 9% cpu 5:34.40 total
> 
> To:
> 
> $ time ./relocate-sdk.sh
> Relocating the buildroot SDK from [...] to [...] ...
> ./relocate-sdk.sh  0.49s user 0.29s system 103% cpu 0.749 total
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  Makefile                     | 10 ++++++++++
>  support/misc/relocate-sdk.sh | 11 +++--------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c14023fd98..95f207150b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -600,6 +600,16 @@ prepare-sdk: world
>  	@$(call MESSAGE,"Preparing the SDK")
>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>  	mkdir -p $(HOST_DIR)/share/buildroot
> +	(\
> +		export LC_ALL=C; \
> +		grep -lr '$(HOST_DIR)' '$(HOST_DIR)' | while read -r FILE; do \
> +			if file -b --mime-type "$$FILE" | grep -q '^text/' && \
> +			   [ "$$FILE" != '$(HOST_DIR)/share/buildroot/sdk-location' ] && \
> +			   [ "$$FILE" != '$(HOST_DIR)/share/buildroot/sdk-relocs' ]; then \
> +				echo "$$FILE"; \
> +			fi; \
> +		done \
> +	) | sed -e 's|^$(HOST_DIR)|.|g' > $(HOST_DIR)/share/buildroot/sdk-relocs
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>  
>  BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
> diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
> index 981d272425..d25bc55279 100755
> --- a/support/misc/relocate-sdk.sh
> +++ b/support/misc/relocate-sdk.sh
> @@ -37,15 +37,10 @@ fi
>  
>  echo "Relocating the buildroot SDK from ${OLDPATH} to ${NEWPATH} ..."
>  
> -# Make sure file uses the right language
> -export LC_ALL=C
>  # Replace the old path with the new one in all text files
> -grep -lr "${OLDPATH}" . | while read -r FILE ; do
> -    if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" != "${LOCFILE}" ]
> -    then
> -        sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
> -    fi
> -done
> +while read -r FILE ; do
> +    sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
> +done < share/buildroot/sdk-relocs
>  
>  # At the very end, we update the location file to not break the
>  # SDK if this script gets interruted.
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
