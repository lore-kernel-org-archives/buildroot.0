Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9461CCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F9E60BDD;
	Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPOrp-g0H7eU; Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958C561130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663866;
	bh=pX9qnc4ex8zbDZGqMPrD8knkNgEZ1lq5mDZLsfXHiN0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=giQc/3XGUBcV5NNLBtkevzLXvDeQcjoesnfeGoQy5ayrv0l+UpqYM0bj/CUsCwPWb
	 nFFAPNR/fRyB+jmCz+9J9Yn+zyvDGDUnjbH/zuXE4VoCKnUiwglMclDRPu1i47ATwv
	 kHOoLL4orvCbg0PFey72fpEnRJ6k5vgeOWd48Ug4qd06H80QtkW5YAU2fX9ZqeTN16
	 QeNmXCF7CLCkk6oKndSlwamgygP9UilsMcZcxGQfUvxGU3CScP5ThzYHXGZWsOB/Cc
	 2paTu0lzBTFYHOU3NntFIzV06Aau7I+qN5YH8gCjr2ycinPy4c3nlpmsEBe7wwcfoh
	 za1Tcpi8DE2Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958C561130;
	Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE1B3F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D40BD4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07p7JxK9GW45 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB85B40381
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB85B40381
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB85B40381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so23314525e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663860; x=1781268660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g2Cayl/Xakovg6xHDPvPx+u1sSbyyyidE/LxCKF/df4=;
 b=NSeMcZppCiiG7mkhGPyLusrm4ymq93t/wdSvMgFv4uy884en+GEii9utzKUYXM5FO2
 DlOwJdqSSA5tVRq/YFA86HHV1HVQOA/0Grjcujt/9iQh9wZvttS0Baww9phNWzbj/X0V
 wef7gmsac9U06WEgyF8VIDWd5TIhmUqw6dWBg9bVYyxIGrdZ8sOx/ew3NwShdL51Xc5l
 ILtOuNGXijynmIXUsr2We5Hf2A5BA/aJK+jcCLmxiCBabgOyGSHmnVFf3+vN26ubf2aT
 KgL3Lv4JT0+7A/njwvRmNWn9ciAaMqNr+ciKF+9lgoYiN0TFKrBoZFIeg75VQuR4y+sS
 nm5g==
X-Gm-Message-State: AOJu0Yw5tGgkTD0gA5TUgFDcKv6OQddrY4jq32Zzoeipra7EudUtBCT8
 KUXQS4k68oJWxX0cQOZ3Hr7ln3HhcoAZdLJe9edI1AkDtGuCp/OyKMJegf+Ev/L6npc=
X-Gm-Gg: Acq92OH1eYtq74s7EXAk/Nn3vLMJ1XpaRf9P/dav46RUfJlXTFzBXx92K+JnPt0exqn
 65nIcJ2kp75o+EKgeWJJEMWX9Yui1lQKe6ou4MOD4wfQcEpEeRggJ0ndIK9QHDdaw44/SgafAoG
 HD7BGS+VtHEYobdwb6kjclPKvl8CLg/Gsrcyhtx6HsuCE/ldoxSpOtyD0Ru0X/A93wW4kF/v4hf
 ZPiSNliNPqZ3Uw6HQuJQG+LMGGmp3EkWKP3Y8yTfaCtFRA4coCGWjFHrGhm/+Yzv1XvCf30ccI4
 Oxum3aHPo0P4o7jmGSmirol6ED209iqsXRW0Zii6OhyD5f4+2j9PK+DlZRwG5uplG9bvr0kIKdn
 WsyGCOjc5GGhoZdx2JtYvGGp76y2daFNf93MmA0RPdLqlE3cFIgfA/6xI1sw6wjcWbCHL56a+zQ
 K4nYUcURMTP90m+qqIdG1D4fBb8w==
X-Received: by 2002:a05:600c:314e:b0:490:9d1b:2022 with SMTP id
 5b1f17b1804b1-490c257bb25mr57421105e9.13.1780663859683; 
 Fri, 05 Jun 2026 05:50:59 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d2d11asm58965825e9.1.2026.06.05.05.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:59 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:58 +0200
Message-ID: <20260605125058.274950-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-7-thomas.perale@mind.be>
References: <20260529094514.178266-7-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663860; x=1781268660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2Cayl/Xakovg6xHDPvPx+u1sSbyyyidE/LxCKF/df4=;
 b=R6hz/dS2BpdTqMuL39U6EZIDIAxyorISxIgtja3rgnnEnRkPGCgSLuNFzTQ4MPaAo6
 XsvVb801XrW4iZaTRB5LGZpbmHCNcglu4Gp+PvNFJRPIKk7GOKHZhu71VaNLprFeer5F
 W4TPXKMtnusXxmnRqnjPhnPviUwj++a4N82s71zWMghT8e/yyDXsXty/jpeH9GhYoQwF
 cdl+F+5QTw3IP0xzcZY+amLM5kYqONjdrK0fbUkUXP58o6ydZHrSxooKIBxvCG17u/Jt
 ixivC/gSd9rGP+5RFS2R1PkAv6WuKBYkoaYUGZLLu5qryw0WNXhXHJ3PWSZQ/MpD1AUe
 pxCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R6hz/dS2
Subject: Re: [Buildroot] [PATCH] package/gstreamer1: update CPE vendor
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
> The CPE "cpe:2.3:a:gstreamer:gstreamer:*:*:*:*:*:*:*:*" is valid for
> this package.
> 
> The previous vendor `gstreamer_project` has no CVE assigned to it except
> "gstreamer_project:gst-rtsp-server" which target another package.
> 
> See the CVEs [1][2] ...
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-3085
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-3086
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index e9299e9e93..535272ed25 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -10,7 +10,7 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
>  GSTREAMER1_INSTALL_STAGING = YES
>  GSTREAMER1_LICENSE_FILES = COPYING
>  GSTREAMER1_LICENSE = LGPL-2.1+
> -GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
> +GSTREAMER1_CPE_ID_VENDOR = gstreamer
>  GSTREAMER1_CPE_ID_PRODUCT = gstreamer
>  
>  GSTREAMER1_CONF_OPTS = \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
