Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72FACD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D336162C;
	Fri, 29 May 2026 08:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXBGPmQKVuiI; Fri, 29 May 2026 08:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2C76161C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043464;
	bh=Wi26fxxHB/sUoGqHPTZbE0m99PQSib6sXIcVSERMj7Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EeMQI2ZDvoKQke7TwDNCdEfmMofW7ZGlDa1q20HWwgj53DQe7w/KIff8egc0tGyp1
	 q4W55kvqQqH2xYE89nuyK8gWjhGtDhJBSagtfx/VjNkdIvUnx43Et/N7oKrZ39sYZ1
	 lLL4Sck6ATd3Sdyn4es5Kk5hhMReg1XJ352jjsTSPhCuGocgC+H/eB9urLUQ9kZaFZ
	 Blq3prUs1dO129F1YMHdIwP63OlQI1y5haArfJkQ5YXYubCVL0jcT1C7y0a3PggYTo
	 acekSnQa4XkHlVwiodVnAlc5qMP8k+9kJeX2r1GTiAuRZIzF/JNjpGULB7zpuBtIM5
	 /qitvHURscekw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB2C76161C;
	Fri, 29 May 2026 08:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA4FC28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C2B4070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zQueyKGGjyc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94390406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94390406F3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94390406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so42495745e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043443; x=1780648243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9HKxHIgud5J5kj4SkdfY4HptGIBd60tr5/vIYDTI0U=;
 b=g/Y9XzGGRHURF9lyeHseeE6kidjOMmU4MA6QJA/CPcOV6uofDB0EPDnStyuBR/1buG
 EEDkMKwBU6uNkyP62vjH8NIFFvfL2zb9XppjKDiJ+hNJamlW/anfbDUkV/vQS5n46hE0
 74jRgF9iLKjtcoxve3+RVN4tsLYa9y5cP+hYhNOC5wg7FPt7ZKvQ5SDEwBvwa+5VQnWS
 /6JZ6B7YR8jYpOHAGmVs+Uug472VKNu15DFWrQWPVIt+0kIcsJvihTTwpsL5wGO4TVUW
 DbSJpJ4LQDfqdZBmNr6tdz2XnvwZvsujPnw8XTR9LbuKxMd8veWSXOzlWjJWWk9oPv+3
 Wd3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EyKY3iQUaDjnFQpUJc12FPZ8dYELlegoaTq3OGwETOkYSEhbUs+zn+OE3fcSl7mkhuQJAEVjY5u4=@buildroot.org
X-Gm-Message-State: AOJu0Yw/IFZx1EnCKIoaqml9Jo06WfTM61KvfNJWI8LWm0+eOIflRlzc
 xz8CHhKuNDhu2hTXw8JqJddae70geUFBJSO8DFrFQAL70MSo+s/hyFJmO8OELNQZOcQ=
X-Gm-Gg: Acq92OH+yPX1ebPk8wrfZ7xS67h6KZlYqRo17ot34ggDba+TMtL4GFE6oyJ918dsbVN
 7IkCUNV0TDcgbPRvz6xuqPHjf+UR+1jbUKy62lS03es4PCNzMwVREuk/9KU/OJgXl27bNJOp25h
 3uYT5FNJVrQxU090YpGDUwHhScQUI9uCrX5yCPF0ZT9V4AhRYXWVvZP5OSm+PyXDpgg3oeP8Wki
 ap3D0Nq8K2ofJDk1k/bEaYY4PRxNyknVpD0mhuO3azCKi95cxKcJiM3PvOcumTaQyUINQtCCsuw
 lXXC+Kttzelbyh1MhO45CaY0IICInae37gvTmUSyS8HGkM3ybuwyJKoCHX6Pc4GgpK96H61OyMd
 jtrkt/ciJdmPjXmqNqwY73vmCkjFa1YNjQSuiUqApk+TOJGOdKNixupf4Vng6XzNOYQdaqMhFIz
 rNUzwHQkmc1Rl6I+o/0SRghXZ6ELkkT8qE/9o6SN+9Nl0JFh4Z+vHfh1pA97ln9vMBB0D6
X-Received: by 2002:a7b:c358:0:b0:490:53b0:9e53 with SMTP id
 5b1f17b1804b1-4909c078feamr21319945e9.1.1780043442564; 
 Fri, 29 May 2026 01:30:42 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cab7b00sm29625165e9.14.2026.05.29.01.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:42 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:41 +0200
Message-ID: <20260529083041.60443-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525123125.2919307-1-bernd@kuhls.net>
References: <20260525123125.2919307-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043443; x=1780648243; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9HKxHIgud5J5kj4SkdfY4HptGIBd60tr5/vIYDTI0U=;
 b=Q1rXg28kHOt2xkgyiEG+4Wgp5vKHlGjXOtUDhQI+LQsxAmsBdlBm0I7YgMWFrz1ouz
 Q4I5/8kCmFJgecHSgDFKLhS4TAPL/brTLsWEgWzhfnYpLr9B/BcwOeGhi9C3OGgGYOzn
 9smczQlhlb2Afl6uVmQqRzLocNmG5AcEtFauP0ps5LPfACJCabzNiOVRk7SvrEa1QIkC
 60HOxta9jHgK0XRhESvy6M2N4svN/c2rDkn5yA2yclKDshwXFHdRz7lT1GAzV5gvu/oJ
 0/NJFtX96C/Ff7F13u8LB+s/Z9l/0WDo+EZjSZPdPHerXbTfoTGZ59tH4ACFPZTc5/6I
 nyNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q1rXg28k
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump version
 to 10.11.17
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
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.17
> https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.17
> 
> Fixes CVE-2026-44168, CVE-2026-44169, CVE-2026-44170, CVE-2026-44171,
> CVE-2026-44172 & CVE-2026-44173.
> 
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.16
> https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.16
> 
> Fixes CVE-2026-3494 & CVE-2026-34303.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/mariadb/mariadb.hash | 4 ++--
>  package/mariadb/mariadb.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index 216b3be7e3..ca23b36a38 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.mariadb.org/mariadb/10.11.15
> -sha512  98d1e54954b69cf87a96be7d76f80333f27832a29279e6b0a9615b830e171713222abcb9ec9b9a545c0fc4a0f9f8e3d4774babcabf534a6fa3cb3dfdaed0dedc  mariadb-10.11.15.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.11.17
> +sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
>  
>  # Hash for license files
>  sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index e2c0cee3d5..c718c1ce7b 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MARIADB_VERSION = 10.11.15
> +MARIADB_VERSION = 10.11.17
>  MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>  MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>  # Tarball no longer contains LGPL license text
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
