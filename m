Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEEECD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2240E41E8D;
	Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YCa9XHOb5mD; Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6586841E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663771;
	bh=gAr+14U7sU3Hv7NSSk5Yp0e8ppYz9zcqoj3c2hOrZ6Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lMmGxiCl/Jsdd+Xixx2Kr+SqKPQcNtmPOBJkbKPLlzfQcgfzrzHxM9s1atGiXqvzH
	 8aSzUNAUQSAxUkVUoYgGwa9IlbJ6XVCbceQNVbmQ/hkLfYeOh0HJdHW7nmagRF05Vy
	 /5Ujjg/GJe7Oe9LqnMeP1r5wX2IpenuJfdjuH6KhsDuXIjR/6Wk7+H0PliiE3nt4ef
	 lUFpgH8ECxoyZqRoOhAZ/GYx6pD558+otxbPya+P0bsPgBmVheOL45BV8dfMeGwcIN
	 r+T+KuNi2OwTCt4afnHbbSvyCTfEWfidF6s+D4g5c4Aqsl4cUKxNYeDMOoKiD1MIOJ
	 Pc+6Loq4DKXnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6586841E84;
	Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 083EB388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF72D60EE5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u51GSHCGstkP for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A45F760F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A45F760F88
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A45F760F88
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490a765d410so19856365e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663762; x=1781268562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ASJ8YHwD50bKjgSyVGuRe45ThNGUaJirw/Muv9UOl2s=;
 b=XT/tevR8+Gdpi7reoXNxKV7X6WTf5WKyBeEAOwJ4nBggHhnSa3r3jz3Wp9PNGwaQfJ
 wOKR2Bm3ExNzUYJRfRiRiSv4iLlgTID4xbTT5XDnsmi7BxuqsvCnKZgEGsXC96CrqaZN
 BPjJNieQ6l0OkoCxUKLAYNQOIyhUJc6/65UssB3ocZO9G47CqEijz1EF4Ue8T3ip3H9p
 V3XirU89Ak0QOLshyJSQZGckQOi44oP24r22NxS1cjHLH3BhrwNTWasX6t7majiNxerg
 3IUgawUUR2dx0VsTBp9fonKEDJOFtF9fsgfrlXMiRGtuLyE6M5nw0H8/pfe9JZNmkg3r
 IcxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ951ZJhNTrEgl6Ny0vpSq0TuCN84gNa1yT8cNy9UqzD39fenmdKFSr8vLgc5FQf/zg5QbKh+6Frmoo=@buildroot.org
X-Gm-Message-State: AOJu0Yxtf7cDSHpqzg02cNqZ/4IKibF97Uj/ku5Dhvt15Umq2J1gNV9u
 Ix72BAw6W8mDLvHdYIR8y3mk+UpImbeKyAl79nLAgxzof/rsjSBrmGFVzNcLUIdlB5s=
X-Gm-Gg: Acq92OFrMTFShDYa2fEZ98c/if7eqBULYl4WNXgZVBL8b+9LWGOY4uEA4OLWBfaXN6D
 HePybVqSmXqZJ7fsMKi7znVAx+DHbk9+Rfpcxwyf6Ie01ie3SIRJFk8fM3xGrf+uORyTTOx1sPl
 04NcrsHYF2a3lXwz5Mp8zla1PN5QG4FKAcjQSsQupz92ninBuQgWGDwXys23aOlBZJ3Fg2cCO/G
 m/kHJIsxT0jRAsPEWlZi7MzDTxMlwLAo4Vg0vz/JBX4LAeRufATQ8cFZWZ/yBTuKI6ijd/HxeNO
 OSZkQbBYJs2J5tip8Eg3hldBG0o9/v7+It0PTEXQNlWu/bNKiQNxYK+YcUReD7+VqjgVLjlILZn
 Cz3pM9ly1+sHr0p5c3P0W4ZltObpVoxUzVo+ZXDe1IjvQ/Bmt08Rp2/uKiktNVyCewpK6iBCS9a
 G6rDJXrkDPCIgo3gNBLHmu1Kn0vKpQJEP+Ga7C
X-Received: by 2002:a05:600c:c059:10b0:488:b187:3c with SMTP id
 5b1f17b1804b1-490c265b439mr41044115e9.14.1780663762512; 
 Fri, 05 Jun 2026 05:49:22 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490be1f69bcsm151842945e9.8.2026.06.05.05.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:22 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:21 +0200
Message-ID: <20260605124921.270995-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425211641.479665-5-bernd@kuhls.net>
References: <20260425211641.479665-5-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663762; x=1781268562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASJ8YHwD50bKjgSyVGuRe45ThNGUaJirw/Muv9UOl2s=;
 b=IFu6DP1QvH7zrSDWFPtxnT88I3bSY8OMJeQXU3Zu2xYyXCpz1a+uU5j0Gq/3Q68yNl
 8CPuOQgyyxkc5bOrgTzXFLG08fB9QVbnTE5o3daAFST4WP4GYYvonOvKkNePHIeaArZ2
 564D9hXJiwc1oAz9QHhqeibMjVWCwTPtguFSpBzrCBPtoYYbNwH/aoYdZMY26SBPrSfY
 +ZtGsWnq6oQkMuUS4AT14P0zg14QnM9z09VvTT6CO5ouoZTbPUps56hl7SSHWGJ5V3Ws
 xeEyra+H23O4YzNvKrZ41rcTocmN9Xqno3C9WhnFWWvWS4kn9Js1jVQN528P3HCKn+iW
 Wazg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IFu6DP1Q
Subject: Re: [Buildroot] [PATCH 5/8] package/libbpf: fix bpftrace build with
 kernel headers > 5.11 & < 6.0
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
> Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 bumped
> bpftrace from 0.23.3 to 0.24.2.
> 
> This release includes upstream commit
> https://github.com/bpftrace/bpftrace/commit/d4f58382270c21b2c718aa0a6574c105f29e77a9
> 
> which was added to version 0.24.0 and makes use of btf_enum64 that was
> added to the linux kernel in version 6.0:
> https://github.com/torvalds/linux/commit/6089fb325cf737eeb2c4d236c94697112ca860da
> 
> causing build errors when the toolchain contains kernel headers between
> versions 5.12 and 5.19 because the libbpf package does not update their
> headers so we need to raise the BR2_TOOLCHAIN_HEADERS_AT_LEAST_ version
> number again.
> 
> The build error can be reproduced with this defconfig
> 
> BR2_aarch64=y
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="5.11.22"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_BPFTRACE=y
> 
> on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0.
> 
> Fixes:
> https://autobuild.buildroot.net/results/8f7/8f7ce88a070e825ef178275a13d969349f05593b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/libbpf/libbpf.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index cded3734b4..c441522266 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -18,14 +18,14 @@ define LIBBPF_BUILD_CMDS
>  		-C $(@D)/src
>  endef
>  
> -# bpftrace uses variables from bpf_btf_info that were added since kernel
> -# 5.11, so we need to update some uapi headers in STAGING_DIR if the
> -# toolchain is build with linux-headers < 5.11.
> +# bpftrace uses btf_enum64 that was added since kernel 6.0 so we need to
> +# update some uapi headers in STAGING_DIR if the toolchain is build with
> +# linux-headers < 6.0.
>  # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
>  # by the toolchain.
> -# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5329722057d41aebc31e391907a501feaa42f7d9
> -# https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11),)
> +# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6089fb325cf737eeb2c4d236c94697112ca860da
> +# https://github.com/bpftrace/bpftrace/commit/d4f58382270c21b2c718aa0a6574c105f29e77a9
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0),)
>  LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
>  LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
>  endif
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
