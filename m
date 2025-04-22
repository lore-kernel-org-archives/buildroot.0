Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1FAC369AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 01:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAA34063E;
	Tue, 22 Apr 2025 01:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZvxdeznHpZu; Tue, 22 Apr 2025 01:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C253340698
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C253340698;
	Tue, 22 Apr 2025 01:19:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB5E1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 01:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBAE360BA7
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 01:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV16h2mtNXD0 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 01:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E33460BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E33460BA8
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E33460BA8
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 01:19:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-223fb0f619dso51386715ad.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745284764; x=1745889564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O09a+nB0BggPaj0Mjk9SwYoEA2mZruY8vANgXf26y94=;
 b=dOf31eiCDWIaQ5WsgWFTPQCb8uYPY8VzP2gkICycnMj8XuupgOTYFHjztMZcMmb3kO
 mXoQ8qRVQyTqRs4vhOGLn+eFOQlZR1GbktRAB/mGumfAIetQDkPal+cO5HMHBB9ure1D
 pAghzk1s1XWqlvx2kj3GVxbamv5et450YiJ+XuKXQxfiL2rV7hmAon9tixDSlZyHGDZ1
 oFpTj57GXQMrnGc1SMYSBymO8C8na14aF1AvfG/pCK29DdcYOzRWCA4WgF0KyAzhj/cX
 OYciBFwu27YUc+HmObL8fsWLr0kvljqkQ9V5fI+a5m68tN59HC81w9v1WHh1vkmWHOPM
 3i3A==
X-Gm-Message-State: AOJu0YxReO1c85m98ZufZ7d68tBY3IJk714k54PsmOeYsj3W7+YYLyns
 5VBDg+v1d5fRPVwdmv4NM4pLlHQSXQhYBNCN9rIDh3otYob0vjSnuRDF3ZfSEgA=
X-Gm-Gg: ASbGncv6tPxuiSssbJATEfz3UX8K9ykABkfzmyWNsZ7UDgfPlMoNQNGSPkkvFqRRwWC
 uc1skfVYxQdB2B9bcJitZzcAM8Kc/wWO4xxBGL5Gg8A1C/g9vHYlRJ7VoYqU36WZO/xKV5vaN2r
 TWoo+PxgQZN1mRFi8XKMaS4CGJ85rfmmeaeo+LXyg+StHdPMKgAUIYLPKpT2UMiAS1SQIK2KEaM
 pHdhlvI7OMcMHr7Tfu4wEVCvPrg/avtL452rHw64EE58S77QrRuUhtpwFBa/xC4ZcP+LLth368I
 JNScdgNUQJU9WVkMYrqfE8DmKGaKnL4=
X-Google-Smtp-Source: AGHT+IFCjLgaL2a/sYPO3Y6JaZpXrT/KICMenCbwPpNO7KCLnakxlxrSpVy/ymsl00gWo6E+DlxzHg==
X-Received: by 2002:a17:902:c40b:b0:221:331:1d46 with SMTP id
 d9443c01a7336-22c5356e4a8mr167236955ad.2.1745284764135; 
 Mon, 21 Apr 2025 18:19:24 -0700 (PDT)
Received: from ghost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50fdb805sm72525755ad.216.2025.04.21.18.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 18:19:23 -0700 (PDT)
Date: Mon, 21 Apr 2025 18:19:21 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aAbumbJ-uUrss9gL@ghost>
References: <20250402-bump_linux_pam_1-7-0-v2-1-c000177ea7f0@rivosinc.com>
 <20250421234156.40403831@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250421234156.40403831@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745284764; x=1745889564;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O09a+nB0BggPaj0Mjk9SwYoEA2mZruY8vANgXf26y94=;
 b=gqkGmcYmXjUd7werrOFL3k9SCwLRGORY5kzakCqCm/VYgLD4Mhtj+3F37zhEkQ4x44
 G92Xccegq5xxlhoFF3kLB7ixHUYYXJwLrmvZwFwEpQOvlWSDbkjojxIOy07BdaZHGMGt
 tROp7mVC68UPIzFst3wxQPCJKPG9nsKOZZCruJlx2N/5rOb7g2gwLxC8mUX55Iq5pVmm
 Qbph2xuK+w0vaPE5wguzFWGkbNOD7+oy9VZ7bkbEJi1oPvA16tNw465wsuwdy63BgJNl
 bDvHj4ri72Wygi4+pmJgo/VXxreLd4YOjWydKiQtD4qHdyWvw2laJOJN53W8kIQZC7iW
 sx8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gqkGmcYm
