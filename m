Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891AACAC589
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DC57615A5;
	Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNsnxaNHqhTQ; Mon,  8 Sep 2025 10:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76BED6175B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76BED6175B;
	Mon,  8 Sep 2025 10:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 169861D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 089F46175B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_zyGsg9zY9o for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABCBB61514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCBB61514
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABCBB61514
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45debcea3aeso564015e9.3
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328944; x=1757933744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNg89y0E+eVTQQO/y4gVUq7ABpD1w9BdspaB107DXBs=;
 b=QxLxofRqh+M+ebI5gKPmYiyJEm7vfFqQef5DmGDCrttcGXhYQtGpiUg9kT8tf8Rf/y
 C9qzUtB/r26Sb0AjD2URYse/yMRPhJYvI5qgj4AuIfVAmoKN/BKsiAoBeKxpQoA9b2D8
 15WhS0waGkyUTncdcPv+pYnN8DVpg6EVU7AGbGDpIcj+WI/UI+BaxTSJAJ0Zw7z4VWtj
 VqzDgNEZyP7prQQmSdiGH+lvl4Pxmvnc4z7LSxPL1f53OF/QMljYVh+APaWgHJ/1miew
 Wue2Nvr09N/dhptmY7sbzrV8ALCykW+6LebzepmPbnVp4ZB9IXDHIbSW6//wIXJFNWGE
 y7Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWSvnBAgPJmmq1tfPtrMFMlyfXn2HeNi8jUgfz6VJH2ojg+vPgNCJPoGWDEA0q35es4/Usgmy2ueY=@buildroot.org
X-Gm-Message-State: AOJu0YzMzKjOmkfvZPNREc1+HFm14vdd/YrtvDRFCNbTYUDjklas5kMz
 exgk4FfSWWYMO57M9mM92JiaaIxK5PVUIgHgTPY9hVQX9i6LcaHOlLGZ+taJJn265myKDGu3XHv
 HFtDK4ms=
X-Gm-Gg: ASbGncv8DE4aQzIgpY/nHNo8RWkQn+++uzv5UeEXSwIN3sScVEQNQTpNAKNZaGbhL7o
 hGWwdZKUjQXCDiGHHHqMqFxTLA1ZwbtNhD1mkBG7y/fjuQBp4wzcY5Gqjf2W4J/7CGuBfXZD6cQ
 rdLcJfb52WgAVJn6tK1ZT3wQkQyOv0lqu0gkQkiF8GwEDiyHwJxbMinkP90US0g/D3T4my/h0rw
 VAZiFLHghrZ05O+VOacnk/K9JBSvosI4O0GFdn/pkSNdBtIxie970VMwro0vrkeBO3OMdE1FRbS
 8Ad2ar9t/UoToZjMc3DGQiA9MYsZ6UYSlaiqxfb6JGZBE3cGTYJr8omPhgHKza9qbbvP5J/u6fH
 3GGj2As612+cC05ssunt7iV2g69B2ZkuQDk+nLo+UDKOsn2u8A772biToUt+sFZKKm3UzKUkt/U
 6rl6yYQuJNR+Cs3UmI0lvDqT3UMxVomqEjcwk=
X-Google-Smtp-Source: AGHT+IFLje/cMu5vl6PxJ0fRiMxqxr4oXSaw+99oCvpfsAVkeRaEHKdRGhPVBwokmjavAxlSL/mDhQ==
X-Received: by 2002:a05:600c:5247:b0:45b:615c:cd2 with SMTP id
 5b1f17b1804b1-45de2028b99mr55881995e9.8.1757328944380; 
 Mon, 08 Sep 2025 03:55:44 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm141044495e9.4.2025.09.08.03.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:44 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:43 +0200
Message-Id: <20250908105543.681508-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250817163144.1217520-1-ju.o@free.fr>
References: <20250817163144.1217520-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328944; x=1757933744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNg89y0E+eVTQQO/y4gVUq7ABpD1w9BdspaB107DXBs=;
 b=ZGToUJcUQh9gqK9J2jTCcytMKzlqD9ll7pR/g1I88cRVFU5ImIbZO/qvWlOslHqwbV
 PNTDGGEXTvQT9qda2TLXD4jSbf8lhNJ24/+GB/SXCfb+GfBIX4Q6bvAx/UBg/c+PfrTr
 t7KS5iKjWWiNSQdDLRs2IZTQI4TlK/zyl4XosDRRXSxzFA8MK1txP9crt3Qyi8njcwTW
 wwJ6L1dRoYXp3KB0TfIVNsuBpDtXsfwkSO22QExt0lbzp9ZBT6PWzJUHfd4x+0ulmsm/
 VsvkABK0+5geGiy2BYiUmLzBufxGfY3IrMm6tIYdZv/JLeBSuRRmrhYKCizlyaoUz8C9
 Jvcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZGToUJcU
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_systemd_selinux:
 fix test after bootlin toolchains update
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
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the tests.init.test_systemd_selinux fails when building its
> Kernel 6.1.26 with gcc 15.1.0.
> 
> This commit fixes the issue by updating the test Kernel to the
> latest 6.1.y version (6.1.148 at the time of this commit) which
> includes the fix for gcc-15.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685949
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685950
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/init/test_systemd_selinux.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
> index e9bb3405cd..398cfbaa82 100644
> --- a/support/testing/tests/init/test_systemd_selinux.py
> +++ b/support/testing/tests/init/test_systemd_selinux.py
> @@ -12,7 +12,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
>          BR2_INIT_SYSTEMD=y
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.148"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>          BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
