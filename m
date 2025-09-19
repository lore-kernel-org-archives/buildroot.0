Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D0CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5206D83422;
	Fri, 19 Sep 2025 12:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziUbfhqHLH6x; Fri, 19 Sep 2025 12:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2043831A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2043831A0;
	Fri, 19 Sep 2025 12:58:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16395E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38CAE6109F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPar6o2jZ7Aw for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 141BD6108E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141BD6108E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 141BD6108E
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45f29e5e89bso23704435e9.2
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286683; x=1758891483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJSxKskW/Bg9cBTKx+LaHX0c1HRBvMA664UegiRsYig=;
 b=sVWIOvaVlbCtmWpcn3fCwIg/dDUFo4P5Jp/iNaVQXr04Aj/bgyrkYmCaw3HrfKlnlE
 gM755XRLnjwELzHRBAXrSzjwzkxaFxosDw2yJ4Q5+GaN87AESx6PcS+71myN1kiLbdSM
 +CgVWdz47de7HLcGXuknyWWjmi+yXEr2LokDwVNQ2JcYhliR3r/iuNDMqHDT4A2vLMP+
 pjm2nLM25lUQbFKw7Qfhe0uig85zix0H/VGoCKF7c8XnQULkfWziY3qU3wNvnhfYs9O7
 Gpmlm760e57oDH5qxhXAIrT/o1uC+cihXZKmUS49agCHuSg40WDrCLchyuXj3cRgupcf
 KVXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOMz4fexhaaTxmQL4fKCp+PqXkLSfMGfpBn7lOxGus3HKIbEElMy5Ye/d0jDr5vtNfDZTASHCfsF8=@buildroot.org
X-Gm-Message-State: AOJu0YyyTVFRYvvuE1qpoaKVcwIAO6vmlhvqRonP8iip+nH0A1wjUXpl
 KZI62AoDHtEM7hk10NkZYjvKtfhTMU9i6ggU8cPqgSXUviulPxtS4iNwBsrN2t1ZcHM=
X-Gm-Gg: ASbGncsTmdpHFmct0EZxg6UTSZOIzVezVdKPdMnhnrvzRLq1aQ2MPVKvGorlgtAHMOi
 keABElkeWVAZkekT/ALjYCwQaN7FMVeuHCliHtIOB0CVNySJRRIE3krqE++KPy7KYdrKZ8mvnr8
 SrI2bwSC/lKEGNBbW5fM9NPSCTBOMt8jXytybabXaHAuVSUIHccRg8Hg8C+TnqTUTCbJbvH0PnV
 YQNSkq6FI6j8KQ9HzqR2atkmJm4ayigSdqXHj5TTQpZO2FUmkxZFVwu5aVvELdCPHskxB+xXkA3
 Ml64TxrJSmtbe03gK6fM4dtfPtX1lSPSocmIxa2te2tRH15ooi1g6sB+hOAVorwbeD1kOFuTUOO
 +EYqsX9lUP1wI3gjzY4Ye2bSnpA==
X-Google-Smtp-Source: AGHT+IHtER0N/lyrjEJYg2v4m01H4g5TPGYVJtCEVYGd9ES/fBnc1jWIVYr0spPqioD9EdNmuoEBOg==
X-Received: by 2002:a05:600c:a01:b0:45d:f7f9:9ac7 with SMTP id
 5b1f17b1804b1-467e6b64fcbmr26528785e9.6.1758286682849; 
 Fri, 19 Sep 2025 05:58:02 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f3252260csm88926615e9.2.2025.09.19.05.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:58:02 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:58:01 +0200
Message-ID: <20250919125801.137833-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aMKgAvthoDM_oXwo@waldemar-brodkorb.de>
References: <aMKgAvthoDM_oXwo@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286683; x=1758891483; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJSxKskW/Bg9cBTKx+LaHX0c1HRBvMA664UegiRsYig=;
 b=C2wOGUlVoqdXKnay6XvKEN/fWXb/sMGKZBGVdTTvV1jy3IJm0pV5HelrD7NOIAPDPX
 t8h/1yBkpNP9F0OzNkl82WAxemrAorPOxSoib2dAPMoMMtGxr4vRye6VXqTPHkuC+Xiy
 2rtA/Y1IoCnixjPp6SYv3gcVfhbsvHg2IeNXausnLWjcGytW3/zRhm5jyZrvBqOlbDWY
 ZMrJua71Tc76Vnw5geUPvSLWweWzzINkeifNHMdLMw7urR7NFoSYpUR5LbxTlamA5c9R
 jdE9V8t/YzddfPLaCUDiLx13ColgmRyoBOwHQtBwaZDcPjmkepTneN23iBz6UX2GPFXh
 Dp7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C2wOGUlV
