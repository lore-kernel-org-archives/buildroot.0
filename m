Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEDBC282DE
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 02:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C8560825;
	Tue, 11 Mar 2025 02:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPKa_ZYQDdZD; Tue, 11 Mar 2025 02:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB1960A5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB1960A5E;
	Tue, 11 Mar 2025 02:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF312EDF
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABD0540DB5
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCf2jvfkbr8c for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 02:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16D33405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D33405E6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16D33405E6
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:50:53 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-223959039f4so98185775ad.3
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 19:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741661453; x=1742266253;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVcrTS6qj1Tn8lvaO5jOF+vUXKp9rZyqzwZ45ohiNUY=;
 b=snIGmJYOw9nColi9aOe4OL3X7JkY+qRaaHQWlKmnS8VI1h5ACBWDychOm/9caLyQmQ
 8gyLdxMNoW8ylin2sqTA9973mB9YBLsyomoTVw0k6YUdmh3H5Hglc7f0cinffVvovXg1
 WtwzbMfk/IRfDSkfgpZKKqeMFjQ+123z+sj69NzpnxdmjUsLifJzU4xoxwhrSpvZ4n12
 itpG0eZjGU/B5YwOoaeh9jirzOiR8pA9vw1eVubT1+mlhiRPKOJR3htSB/3IpT45tUfq
 57irVqshGb03a3AviYR+D0//zf1ShgCuDbbtzdIwNSnLSgFKYvC7T0XV1o2Pv3J3LMgv
 +CIg==
X-Gm-Message-State: AOJu0YxByapLpz8J6W7PRfOuiiw0ODCpJcL1oYExPJZHKv4rZaqAPSKN
 qi6otvuR3DgHFVb+CVoGRpbMnJJSMQnNk7dto0maexPgpc5FneggY2tZLchKWdGizLLUu3RZYJW
 K
X-Gm-Gg: ASbGnctoUIl9+zuEpVTiZnIojJeF0iXUH4iPwaqHWzwLQwZz0yl/IxpQb4wp9+0i47m
 A5BS56p2fuepW2MEt2MdbrrUODYD9QLDDDRSu31YGrIpjiPL58fGPJhFY2m+ZxHEE1DyPXevhGM
 D8GtZdsqFbHByRexWN0X3FKLLtOzMEDhYbT+TCeiJd4SoCMj67j36WupPUh8cPD8xRrIcxxsGk1
 06USk5gPwgtW6BQ/4rHBdhg+783YjJw/rcC9pPw/iEzMFN05tuh4RTCfw3PHgGYaEMdIBXleQWB
 kkL00Rw2PafPo1XqZXzWng25X/Bn7ZhF/ulPLUs95y/XzQ==
X-Google-Smtp-Source: AGHT+IE1K+Pe8mlOpPebcYev7BN0Ksj47LSM1yPwyRDNHUY7YSUJrFY7ZFSeWFYx8jcObUNDD0n6+w==
X-Received: by 2002:a05:6a20:4393:b0:1f5:769a:a4c2 with SMTP id
 adf61e73a8af0-1f5769aa6c0mr11408858637.22.1741661452808; 
 Mon, 10 Mar 2025 19:50:52 -0700 (PDT)
Received: from ghost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736982065dfsm9189833b3a.30.2025.03.10.19.50.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 19:50:52 -0700 (PDT)
Date: Mon, 10 Mar 2025 19:50:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: buildroot@buildroot.org
Message-ID: <Z8-lCmBldqRf-Mwr@ghost>
References: <Z85-NfSRZVA9VxK6@ghost>
 <Z86AGdrKHaUqgLVt@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z86AGdrKHaUqgLVt@ghost>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741661453; x=1742266253;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SVcrTS6qj1Tn8lvaO5jOF+vUXKp9rZyqzwZ45ohiNUY=;
 b=26MRO3ZW9h2IuAvlF+lWbuSH0ivjE1WXfW20W5Wrc4IIqcVK7Naih5MQ2TeTA+pN3K
 FD4RihzE1C4fTx6ddNzzj9RZ3rjcaj1vWFSCsiERF1gmoupO2Jhq/LaMl8Kjt/GCS9WF
 8UtvEIhIl+IA2mX/e53mHI+gu9r0kVSHgjJN899gbsbcOqRfSGMxb0v7LGQQ/LuXU3la
 fC+pICh8fZdTs7Gb4QIg+hoRDfWp/9xTwRjXyRqVAMOyo7IUlloB51tpbdZbhJrsU5wu
 2+/PviAYWU3cOMFksM53n28Pc/77LvAYZKE6hPKr7R3tFUzn661MJqSlzIvj5JvrCM0D
 YHlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=26MRO3ZW
Subject: Re: [Buildroot] Crosstool-ng external toolchain with
 BR2_ROOTFS_MERGED_USR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 09, 2025 at 11:00:57PM -0700, Charlie Jenkins wrote:
> On Sun, Mar 09, 2025 at 10:52:53PM -0700, Charlie Jenkins wrote:
> > I am trying to use a crosstool-ng build toolchain in Buildroot with the
> > BR2_ROOTFS_MERGED_USR option enabled. However, crosstool-ng installs
> > the sysroot libs at /lib instead /usr/lib as BR2_ROOTFS_MERGED_USR
> > expects. I am not sure what the best solution for this is. Should
> > BR2_ROOTFS_MERGED_USR be ignored for toolchain packages when an external
> > toolchain is being used?
> 
> I meant to add more information about the failure...
> 
> Because crosstool-ng installs the libs at /lib instead of /usr/lib, the
> libraries end up getting symlinked into nothingness. For example:
> 
> $ ls -l ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
> lrwxrwxrwx 1 charlie rvs 6 Mar  9 22:58 ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../

I believed I fixed the problem here:

https://lore.kernel.org/buildroot/20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com/T/#u

- Charlie

> 
> > 
> > My crosstool-ng config is:
> > CT_CONFIG_VERSION="4"
> > CT_ARCH_RISCV=y
> > # CT_DEMULTILIB is not set
> > CT_ARCH_USE_MMU=y
> > CT_ARCH_64=y
> > CT_ARCH_ARCH="rv64gc"
> > CT_KERNEL_LINUX=y
> > CT_CC_LANG_CXX=y
> > CT_DEBUG_GDB=y
> > # CT_GDB_CROSS_PYTHON is not set
> > # CT_GDB_GDBSERVER is not set
> > 
> > My buildroot config is:
> > BR2_riscv=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > BR2_TOOLCHAIN_EXTERNAL_URL="<path to built crosstool-ng toolchain>"
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-unknown-linux-gnu"
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
> > # BR2_STRIP_strip is not set
> > BR2_ROOTFS_MERGED_USR=y
> > 
> > - Charlie
> > 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
