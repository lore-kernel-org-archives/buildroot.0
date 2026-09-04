Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1FC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E520D60D8A;
	Fri,  4 Sep 2026 12:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fw-jdHWTKJOb; Fri,  4 Sep 2026 12:17:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C8A9060D95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524274;
	b=jcMh0v8atYbK+/e0uz6RGaYpP3R9JcprTtyp/0vryYIqTT2XZisLXfjeBHErYIYzCg3B
	 67Fs2vfI1947iQI1WWlwXWdxhnly1qHQYLq9q+3VBDXJNzH8Tg53FTBuSJrdaxcWEM5GK
	 Jjig7L2QsTwbaNxBvDE25Q+pZJ5ilpq6XpMLjoizgCq3w+eQRX3ARr2iLF3+SIGsswCMl
	 Y0w/G4U5687o0Z5OfFQsjs0dl/brVvsIGF+IW3nwjJlqL1ci7l7zYcScbMvmmCR6QFkLt
	 BrmrgpsiFv8RAsfcynobEObu2PUi+eHQsvsIAix0o1+BJXKIfYEcc3ZyEHla3KFR5Fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524274;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+fvXYre37l1Gae84Mt69B6BkRj9wlJS8xs6zcOBAxnA=;
	b=muYqz2ud57NRCsQorBLdYVOZJB+T1jZkZ4Yio1t+BAomj7ERXsHezUfQ5GFkgNBoAOH0
	 7dIhwR8vXwSUemhzWU3zmmHS3wIqv5Nd2y9JJK89Yx+VK1cFPW5sLnvKNsB/ubcW6CpqX
	 6r0+K37S1iBQq45FImUH7/UIVMNKhJtq68/m/ZdPHtYvsDkt6IFI0XcOT6hVu0IXhntC6
	 Ujl/+xJfSf7+JezScEshg5IXsM4DeHIUMTNddgbktOK0CixG3i8nFSqkQaUre4whDaL2Q
	 vKJnbjAPJfQ2RW4dtrdKBRTAiIedt0HGYnw4i9g7kQ1OeBlt9ZC1ysJcRlIdegDqTEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524274;
	bh=+fvXYre37l1Gae84Mt69B6BkRj9wlJS8xs6zcOBAxnA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=egDz3NBWWbaLHlCD64XJ1zAR7stLk5Ko9gKghABXX5Y17NHE33w/kOHYB7J4clhtG
	 0viGfE5YxaXFbdMwXaoEeBmpjiFPq6Hh72cmjehHmIyvD85eOpcoFNnNvGJEmxhiDO
	 bpMaMZv9QSApJOww5kwBpiwTE62smWE7WmNLbrGvQ6bLAMZc5Ctc1c32Eq4mbGdqc0
	 cYNz1B02tEAHnCtfDx4L1LqcE6Vcqr1kzZwmv1PYExUNq2NtF1GrrMv+yqMY4sG4hc
	 GgVQz2rco2oEVC410bTHTMQAuSTrMdqssVeATlOBY2AjcP6G9GW9Bkb/4hZU7guhHC
	 NQSt9dpQS7GCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A9060D95;
	Fri,  4 Sep 2026 12:17:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A1410E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E05640080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6LFKyQ6Q3T5 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 689514031A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524266;
 b=TAiewRRLT6l8aq6QtkdO+aoEDghc/LvoZICT2TAVVmIVpI5XGe3/e/fFMzebJ8dlpHXH
 6bsrN3w64WU1FXCO3RhX3OsawWjGyWNih0tJqAwlP+RREZzGpFu7unSnB1mTROQco6qF+
 X5BqtQ/XqtKASQICji84OsspeEMJf0YNO5YSp6G/vDTQNycaoXnxvtQlntkJd+WyjIeNt
 Fu2D3k0sWlrN0GjCRjY71TlNpvwRPqQQWAVBKhqllm0KHSyQBxKNF9NaD7rPYt62BQCnt
 faRrqLLVtI1Dspk98UdSWtGDEoPyYLmW5jmcxM2thkWDuxwIIslqw+IXwN2iTqWnSdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524266;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=O7grca24P+FWo7gor5k0UrTttmx0HXGsiEqdxPoeeuY=;
 b=OcueEZDfbhXm6OxiMnd/o8e/dWcFUDQQYJ9fWwXU7GLPaKrQSsODo5P7oylL0tjQjRcj
 v4iO/gmFyyqwJ4nsF4Qedz1KkzFUp4T3qdhkRXvEDltntlMUuP+j+OnzEnMMvVGbWscdM
 9NBlfaqntGF2Cb1uZt/Ae8EDahSCat/HuDDpV8Tzt8ctFHtIosGcToT5EdqtQznLq2Ssh
 gM3JKDWwuRzCStHCdU2mMQibZ24sC2XGPbTmU2sjXu6bBxF86x470oiUhKT6pK6GzA8/g
 +8l03mKYsryFL2cysnSzTKPDRZSYp6v3n/feMAFWzZRZo/td1iRUo9O1GK+DSxlu8mw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DomyqkpR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 689514031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4843efcbdb2so548834f8f.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524264; x=1789129064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O7grca24P+FWo7gor5k0UrTttmx0HXGsiEqdxPoeeuY=;
 b=lu+c5EYdaS8eEWZVcazB3EPKtvbR2eO36MwBQK5qMJS/oLdc5kXfFB7ZIyaOksTKTt
 bFFmpBFmL3443H9K3+Jfn9ZF5e1CVU4UoCqgxyY81RPnf6E+eqABAHUF0QxBwDYpo4fP
 Qnf6/WDIxlT9lnvboa4jw1Cu5YrUqaOZ+zGDB3Mz/v8mbh1akNnUBufHDHzobnQYrIcC
 6bEXVjjNTqMLqUZv2LveWIocXwhMPzNM3U//XLyd9ycvwc8nhHORBDaEO0IONuXBuN0A
 AOWNpTnuydRQJTj182Sy5MmgSioIUO1MP+PBcuBZ33ZHuK3BqnVXT4ulZjgHU2IfZSyz
 jDFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwe1pFo3o7zzJZOlcrWP2OXAltXbT0RYoIBjQgLxpHLCDzI039z4g6jvaYHPL1z7hWBe/QCkHo0hsw=@buildroot.org
