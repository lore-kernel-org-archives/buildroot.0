Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0897C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 832A08202C;
	Sat, 25 Mar 2023 20:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 832A08202C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vVK-BpQRhOy; Sat, 25 Mar 2023 20:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59518202A;
	Sat, 25 Mar 2023 20:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59518202A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BEA31BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96708202A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E96708202A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5e3NBcr5GN2O for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E5E81FE0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0E5E81FE0
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:37:18 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b20so21092491edd.1
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679776637;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vMk1jjZTt9DmgtRbdLZYQ3J47MhbPi4Cd7K8tYPzU6A=;
 b=sDfjnkBs4mY08IfgYyp2zQaFr7bIfMUdMWp9NkB/CObxXfBjNep/W055+CKVuWmFUk
 UandKheLWrjkDSPaujTjQ6bO208gs6AnoNuXefYQRtfUwLTpe3Z1YP2ldbGz71MVhcbO
 s18lO3/5YufIo6q1WAm2VdH/dJzOe6pOZlywtSWq1Miop4mP0spqofZpsH6UBfKqS42L
 TybX/N2/W3rYBsdwgDh01CCbtmzO6FASc/UTKyz2aIeP8Lhd4UoqiCYZYroYqXCocuEB
 helvcaitbFgPddctRHXpr+BhaZ2RzuFL7QPOYD1Xl+NcVXgJMpfMoPBuezlgCB9ANu2T
 XdVA==
X-Gm-Message-State: AAQBX9c0sTP++Xsx6gDw3UozS6yuJ/+NA1FyrWyF/P1ujPSz12Xmi9ug
 BvSOURTw4y2zVKlrP549+qEcAg==
X-Google-Smtp-Source: AKy350bbuXMZVkD+AzTvaVitogCi/AJKYPPSfwSiabdo/iyBO9nLJwd+PUgHIIpF6EDoMFHHjDUTgQ==
X-Received: by 2002:a17:907:6ea8:b0:930:a3a1:bede with SMTP id
 sh40-20020a1709076ea800b00930a3a1bedemr9395469ejc.50.1679776637047; 
 Sat, 25 Mar 2023 13:37:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170906520400b0093a35f65a30sm6987023ejm.41.2023.03.25.13.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 13:37:16 -0700 (PDT)
Message-ID: <c9c5ba89-9be1-1fea-6ff1-2ecfc8234470@mind.be>
Date: Sat, 25 Mar 2023 21:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-9-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-9-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679776637;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vMk1jjZTt9DmgtRbdLZYQ3J47MhbPi4Cd7K8tYPzU6A=;
 b=JN35gjwhPtjHhYuUjoy4byQZPlLC9KEJr5eITkLRktEgM4NxFK4EFuKRGjVHX9Zfen
 cH9B7xeU28WM/i79OA+N/+qxhyaH9sLcoAdfydtUBPh5WasZralKBtuDVmUwN9xbp+oV
 KitB4wC+uH1Kw1MvpjDN69h9UsEY9Nr+ix5svejLZlsK9aQQ/dwHD12Pak0CeDVxZQni
 NAFfvbzGK+kOR4ZH49Ci7jD8mkhRecAz8yH7oz+UaVX29NtyaTHH2lCNFbp+VxVRJugV
 2nIRzD1UiNNYE+7eNWSdmwW3uVydl0f+Phkk2daOpV8CrxanA7aa+L176SHAubNWmpze
 5Vow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JN35gjwh
Subject: Re: [Buildroot] [PATCH 09/15] package/libuio: migrate to new
 autopoint flag
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 18:21, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Drop patch that is no longer necessary after moving to new package flag.
> Add patch to fix builds due to missing required files.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>   ...0001-configure-remove-po-Makefile.in.patch | 26 ----------------
>   ...c-set-automake-strictness-to-foreign.patch | 31 +++++++++++++++++++
>   package/libuio/libuio.mk                      |  2 +-
>   3 files changed, 32 insertions(+), 27 deletions(-)
>   delete mode 100644 package/libuio/0001-configure-remove-po-Makefile.in.patch
>   create mode 100644 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
[snip]
> diff --git a/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch b/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
> new file mode 100644
> index 0000000000..1ce91f01f3
> --- /dev/null
> +++ b/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
> @@ -0,0 +1,31 @@
> +From 546e07b2405455c03b7eb0d392c331e189913bc4 Mon Sep 17 00:00:00 2001
> +From: Vincent Fazio <vfazio@xes-inc.com>
> +Date: Tue, 31 Jan 2023 19:06:29 -0600
> +Subject: [PATCH] configure.ac: set automake strictness to foreign
> +
> +libuio does not conform to the GNU's strict layout requirements. [1]
> +
> +Set the strictness to foreign to account for this.
> +
> +[1] https://www.gnu.org/software/automake/manual/html_node/Strictness.html
> +
> +Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 101abd3..ef46171 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1,6 +1,6 @@
> + dnl Every other copy of the package version number gets its value from here
> + AC_INIT(libuio, 0.2.8, https://github.com/linutronix/libuio/issues)
> +-AM_INIT_AUTOMAKE
> ++AM_INIT_AUTOMAKE([foreign])

  This looks absolutely applicable upstream, so please create a PR.

  Regards,
  Arnout

> +
> + AM_CONFIG_HEADER(config.h)
> +
> +--
> +2.25.1
> +
> diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
> index a0285277ab..d5019af594 100644
> --- a/package/libuio/libuio.mk
> +++ b/package/libuio/libuio.mk
> @@ -14,7 +14,7 @@ LIBUIO_LIBS = $(TARGET_NLS_LIBS)
>   LIBUIO_INSTALL_STAGING = YES
>   
>   # Fetched from github, no pre-generated configure script provided
> -LIBUIO_GETTEXTIZE = YES
> +LIBUIO_AUTOPOINT = YES
>   LIBUIO_AUTORECONF = YES
>   
>   # Avoid build issue when makeinfo is missing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
