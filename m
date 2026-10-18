Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12315CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 19:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CE26062C;
	Sun, 18 Oct 2026 19:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WPdFofxwSAF; Sun, 18 Oct 2026 19:46:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E7C3A6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792352761;
	b=CmPye5nA7CkM4f2LaLdkaLpUYJM6lZUH4Z5WUO97yIHg8ywRTGKalXq64GTxJsp3UG3u
	 oC+kQ8pJbjzumAwGN7HDP475xEhIHga6Uy40z8wpVIwWU8xLECaE4oh1fOnifdO2ZldvE
	 y16yWDPxJQNf7V9LcSMLSuG5JbfUqRfCFQV5ue+vk8lgEBpdX8IvJu46MTa0hyuwatgHd
	 SxCbNzORlJ7iaSzZiGu/7JcSF8hNtoxjyPAaVZ+9K1TYNsqnzS6vebSi+UdWFO81yiF//
	 KjhiLxNvmpx0eNqLBuCaepZcT1xGOoFIULY0Oh6tiXY6ORw5LDZGrt2nFv0nM2MUZvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792352761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Date:In-Reply-To:References:
	 User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5xzOoiAGYbiyg8w6hDQ/zulVufFMd5W+BAJlGnve6ZA=;
	b=BsUnPh77BE2mJrcA/WJjaWysLn17LF3VJUlivB+OJPqvvaqWN7YANzT/Vh7/LO93F4dy
	 qsvJlDv2F1hGLHl5CnUzqqC+jqEwMy63bOJG6KiYH5QsrUOuiFMKIxNVIo2bbdY4AMyE4
	 Owy6OvMU1XpfFptxNzY5bnwgTA1nwaiOR1ly+pEXuVH/T8NClwYprdz030tJYXfvemBG8
	 xrWTc30+maMA0eMaJXk/NQSU8tt/883bGNzIh0HuXcgh3kg3dcqclUlwA0XMZRf/zCjzk
	 R//ReVnjZrdtn18UqW/CIs1oonXzAeGWoKwxIQYRPi/OF7KkmuwjuOxpYeWXSh0QUeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792352761;
	bh=5xzOoiAGYbiyg8w6hDQ/zulVufFMd5W+BAJlGnve6ZA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OG83Qzm/hvRNtVwePf0UIo3er5CwwvjH84Co4X/GNxm0G3K2sYGqyB87VHqlLZxw/
	 OgYIkTGu+AdO4pJCg63cah9nvU6DA8xXqAe6oPRrK0UHNYOQ0UwAjCMyfOafahSp3K
	 Nt5LjDZ2NGHDaB33C7CYdLjFqKOMNxhZXji+6TfF8tNWHrGv5M61fthksGbTwE6lcc
	 5cRnFT+z/l5DgZCrZnaSWkAmXCJZIaNHAAP6U/jl8qg1HErSlpQz+3Lw/pu9VtRt7U
	 hNvtdZVD0G039f+37rfaIjGg9VG8cVRBTFkD/XgwFlEBjmu5nusm0HXtrkiwyC781S
	 F02r6x9S9g2lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C3A6060B;
	Sun, 18 Oct 2026 19:46:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5F762A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B809C80F56
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIjOqAkV3eYg for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 19:45:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C07E880DFD
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792352759;
 b=jU3hEKekfQdvqxSjH3e7GAIyePjIZcttAmFh5mMaiDXENrrx1FqFzj5k/XqATwBp84Xv
 3ghQNTIi2W3JnWVKPlo9aDJswMVdwiavZbwQg4A32egWl9orp6f4TzeifigFPN9Xor/O1
 yB8txd0mwh4/dHwLPrLy69lzm0RPiYh0YIO8yQTPvZ2yt72AIUiIPpaQdhVTmF2JT10ES
 9d/TU2+jy6iIw58CSDY8nFRQu9iGLWuxssmARtguEpkmuo+cv73W0MoycYVJs8YMQzlXA
 q/dIq0FU3c0REZW366gyR5D4aZLyGQRHOdfW86E/0Gw8KLvNsCJ0zH+PBlgNgmSsGIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792352759;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:Date:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=8j1GJ8IAsVHONdJV6kpfZCU+GsBIxAR/5BxQp0dflNA=;
 b=qUgzwWce6VqWtjvCig5/icqPtRHnVtnOjfzHeEPPHAjvySqllc9GEECp1vUIVx7jaJqt
 sIoiVytG17i09n9+zJwSUvARhpKUYH4vFjhAUX4HUiIh07ZJknFH62GW5lHYMOFAcy199
 CKz80a4HGsWPMxtg59MSb1PS3cTNf49fAQtzX1lZE2yOo5/ARvbe58tWNqAfa0xdNUIp7
 PgSR9fAueKkju/SWI8ltIGOnAiR2PeWJvBAmLhJep6HyjKSlAg5MvllpjZzD0zbUuZaDx
 bgf9M9Ujb+jIQAYLLRe/N6vASORu5jiAgZ02e7OOEVgFBX/KXj9oVtN8Bt2gKRu/wWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZJ+rGKSe; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZJ+rGKSe
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C07E880DFD
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:45:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso728115f8f.3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792352756; x=1792957556; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=8j1GJ8IAsVHONdJV6kpfZCU+GsBIxAR/5BxQp0dflNA=;
 b=ZJ+rGKSe4K0vhoRk/fYY8pItzHwB/S1ozYiBQvjW+ZdeBjuhEf0tn50tPb3DXjwkS+
 VwSXihnaY3N5UJK6F+jFMDw/t7YMq2tw49BvRMoObgfQn+R+L51VoeUgzr1vlJc/XwHJ
 26r3FhCi9LnAK/J9bCkizo19A9XjI9ZGY+0XSHF/VhBsTfoAbHK8YtcRs/BLjB63C4Zz
 hO9XclWNmdaXi5Nn/OZSWTELCFbDFMHuGiQ6xUn2MZRE8+ELf/jFNTZfsNHN/DwY5ycg
 0+czxQTZley+VZqtQ+XvE5cLJAl1sqEObUNNqLutKtY0H2gIxZ1HyPPN6pYWd/HZ/Zrl
 hG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792352756; x=1792957556;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8j1GJ8IAsVHONdJV6kpfZCU+GsBIxAR/5BxQp0dflNA=;
 b=ZZ0PCXoeaNeX7236pWrvnY/frhQz6RbAxiRWDPs6XSl84XeIlkl/nLqJr1mm40FYaI
 NknfXtq+eXHwFLl153JI1Rt4olX5bi+GRJGSY8seltLe6ZWgFZGX88ZgD4ujqGYvACxe
 3XPpJVno79jCWXW+a2u4KWwLo58P7g0fbRB4TI5F7a8t3/GN0PA3C2Y145jkw3RThrH8
 mIcwfWSbSkBuvMtQ9meeDZpQe1IN23lGHvst0pF4yq2TBdmOGdU8Hg7WYYHvxOijddZM
 t03VWUZA/jScIbO25BXKLKz+d+bgna14BoqJYsrHuBsLg+n8pB7z711B1/Q1ETYfcalN
 PtSg==
