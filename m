Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D08C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 10:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E05940B7D;
	Sun,  6 Jul 2025 10:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFHfUG1VlUCf; Sun,  6 Jul 2025 10:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6957A407DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6957A407DE;
	Sun,  6 Jul 2025 10:42:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF0D515F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A593D60AAD
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oca2kJ0vJsFy for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 10:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=david.laight.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1C8C6081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C8C6081F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1C8C6081F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:42:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so1633939f8f.3
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 03:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751798532; x=1752403332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UR/QX/dI9y4PqoYKSYjbv6NcZ7jT7PMFUUHSY63bIr0=;
 b=FNHNrGumHcLqo4kenldHeuQu/DeL6zYxSIdXA5oEq+jFb6KGVYHfIsSu5IS1nCfCh0
 o7tbXsLN63YNT0nld12wKYFTNENXLmL/WHWOaghP8NfcWIBW5Bj6QyrHJr3a78qh95az
 FNncFU3wtxr2eelrvJttL2o4EjNtfGQr98+YxF3NKNsFdm5XjcI0na8yEy44ujk1wNtC
 j6aWn3t7B8YGQ+fZvYDP49jOfA4hf72Zn/+Hxvs+ppg3yMWMu0HixnCUIXOX2e2ixXm0
 RGysCkIMpG12ajGCj+uxgcdNYQlfP4w4dvzGFfZrvuKkKMLO8IXujfGCxKE+WUuILcxX
 KQ+Q==
X-Gm-Message-State: AOJu0YwCzP7syg8xf01gHmgg1649v3BDpTwnh3LSgYQDlmk/BcUN3cBJ
 O7zKqJMMJVpzbVhzYwnipunhNB5Z6VH+Kz9vVJ8lEQ0TuDq5xxX54gkGkj4x7Q==
X-Gm-Gg: ASbGncsObxzjU/KOHIrjpYSYlMOGWSDYGD1Hp2NwRqav0Rzr+fDr1rMY7jgeCHRWy+7
 KI7/e1PlfMmB1kOlrZ2i13YVcdXnqGUuOhglkPvxvv7jcdLmO2Hp8IbUEjFNIPik50ZHw5h5ZiW
 FXBmp2yJG9DfQVBFODecapM6BVeT2iRL2l0gk67/Y8mDzzIKrMS1IGDi/UYvlDGC/J/NLmUAzUp
 anm2Ijaqd7nQGV+M/3pkOs/jnqKJcAxX58tFk3Ss47hlDwWhk2Sd3ffkPLSTyEFgM7FQvf7vRq2
 9+BSTf9hZB9r9hjAU5IlLuui4maTPv/P25NNZJe/i7hixPCSSeS/8q95ASVbzF+UWNRMruK3dD0
 CsNqx4w9DAgshnG4yCg==
X-Google-Smtp-Source: AGHT+IGch2xjAZuX7T+SNGZXsv7KVGwoQxld5dUfcspe4rZZa5Oom9dvi3gCkztSJnaVsAda7uzq8w==
X-Received: by 2002:a05:6000:40e0:b0:3a4:d8f2:d9d with SMTP id
 ffacd0b85a97d-3b497036cdemr6041413f8f.38.1751798532375; 
 Sun, 06 Jul 2025 03:42:12 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285dc08sm7294611f8f.98.2025.07.06.03.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:42:12 -0700 (PDT)
Date: Sun, 6 Jul 2025 11:42:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julien Boibessot <julien.boibessot@armadeus.com>
Message-ID: <20250706114210.1669ea00@pumpkin>
In-Reply-To: <20250706101044.840248-1-bernd@kuhls.net>
References: <20250706101044.840248-1-bernd@kuhls.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751798532; x=1752403332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UR/QX/dI9y4PqoYKSYjbv6NcZ7jT7PMFUUHSY63bIr0=;
 b=VKtAI0/zz/6w4H+iQo0jM+ufDtmk4Rpgu1f1fENrT1STqPcnsi8KSB8BD112FEEskZ
 CtdiDwLE2kHGvMtIb3KdNzPePLoxjVzT+YingVK+j73lyFHD9QbQSU39PAJrB9G1exBt
 7w6ys9sA+KkvkJfhmxi2z3gyvLNhxTcHoV9ZmEAtQ8MsoXAN0t2N4bqAxsYZ5dy3zZdA
 773WKs88iWW11gs4WCpHJk+juBjnTgUXclEioRMdZvBG40JfDjBvwcsOmG1BvNyHzlmG
 rQq4RDnKsRAi5ux3PX//Gto5iv7o1/l95IIwb2VbzTmHNHsNLKuBBxOlGu8KTE9pfXVA
 cfhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VKtAI0/z
Subject: Re: [Buildroot] [PATCH 1/1] package/libcddb: Fix build with gcc-14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Jul 2025 12:10:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/723/7236cf5fd4f33aabd3178586f877dff04d754abe/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcddb/0001-gcc14.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/libcddb/0001-gcc14.patch
> 
> diff --git a/package/libcddb/0001-gcc14.patch b/package/libcddb/0001-gcc14.patch
> new file mode 100644
> index 0000000000..fe06d2512d
> --- /dev/null
> +++ b/package/libcddb/0001-gcc14.patch
> @@ -0,0 +1,24 @@
> +Fix build with gcc-14
> +
> +https://bugs.gentoo.org/919280
> +https://src.fedoraproject.org/rpms/libcddb/blob/rawhide/f/pointer-types.patch
> +
> +Patch downloaded from
> +https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libcddb/files/libcddb-1.3.2-c99.patch?id=9200fde5b926191737a8380a08cffa2998013945
> +
> +Upstream: https://sourceforge.net/p/libcddb/patches/9/
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +--- a/lib/cddb_net.c
> ++++ b/lib/cddb_net.c
> +@@ -329,7 +329,7 @@
> +             default:
> +                 /* we got connected, check error condition */
> +                 l = sizeof(rv);
> +-                getsockopt(sockfd, SOL_SOCKET, SO_ERROR, &rv, &l);
> ++                getsockopt(sockfd, SOL_SOCKET, SO_ERROR, &rv, (socklen_t * restrict)&l);

That can't really be right.
You need to change the type of 'l' to be the same as socklen_t.
If the sizes of the integer types differ then you've either passes the
wrong value (typical for big endian) or corrupted stack.

	David


> +                 if (rv) {
> +                     /* something went wrong, simulate normal connect behaviour */
> +                     errno = rv;
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
