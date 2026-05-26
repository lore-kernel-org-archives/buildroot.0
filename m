Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47519CD5BB4
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 07:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08D140A10;
	Tue, 26 May 2026 07:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liwBK6FaLbYa; Tue, 26 May 2026 07:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262A540A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779781329;
	bh=mjPUEysvrYB5aBa9L4YVSRAz8TQZBScRGFE4PuCtAUg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z1yTOmIPbM1XGJopIL2o3T4CXnyatpWwAmsDZZsI5Qh4G1Z6wCPqR1ORq2XqcGgtS
	 9/H71CmsHI9IKJDZPU9FvhRflFML7KfK9Pd5A5T6JiGvZm22XTrP+b9gwz0XSj2J1J
	 jgkS7w/1ZO8nly9udsoO+oiJlkGkNQdszFhf130eya7lecbjnUcS9aj03tGyCltGiV
	 YSmpNlwJwe7EFbOwJNDpskIg4DvwwJa3WdK36r3ml+L11yx6frUH4HCvxiCBe9C8qO
	 dMVDnJaOKGm9J09Tw8DEEQpOSgFxBfBIj4dyur9BEEr7sQLX0/Zy8iUBMTnWOPnY+O
	 KUZbKLyislo1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262A540A2E;
	Tue, 26 May 2026 07:42:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10ECA265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA9DF60BCB
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjaz8eUt02ZN for <buildroot@buildroot.org>;
 Tue, 26 May 2026 07:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFB0D60BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB0D60BBD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFB0D60BBD
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:42:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4585a116a4aso8491444f8f.3
 for <buildroot@buildroot.org>; Tue, 26 May 2026 00:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779781324; x=1780386124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JGJFLDTAOBl8ytXdJ2hKHOqez+dS36jEouZjH1+0q1I=;
 b=QC2MRGD4/7DAoZ0O+Ckw402rRWCelFHj+4NwXhINJNOyc9x/Wvh89k1FCTZOsDp6Rn
 d/iKlSNKP9zOHd5U1wqeCxtfRmfzXTzYGJGmVnROmKJbXeS1yvdh9UsO9iWI4fJBaZ/n
 X7yoXkJxIN0z5YraLhteyL59jAJl89G9s1uZkVjq8PUNd/Bxp4NFzJ+lAyTzbDbSKBRu
 MFOZhTkiaQffmKi7gTgPRQj6B/BEbDK1wddOoKwoKyyAD3nFfke+couWI0ELFHcwPh8V
 91AYsB5/sVkebzpOAQ/l9U8pYwHn0BKysyjNdh3c1C38EDKui8yfBToKfmRHJp6UlDsF
 nMzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9l5lDOxq+OTigvXoSDPq10PFqvodUOdUkq9g46xY3DNpFxadXtDxSin7Wxm0aXsGbOl2cM/06YV1M=@buildroot.org
X-Gm-Message-State: AOJu0YzRjjmoWXw5arICPLBl7AOnAPvWAQCmWYqVP0bj9GeRN24ZffPl
 MOuYDg0V2ZMxT8pY0xfhrBYdaA5DgX1PL8CV0LlvkXlynt9rs121B6l0neNgIPQab3s=
X-Gm-Gg: Acq92OHoUgkyi0swFdKHM7WD7yvClozE3XmI7B7djzRiNJfmslPciZ+oQwn67bJkZ5o
 e/pqYON5ZfnsJprbRN3AhEIcrPzqxAsTtZX/cpsR2J0qdW8ryk+9/d6KEb+akT/BN+DmWTJLYlE
 BnyoNOYa48/PQ6xjLXmUFR2D8urJc58sXnyUmx6zV3zywHQ9eYrzz0gjlYOHik+FCsF+1KwxkOI
 +WbewanjuE77/8xAeWFT72wrQRf1140BJb7i7blkvHFVzMw0b+JFyMScldFmCurihS3zr34ANtF
 VNqDYvLwvGM8MH7DFYZOcyiNDZyIpfbSZDsB6Vp29lYSSwCQ6N8Q/0urmSLpagzmfj0mLDhyLqS
 h0smQAPepDwYo/WVLYcCbi6OXLTM10BgtGjPzpHBNQ5pIN0sXzul3z4C86O4bVH67tW0GnokAu7
 FU6AdCAx+kB/5dMdsD9nJRHCZIlVdubjCPd7ufENny4BuAuvdQEJnYfdv27Q==
X-Received: by 2002:a5d:6f08:0:b0:43d:7c1b:b8c7 with SMTP id
 ffacd0b85a97d-45eb36ac4cfmr26761615f8f.21.1779781324287; 
 Tue, 26 May 2026 00:42:04 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ed90f8978sm1020168f8f.7.2026.05.26.00.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 00:42:03 -0700 (PDT)
