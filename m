Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5835AEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A7E615AA;
	Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3g3fEUlrr6j; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72806157C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011428;
	bh=tcl5R7UfAy9bQmURl/eN/QQ8tyrE/T8aGYSLo3jyUg0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8hu3+2541t7QlRobB3MR108g4EUpm8fwJFdfxpqQvSVaHucMMHxkgf6zE+Bd+IAP
	 U3cCNmjwYx0ppChybw+jL6PjxXF2s/uldwNGEM0CFbrOKLkpv5aCyfanDENs1z2VTP
	 FScVQML7E7SrNAs2csM48+p8YaH+lhJhRfxomOB3JYVOAvFDmKbJzfR7KtQDrMB2jk
	 CpYaGLaM+YqhXrl9i46yohEYT+b1NoY++OEIid1hXqZNgLcUDU/n2zRrpjY68w+RyI
	 8sfniTXicy/RVdppQksjlzMqYKCJTmvekQARKAAsriPBzw9vN2kM78OIyTGn3sSJV9
	 R5pkqHmxSJJHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72806157C;
	Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB7869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F29F8464E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG-PXG8wH_gt for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF80384646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF80384646
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF80384646
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so1369945e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011385; x=1771616185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hTacuKpV4yqoMNSdoCFpFd9qkQzoHe8Qe576KWIBneY=;
 b=KboUfJb28NdDuGn3e6R4k7cT2BHRhVbhBy1jbhnauqY4ag9s2VilNzDbBWyYdlo9eo
 KT8INAskoRF2CCVwnAlLTWD9JXYru7tMizcEZIxRUC6Xkq6pD+hs6foJu3G09MmWpUSj
 iZRwkw5nU87tovK//s7P3x6oVUNOx81lOMEu8e1D4LrIqnNL4TqQGF8e4KQRqww2gv3G
 DkpCMZ5YnUBvU7S9bzimGyqltVECKkN1DZlJech7FVLfhYNR0QQDyE2g6OGVVFFiXQ8L
 FltDAIwBXAgMpDQqAVx8lhhtZCgw+LTLjoTIVlzP4nGgiMfgohZMC+3CYeVZJoIdJAFH
 yiJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmqFczlp5aN3+/Vcx0UQa/StWi2YKY55RBJzcAFhBDjhFSA9MXLpG3DqUzOSucY8HhXSHQYbC7Ds4=@buildroot.org
X-Gm-Message-State: AOJu0YwlZx0jEoqXqiknq4DR1CC/mhpO+8kuuI5UHxc+2K4awftmiddl
 qDATUhZjNht6K59deINoa4Ckom/3MBTF8lYwbZRl8I2N+nkFe2vX2+1DXqaMb3CJjMw=
X-Gm-Gg: AZuq6aJGvRBzDkL55CbCiRVZDc5qp1j9wze5E5GCL7T2xLUgcp2S/OqtKNgJIYddDDb
 j3yWjWu3X8xLwHPrQH4VQ8ii3hf5TL0E3mTv/mmJkkWS8lzFZYY+FJXZFj4z3Av59NvKMC/Azw5
 yfQzfam5PCOsuR7wxWVL2YsjTQeZEL7UjR8ui8PCU2mEYVmd8LaO0vdTLzFcDBkYka48Cexb7fh
 TG7KRu6T+MRcmp8fK4caUGKxrgzGodPS+RvRjUUyJhGwEFhB7obcK4xDG8Ng5Hfa/gddHK9Z/f3
 VY1tp7X486xyURkneUX1ZXSOUT2FQfglb3JIIaeA+BUnlbnFosW0kGbvMiNknF10ur3iyjGPlys
 Rz2Iz5kc0AMRGVo/Zvj5KKi9zR/5LDEh89OoW2GWlg/sWyMIkPwemqAhb2DNNuw36Dqvk6K3Avl
 WOqzJ0r8DnpVrHRek=
X-Received: by 2002:a05:600c:1c07:b0:477:561f:6fc8 with SMTP id
 5b1f17b1804b1-48379bac86bmr7496765e9.5.1771011385491; 
 Fri, 13 Feb 2026 11:36:25 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a15d99sm34902855e9.4.2026.02.13.11.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:25 -0800 (PST)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:24 +0100
