Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95559CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CCA942320;
	Fri, 29 May 2026 08:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqwSL3MJ1Uq6; Fri, 29 May 2026 08:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E7742313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043419;
	bh=HtDd85JdcrTjPugR9ZY8mt8WexgF8NBSEz1vp/DCdd0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QzLodHcnU5cDUQryarB0NJ8WIt5Wx89K8C2UMzNKcB//LnUqlQoTyr9O4AMvEmLxs
	 K6b9mLpIWFeS6Z5QfSpqO1eFUkNQsnJoZsoljj/PF4/tK/EF8u0ymYTFOJgx0gGGG/
	 aHxaLnSUHlE+aRVDHxZtUhLdekRFYzqk59cNmD26mLwqZ9fF1mLeSegqJMhpjIGq4T
	 gh4IF3TwesEBSl3q0wMbPzz3fb7+m8ap6BCQBngkP9fhPyrLFrixS4OqbTVbJhcjcR
	 zFEXXjwuHiVI6rP72m5tjtFkQ1Lp02QG/0FpbRJyAkEPS4XoGhh12Kq/r9IwN8odge
	 tchdZFsYdNBvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E7742313;
	Fri, 29 May 2026 08:30:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF2A228E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D14534070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QEaXIDY4N2H for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE9E6406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE9E6406F3
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE9E6406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so7131642f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043411; x=1780648211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DtSBnhE+HWjGIlPT5GKOxxQEQAt4tjwyl7VWRGjOiwU=;
 b=nOn7ToTOMXD9NEMYJeT51dE6K1hCfyQWlspgqLHOyNBTeeKtZcLNm4wJMHjeg9v5eC
 1e1ynV+EnDyTaY6IC2T1vZevU4EwturuFRmjgMSNzRZXmsicEjHuBWlPk0wjbZouOTCC
 H2fFrTeNusyaU+ZvqEhsvkTX6zJjqfp/udMIVOpqF277R7o8FLOuFtwFr6s1k8b2FqdV
 fZ1gwmjNX7p+jVDQf5EacemQyN+Z4pQh19Mw2XT1oMQtdRxYa48/YRwiT44Qrg9n4TIy
 Xctfa0kj3yzx61uiJK4AyAXJeulhEB9Kw6PeOPy2mVRVho82al1qizDhfDmCSLwhHngA
 tSHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xhcX65aUsYLb8G+lwnufHfF3yGSwz5ZWs2TLUjqlqzBVmMwE6ZAJjTFxI6keXVz4e3K1Vz//UW/A=@buildroot.org
X-Gm-Message-State: AOJu0Yx5dHrdrVN0fy8SIXa165Q8un1lA77GYCzj8MooCSgxuumK6dtP
 25jUPlIb3sNxjegZiaRnuN661UGyahWXBo3BZW3lKN/B/E3rz7EWPhgLLV3aKRQm3Cg=
X-Gm-Gg: Acq92OEFhF/1W9G/TPsWCZ1zVgH+2iUrVXPfPeePqSyQ7OEDDjB7ublkiiuSF8VWCKb
 pizuuddXZr/dcX/7cbx9jvt9cS5U7G3CAutAEDAuSKe/lRSIT8AmOq8PcJ/SeRVJ/7OqI0WyFRf
 AveImQv/0SGQg4mwUBGH1XHfuldWMJ+02jXWK9Jsh6MwWt7cUYSoB98ze7gewQUBF8c1mUhnr+D
 1RpL2wGdPexzDkLg3VSpqmBv8XJBXKTj2L2PY4S410kOa6IU8ccQztXhupidiqJhJb1ZvrDFEmf
 QR+Cy48IGlXY2YVtEB+vOgqK+2DaDP5uvFA1GblEk372pQLPZuCT8nRMHXaVqGYovEPLCfQPWal
 5FMDC+4MAjiWRDwqzHBYV9rIZgn7gq/U38TSnSY79zXci3kj/0Fb9sI/DXRUu0HTqiK9EYxvRSu
 qlp+INASWq+Bnm0CtUb0BQqOb9jOuND4LzEuhQhz57av3mgJmTG6/TVQvNeQ==
X-Received: by 2002:a05:6000:43c5:20b0:45e:93d6:359b with SMTP id
 ffacd0b85a97d-45ef1425d2cmr2485162f8f.9.1780043410705; 
 Fri, 29 May 2026 01:30:10 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef357635fsm1748509f8f.33.2026.05.29.01.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:10 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:10 +0200
Message-ID: <20260529083010.58996-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185447.3298731-1-bernd@kuhls.net>
References: <20260511185447.3298731-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043411; x=1780648211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtSBnhE+HWjGIlPT5GKOxxQEQAt4tjwyl7VWRGjOiwU=;
 b=a8K2+1sSDKlmoG1mN5G4e7StT3O7Fhw/0UPpbqE2Z2L7xM/WVWkTjaHsws9Imh1B7z
 ZCAIB5M6SyiEXHZGM/jHzE1bEkiDjGAMLNKi9FlaOfzBxTvEbuAbJ2uupFWWnSRP09GK
 aMVprYceR4R7bRQgXQih2t18gSKq6uPJyIwov1IuFF6IarRsad4b0zWVWAmF7EkI+YhT
 dnOHAgY+oQiqR06G0aW5a3EqJMjarTiCiShV27Dxo2hFDc+XNqWDQs+tvDetpbtEAhga
 W9VLAOLHht/TRSg/kJ0i/eLmw+fgFOhHqCbx+7d8HgNaM76SXL46SkCYmwSwXCGgHSjH
 OHDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a8K2+1sS
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: security bump version
 to 2.92rel2
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
> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q2/018471.html
> https://thekelleys.org.uk/dnsmasq/CVE/
> 
> Fixes CVE-2026-2291, CVE-2026-4890, CVE-2026-4891, CVE-2026-4892,
> CVE-2026-4893 & CVE-2026-5172.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/dnsmasq/dnsmasq.hash | 4 ++--
>  package/dnsmasq/dnsmasq.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
> index 258f0b1e93..74ee5c415b 100644
> --- a/package/dnsmasq/dnsmasq.hash
> +++ b/package/dnsmasq/dnsmasq.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
> -sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
> +# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
> +sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index 74fc053089..d7ae8a3312 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DNSMASQ_VERSION = 2.92
> +DNSMASQ_VERSION = 2.92rel2
>  DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
>  DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
>  DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
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
