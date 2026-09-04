Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8361C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D50160DD2;
	Fri,  4 Sep 2026 12:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1QfexsCLN4W; Fri,  4 Sep 2026 12:18:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E457360D4B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524322;
	b=At7iuHHB5B/HJ/RFQo8Md0p6XixOGZl5Iy2/RLgh7c/qpVAzXJDcL/vcHbcMUIY0MPDO
	 gWQFYW9+a9epGUa0yA4HOLbjGwDT7EPUbwl2LeFvvapYmyv7DfTYNta86xS5ePysoKD1A
	 E5VL7vSQn7WJ3XoM+qN+0p4u+DqGiOCYbc/fL/wS44yCcLZoASwaWN/qpJidWh+eo8gr0
	 Il9f20zbRdwZ1fnwulEDiY/IFg7vqKp3auST5/njfMcsyz5e+CTQ4PjPqESfXTWZjYI1B
	 EfYTs/5wsu93/UrjfqxS/BUkGbL0419Vhs7eoOcAbPHTXl0FeCHzs9GeYAfyszxYjvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524322;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HsKJJNvCnsQzAhbmZyQXdpjQBd+/KWwYh0Uq/5Xt5g4=;
	b=mtBiHs7CMfFzvpFTgeX+sNYqLzXZkPrbbfL8hGOR7nUW/3Yth4IbV2sd5YASm0Jmv5Wn
	 0P8CoON3BsBsG3BoH2ibzUNcjfySmGIWrlXeTYi2NVFmhXOogFzM/hKQlciuisoMAdzT7
	 kULmK2CGeTEEytcndXeAH+xijkREFhhjly17Td/CYBkvr0T8nBdB+9dVjEALA8fQ5yfXW
	 rmJoXvhZjbVPhDOZrnA7xXm1r4FlCcktAAOxMNMWHRNxeW2UGTx0usOavatfcAHV20m8j
	 dSoUQVJ7nQTgdiHvPtc6C+8rVMvkqZev1WTi0KY+WqWn2t5cMNrKzQZxZBKAk9cIlfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524322;
	bh=HsKJJNvCnsQzAhbmZyQXdpjQBd+/KWwYh0Uq/5Xt5g4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OTyIuCaskbWHms0+rKW3sv0V2gWTSPj41UDDXG5jcUpK3uHCr/tn9ZFua5caEcXM+
	 d2JKU5sNYivOrqi491rkFBp6r1b2J5J03g9HHLvnxaD8zu6nlNI7oiCyLCjRiCNV6E
	 lXtnBr5OXbr7sdLBRZJzhY5rXFKOGQEH5NN5Q+LiLHY217EINAlF31jNzpS+lxYNRO
	 huyP16Kr+Os9jONylTFNUMIT0yzQUC9jDobbXzicnTWmFKAY9wMLrkvYcIZAc+EJt8
	 jVfRFeH1zarWykiDNac1gUWsGyS/CJHiYyOjkXEGw0LBiaxS+jtREtagdFQmGjwv4Y
	 6Vg04+O48q4Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E457360D4B;
	Fri,  4 Sep 2026 12:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BEBE10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66A9180F31
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOoxBCT4P-fP for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 31BA080F20
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524319;
 b=etqTLg6qKu4UPPVKXNIf24zmyso684jxJB2adU529crR2AKR8zyMtkN6/DTMWV8dgFjx
 bFGN6AT4TZJqNzp6PyssEeH/ykVS04loib9ZuGs9TqKALEx1T8Jjo7RBRb26nQ4AvVwpj
 NYQLrElnc4x3sUsnmFargVRUHBVbTbnrP4JIliMW+beaGRNNaiwr4jojRheZXDBH7cvV4
 HAwGbS257Q+EeekzacaMN275yJ/TVt52yvUOUjZEjrx8yPyv38f+SNWP+e5I1Yt9qY5e5
 m38jaacAsFddT2+GQrzHnTkdtOo6tdgul7YFm358lZKX9Klk6iZjOs54wAgs9DyAwBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524319;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=tMasZRkapLaUYG1DlxycR0Y3dTaiHcGMw/A3PF7Bkmk=;
 b=Z/7fcUeIF9fq8CvtpFOQfXbq8Lz1Y0RPwnIakiA+T95YOlDauM514HO2HRAdgZga6LHF
 lagwRQWFjLU1SmbQSD9BSMPfGXOvE6Cwqq2/nMINkX7AJoc4HoCEpWZHrodcqE8IYDwl3
 JeIV9zG/y7oLz9KQHQEhDo1ZNn76GIRDqBpQmSosX3XfQGkqCxmvhUPnU0wxTk64KzsrU
 ZdI72ZJ5pyb7K9rsF5eLsH7icY3GLm/+3mM9W2Gcs2FALIsFdpTPM/rE5GubANtwxveO3
 RZiPis3NiVnf8nfcGBabWtY7R2r70wo6nFDD9Fx4JtgLSp7SLbpJGnIu4Wt1zPzemew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YvKB5xcw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31BA080F20
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso8157595e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524316; x=1789129116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tMasZRkapLaUYG1DlxycR0Y3dTaiHcGMw/A3PF7Bkmk=;
 b=qcw2C2Wx91qCNj6C3ETATWHH63YbQPBDS6Aq2E9SvDLo3Ajy6qyw6Z5vBZG/ZXzlKC
 HltA0ThYWgfFal5146JRvrscypd0aFy/EHmbtINEO6+5YEqptBMf/tcXZU7wYEXSxkuC
 Nu13v17pBtqNMRSdsXyYge2o7fa4u7vSUB2CFJ5mL4T+4Gunu649CQOLzIU21pPqoH1o
 WhkjIQ8EEANsfra6GMKsbeLgE0GRDFV6MfyTcyt4mQ3UMnLktmml0sEUo7DfE0ajrdL1
 tp6QsWc8YrpuQ1pBrz6qRBfrJfn2oz5KdZSig+i9WSeIIUMNtcyXq88xLgjN/Ph+fA3v
 NFAA==
