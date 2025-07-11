Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30128C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8B761502;
	Fri, 11 Jul 2025 10:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYFJdYA1vaMd; Fri, 11 Jul 2025 10:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C64A61437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C64A61437;
	Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37900199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1D340549
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ma1mhPd-gtVs for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9448240517
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9448240517
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9448240517
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so1546265e9.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230697; x=1752835497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U00xWa/qATlUK8lCmUaVVtYjgeiaAwaPP/xE9I3GgZQ=;
 b=Vo+ksYqWdgQWWO7HdX0TgGF7MHMrNvZmsWZVGYv0N+Tk09PU0SRmLzcM792KOZ9pXF
 J+1DMtF+mDcdIOtm+8FOhnNoBqrdxE5J6FK9Flnp+fQbHzT9T/aye1sAQZ9Z900nEfor
 UhHGcNfomHDAPv+ScUhMFGd1gn7JQVwltWokNupUB0lIPHVnoNCOnD/gxN2KQH9iYLZT
 wA7K5+Z4FfnlqCJKRwg02HnJwlhubFL21I6AEHLIIKUebwC/TmAJTLviDigNGItZ/aVP
 1IAAoyQiZchvAric0uteyQ8ea/3gqKTjqAfoo0SyuXFo7wNU/Msw0OyMH5gsYq0eBTHB
 GL5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEPyKHP4HA2AVKhWu3rC4af9XODfKxdg7pjletu0HMs5aSBK1+3/yViowYBw54PeJXDnYlXmrd5IA=@buildroot.org
X-Gm-Message-State: AOJu0YwqSMB1evAONtW1XS6VLoFcJ5TfV66JD5un/KELYJWW1afQpuCn
 6E3dZc5XNRAd4JcdkrNFr3agHN2vcq8ir6zpbuTvWsfZ2uCn5WmDiW5Svws7cN155wZjbeH0m9d
 ce1SY
X-Gm-Gg: ASbGncvOeOxmXs9paXPut7gxPMDw9GSS2YtkAmaJzJjzq5uRJ26GXWEgqA57w9R3hco
 w0E38e1WgBf2PeP6FmoTfnnJvKn+JP0u5Lx+pcO+N7lw1tqjqY4E2BgcJDI407B6Dnw5n8pyvBm
 MgFd35A1IU6FfgZZ8IS7OkBCTLJyTeZISGfZd3rHio6GBFEjC/NdBVTlVLKy3dzLL2DS4mHQ/fB
 XIHZpbOCsqZD2buI722P4I61xBJNHZTcIjTZivLsg8U82XBA98aWpMhPWbdeErcuqdUH9RaGw2o
 KwmsRRzQd9baEzESKQuuEz/CDN924QcncmaSfLNoI2E1DYtsHZhHdndRNaVTmMwV9LdfdLtsEaV
 OPaJcvEHvglstxA==
X-Google-Smtp-Source: AGHT+IG0WQmHMor9K/EfZbNLddwsGl9TctbFe5fjEePa0jGrZsToCN0feFFtUOPXm414jU1ZMUl8wg==
X-Received: by 2002:a05:600c:3105:b0:442:d9fc:7de with SMTP id
 5b1f17b1804b1-45565ed632dmr16188795e9.22.1752230696606; 
 Fri, 11 Jul 2025 03:44:56 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455e6d57013sm9997685e9.32.2025.07.11.03.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:56 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:55 +0200
Message-ID: <20250711104455.824148-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703103316.1727024-1-titouan.christophe@mind.be>
References: <20250703103316.1727024-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230697; x=1752835497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U00xWa/qATlUK8lCmUaVVtYjgeiaAwaPP/xE9I3GgZQ=;
 b=cEh5guZwNO/G24JwGN/yM68Izbma0ljR78jMTEVDm5f1sQWgJiDm0FtB1ZHeSHbE9h
 dP0hnaoM6pxTlNdwdtojPThOG2w/78rUo7NpTL7o4/3QAE5//ReFSUY4tl5u49m3+XAO
 XywKUvgjg3hbneFmlxsNQtReKuplQufMU9qxr6lA4o0DK4mZbmMHJyVC51Lix5HGvYKQ
 FHwMm72++OxOqIwxTcb2X50boSeWH9zT9SHUsI1ZRoQsAQ1DlleuVv0ICnGExg0TvinO
 IRqFrWEzhvHzoSFUYUCRqlHNQLDmLIXFFLlS+SYPSMkGTATvhUAuvSqWmu9cExkOBeWS
 v80Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cEh5guZw