To: Christopher Obbard <obbardc@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 May 2026 09:42:03 +0200
Message-ID: <20260526074203.19772-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779781324; x=1780386124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGJFLDTAOBl8ytXdJ2hKHOqez+dS36jEouZjH1+0q1I=;
 b=dHYsanPsByReJB+S0Fa32/D5rpaVaMZu4vkYY8xlxpEUlUBn4lA7bbTgjKl0bWm5NJ
 K+NLIgYxRuFCMI0LCwV2yySbKoy4dbZcNV+WpGcRiHBc5AgQGXSvXjj0IEU0wQaz92d+
 M9KYiOGzDbVmCnj6LiR+QZupZjaf8gDsIC9691BB5FKWwO3AfncsYv6xKPcdf1jhAcrD
 wdBisY9dz4safrVTjEYp9dFfG4HXXaSuaBudMU1q27RBOAjDBJoUxZOBNx0UmlHOnKPf
 acqEPgxSFp35BNbQhTja6xz8x/VBR/uuC6FsZOBT0uEpOSQ9sB2jfVlUfhVP/CPK2SFA
 fWqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dHYsanPs
Subject: Re: [Buildroot] [PATCH v3 1/2] boot/efibootguard: new boot package
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

Hi Christopher,

In reply of:
> This patch adds a new boot package to Buildroot to build the
> EFI Boot Guard bootloader from the https://github.com/siemens/efibootguard
> repository.

Just a small comment as I see that simens/efibootguard has a GHSA assigned with
a CVE associated:

- https://github.com/siemens/efibootguard/security/advisories/GHSA-j6pp-7g99-24m7 
- https://nvd.nist.gov/vuln/detail/CVE-2023-39950

With the CPE ID `siemens:efibootguard`.

> diff --git a/boot/efibootguard/efibootguard.mk b/boot/efibootguard/efibootguard.mk
> new file mode 100644
> index 0000000000..c40cef13ac
> --- /dev/null
> +++ b/boot/efibootguard/efibootguard.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# efibootguard
> +#
> +################################################################################
> +
> +EFIBOOTGUARD_VERSION = 0.22
> +EFIBOOTGUARD_SITE = $(call github,siemens,efibootguard,refs/tags/v$(EFIBOOTGUARD_VERSION))
> +EFIBOOTGUARD_LICENSE = GPL-2.0-only
> +EFIBOOTGUARD_LICENSE_FILES = COPYING
> +

Add the following entry:

EFIBOOTGUARD_CPE_ID_VENDOR = siemens

> +EFIBOOTGUARD_DEPENDENCIES = \
> +	gnu-efi \
> +	host-autoconf-archive
> +
> +ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
> +EFIBOOTGUARD_DEPENDENCIES += pciutils
> +EFIBOOTGUARD_INSTALL_TARGET = YES
> +else
> +EFIBOOTGUARD_INSTALL_TARGET = NO
> +endif
> +
> +EFIBOOTGUARD_INSTALL_IMAGES = YES
> +
> +EFIBOOTGUARD_AUTORECONF = YES
> +
> +EFIBOOTGUARD_AUTORECONF_OPTS = \
> +	-I $(HOST_DIR)/share/autoconf-archive
> +
> +EFIBOOTGUARD_CONF_OPTS = \
> +	--with-gnuefi-sys-dir=$(STAGING_DIR) \
> +	--with-gnuefi-include-dir=$(STAGING_DIR)/usr/include/efi \
> +	--with-gnuefi-lib-dir=$(STAGING_DIR)/usr/lib \
> +	--disable-completion \
> +	--disable-tests
> +
> +# TODO: Perhaps take inspiration from Debian patch https://salsa.debian.org/debian/efibootguard/-/blob/master/debian/patches/always-override-stack-protector-variables-in-EFI-bui.patch?ref_type=heads
> +EFIBOOTGUARD_CONF_ENV = \
> +	LDFLAGS="$(LDFLAGS) -no-pie"
> +
> +define EFIBOOTGUARD_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -d $(BINARIES_DIR)/efibootguard
> +	$(INSTALL) -m 0644 $(@D)/efibootguardx64.efi $(BINARIES_DIR)/efibootguard/
> +endef
> +
> +HOST_EFIBOOTGUARD_DEPENDENCIES = \
> +	host-autoconf-archive
> +
> +HOST_EFIBOOTGUARD_AUTORECONF = YES
> +
> +HOST_EFIBOOTGUARD_AUTORECONF_OPTS = \
> +	-I $(HOST_DIR)/share/autoconf-archive
> +
> +HOST_EFIBOOTGUARD_CONF_OPTS = \
> +	--disable-bootloader \
> +	--disable-completion \
> +	--disable-tests
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
