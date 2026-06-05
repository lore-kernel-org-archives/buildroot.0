Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA76CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F59480709;
	Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLb3yDOyrzuG; Fri,  5 Jun 2026 12:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57D380778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663857;
	bh=LdK1KcGn6zebMbke3dMvn2aauznSpBCo9ORKHYJbzjY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JMXG9CynSGlZjOyKbsye8nYncXhzpYGCz9ebeHz+dgnh3xrh8S7arse37sM8fjTcq
	 c2uYAeEDF/zRuNlINa7ckodtYwhj+R1Od9GCkkmMevNuDd8/bhkCGu2Ev3JyW5Uvlf
	 UsfFjx8q0lhspJN6oZN599HLMAdwpuaXJJFy3Mqy/q150BUoC258pDOqWR9yPc5bQt
	 LO5/4wJpT0R/lu+d0h2yefZe7eF3pw/eJL/zKRp2ae746xxxUPPjZZzsALBKGPhuCV
	 do3JOxo5rB8yMGnYmk2JylOTdiiATG00t9ybAKnQnFSajTUxCVGCNehE8/PfnlfUDT
	 z4R6LsbI1ehzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57D380778;
	Fri,  5 Jun 2026 12:50:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33880388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17543806DD
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfnCxn3r86NP for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD05082ED1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD05082ED1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD05082ED1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso18493365e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663852; x=1781268652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ZFx9s/cZBSLXOgT+miz3ir4oNgl6Vt8WOXlPSHfxjA=;
 b=ip+jdBUVxVrEhgnvsnkbPVPmtdGvSbXSwqFsPkcmEDoYJNazMN8XbhzD3mXVklHO5X
 ZLpifCbshSwSEC0+YS2Mi1BjreiySjITxeGzVBG6SjAhrjxzmMPhX4OtNhhbc9IoNJ4U
 Sxz+DMXmdzxY5Puu8ZFCWSnl3Jcg7CiG9cRhG4zfrAYsjAmQkoauF1BwHJE29LlCGLKI
 YyEB82J6B4p7sxqPJwdWiydd8POoBgfdfGRksA+Z6ZPnK+8MwOA8Eb4CNstM+lbc5IO7
 YpeRuu/dck33BO9AgmZplG78VxV8qXM0sSWv7rMo+9AIwwbq9+s1maYdEMYW7Z3uIQGv
 YiLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/j4EM/kOScnFpzWIUY7cDwOEIrpGDLvbRltU8OCOW29M2LErJkdW+eJTL4DILQtxG8AK88HOufpwg=@buildroot.org
X-Gm-Message-State: AOJu0YwmelZjxNpG98a7KH6yF81HJ+092CYsdwS567QqpO6SrO+1miES
 oObclctPru1FigoITzNx0psRbS0Rsv37xaGajBRpjDZZNJQK7Hw0gFQU9Gga9v2WPbQ=
X-Gm-Gg: Acq92OF7aZTLZt51JhUCkaOOpH60SY+QRRJpA/MVa/uxQEbnOL0IiyLGE+67LNaNKvc
 ryW7c/lxVTP3T+JlQFy2+ClKh6u5xyD0HgulOE4qN8OHRYh20Kx4ArE/1ZUhg0qL7hGGMICpwoU
 GaWVAUdbz1P8MS/qy6JdpBIvCoX60OfgTgaioU9RMBNjbrj0foVwenF5AilSxU2jmQGSfEa0Q/v
 0HtC4L1GyMhEb9qcuS+av0/HX8bFOWx0Oi8euQU9SKzz/O1tFle5pBQd1XRxscA1OUf/Ao2dClT
 kOACG9kVF1FXGLZX4+yA9ZsPYiM5m9Cj4YPmVHntvsdHRW1UJRRaJJ/RCJak3QVnLJ2ozHtFzLM
 6LCla+p1QW1kK2W/pVTlnDJpWrRqoDv0/e1XCxRGfbA3JAYZKBgwgv+1zfkl5mbGirSqUfC9eMI
 dtzC+BTPNUCSn++BjxQx7+2xDpbg==
X-Received: by 2002:a05:600c:3e0f:b0:490:be8e:c890 with SMTP id
 5b1f17b1804b1-490c25d4cb2mr54645455e9.13.1780663851614; 
 Fri, 05 Jun 2026 05:50:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4004sm25938769f8f.9.2026.06.05.05.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:51 -0700 (PDT)
To: John Ernberg <j@j-ernberg.se>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:50 +0200
Message-ID: <20260605125050.274508-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527204125.4054645-1-j@j-ernberg.se>
References: <20260527204125.4054645-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663852; x=1781268652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ZFx9s/cZBSLXOgT+miz3ir4oNgl6Vt8WOXlPSHfxjA=;
 b=KaEbuDJvmaFDP0RNbn1amu+xjmoTtLqlzh1yotc7uYi5IkwepiuOQGHJ284l65XYWb
 C/5uSKmlNh9ySjUUKZX4RUHxscyuFaLa1Ctd6n3yeqazoADYAwXhFt9NQmRsJF4/bV1P
 vbJLpw2PsBQJcK0DOK5JliOC0Cc1DHxmFAefoO8o2/24GMBgaiexkwRFkZiz++j6PMoo
 gVvjRWT9G3yEKTNRAmVwwBDZEDwCfrDMB0A7UIWo0oIhXAgL5H7iIlxELgRk0gl7RvSf
 CsQPyfxImnQzaCngbhVkhxlbhldT21XWEhnlNG9dKqKNzcpG2T1DeVGXJlzqun8p0DhC
 lFPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KaEbuDJv
Subject: Re: [Buildroot] [PATCH v2] package/pkg-generic: Add
 /usr/share/info/dir to $(2)_DROP_FILES_OR_DIRS
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
> This is the file the original commit d8898380984f ("package/pkg-generic.mk:
> Remove Info documents dir entry") wanted to deleted.
> 
> However, there are enough packages that install to /share rather than
> /usr/share, that the path currently listed is still needed.
> 
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> 
> v2:
>  - Append to the existing mechanism rather than inventing a new one (Arnout)
> 
> v1: https://lore.kernel.org/buildroot/20260510193826.2846038-7-j@j-ernberg.se/
> 
> ---
> 
> Packages installing to /share are broken as that has never been a valid
> path since the FHS was first published [1].
> 
> Would it make sense to add a specialized check to test-pkg to warn (or
> error?) if packages create incorrect paths such as /share?
> 
> [1]: http://www.ibiblio.org/pub/Linux/docs/fsstnd/old/fsstnd-1.0/
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index dd440e4062..83f3506913 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -863,7 +863,7 @@ endif
>  endif
>  
>  # Globally remove following conflicting and useless files
> -$(2)_DROP_FILES_OR_DIRS += /share/info/dir
> +$(2)_DROP_FILES_OR_DIRS += /share/info/dir /usr/share/info/dir
>  
>  ifeq ($$($(2)_TYPE),host)
>  $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
