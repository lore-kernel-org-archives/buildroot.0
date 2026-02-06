Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC7EEB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2B761230;
	Fri,  6 Feb 2026 08:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkDiQmoDZjNY; Fri,  6 Feb 2026 08:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA96361279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365540;
	bh=B8W096RsFLTZb1qiDOGPscM6OSXujzmE0hfb2n5zdtQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UMi09BRGqf0VDDG/vLnXFohHuWpsZzo5Tbw5lA+EV/h/qEXbBnjwH30jtPKrKosds
	 rlOW6IxskvFZ+hnAH6bPXO5tQ2rRj8VjhT+i5iOWL2f4gXNX8BMitE7QTyvqvXvth3
	 DxhYa7Q3zHg8FJOzo/gOAOw6rJh1v7eDqot7MAYBxnK4M8to8vHTHoRLTTi3ZAdIhR
	 7EGchMF+DIeRSYzmTW1HEWlwPRKWlQYBdpIYbwBT7ccULmM9DKwxrG7DoiijDh3tnY
	 EeTM8/3/++5acO+0AlLdEpt6L05mGx5wy1BMm3W7XKyClXLSOhgKNLnye0rFVQL/N3
	 YrZUZIMuriLOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA96361279;
	Fri,  6 Feb 2026 08:12:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35622219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A50840A4A
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSKPTA3AWWau for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0749B40A3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0749B40A3C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0749B40A3C
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so3997675e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365524; x=1770970324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5OFyPike4OlfYHIB/NWUyvpPhDq8uOK+aIuFV/rX2Aw=;
 b=wlOt48qHBq0E/mgetE4gcFtIRU/AJjS41yKfMo7nVmlpzKlzIFSCZfPRKmbMTqh7Bt
 NsBLmZcGnq+SCFRfxSLhJslmbBcolAu+/T8OYaZjSPmsWOtnr9RZQtTZeiEMx3VNmuR8
 //XyABHAjcKzsPHchaI/PuvoiyMDEwqA01vrFrI3YpTMS86vHuxEH5FqEg0qZnMW5jDd
 GH5aA0Lj68AhzKT4liE6mkqAK8e/JzfbPdb51LpW9+XH6Ea4lzbJqmCCCn58M/68717z
 Zl0t8YC0/2e2dKwGYoLD7YnQU7F6q05H6BU4rEozL4xLXEMezrGyy4hjhfe9P+HGkYf3
 QIfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQeaNOLN5HdTD2twR0LO3emvXOdXLHppnpdUGtAl0QPETCfgbsgync7A1NfT4HQYNcm6lCffQR/2c=@buildroot.org
X-Gm-Message-State: AOJu0YzBWu9wdpm8yTbZdb6RD0bz/J2OEn1wbq0zw7t1bikXJjaP81n5
 ehniGLcou9GySBKpUxfRZgqyLEE2ifG8+8GZUxWPy9+lFM0H868/vYTZVYsgYRz4B8o=
X-Gm-Gg: AZuq6aLIcAFScKYGSp1zxw6pXcUPcJSAMcDMrjauE71aCCTWUyrhI1H+d3Vv/zUA61d
 zOolDLfTrCRfSqz9RSHa6RmDDf3f8hEGjbl7tbJAqB+G388uQmmm2ym+NMWUhSpUDaWvNIotXp5
 5cWl+sfWrVhOeTNjYYlYzSznrhPlSSBo0N473OJzHy5zedE2DSq967SbVEUtLpJJG/aTRXz8edi
 tcFCkiMd8/uJ1LZds4B8xGsk/DTzWLHyHJEEd/k5RdEl928R5s5AptgF4o9aex/hCqAc597QGhu
 GiJ2djq2aIDKWdGvgiY3bPQTmU3dXTkMqnC47/kCJN4E3hoCcVGoOa3gcKe9v2LJRqWMYAvIQTU
 Vy2RDJNfSpz8gPGetrzPdmQiwyeGXyJ+Duvzam+FXBxjsJdg/zgQhAHtEFqNXZQW8jtoqS4rl1e
 cg+u0=
X-Received: by 2002:a05:600c:4745:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-483201e4b18mr27121685e9.16.1770365523982; 
 Fri, 06 Feb 2026 00:12:03 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832097d9a5sm14860835e9.11.2026.02.06.00.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:03 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:02 +0100
Message-ID: <20260206081202.32903-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124162000.2396200-1-dario.binacchi@amarulasolutions.com>
References: <20260124162000.2396200-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365524; x=1770970324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OFyPike4OlfYHIB/NWUyvpPhDq8uOK+aIuFV/rX2Aw=;
 b=WHNMvHjlAWsP6jLxN3BmfgyLp+pFU/Xc6GPr4kKnDcIXevBjJQ/BgF5KAkiMeoVNMa
 CaCXacWbNnK0yGOvBdgqcLlFO3ETQ9KDJ/5BoQlahGfnZU5b/nei9v57FBgjNSTwAjdp
 Oevxw8S4z7+etq4/WK0fYyRVT0gsDmlGKRXV3iNAc+ibng0/JUoQeUtRErlvDM0+1ARe
 DSNyKwLx7y6M41gcIl59MQQRWpUsWAfHJoOO7tlmUXN5alVAXQDP+Efm4VbeW4rkBF/8
 C+t36JcyLJTlqbr9B/QIWsJpWXPPpvORY/4J7GXJGKgH7I0D8yJ6thr6Kqj9FbcIK9Ih
 IUzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WHNMvHjl
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f769-disco: exit post-build.sh on error
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
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/stmicroelectronics/stm32f769-disco/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
> index 45100509411b..293bf30cb3ff 100755
> --- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
> +++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname "$0")"
>  
>  # Kernel is built without devpts support
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
