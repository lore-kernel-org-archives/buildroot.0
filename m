Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554EEE7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2714861292;
	Fri,  3 Apr 2026 10:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T8Fe-Oo77jF; Fri,  3 Apr 2026 10:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0696A61276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212130;
	bh=0z1oJsUiynDom/vYwZGavKqYjponQH9FXdDFHMXPnWo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jKqWcDE946PRc7VJpXOqB9VlLLCa9KK+uI7wnDs/V123ZOJfE+FpVWWI6ZWiEOnJK
	 mToegFI/58CNDPuyXduyA772B6ehYp0ns/ywJV4iP4wyrIZI9HheE7af0bCEvcZYlK
	 SzPuFmPVRMG9EkqaXuOkw+OmMFowU4U5nkXqTKk4MwWi3NtCPs5ONFF1qHjCwFc2og
	 Rxpt3cTGuy6WoXp03QhORZmbNlQ1YmZRWCEE/ziL+KxP+DIzdCUisowMN/f2iONu88
	 +26N9J1KoFdK16MkxBxoiPFsEb1PnchnXw72nG0lle0GtsJoDjYYJRMXzf6WPetlZx
	 /JQ/x6B0yYmPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0696A61276;
	Fri,  3 Apr 2026 10:28:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 169FC2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42F4C608F9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCQwmO4udsOq for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 375CD608A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375CD608A9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 375CD608A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so965571f8f.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212115; x=1775816915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1+MShLnirfVgWcPIRrfBpySNDA0mycDTbx1WsnGE7iM=;
 b=sYG2xEOd3MAasvWQjEqDXrBJm3qGDMxyMrlphiskWOCZb7KAtACHbZ3AIpkHf8B8/t
 gBHXi3Oqn47rGhQX9qU1NteeAJcefk1sB/9YTVaG/6qnL33NP/kP7q4Dmh/lCfoSw5+Z
 748TbTYuuB5ucFHjBFXrTPpKjVUERjHRRWn40b7ds4my5nw6WVjCKLu7oXfJFSIoSQWU
 FGamYn8GzXW7ZRyD9eNZvhIlZ1UN7Y9+bdIVy1mnZ9Q9QfI4g2b5SE86ospo6yuVDBQL
 xJf1Ztk+4pO6b1SGj7Z7eDZrn+X6SteHfXV3jww2c4mLYp3yj1doo1IukKJQE/ndFo2E
 +KGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjnmqQSZqgLxxvbEmeEazNq3e0K1YV5jk0fQfAR9bitKXDvh+vIs5w39LHqpYG1Om60aIgAvfy6GM=@buildroot.org
X-Gm-Message-State: AOJu0YwD9jmQ4KEZgBcWsQ/Gd2u3KLgYc5YU/yQ0rRs/77KRNIGWaAeH
 t2TrOngvY4vY82fhwDHzhX/7byp7xCWvoTeBZe02CSjGnldsqtUoDGwyHMvGfu6j9iU=
X-Gm-Gg: AeBDiev7zeljsoCTz3vraKIh1V+GXxaJxTudgDqFAg2eoCv+zYCmSTTfvo9OL/rQA3H
 s11ZyqJfqbIXcV+D+2GcszZuwRZbjgT0wHygPUCS1msFNRpF2iY6p0jH5JSHWOzq0xCszX4QR5A
 cSnPW5Bylhn7t7ZIfIX1QlT+EceoDOrlUW2tjaziKSpEJ/6rYGBKec2FqULrmURcxmMe37EykyG
 2/dXWStru+duettpX5dO/dICub9M3KZYsJ2ziDex32gnpyYKWU/GCwbF7zplufLJPCBuzpGcPO5
 B684OIzXi+jTntE4evCgCo85XLZ7m6ocwc6FGcHH/S3t/hgGVJrkxCkE1E8NCDZ9LOkFqNcBbAF
 lKraAl9PtXJvtDIxEzzTiJ/OjDubIGOBMaiu9KTpQS7SI6KGh9C8mIQZX0t7RVX7yX8NRBr8mv+
 gtLUQxVmFkp13mFbeK
X-Received: by 2002:a5d:5f92:0:b0:43d:1bf6:920 with SMTP id
 ffacd0b85a97d-43d2928f444mr4006809f8f.14.1775212115257; 
 Fri, 03 Apr 2026 03:28:35 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c54bdsm16828958f8f.16.2026.04.03.03.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:34 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:34 +0200
Message-ID: <20260403102834.210907-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327182155.192855-1-peter@korsgaard.com>
References: <20260327182155.192855-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212115; x=1775816915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+MShLnirfVgWcPIRrfBpySNDA0mycDTbx1WsnGE7iM=;
 b=dfj7bjJ8EHgAmtn9En3kaOBZZX8F2mRldub/FkI03eGZiZkUSt1EdwLN8QFkjidvGk
 T6gjlXZSwREGh9XNqVkfY3eV0zK92SJpXflBDKaaD3mFIX7UeWGQxjfqTkOvSmzW4R1C
 LvOuwPDM/sUhpZMhBef2VSzANncxyuWZ5IebJvr9wOV+LUImrPQ8DLGq2H+fq5l3bMv8
 69ySmFC4lR1d/HloNP++oW4n00ZA/4Eun9vkkjtnz4iJ4MdJmfH+gg/9uaPC4flzkfqp
 WXDGGtbNq/5hCJIZAoTnBWm8bLNcoq8pU8YT1dcwjcYIQNeghphxxq340x8oZrflBR7i
 3+dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dfj7bjJ8
Subject: Re: [Buildroot] [PATCH] package/rauc: security bump to version
 1.15.2
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
> Fixes the following security issue:
> 
> CVE-2026-34155: Improper Signing of Plain Bundles Exceeding 2 GiB
> 
> RAUC bundles using the 'plain' format exceeding a payload size of 2 GiB
> cause an integer overflow which results in a signature which covers only the
> first few bytes of the payload.  Given such a bundle with a legitimate
> signature, an attacker can modify the part of the payload which is not
> covered by the signature.
> 
> Bundles using the recommended 'verity' or 'crypt' formats are not affected.
> 
> For more details, see the advisory:
> https://github.com/rauc/rauc/security/advisories/GHSA-6hj7-q844-m2hx
> 
> https://github.com/rauc/rauc/releases/tag/v1.15.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/rauc/rauc.hash | 2 +-
>  package/rauc/rauc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index ea537c63b6..edfefb5a7b 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256  603dafa5085b6b964c74d5f57a154a1489af2b415dd20c6ff1447815d02c094f  rauc-1.15.1.tar.xz
> +sha256  127a24cde208c65b837ae978c695a00730f1094ee8b6c7d48cf58ef846eae340  rauc-1.15.2.tar.xz
>  sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index ba30c70dad..54974abc09 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RAUC_VERSION = 1.15.1
> +RAUC_VERSION = 1.15.2
>  RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>  RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>  RAUC_LICENSE = LGPL-2.1
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