Subject: Re: [Buildroot] [PATCH v2] package/linux-pam: bump to version 1.7.0
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

On Mon, Apr 21, 2025 at 11:41:56PM +0200, Thomas Petazzoni wrote:
> Hello Charlie,
> 
> Thanks for this v2. Unfortunately, it still has some problems, see
> below.
> 
> On Wed, 02 Apr 2025 14:46:31 -0700
> Charlie Jenkins <charlie@rivosinc.com> wrote:
> 
> > diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
> > index 6b08a9c4c2a9ff14a9d43c96ecc99826c82bdae7..41de8f833b14247b85ce1849c08fac6a507727d5 100644
> > --- a/package/linux-pam/Config.in
> > +++ b/package/linux-pam/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_LINUX_PAM
> >  	depends on BR2_ENABLE_LOCALE
> >  	depends on BR2_USE_WCHAR
> >  	depends on !BR2_STATIC_LIBS
> > +	depends on !BR2_microblaze # Toolchain doesn't support shared libraries
> 
> This is not true: Microblaze supports shared libraries.
> 
> Also, you cannot add a dependency like this: it would have to be
> propagated to all reverse dependencies of linux-pam:
> 
> package/nodm/Config.in: select BR2_PACKAGE_LINUX_PAM
> package/openvmtools/Config.in:  select BR2_PACKAGE_LINUX_PAM
> package/php-pam/Config.in:      select BR2_PACKAGE_LINUX_PAM
> package/refpolicy/Config.in:    select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_OPENSSH \
> package/rsh-redone/Config.in:   select BR2_PACKAGE_LINUX_PAM
> package/rsh-redone/Config.in:   select BR2_PACKAGE_LINUX_PAM
> package/shadow/Config.in:       select BR2_PACKAGE_LINUX_PAM
> package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
> package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
> package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
> package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
> 
> And then in turn, propagated to the reverse dependencies of those
> reverse dependencies.
> 
> Bottom line: we really want to understand why it doesn't work on
> Microblaze, and chances are that the problem is not Microblaze
> specific. What issue are you trying to solve.

When trying to build on microblaze this is the error I get:

/scratch/filesystems/upstream_buildroot/build-microblaze/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-gnu/13.3.0/../../../../microblazeel-buildroot-linux-gnu/bin/ld:
FDE encoding in
/scratch/filesystems/upstream_buildroot/build-microblaze/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-gnu/13.3.0/libgcc.a(_umoddi3.o)(.eh_frame)
prevents .eh_frame_hdr table being created

I was unable to figure out the proper solution and found a couple of
sources that seemed to point to it being broken.

- Charlie

> 
> >  	depends on BR2_USE_MMU # fork()
> >  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> >  	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
> > @@ -16,8 +17,10 @@ if BR2_PACKAGE_LINUX_PAM
> >  
> >  config BR2_PACKAGE_LINUX_PAM_LASTLOG
> >  	bool "pam_lastlog.so"
> > +	depends on !BR2_TOOLCHAIN_USES_MUSL
> 
> Why?
> 
> >  	help
> > -	  Build pam_lastlog.so module.
> > +	  Build pam_lastlog.so module. Requires toolchain support for shared libraries
> > +	  which microblaze does not have.
> 
> This does not make sense: the !BR2_microblaze dependency is on the main
> option, and you're adding this to the BR2_PACKAGE_LINUX_PAM_LASTLOG
> sub-option. Could you clarify?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