Subject: Re: [Buildroot] [PATCH] package/libolm: remove package
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
> Upstream has explicitely stated that libolm is now deprecated.
> Since no other package depend on libolm, we can easily remove it from
> Buildroot. If any user is interested in this feature, we can add its
> successor: vodozemac.
> 
> More information here:
> https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  Config.in.legacy           |  7 +++++++
>  DEVELOPERS                 |  1 -
>  package/Config.in          |  1 -
>  package/libolm/Config.in   | 12 ------------
>  package/libolm/libolm.hash |  3 ---
>  package/libolm/libolm.mk   | 18 ------------------
>  6 files changed, 7 insertions(+), 35 deletions(-)
>  delete mode 100644 package/libolm/Config.in
>  delete mode 100644 package/libolm/libolm.hash
>  delete mode 100644 package/libolm/libolm.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 23d7da13b4..4bc917ce00 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2025.08"
>  
> +config BR2_PACKAGE_LIBOLM
> +	bool "libolm has been removed"
> +	select BR2_LEGACY
> +	help
> +	  libolm is deprecated and has been removed from Buildroot.
> +	  https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated
> +
>  config BR2_PACKAGE_LIBWEBSOCK
>  	bool "libwebsock has been removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e6285ab35d..d2a3e9385b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1267,7 +1267,6 @@ F:	package/httping/
>  F:	package/iozone/
>  F:	package/leptonica/
>  F:	package/libeXosip2/
> -F:	package/libolm/
>  F:	package/libosip2/
>  F:	package/ocrad/
>  F:	package/opencl-clhpp/
> diff --git a/package/Config.in b/package/Config.in
> index 5109ebed78..39d9d6cf3d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1630,7 +1630,6 @@ menu "Crypto"
>  	source "package/libmd/Config.in"
>  	source "package/libmhash/Config.in"
>  	source "package/libnss/Config.in"
> -	source "package/libolm/Config.in"
>  	source "package/libp11/Config.in"
>  	source "package/libscrypt/Config.in"
>  	source "package/libsecret/Config.in"
> diff --git a/package/libolm/Config.in b/package/libolm/Config.in
> deleted file mode 100644
> index a863216d5c..0000000000
> --- a/package/libolm/Config.in
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -config BR2_PACKAGE_LIBOLM
> -	bool "libolm"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> -	help
> -	  libolm is an implementation of the Double Ratchet
> -	  cryptographic ratchet in C++
> -
> -	  https://gitlab.matrix.org/matrix-org/olm
> -
> -comment "libolm needs a toolchain w/ C++, gcc >= 4.8"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
> deleted file mode 100644
> index a95115d2fe..0000000000
> --- a/package/libolm/libolm.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# locally computed
> -sha256  1e90f9891009965fd064be747616da46b232086fe270b77605ec9bda34272a68  olm-3.2.16.tar.gz
> -sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
> deleted file mode 100644
> index 5c8bcd1f59..0000000000
> --- a/package/libolm/libolm.mk
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -################################################################################
> -#
> -# libolm
> -#
> -################################################################################
> -
> -LIBOLM_VERSION = 3.2.16
> -LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
> -LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
> -LIBOLM_LICENSE = Apache-2.0
> -LIBOLM_LICENSE_FILES = LICENSE
> -LIBOLM_CPE_ID_VENDOR = matrix
> -LIBOLM_CPE_ID_PRODUCT = olm
> -LIBOLM_INSTALL_STAGING = YES
> -
> -LIBOLM_CONF_OPTS = -DOLM_TESTS=OFF
> -
> -$(eval $(cmake-package))
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
