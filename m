Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A1CCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E13661056;
	Fri, 12 Jun 2026 11:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8yTV1div5QJ; Fri, 12 Jun 2026 11:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B67760F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264222;
	bh=oH0Vkb3FapiKUh6k9dErncKs1e3lry20nUQxSyU7ON8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IitJ+FhvxrAKfWst1eNc3T65o/iEyOZYIcz4njMPWZAha5Zi1vaid5lRs4KMZVRM5
	 qusDE9wFL+dEOSV3wx/NPswF7+deSgCg5j0xwvEVkcmvW1/459BAmOVKACYhye0kCU
	 2+tChb0cMcHo78ZxOYlArHt3rysHjrowPCfcOSm/G+SEp0ZX8T2ry1g8UnV0t2GUK5
	 diV9SkT6U8+hXTzX4TP5iQ6GELLl07oXsqwOgxtrE7uvVnO8F5PoS/Wv5oXp9iUEB3
	 JAVa4cPTQa1LMPEqZbRzfV/2v19Y9esnv2waEHWeYUBjTu9OHVdB688n82inQ0sH66
	 JCAGSUk9jztnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B67760F95;
	Fri, 12 Jun 2026 11:37:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24180237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15C2F406A3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADh6z4bQTgZr for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 227AA40695
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227AA40695
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 227AA40695
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso681282f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264215; x=1781869015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WasyEaBzPbP/P4VY07aQU7ZP8WMb3ZtC49F1Pka9MAk=;
 b=RuM7Cn0nSanhLUgjfXgFnQ2X8PFAo9zX/6dFOXEc+n0xxhPKpAjMpcAYa9iZ9xlSuu
 VaEwrr63XuQsHFvZQZfF0bit8wval02lZDeuVbgOldh6xf0u1Dy7AntejJOJvDys3PQ1
 dE3QXITqsHIJqKdnFNSAQco2SkwmjzUmE4071WKksYXM7U8MmCkMopwGNXS+899fwOty
 ijKt4dJVqeMTEEw7vq0swW8E0IeKm30N/b48fBESUd2aK3f5/4QFYK0V4UfGWK42oByx
 qwD6HsUiBzvd7vTKZEfs1Is1auMewiiixmQVF7/Pz8fCmJY/Uj32++ugBwM1taIsGu/7
 rlJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Lc0Tjsm9kkw5U8j9YqL841tbQaQNIihdRdJDsRjyAb06pXPmui3eOa1qncKbOZMzFeP8STUr6NAQ=@buildroot.org
X-Gm-Message-State: AOJu0YwCVLNHjlFrzW55uQfJz20/3wUBFK3Fr/6rVWsypFnbbKYxFgQa
 wUkPWcG9dxzkmfBkcFbVVszL4v4Gdx87m7L0/rMVPSRr3R41kr+UgxafoE3Pm6IDZBSzh9hWyOP
 q+Zrm
X-Gm-Gg: Acq92OFdzdrVwEYKqf6u4B2oIWspuhDeSwpzz6g6ChVEJ7vZ6rYIVM43ykp+e4mOT60
 qQr2UNx8ybpRnJgoXP9X67wOyHZ+xPksDZ4n/F/QKD5gyT+f13XO8JRV0GJFq428XtkSCxBzOBd
 ElplPqESKF1GWiepP5g92bF9eNIpIRc6seebL7oBI+5Nh7vD2dFsQigaWx8AV8scj9Px2Rn3Zrs
 zEOQGnqP757bxOucrXfRN9APd5kouzCcN5vu99Wt0MiXsbnUScOJzVFmhw3R8zzlf3ZNhvzyh2G
 2R5jWZk5DPQpg3MxMh+jrvGMfJ4J16RHja5VirYCoTPV6rl0v+IIFiJOjwzMoBkrxAM58DfUsg6
 e1xuhDvS1NU/CsDbLsu9MKPcnRd0t/mPkN5o5K1UZmiVdGaZ0IU9FeF1nYhNU6Z3hfyN4n9vzrp
 SDmqgU3vFhnRDi5SGGaLQFOFjUrw==
X-Received: by 2002:a5d:5f85:0:b0:43b:5097:6f62 with SMTP id
 ffacd0b85a97d-4606dbf1645mr3783833f8f.36.1781264215138; 
 Fri, 12 Jun 2026 04:36:55 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2d9becsm5068149f8f.34.2026.06.12.04.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:36:54 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:36:54 +0200
Message-ID: <20260612113654.250991-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608095745.737902-1-titouan.christophe@mind.be>
References: <20260608095745.737902-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264215; x=1781869015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WasyEaBzPbP/P4VY07aQU7ZP8WMb3ZtC49F1Pka9MAk=;
 b=Pqg1ByWNwJMqVw0WYZhMJmMYI/ZT4EeT7MpOxG1MlXBT6NH5EPW/RKwi07yZ5atDwg
 ljt4QazDjbrpggI6B255sinUxA2T+q6CVQopp/+F8WKupDe9o2TQW32Pko4FkP/brqpV
 kp3BmrCnzty3bI8hY8JFSwTKOJPR7gSgnkSFJm5Bxvgfli2q37H/eT6S+i7ABPKRX3Ci
 CS6qzcfMb6RgZUSb3UdeQz93ACpoYJyQlt1mY/22CjOkRYZyj6f9b/dHEA5OBjfBugby
 rAyJp7sZuZ+7Wf8uq8kdQTSCyC3GEnNxdU+59DHFOGrHqB2AqtU2ppILJx5kxo21TA0L
 FV2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Pqg1ByWN
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/runc: security bump
 to v1.2.9
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
> Fixes the following security issues (in v1.2.8):
> 
> - CVE-2025-31133: container escape via "masked path" abuse due to mount race
>   conditions
>   https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2
> 
> - CVE-2025-52565: container escape with malicious config due to /dev/console
>   mount and related races
>   https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r
> 
> - CVE-2025-52881: container escape and denial of service due to arbitrary
>   write gadgets and procfs write redirects
>   https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm
> 
> There are also numerous bugfixes.
> 
> See the releases notes:
> 
> - https://github.com/opencontainers/runc/releases/v1.2.5
> - https://github.com/opencontainers/runc/releases/v1.2.6
> - https://github.com/opencontainers/runc/releases/v1.2.7
> - https://github.com/opencontainers/runc/releases/v1.2.8
> - https://github.com/opencontainers/runc/releases/v1.2.9
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index d25d8facfd..33850238f3 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  9785c144c97974b52b6091b7a79168b73681ff574bc8438b44f3f5f8c112f171  runc-1.2.4-go2.tar.gz
> +sha256  8e298469fc729d37920a7ee45c7cd587a4139149abccca485e08d616b80d2fad  runc-1.2.9-go2.tar.gz
>  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index 51ac32de26..0daffa1368 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RUNC_VERSION = 1.2.4
> +RUNC_VERSION = 1.2.9
>  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
>  RUNC_LICENSE_FILES = LICENSE
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
