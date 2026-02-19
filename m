Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F0BE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD58B6123C;
	Thu, 19 Feb 2026 17:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aGwIkwOWTau; Thu, 19 Feb 2026 17:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 653396124E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522017;
	bh=Awkw2vJTycmNh+kcsDXXmAjYZa1Dl0BtVPUaGe9h2Jk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BXTBb4KlW4Zo/blZQd+AKC0n6phLuButYQmztHN6/QbJZ49UIMxe83OxIGs5hUUzv
	 0D9q4IsVTV3m0aXRKDIkfw5XZOA7l5QK7B8I5C/+SBPsehk9u3qTDs1Jf9cO5oXZJL
	 u6wbcZbSmS4oy6Bmoa7amDRamzXiAPvA+qNXtna0/0YmwSSDXkMGirzTzA2KjbgHfr
	 hy6eUzj/r5yaqkqDuJvgvszfT+tg6uBi9/wUgm8dHY1dUgepcwfRS7auIzRhxWkzk8
	 yZaUZVwo4eubOuSF1wYJmmvEJa2E28xtHwZQJDrwihbM/jqQj6cbVYswW1YyryQYpt
	 hdjR0jhUD6Bog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 653396124E;
	Thu, 19 Feb 2026 17:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D14D8206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34104083B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTP2NhSkOiIe for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B43BF403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43BF403E5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B43BF403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48378136adcso7617275e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522004; x=1772126804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3uw40EP/vb4gYKn1P3FrgHt7sUxRxiXNu3btOYARKq8=;
 b=md2ZyLXDrwOgdM3A8Hg9dAAMZz6ztGx0waICXUl4gu6KJd5FZj6yYlQ79etg6zsjh1
 qOfsA+nu41Suq/UIgoorR+Gf6Y19RrW3uJkOP/5tf2AhEPO2v2h/3Pi3jjhlbUCDJZ4q
 aw/FveioegVvwNABLMCLSz1+ZEWliLC/f1pE1SYcWPCoKASSWhT+8JwYhhVsr4G+8fXw
 HnicNoM4IIZYkqlE+2RJIBkiaRzLVStpPxin8rBfeQRvvYwrTWAvKa7Df4jWQIKlJNZu
 IaRw1D9nmArwMpboAO4YMBW1tJ9Q4gjVlai4JEwCVsCe7hegNdGv0Wi7TtKBigr++UHN
 tC8g==
X-Gm-Message-State: AOJu0YwOXFnn5bAjy1hpo4gc91ZzXRhwjA9xOMQgd3iR1SBRiUe+naO9
 lytT3MZZe2F7U4zKwBzU1FvfR94LqsvWsr9GDSo3A8bbqddUKLW/VnLhClXV8FLD9rAchE6PFZP
 EB0nQ
X-Gm-Gg: AZuq6aLADjMpqGOyKvT6noVoxu1PK35soN0SnRVgIyoaHHoGfTPbziZ4LKrtdB/Gnxy
 rlMZTXIVKl/pvOLk+ep8TsoA4w/4JSdQvJcm/UwSqEIcv3jNOT+OaOcAf/1B0L3nOSDrIvzOer+
 ooFsc1gec7jrmGPE7QobJc+ub0yuGr5pm5RgL5bL4fBcumJAhnA5H5Ur25VFhCOrvVVIN2tA2Rl
 RWqAUPilnZe6ssgadyMKcSD8Fa6vys6v4ji3hiRXRC4JxsdZqG+oHuRZhQgp5ZLI8UIR0AOkAhP
 PIF/QuoHCRkRfV9D0fBro20U7RVqjwCtuH9yIKNGqYZLN21sgU2GGo95RFlM889/4I0e9Dhq0nv
 8qKh3oDXETldVGXpk1pEoFoy/CfExvoQ147wdeVfq8pS/Y1NIkhXyL01zzIEDcyyUhEM128TsCX
 nMYIOCpxHuQ5gWo04=
X-Received: by 2002:a05:600c:8189:b0:483:6f37:1b61 with SMTP id
 5b1f17b1804b1-48379bac876mr293983145e9.4.1771522003622; 
 Thu, 19 Feb 2026 09:26:43 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f986118sm23776595e9.21.2026.02.19.09.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:43 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:42 +0100
Message-ID: <20260219172642.341421-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215144923.54095-2-thomas.perale@mind.be>
References: <20260215144923.54095-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771522004; x=1772126804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uw40EP/vb4gYKn1P3FrgHt7sUxRxiXNu3btOYARKq8=;
 b=YCgsVpkeZrBHkhN/VevB1xyhYEhPLC56ghW7+4v/ToZ50SIL3pfsfior32j7r2U/n4
 3brWs96uG4PUelDC9sXTfigQrQFu2KeYQNo9w5jox3kkHAGou7cIZPE0lF2WOxPjVgNP
 3Lec2iZ7I3bA9stb64KA/lciJXTOZo/1GjrctpJrD+H3YA9lGKzitYGvgehmtfCtxqv2
 7vtG9mD6DgWFdGRHmNRT0YRorkx0OVDfYibIHtKkVyeATaDMYA1LgqWL3ZGXg/ZnzSNt
 /FYK9OemSrG/CqrR4ScPKkArziZdmgQ/qJh0cFmNmuVzWQqN6UHWaURsUGDERSo26FDj
 Wdlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YCgsVpke
Subject: Re: [Buildroot] [PATCH 2/2] package/haproxy: security bump to
 v2.6.23
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
> For more information on the release, see:
>   - https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=c3bf1ac6709072bf9984c829c3badda5a4e8fa7e
> 
> This fixes the following vulnerability:
> 
> - CVE-2025-11230:
>     Inefficient algorithm complexity in mjson in HAProxy allows remote
>     attackers to cause a denial of service via specially crafted JSON
>     requests.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-11230
>   - https://www.haproxy.com/blog/october-2025-cve-2025-11230-haproxy-mjson-library-denial-of-service-vulnerability
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index 42f340fa80..ce5dae17e7 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
> -sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa  haproxy-2.6.22.tar.gz
> +# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
> +sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index f60cb1e08a..51878e754f 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
