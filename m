Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E161CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4644484742;
	Fri, 15 May 2026 17:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OaYOYjX4J-3; Fri, 15 May 2026 17:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5159184730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867241;
	bh=oJ1IBdxn/Aa626XUxo6o16kW6lwoTrSr1BKFYg/98Os=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hNd2uQz8xSuiWXj6jufjCzUnFKnWyR/gx3VAz4LK51C17PFk7Uz2Na0o5gFfSEUd1
	 4+RleBLNUtVxkgc9n4JeVSWLecmIfsAXVDBglptPE50fbTL1bNg/Ip+B+xKdeF7xjv
	 C/ZiljIQP+5GDUq9D5+zm4DYfGcxGw2VebwItsn4pgBf/Yj0WghZAhGjY95Eq2cM8b
	 QouCG3HKys4hsKS23HxwePgYDztdFofy4rtg2oxRFhgWypiCtYMhiV3fDvmMm9O9ij
	 N9j4N5iUPmXTmTqGCqnLhw0Mad4A/m8VHKmIJ8d6/6XiucHlqbtfY7gKYKhWvTlHTp
	 0Mi8Xex+ipU2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5159184730;
	Fri, 15 May 2026 17:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26CBA23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AACA8455D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hBVdPVGfA7F for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E565484552
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E565484552
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E565484552
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so616955e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867209; x=1779472009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1MwDi9pKM+twDCqcuZQ/akUfPnEVOQIZ1LJ+cCQ/U+s=;
 b=gA1zj2OFZYK/VuN6u52w7LTwv/eOldeQbB9crhRXUJFjOQJ2RAtxY1xYbUYHlp/MaQ
 0VWB/GjoutzELC69dnGY4yBQIRgBO3Qptg8ta/9hRlflFbCJqzXbKe8yKtLgcbhTD9Y8
 q3hHbOkbvH2FC8liv3uB5xVe3/Cs97/fANTElYtldgfuWlBns/lG436NZv8ptUcDFsxt
 PghOKbZYDqTiEjzgnGGU1+rCwdZeH/NPCpoGwjeEDNIphzrVTqcF/mt+YtlrH2QsY88f
 FHfO004lNuGIVHuObyjFBZsdT8ox7D/UL5BDH21wgaa/mY11edXX3uCRuDR9k8JpFwSy
 T17g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GnVxTYacOvKvwQ4/lnCw5S2BcZVNZZE22UV8DIVmCYsy31nYoAGLjJFQisWA2oY1T/kB7e9+fe1M=@buildroot.org
X-Gm-Message-State: AOJu0YzPqYE746AhiS+0BNosger23UYWtLDhC67rzRly2nbsAqIEyaGd
 aD+va6NK05U01Si+kkdTo/IcMJ+qEjnbr7viK7pyDolMIWuvcehskXEZQYFSVLQWs40=
X-Gm-Gg: Acq92OEuOp8gwWjeyAyfN7/vNaCjv7oPcUVRh+WcWz9Gv6CyeUkvfCE9NijqIud5nLd
 Irzqlum4v0thzTsq7G7ckteGLmdWRXVwi48ID9BHh1kq3C8GWnn1+BFVHdYadtdku2K7BqnB1Cb
 i1RsuNyBOqrEsXI16nbreaOOsCiY9TZBkJxxwOW1sQCAaz7cpA2gHtQnyve6sW4knV8hcpVJwNK
 ON8Bj3ykgKVA4x1F4FGdHt4KmqgQ36RVFU26QIeGrjmpmxxfTwKyl5EM2VeOuTzvMYO/glsquya
 qyk11ku5rsL5ZDLAq0tErWoUuPHL+8cMZOYYYox1ATBm/DludU2AC8o0VfIkkiyhjzFv7WL68LV
 TSB7gxuP06nAKB7t3UHoLkl74Ncs/VeycB1eCK0hW3AEegaSbW/rymD6iUh585Bv812f+7otSBi
 z1OHLLj2iFHB4IYjRBHuphw5RZYSggDuYVakuGicIi/P29
X-Received: by 2002:a05:600c:4897:b0:48f:e6de:1cb2 with SMTP id
 5b1f17b1804b1-48fe6de1db4mr39653825e9.19.1778867208990; 
 Fri, 15 May 2026 10:46:48 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c834besm75539575e9.3.2026.05.15.10.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:48 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:48 +0200
Message-ID: <20260515174648.530802-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506190239.655752-1-peter@korsgaard.com>
References: <20260506190239.655752-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867209; x=1779472009; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MwDi9pKM+twDCqcuZQ/akUfPnEVOQIZ1LJ+cCQ/U+s=;
 b=M/skE0dVmLVDrk83Nl9ml0fKJ3YZWxG+odjDhxxXe+sGxclA8btCbaKGh2veImUnQn
 ShBUZbPe0ex2WdJyFyg1dIc+T+kVY5VZCkdURN6vkfzOiGJEc1BJVdehiaGwB9bskCKH
 5J46xkjKZR1QyfGLRKnu+DJ33DCKvwB/idwWgZLh0R9gjZUpyhsSDjZE3ig+QJ2cjc1F
 MjDJeMdo4RBBL/cRWBH5OamIU8tWRhAVmhSVrcZp7Gi8Zf0qD80K61u55kPpsnR3LMu/
 WZEU/3qQXwWHbbZvlWtu++5sc9Lpl7cuHEi1ydOpP9M+tLEsJpGhCzRe9hav9tRKE31P
 R89A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M/skE0dV
Subject: Re: [Buildroot] [PATCH] package/xlib_libXpm: security bump to
 version 3.5.19
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
> Fixes the following vulnerability:
> 
> CVE-2026-4367: libXpm Out-of-bounds read in xpmNextWord()
> 
> libXpm uses a number of internal helper functions to parse the XPM file
> format.
> One of these internal functions, xpmNextString(), checks for the NULL
> terminator when looking for the end of the current string but not when
> looking for the beginning of the next string.
> A small XPM file with a malformed color table definition may cause the
> function xpmNextWord(), called from xpmParseColors() following a call to
> xpmNextString(), to start past the actual end of the file, causing an
> out-of-bound read.
> 
> Advisory:
> https://lists.x.org/archives/xorg-announce/2026-April/003690.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/x11r7/xlib_libXpm/xlib_libXpm.hash | 6 +++---
>  package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
> index 3582169891..72a330f1ad 100644
> --- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
> +++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2023-October/003425.html
> -sha256  64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43  libXpm-3.5.17.tar.xz
> -sha512  52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e  libXpm-3.5.17.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-April/003691.html
> +sha256  ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900  libXpm-3.5.19.tar.xz
> +sha512  dd95a70af0ac2fb0f5876e69ad19b38128c5add94b00238ee41a22634aa4dc56b22c1b47c4baa6a1ab549308d11b302c250b405322da8a64ea24441a065fbada  libXpm-3.5.19.tar.xz
>  # Locally calculated
>  sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
>  sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
> diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
> index 1239ba0d4d..a2a652df17 100644
> --- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
> +++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XLIB_LIBXPM_VERSION = 3.5.17
> +XLIB_LIBXPM_VERSION = 3.5.19
>  XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
>  XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
>  XLIB_LIBXPM_LICENSE = MIT
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
