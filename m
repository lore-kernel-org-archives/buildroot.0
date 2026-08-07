Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB93C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2343C60A6E;
	Fri,  7 Aug 2026 11:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-o9PdVsFVU8; Fri,  7 Aug 2026 11:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5555060A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103752;
	bh=eelBdb2RvM4QuGtfakldXppa8GwX/pVwmi8lw3+atn4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HAIWCYpga1H/XEGDtzcaeip5tyxzMTByWFAhOXm5ZfqaqWgDnPAS2WwKV9kJe165f
	 Z8qHZBm290LtiSw4S3Bf6oXER4Jh/TumAebSCBzPNGNun7bEli0/zqAUladrEa51j0
	 jspRmf85a7DWVEo7uujCSt9KwS4erra86xjCdlSVT9RW6XRzeLe7RfNBnPFIqrCoa+
	 1Nop98qk2TggKNne8IBehasp/8NR6q3D9goRq4XCexbP9C4gbHMwAp41l/yhy/h/Up
	 7EhZHSvoAAV29YuvCocRoUOEKvsWUTIc1lV6L1tMdnwgLRZQCsZuB55mGClG1QiiIc
	 NCY07CfA4oHJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5555060A4C;
	Fri,  7 Aug 2026 11:55:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 012F810E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB61860A3E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPURPJTg7V3f for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF32760A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF32760A4C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF32760A4C
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-496b7622a83so27675085e9.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103748; x=1786708548;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d0KFjyDEBO4k9UDqlJMnk3k/G+uL95ipRMeqGU9RlaY=;
 b=d3VYgLKeVliEZtuIYIbRZh0W3zUNFg1oRlXoTujwKvU7Znfm2xSmN+QLyueWtIASAR
 Bj6ayVgljKqT5g9SYHs01aQOTl6VlLyLEkkSekII5Ze9ANu/NQEYFVavBgDHdWVDRGQM
 z670Wx6KBQHcOTzh9beiwdQm2IEyyVLe1uxbs3bDnG+Jym3Ylae4L/1xxKW6tbXG4lBf
 b05gqX318NtsAPYxwj+eAsB6ZpFB3SnEFpj9lfwSIQU/zEqCbIkKkazchuS/4v9dtivF
 rF89iMGj/k/hpzhFioc2jxlgHlol/BLQ0Eja1efrtmd/lFz8WBgwBHEpzvr2ACrejPN5
 A0Xg==
X-Forwarded-Encrypted: i=1;
 AHgh+RouEOZmS9KgXVGbccLFCe8ywmtc0yj+Kse3sEZtc6AyRbws54t+gs6sUNLnKkPx1RnToBQrcUPt+UE=@buildroot.org
X-Gm-Message-State: AOJu0YwTXsDUzjOS5h6V5q8z+RvfmzHf7FbDsnZSm2rFDhyH8+HSLeTU
 9kozxQQ8ZfSfaXCA/I3NIUqdUW8tmAFzWI7mvAEiF07WTqvBS3RyHLnZvTLEXMvx4Qc=
X-Gm-Gg: AR+sD106bL4joauRTQjdE5+a6jREJtq2tWtsNiNYDXBSBe4iybDuAlJ5VbeZpJHMZz7
 SwIWr4LEEQwPpSjP3nn+6K0LAFxsZ3M1TrPlLSUQ2+nTdOSeYgqBh4Ke91kUQpq7tlDNN5fCUFB
 Lg855LIHARu4YVl2jGaFRiyOQRmgJ5T1imAgzDNyv0fp5N0bPtyHRd/3tvOSU2/GT6nTILKHde+
 ZHpDvv3Q1GB+V+4xe+fBsX6F3HuvMBPN5PYi3f+HiJkEKYhpw+WVO2/VWZrFND0b3Vi8RCKVHqy
 bd4P38f0Wq0suWZ1cKdBMvTMVCy+QQLvCQ6PepPIRC5IPH6RXGMDn3zQhegtHJoVQnxYGcBu0Xq
 rCpinuQf3GCW4dMSmksXcBWnoRaz2ACI4+SmheuvfzzvY2Pv0+BfPDYT9Z5mIjAa/9Y2vX2iazl
 JvbxTuKpRrFfVSPXrqcKsVgnRzaLF82PkLhqjPI2JVpf7sIvbWxajS+dG1fxjheW7N+KF623reR
 i7z7c+qwy5vPwZCIzQxWeENYKnKaI2DyRUdm3bNuulLXDjW
X-Received: by 2002:a05:600c:2142:b0:495:5858:8101 with SMTP id
 5b1f17b1804b1-4994e7cbcbfmr245900665e9.15.1786103747766; 
 Fri, 07 Aug 2026 04:55:47 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800220a6d9sm5735506f8f.34.2026.08.07.04.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:55:47 -0700 (PDT)
Message-ID: <d6a0acf6-a9f4-40c5-9a26-83697e6d6e7b@mind.be>
Date: Fri, 7 Aug 2026 13:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Marcus Hoffmann <buildroot@bubu1.eu>
References: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
Content-Language: en-US
In-Reply-To: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103748; x=1786708548; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=d0KFjyDEBO4k9UDqlJMnk3k/G+uL95ipRMeqGU9RlaY=;
 b=GxqHM9SReJhZn0K9/ulu3StHZmFW5/AB/UGK+BabRZE/Qu70aeZl/cezjLuKZggFlh
 6qRmrv/fkZONMIwSy8RL2vmjNmA3HbT1KNBW5PEuoNqH5g7XeWYzTpXBaxP5hCHzEbUl
 o5MWeN8UIAvofflBx6xQtNoutazawUCDJzPwNV2Zm+bfcCPsA87rhLT7Ch56mIC4KJZV
 RPkPqn+OuJXuMv0zi/fu7olplmXJwoX2GXS58PvW9aHmWaf00+w5c0r/I4fjyP3Ja+vS
 xwImefFRPwlfi4sJ/Gl/YJ80A+yXSHeNCijzNbVWCf+2r2dFZiHGoq+Pwxxqq0y44e/r
 b+rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GxqHM9SR
Subject: Re: [Buildroot] [PATCH] package/network-manager: drop
 initrd-related services when unneeded
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/06/26 13:06, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Since NetworkManager 1.54, packaged since commit 24827ae398db
> (package/network-manager: bump to 1.56.0), new services related to
> running in an initrd are now installed, which prevents proper startup,
> with systemd reporting that two units declare the same BusName.
>
> When systemd is configured without initrd support, drop the
> NetworkManager initrd-related services.
>
> Fixes: 24827ae398db
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Fiona Klute <fiona.klute@gmx.de>
> Cc: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