Message-ID: <20260213193624.37434-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aYNOIjYboYd9f-Uj@waldemar-brodkorb.de>
References: <aYNOIjYboYd9f-Uj@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011385; x=1771616185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTacuKpV4yqoMNSdoCFpFd9qkQzoHe8Qe576KWIBneY=;
 b=AlsjFeP5TSCD5Vomd343lmYY4UxrHKCQQlyPwyaQottXQn+RK60GLCvoNgz2yqN1Ov
 1Oh0+sRnn1SjKUMnMQhC/9VNbRgNfwomnA77H3FWvejWZpvkmmiHWCWbrMIY1D/8zmY1
 jH9fSFS+1hTY9Sl7lRB0m4V5v4r0Oads5yJ5sBbZRqxIaX+6h2rsaHYJAVWCmr66XcaL
 S5PfSL35tGh4PlEQy1Yrr3648HdErPYy5VASKkSshRF56P7s4H+4UFhDleSygOX3GvKD
 y9EKBiR0f7NHaFvW832kDvbkRR+W1rFfy+vEpv/awcknXxIDYacP8HZbH7VAf/ZJH7XS
 tbtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AlsjFeP5
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/libpam-pkcs11: new
 package
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
> The Linux-PAM login module for X.509 certificate based user login.
> 
> https://github.com/OpenSC/pam_pkcs11
> 
> [ cherry-picked from commit e3812ea5142bf0092a7d0f9830f0cd4c478b6431 ]
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x. Thanks

> ---
> As discussed in IRC I try to add some packages to LTS branch.
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/libpam-pkcs11/Config.in          | 19 +++++++++++++++++++
>  package/libpam-pkcs11/libpam-pkcs11.hash |  3 +++
>  package/libpam-pkcs11/libpam-pkcs11.mk   | 21 +++++++++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 package/libpam-pkcs11/Config.in
>  create mode 100644 package/libpam-pkcs11/libpam-pkcs11.hash
>  create mode 100644 package/libpam-pkcs11/libpam-pkcs11.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index eba18334e0..069c846be6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3318,6 +3318,7 @@ F:	package/asterisk/
>  F:	package/evilwm/
>  F:	package/fbv/
>  F:	package/libjwt/
> +F:	package/libpam-pkcs11/
>  F:	package/mksh/
>  F:	package/ruby/
>  F:	package/uclibc/
> diff --git a/package/Config.in b/package/Config.in
> index d64d915997..bd44e8e988 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2256,6 +2256,7 @@ menu "Other"
>  if BR2_PACKAGE_LINUX_PAM
>  comment "linux-pam plugins"
>  	source "package/libpam-nfc/Config.in"
> +	source "package/libpam-pkcs11/Config.in"
>  	source "package/libpam-radius-auth/Config.in"
>  	source "package/libpam-tacplus/Config.in"
>  endif
> diff --git a/package/libpam-pkcs11/Config.in b/package/libpam-pkcs11/Config.in
> new file mode 100644
> index 0000000000..8db34090b2
> --- /dev/null
> +++ b/package/libpam-pkcs11/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_LIBPAM_PKCS11
> +	bool "libpam-pkcs11"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # pcsc-lite -> fork()
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite -> _Atomic keyword
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_PCSC_LITE
> +	help
> +	  The Linux-PAM login module for X.509 certificate
> +	  based user login.
> +
> +	  https://github.com/OpenSC/pam_pkcs11
> +
> +comment "libpam-pkcs11 needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash b/package/libpam-pkcs11/libpam-pkcs11.hash
> new file mode 100644
> index 0000000000..95747afc08
> --- /dev/null
> +++ b/package/libpam-pkcs11/libpam-pkcs11.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  pam_pkcs11-0.6.13.tar.gz
> +sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
> diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk b/package/libpam-pkcs11/libpam-pkcs11.mk
> new file mode 100644
> index 0000000000..4bad47f69a
> --- /dev/null
> +++ b/package/libpam-pkcs11/libpam-pkcs11.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libpam-pkcs11
> +#
> +################################################################################
> +
> +LIBPAM_PKCS11_VERSION = 0.6.13
> +LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
> +LIBPAM_PKCS11_SITE = https://github.com/OpenSC/pam_pkcs11/archive/refs/tags
> +LIBPAM_PKCS11_LICENSE = LGPL-2.1
> +LIBPAM_PKCS11_LICENSE_FILES = COPYING
> +
> +LIBPAM_PKCS11_AUTORECONF = YES
> +
> +LIBPAM_PKCS11_CONF_OPTS = \
> +	--libdir=/lib \
> +	--without-docbook \
> +	--without-ldap
> +LIBPAM_PKCS11_DEPENDENCIES = linux-pam openssl pcsc-lite
> +
> +$(eval $(autotools-package))
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