X-Forwarded-Encrypted: i=1;
 AKwUvByRkNSZTPApV30VLdov1wn+O96iPvG1Lehb5WXaCIYKBY0nRGO/kluj4Ia+cIYgQLdE8+TpZHPhvmU=@buildroot.org
X-Gm-Message-State: AFuF++nWxb7+912jBiad10xecKkAY+ywXI72tQAY33o6kvVKuz4IX9H3
 wsQyyr1Mc4q++tLg99Ucy99dHKNIwDjM1uTQYfLMETb+6o/D2DOXaGlsdiZ3929BKkngcFEF4KB
 XSA+G
X-Gm-Gg: AYBFou2X0+/WBry1lv6aBODIaaB6HN+1ouyfYkfZqs+6XsN9DLVXbDONgVLPa/porAY
 pKxyGvzD8W7O/tk6FJ5e/b4A0Ks6gxDcMRz7RaM3YC4XA91pBjP0UO6aEBqJTmwNxQHZZWCUYbM
 VwoyxkGLnVufz5B1rtbg5DOoCz0aOuL1N1PBOL/eNKyngkTmizAjALm3KwTba40GJ+P2CR7nKVm
 JipUgKyiWDUR+A2Gi1w2GYw7neLdx1lWZFrmq7ZTlJYAbXaV/3mgzB2cgle7+kKXICDhj19+YVp
 jz3W63PhAC9QdvOMF4JgYkQOq1zHbUyn5KbOA/q0OyYBkpOZf8R+dV+Ty5uM0ealAoohch23uxs
 l1Ay8EWDGbehVtf9IvD5kpJ9kzz4NO72ajAuJ0jZn5TPGQZLRSiigbaiXgK4HtlsZowZhXjfOA0
 P3oZzwj0T/wMd6NkuFpa3tQtLCEFenLCpyoSAwGhx6t9Znnpb4HhvyiQ==
X-Received: by 2002:a05:600c:3b0a:b0:49c:f13e:e4c with SMTP id
 5b1f17b1804b1-49cf86f49b5mr39764135e9.9.1788524316127; 
 Fri, 04 Sep 2026 05:18:36 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf755c22esm66645715e9.0.2026.09.04.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:35 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:35 +0200
Message-ID: <20260904121835.405609-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
References: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gdb: handle lzma option for
 host-gdb
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
> For target gdb, we properly enable/disable lzma support depending on
> BR2_PACKAGE_XZ.
> 
> However, for host-gdb we don't do anything, which can lead the gdb
> configure script to detect and use a system-provided xz library, which
> is not desired.
> 
> Instead, add an explicit option BR2_PACKAGE_HOST_GDB_LZMA, which when
> enabled pulls in host-xz, but also when disabled ensures gdb doesn't
> try to use a system-provided xz library.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/gdb/Config.in.host | 5 +++++
>  package/gdb/gdb.mk         | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 2e1eed6f50..823c2e9966 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -44,6 +44,11 @@ config BR2_PACKAGE_HOST_GDB_SIM
>  	help
>  	  This option enables the simulator support in the cross gdb.
>  
> +config BR2_PACKAGE_HOST_GDB_LZMA
> +	bool "lzma support"
> +	help
> +	  This option enables lzma support in the cross gdb.
> +
>  choice
>  	prompt "GDB debugger Version"
>  	default BR2_GDB_VERSION_16
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 685d1fe992..ebb80072cf 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -293,6 +293,14 @@ else
>  HOST_GDB_CONF_OPTS += --disable-sim
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HOST_GDB_LZMA),y)
> +HOST_GDB_CONF_OPTS += --with-lzma
> +HOST_GDB_CONF_OPTS += --with-liblzma-prefix=$(HOST_DIR)
> +HOST_GDB_DEPENDENCIES += host-xz
> +else
> +HOST_GDB_CONF_OPTS += --without-lzma
> +endif
> +
>  # Since gdb 9, in-tree builds for GDB are not allowed anymore,
>  # so we create a 'build' subdirectory in the gdb sources, and
>  # build from there.
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