Subject: Re: [Buildroot] [PATCH] package/xlib_xtrans: bump to 1.6.0
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
> There is following compile error with gcc 15.1.0:
> 
> auth.c: In function 'GenerateRandomData': auth.c:320:5: warning:
> ignoring return value of 'read' declared with attribute
> 'warn_unused_result' [-Wunused-result]   320 |     read(fd, buf, len);
> |     ^~~~~~~~~~~~~~~~~~ In file included from
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/string.h:548,
> from
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xos.h:62,
> from
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtrans.h:54,
> from
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:79,
> from
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/transport.c:55,
> from xstrans.c:17: In function 'strncpy',     inlined from
> '_XSERVTransGetHostname' at
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtrans.c:1351:5,
> inlined from '_XSERVTransConvertAddress' at
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransutil.c:188:12:
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/string_fortified.h:100:10:
> error: '__builtin_strncpy' offset [130, 319] from the object at 'name'
> is out of the bounds of referenced subobject 'nodename' with type
> 'char[65]' at offset 65 [-Werror=array-bounds=]   100 |   return
> __builtin___strncpy_chk (__dest, __src, __len,       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   101 |
> __glibc_objsize (__dest));       |
> ~~~~~~~~~~~~~~~~~~~~~~~~~ In file included from
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:105:
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/utsname.h:
> In function '_XSERVTransConvertAddress':
> /home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/utsname.h:54:10:
> note: subobject 'nodename' declared here    54 |     char
> nodename[_UTSNAME_NODENAME_LENGTH];       |          ^~~~~~~~ cc1: some
> warnings being treated as errors make[2]: *** [Makefile:696: xstrans.lo]
> Error 1 make[2]: *** Waiting for unfinished jobs.... make[2]: Leaving
> directory
> '/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18/os'
> make[1]: *** [Makefile:796: all-recursive] Error 1 make[1]: Leaving
> directory '/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18'
> make: *** [package/pkg-generic.mk:273:
> /home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18/.stamp_built]
> Error 2
> 
> The update fixes the compile error.
> 
> See here for changes:
> https://lists.x.org/archives/xorg/2025-March/061900.html
> 
> The COPYRIGHT was updated from 2005 to 2025.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.08.x. Thanks

> ---
>  package/x11r7/xlib_xtrans/xlib_xtrans.hash | 8 ++++----
>  package/x11r7/xlib_xtrans/xlib_xtrans.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
> index 9595a73d0e..530f2e858a 100644
> --- a/package/x11r7/xlib_xtrans/xlib_xtrans.hash
> +++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2023-June/003399.html
> -sha256  1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd  xtrans-1.5.0.tar.xz
> -sha512  e8091f11d4ad2b14e01de3eac56bdf2267ea26687ce66e3056374d0d02e049480c0b27c482f8828a0efd086f1e4c485108ca4dce3f83d66c1896effa3b38b228  xtrans-1.5.0.tar.xz
> +# From https://www.mail-archive.com/xorg-announce@lists.x.org/msg01797.html
> +sha256  faafea166bf2451a173d9d593352940ec6404145c5d1da5c213423ce4d359e92  xtrans-1.6.0.tar.xz
> +sha512  e0ac4a2df0eeacdf23cedd74fee063a8eea81d05c4c4c9a9a113b9b4238db7cacb3c831973ac647fe1a5b06426dcdf0b2f8be5ac27862700333269880e25725b  xtrans-1.6.0.tar.xz
>  # Locally computed
> -sha256  22616bf00b6db85ee3164775a95206894af987b85ff1a7703de55644bc722a39  COPYING
> +sha256  3fe68a84ab89e82947e560316ab70cf2d02a8b978ae5cf4fbdfd53fc5b917308  COPYING
> diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
> index 001705bb2e..152c080a87 100644
> --- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
> +++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XLIB_XTRANS_VERSION = 1.5.0
> +XLIB_XTRANS_VERSION = 1.6.0
>  XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.xz
>  XLIB_XTRANS_SITE = https://xorg.freedesktop.org/archive/individual/lib
>  XLIB_XTRANS_LICENSE = MIT
> -- 
> 2.47.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
