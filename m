Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136F0CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5EBC84680;
	Fri, 15 May 2026 17:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSL_zSadW4KP; Fri, 15 May 2026 17:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 830EA8466B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867211;
	bh=aDAUBiNZ7OwQYWuJEpQG/8C9QsddS1CwVhD8FWJ1TGg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CyCm4zNiMOZLcGk1bZWtsQgFwG7zaTzyR05Ykvjh4qVW4RSe3T6ZYlD0CgrHuUT6g
	 mNCPWe5ptTk0KelgaOXoTqKPijOMC7lkUXcpfZLHnN57b1KtYFqAxQVMWJl8driUf8
	 O+xLm7OZLG4IceP08A2n1eck7zAVLqJ9i3ZeAoO7oFAMFjz9avLXRuA696+4GBEw4Y
	 BikbCS3WOc7YpUIFCj/5bZlEIqpvbZvdyWD2s0ypBBjoznfj+SZWsTVQ9mn0H/7Byg
	 SrIjCmcOuR1jZOZwEMe+QuueOYS9Mn4QD7t3jrPOOrPVpyQvGCkhRJYIzD1esve9dq
	 aomacTLl0hoCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830EA8466B;
	Fri, 15 May 2026 17:46:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A526B23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B01A40FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzexzGV5vZIK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71B194027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B194027F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71B194027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso959625e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867199; x=1779471999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+rkaRaysGX43wq2eJm6uaB7oaUGGr8mDG4QwIcuCz+Y=;
 b=Y4PR3I/Vz8Y+k0yPriOQm/oQjQzRY7POks1wSdA1jKLzJ8N5GeVjglb+mx/c/93MjA
 JjsZ1+/Q5CA+jjHWC9fUJ/IEoa0lY1oWsIZDzm/oSqDB/8f1aIUpXz33udortwCPz1ZX
 4m069WsQsAU2Oq0enoObBg+Fkp9OOFX+pVbr/KI3fsLGrVEXr2Ukp8UfIRYBE/1jmBdn
 zo/WS661mwCt0B12AT9l9Op8NsTFkCL1EU9tgahHePYhShZdIEMRCbZJZnNc1GOX6GAB
 O3VC6/rYeXSH8nLV4NO9d/f8RHx/BcysrsIyR1lGsh6JrltHIqLHVBt3fhSLgol8TWgq
 9jRg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Zd7bVTcTRJLGyVKNrxqEfRHS1xSK6oViMEn+8vEjfEIPdR5wjT2JA0dvQVnLeWS7ZC6FO2cpcFEQ=@buildroot.org
X-Gm-Message-State: AOJu0Yz11GYvMSJsfGol44SwdU+PhBUTF0iuDPrxxbQ81ulIn5g+JaiY
 ngUWXQHHDgCzvqmbAbvBv8uRFy/r6TBuqetX4g9VL8OSYD5k9ki6DD4zRKqzd0QTA70=
X-Gm-Gg: Acq92OF81VTm7y2jvF0KvUSU89CU7Y1Lorgbv7+LJi78ydxLZf5a/c/N9FvsgZsB3C/
 p2IjzoWZz2SB6cXQQ+bwQK62vaaNtjzLmE4SqsSGwy6afiyBrbfZMPm7CUCuVj2/1bV3OQl2B5e
 ihZwsXxVNc26ocNETl7YgGUZjxEo5TuZ9slRAAewQ6nhIMma5/0hEgXHC/6l4uSe6NE13XGHz9C
 eXWMq/jP4iOk8ZTs5IY/KS+PbMTnwXZ7bY2RlfyDj/toMg05gOBivJ7g0F0h9I2HzZaoSZio4cX
 rZ0Dw1y/DFOaU6kp9H0c1EE3z9sDu1K/d5v2jH9k/FhMsFASwex7GT/GMzPGkKSjoAifhBxn7nu
 8Kf0gVGwrp8Xmok4iBS3kSTwdwwm+2vqMckmctJ0BEt7W6PHDAvBX4jZSRk9S4qcT+waJiJ0d+2
 W9qSmMykWqdB+C4WVqxOMHbXncn7FwWRQt4TJWC5KdFiJB
X-Received: by 2002:a05:600c:4fc9:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-48fe60e4794mr69806055e9.3.1778867199304; 
 Fri, 15 May 2026 10:46:39 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53767ecsm69260415e9.10.2026.05.15.10.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:39 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:38 +0200
Message-ID: <20260515174638.530310-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504192351.3971764-1-bernd@kuhls.net>
References: <20260504192351.3971764-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867199; x=1779471999; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rkaRaysGX43wq2eJm6uaB7oaUGGr8mDG4QwIcuCz+Y=;
 b=CaGEAlOiWo3QI5ImCqdAk5k7yWz2+C5opHLZvVCDJfso5q5+LO63TWUxpEDyNqbIGB
 y3SaKCw5HUFIQ2UMNRdcJQPGsuiTuKlgVT0hW+D40rHY4Li9CaktP+nyFx3luGiYVWw3
 bqyW5p1s6pyKVIHxWKz51r2dCZWhqoQzIAKbI568eov/riBWxEcbwqEJgfWOUb1eueFm
 92IP0RmJ2pNORrbNPBxLmBlV8UzXUBp88cGY+SLwLnTEnWJ2W51Qmt7wcMmiLddIXwvF
 ATnsn2P0043rlvq05xRYtTo5wZZwTKF0HugJxLOghrdgOdbWh4MeYumIV48a+EARM6Ay
 WXcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CaGEAlOi
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.67
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
> Changelog:
> https://downloads.apache.org/httpd/CHANGES_2.4.67
> 
> Fixes CVE-2026-23918, CVE-2026-24072, CVE-2026-28780, CVE-2026-29168,
> CVE-2026-29169, CVE-2026-33006, CVE-2026-33007, CVE-2026-33523,
> CVE-2026-33857, CVE-2026-34032 & CVE-2026-34059.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 53fb05a5c8..44e2ac24b4 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://archive.apache.org/dist/httpd/httpd-2.4.66.tar.bz2.{sha256,sha512}
> -sha256  94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a  httpd-2.4.66.tar.bz2
> -sha512  49031a3465d956ee3b755e65810b6c35561ddd5fac2c624a273b733c238e115b914cd7b246837e5a3090ccfded6e0b8b3059bfd1f8ce4419081c805a38d05a4b  httpd-2.4.66.tar.bz2
> +# From https://archive.apache.org/dist/httpd/httpd-2.4.67.tar.bz2.{sha256,sha512}
> +sha256  66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4  httpd-2.4.67.tar.bz2
> +sha512  5ae29fc8edb253453271613cb18754de0d943d1f82361059c81f8ebe1f057b894675506550bd1341bfa9416226b569a7bac08f497c53e8bb6dede87f4f41eae4  httpd-2.4.67.tar.bz2
>  # Locally computed
>  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 3b1574cb78..e113088372 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -APACHE_VERSION = 2.4.66
> +APACHE_VERSION = 2.4.67
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>  APACHE_SITE = https://archive.apache.org/dist/httpd
>  APACHE_LICENSE = Apache-2.0
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
