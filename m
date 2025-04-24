Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B717C369D1
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 19:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E8540E2E;
	Thu, 24 Apr 2025 19:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3v4IrrCrCFS; Thu, 24 Apr 2025 19:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3881C4296A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3881C4296A;
	Thu, 24 Apr 2025 19:16:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78389159
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 757BC837AC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R508Y8WiuL6b for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 19:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D36D82B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D36D82B51
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D36D82B51
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:15:59 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-736c277331eso2571121b3a.1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 12:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745522159; x=1746126959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nW6w3tUITpcls5IbQf3w06b3gFE+Zveua8b6PVGumHw=;
 b=r1W9JoUgBBgqOv0dleYM31Z5qmNfdIL3jMRDDsp9hcLwgGalmtKj9TjNJ3VaZpi0Xf
 IFgSEY3sdjkfE9lH58zDtAHjUctAYG2yM7/YkM5oLYxPJbOTZfEMbMlgUCENFDqDBjgT
 DvF3xTttN0k/PjFozOgpK8SRCro4SQWr5mcqNAhUQcQiSSvCuXXzycr5Gy7waO2G9eNo
 9ybl6usCI2Va5dUff2pY1mWu4jXRw9DNicX44GDsytSjJQs0Mp4fBSa06I3P25dw0Ajm
 4JoA8hx7If0gN5MO5jv/oz22i0A2aqmHUbtpxgdgYHyDUEKZaSxgKipkTSsCUQk7Bkv4
 QDwg==
X-Gm-Message-State: AOJu0Yw1oyuxw6R++j9A/imtsoK4B55dV72ORdNQq0SyBH1mFm5ddtaM
 lWMPKrI19rk87Y2VM9/omG3csJv73LF3PevcCv+02mnWmNQtErHHwiCaK1bwGDIEZTzVa2BFeob
 ajGQ=
X-Gm-Gg: ASbGncsuxRNrTGD/mjdVq/CEasXiXIM+lc/M74BV82ZxTXKAi/GsdHZblsZ1k9oZaqt
 RnxBPywxEO/AXkXOtwQoYY9oKV3ECyl00AwZB8vPEVuHGX6UKttmwpKpzkPejdA0tG+70Q1oAqr
 G+6DT7YvXxXq0ZPk9lz1D3mYfq64D9UI8S6Ig5R4rwNaz28xDkExfXD+An9BQrwYJps3OuvRNFn
 Q8VU72xC21icWemVIQArX4/Ypv4rkU79Z/LXLX8XCJJ6oLoCQizaEcHiFf+eRsnSkBEzdFd++ql
 LoT1argvC/6TPEET3Akywwp4T6YOKf4YsMCs
X-Google-Smtp-Source: AGHT+IHFFaYE+Tt1x41dwt6aX1u4C4poKb4SrylS2f7/gXYyCPlZq5TJzN/TJl/F4cqkaWfQ3kgNFA==
X-Received: by 2002:a05:6a00:3e2a:b0:73e:1e1d:1713 with SMTP id
 d2e1a72fcca58-73e267c2c98mr4525608b3a.1.1745522159291; 
 Thu, 24 Apr 2025 12:15:59 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:3bb8:6eb4:c68b:30df])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e2593f426sm1785239b3a.43.2025.04.24.12.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 12:15:58 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:15:56 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Message-ID: <aAqN7P4xIuw6sm5q@ghost>
References: <20250424-fix_gmp_c23-v1-1-b2474a9585b6@rivosinc.com>
 <87plh2f0ok.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87plh2f0ok.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745522159; x=1746126959;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nW6w3tUITpcls5IbQf3w06b3gFE+Zveua8b6PVGumHw=;
 b=1iNFIVJZzr0rvy7ITWP+39zuGXY3R8wda8KtYGQeJWAK9uCHOf2YTl3F2I787gg088
 iOikeHjfpQEuJWoMOnZyEUtqqnXI3K7vl07PiUvEYvv8zVR5DBBUN2Mlyv5760C0VAWC
 n2Nt+VFTf8glZrR8q0cFbCMZAO4JRvcu+q4yWO2B7mNIZayZYEvGCPtbAqVD2Pe/CBFs
 CnInUqM+KoG9xKMt4S6EbxImw9fYlHvdDuwXQ/OlcKu9+LCM5du5xFd41lFzCLTkP5jo
 GTyNpVqe5ti/QFaflqbIWOem9NNGZvr5emJaDq6+4iYTBdRjGNHSISsnWLrWtA2xwX+z
 aKaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1iNFIVJZ
Subject: Re: [Buildroot] [PATCH] package/gmp: Fix for c23
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

On Thu, Apr 24, 2025 at 11:01:15AM +0300, Baruch Siach wrote:
> Hi Charlie,
> 
> On Thu, Apr 24 2025, Charlie Jenkins wrote:
> > GMP will not build for a C compiler configured for c23 because its
> > autoconf scripts use deprecated function prototypes. Include an upstream
> > patch that fixes this issue.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> 
> [...]
> 
> > diff --git
> > a/package/gmp/0002-configure-Patch-configure-script-for-c23-function-pr.patch
> > b/package/gmp/0002-configure-Patch-configure-script-for-c23-function-pr.patch
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d60c4d39f670d8c4f9dc937b14659695e3cc36a3
> > --- /dev/null
> > +++ b/package/gmp/0002-configure-Patch-configure-script-for-c23-function-pr.patch
> > @@ -0,0 +1,39 @@
> > +From: Charlie Jenkins <charlie@rivosinc.com>
> > +Date: Wed, 23 Apr 2025 23:55:25 -0700
> > +Subject: [PATCH] configure: Patch configure script for c23 function prototype
> > +
> > +The distributed configure script is pre-generated so it will not be
> > +updated by acinclude.m4. Patch the configure script to allow gmp to
> > +compile with c23.
> > +
> > +Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > +Upstream: N/A (patching generated autoconf files)
> 
> When patching autoconf source files we usually add PKG_AUTORECONF to
> regenerate the configure script at build time. This patch should not be
> needed then.

That's much better, thank you! :)

- Charlie

> 
> baruch
> 
> > +---
> > + configure | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure b/configure
> > +index 7910aa0..259f7c8 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -6568,7 +6568,7 @@ if test "$gmp_prog_cc_works" = yes; then
> > + 
> > + #if defined (__GNUC__) && ! defined (__cplusplus)
> > + typedef unsigned long long t1;typedef t1*t2;
> > +-void g(){}
> > ++void g(int a,t1 const* b,t1 c,t2 d,t1 const* e,int f){}
> > + void h(){}
> > + static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
> > + {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
> > +@@ -8187,7 +8187,7 @@ if test "$gmp_prog_cc_works" = yes; then
> > + 
> > + #if defined (__GNUC__) && ! defined (__cplusplus)
> > + typedef unsigned long long t1;typedef t1*t2;
> > +-void g(){}
> > ++void g(int a,t1 const* b,t1 c,t2 d,t1 const* e,int f){}
> > + void h(){}
> > + static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
> > + {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
> > +-- 
> > +2.43.0
> > +
> >
> > ---
> > base-commit: 1fc51abc27d37c2874823ab864db0f32ae774eb6
> > change-id: 20250424-fix_gmp_c23-c374e940b045
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