X-Gm-Message-State: AFuF++mNjMFBLeAwBLyXzav0EGvu0OezCn3lwYbfAMvXp9347n6G9o+t
 7b2XLIxvOsa5B6ESMHEpkSDRoY1BVuxpwolwlVPzY64QlykFv1JumfGyUCB+TReTH50=
X-Gm-Gg: AYBFou2ffi2j7zXxw3dXj7B/m1XjKw6so6l0sCbpZy3IWmXdGwjHmm+/FUW8M5q+ZSR
 eFw7DGK/Dx/oPx/nyY7NEiLx/bEGzXQZC9rDzJJ4HU8VYe+Kn7AFpfAUSZhlqFi5gG7EJgWbc9r
 yyagUA669f1dRSTr6wLpa4FVyhEdceW3zxOj48WEVkQvwrk7wBaq1Uq26A8ovsZDWoBihvUfxNp
 u4mANhrUCpmOCDkdVHD8I8FAk+3Xtl4e/aGSs5LU9yGMoxcmGAmcwQik7Wrs7lMY5kkE0olaDz4
 npgkaJWgN8zQyCncv0bxaLI5UCK7RJpCBzYIriSC+DXa/GDofOhkzAHPTx6uhYfRoHTFdFjc4IK
 TQfriRBr7QeLtVaqpBZJ5+R2JEzWPVC6sdclvTDJj82RU5v0Lj2CClXxw3mA6UXK0QOoa/PDLoS
 NPYALqYMztCw5DpXD7vKyIBQdzzmBkENx26G/jp7avbKPCcq9L7K19tA==
X-Received: by 2002:a5d:5f51:0:b0:485:8a47:5b9c with SMTP id
 ffacd0b85a97d-4858a475d7dmr3733411f8f.57.1788524263778; 
 Fri, 04 Sep 2026 05:17:43 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858ac2b4cdsm4431856f8f.16.2026.09.04.05.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:43 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:41 +0200
Message-ID: <20260904121741.404200-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/libbpf: update UAPI header
 installation work-around
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
> bpftrace often needs very recent kernel headers, more recent than the
> runtime version actually needed. We already had a workaround in
> libbpf making sure that if the kernel headers are older than 6.1, we
> would install the libbpf provided headers instead.
> 
> As we are about to update bpftrace to a newer version that uses
> BPF_TRACE_KPROBE_SESSION, which was introduced in Linux 6.10, we need
> to update this workaround accordingly and ensure that the libbpf
> header is installed if the kernel headers are older than 6.10.
> 
> This is necessary for the update of bpftrace to 0.26.1.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.05.x. Thanks

> ---
>  package/libbpf/libbpf.mk | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 5a6d574331..0683ec12c1 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -18,14 +18,12 @@ define LIBBPF_BUILD_CMDS
>  		-C $(@D)/src
>  endef
>  
> -# bpftrace uses bpf_iter_link_info.task that was added since kernel 6.1
> +# bpftrace uses BPF_TRACE_KPROBE_SESSION that was added since kernel 6.10
>  # so we need to update some uapi headers in STAGING_DIR if the toolchain
> -# is build with linux-headers < 6.1.
> +# is build with linux-headers < 6.1.0
>  # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
>  # by the toolchain.
> -# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f0d74c4da1f060d2a66976193712a5e6abd361f5
> -# https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1),)
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10),)
>  LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
>  
>  define LIBBPF_FIX_STAGING_PC
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