X-Gm-Message-State: AFq9FYKa5BhZt1a3n3BFyxJJ6vPAqTWG3BXrQt1XUJ43oGcYrbtIBSCK
 bfQEsTlT17VfHsdgnW8lr6v9tB8lHGReILkLtSa6jl/RMJAHAi/HUt6Q9iuuag==
X-Gm-Gg: AYBFou2/YyAumu9djGa2pN70yNwqhEukIg/zud07H30KVlmGKuNQLGWuXNyspMUeyIi
 zT8fFg4uNmUhJ0u5ZxN8wewed6MUJxz9HBHkiN2lv5aHu0kNbo6mfHwMOa8ABwugKpd/cbEbAfa
 qu9vyL0z8pL6RkTjcYQqB8uNTrUy5gAN90vDAfofZasSSiHetOjRB1Wsv44D4SuCjl7940xpAto
 o2e6SW3cKz4a9e1nRt+lFZJphrtRaA5DFM5YH8NbUyvE/yElWPSlZCY+HletC9VvRI9ef4sjvk3
 JXZWOooGCDnVdn3Evi4v7ZLAXE5+3rAGheyScRLE6H3/nZA942iO7IfFCN/8H0NoiKVc4sD+6rC
 pMS+GOhFGP/qaDhKtnXSujet+tdcUSqrmEAWqffyX/UREPdohSOb1JcofD+g7ByOsIIn4pQmYN4
 odXph5v08739spjaZzDrXKxEnpu9XeWmL+PNpVuxwF04P0+V+gb4KlATZXsCOaUgtoDjPESmOtQ
 Q/HdE+P2aLkMHCZLIpkYLjt1ZiyMunMQ153lNLoX4+YVnyo
X-Received: by 2002:a05:6000:178f:b0:48e:1080:3a92 with SMTP id
 ffacd0b85a97d-48e10803b6fmr5310932f8f.32.1792352756118; 
 Sun, 18 Oct 2026 12:45:56 -0700 (PDT)
Received: from giga-mm.home (253.81.4.85.dynamic.cust.swisscom.net.
 [85.4.81.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ee183sm18443469f8f.29.2026.10.18.12.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 12:45:54 -0700 (PDT)
Message-ID: <c5aca2bcccb4018ee1d1923ce3262177977003eb.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Oct 2026 21:45:45 +0200
In-Reply-To: <atUeDroTYvzii7To@windsurf>
References: <20261003210614.1376879-1-alexander.sverdlin@gmail.com>
 <atUeDroTYvzii7To@windsurf>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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
Cc: Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 arnout@rnout.be, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

On Sun, 2026-10-18 at 21:32 +0200, Thomas Petazzoni wrote:
> > Since U-Boot 2024.07, boards with CONFIG_OF_UPSTREAM build their device
> > trees from dts/upstream/src/<arch>/<vendor>/ instead of arch/<arch>/dts/,
> > so the files copied by BR2_TARGET_UBOOT_CUSTOM_DTS_PATH were misplaced.
> > 
> > Derive the destination from the U-Boot configuration, including the vendor
> > sub-directory taken from CONFIG_DEFAULT_DEVICE_TREE.
> > 
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> Thanks for the patch. However, I don't really understand the
> use-case. If your board DT is not in the upstream Linux kernel, why
> would you enable CONFIG_OF_UPSTREAM in the first place?
> 
> The whole point of CONFIG_OF_UPSTREAM=y is to tell U-Boot "use the DT
> from the upstream kernel". But if you have to copy your own DT, it
> means your board DT is not in upstream Linux. So, just disable
> CONFIG_OF_UPSTREAM in your U-Boot configuration, and use the existing
> BR2_TARGET_UBOOT_CUSTOM_DTS_PATH option that copies to arch/ARCH/dts/
> and does the job.
> 
> Could you clarify why we would want this change? I'm kind of missing
> the point.

This is indeed a valid point!
I've been looking into it from the point of implementing a BSP for a board
which have been already merged into upstream Linux, but not into U-Boot
yet, but you are right, for this intermediate step I'm not forced to
use CONFIG_OF_UPSTREAM even if it would be used for the same board at
some point in future (when the DTs will be merged into U-Boot as well).

Sorry for the noise, let's ignore the patch for now!

-- 
Alexander Sverdlin.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
