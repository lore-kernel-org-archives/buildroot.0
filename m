Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA4C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D2660E03;
	Fri,  4 Sep 2026 12:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qfj_yeNP8RDn; Fri,  4 Sep 2026 12:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BB14660DA3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524337;
	b=q0dAiImwkA1BAPZ6VLLEOShTvYckBa16BR+vwsU27TjQcoayKyAsuzYTrtYhOO/ZJNge
	 k/+bYW9T6RnvxejkcFqFxqElzJv5cdlKvia78wJ7RFQ/rMxggF5vGGxNIHZxPKfhTHGJb
	 JDSa4uKbib5XmLpuNNys/nEXJj8VDInq2t40VrsswzHih6vdOssB+4wuOpKarnlOBUMrw
	 kph6xYYETsgOG7p6VoplvRV3O3lyRtgdOWGdEKoyTTnJGWpKeOgROucYW+1ub1S5I50Cr
	 Xc1orZIkQYcXwKePfcsZXbuoVBbq7wdfDPC7Gj60QX8LV8ypYid6Q49jrSwTfoRs2NA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qis8ttFZshzYQFtA1tWg/oTuOi4SW+3BpU//XuUmFDQ=;
	b=nkFLcPuYz1a8ys3HNSxGiOeGlrMa2bgA/gSNGBqmW+YhRJ3P5+Sq8hIrCIj+ESBB0p7k
	 TrPNlAIR+e7PIfdgZL0SbZRHP5wak3fvsxZ7sOtcbbmHmc1DMzLcR/VVggQHAMHa0sKYz
	 CXJ4X0kF/eIiJeQ70K4bcom/+1UgJqh3EwdLA4Mpk3AHYqrQyCOCl71Ah6RNe1UQhBfeq
	 429mxL/vTndkf60HHpuwx4aQ3IZbZh0A9B5EAx/uwHnAnITwilE1vcf6dg3fEngvNF6HK
	 I1aarR/yBSqt5MF+fUmLC8JZoQOBN+ExXm3nSm9OZZuhT6NEPFvUHexJhXs1qVF7OcQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524337;
	bh=Qis8ttFZshzYQFtA1tWg/oTuOi4SW+3BpU//XuUmFDQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QAdSPsoE8FTvdD+3KgiVLjR3yUelzxdPdlDD6KhCBx/ev19kJgkSG5SmxNj1O7z6F
	 FHknSYohT3d/NeBLXyqF1U7d2lchhHLyALcO5CcxhtmXVqcnEWr5StqPCwHzaXkQSz
	 ImGLpL8CIUxVyqqnggDyZImrkZt89h3t6P2iG23kxzelC4i09yNqgUQUN73YyfxRcn
	 ORea6BVe7pS05c6Vi8Ogf+j2w1BJ8SGkT70TqQAmqDBZTKWOlVYBRdOgwQ2SuFYV5u
	 BJZysKBwdgS1dr91LllJErhnDVr2teDXiQb2tUqPH+Pf/glRN0c/lavXQDo3g01VpJ
	 MgduG4Ip+BkrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB14660DA3;
	Fri,  4 Sep 2026 12:18:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2D26F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A98394031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8FlCRa0lswC for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6D8FF40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524334;
 b=OXcVcemxd+dRLt6GW4BEn/RlimMYq9ncbj8mvDbpi9kEH7vDE7BIh5dYsdAgBvjd+xfW
 uqslZtUKi9Q1lMTshGvTlqCGl7eDR1ZYq46E6aTfQgF3q/0hGcPe+POH/D2CGhapqmo1t
 seCrc5X3nOqUSjAkdfYhYxgiGY0C3jYFLS4+l2N+U612G9CL+G5YKFdrvxssjRgvop5nN
 7kbK7Jwj4zkC2nYx4h+Dtz0UAkNJiHO3OJziCuFcav89DSCcsRfbV394TwbTh5hj7koAH
 aKqEgH7yTmgi2Hj0GqkgFRIi1B0H1CSRFI4LoWxKNNhjEu6GRYNee7ModRQmeJD4ibQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524334;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=4nqMN4aeOsqXETAPFNlvv7LjNm+dRwBrE/1EKKI+Xak=;
 b=TkaLbsP2wClp0yh6Zqox9L0NTFDiO2JP6sNrysGKxh4Z+DM8FwYZY8t1vY8zFKFH0fqs
 /pL3sE9J9syBKQWkqZpW9Q63waPCgxNo5fqGf2eTVvsCzjP8dG3mahOoNJqEuNEVXsfRz
 +TYa0XkMTsrAt78FseoG93B9VkLfiBpuoIPVL9OTh6swYj/WT0aPh1iJdFiPIOMl9ReyM
 f5JbPB9AYSmS7OGAmBPCzH8P8FBDdA42J+XJqQ/AYza+CCoq9/3n/EdzJ27kpElG7d1kP
 P+NOh+W+41bmy5QMz3oe5vbcimRz6JimOvrUhGi1i1onQfOYhc/gLosWwXMpffQEbJg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OYw7oJoz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D8FF40080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49557167508so10787145e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524332; x=1789129132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4nqMN4aeOsqXETAPFNlvv7LjNm+dRwBrE/1EKKI+Xak=;
 b=g0ruvf4RlXPb/8i6cqObY22oYby9BahKvDpXclMm/cnur2i2P+btBBMl76JV88eW42
 OB5JGGrgEeeiI1UDDNFuktRshRi7jPvH5ryoYgFenqsZLbx9QKX4v+IKZoPGWJZ5M7E5
 Ji5YGqcwr0ILEAjozRbLhfGUeqkDRWUIjq+mARjHgJoAmcGJM3LJ5RsI09oqLQ1p+9eJ
 2fQjO20cXuGmP4RX5yk+qx/LTBxliNd75rUfiBoLXicV3iOqKURBFRdjNDnXl1HFlXxU
 v7IOVIqW1ygjrJj4ORIVfEC3W8FtALoL7vuhvaB3YTNagVx+YJ5ITKz6VMAFCatq+QK2
 zshw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMiApTd4FSyExfpWF+2LNPWiGWQiZzAxHPkrv6nVgjvN3SDnxTOGdAyUD5W1v6Q5Y0DFk+CpfXYEM=@buildroot.org
X-Gm-Message-State: AFuF++lhGEWaHWPKRhCCpC0t8rhLYdYqM3mE877lukCKVbSWpJ/I7pFM
 ekvfDfgfVlwK743gV+21/ZxLnU24cRz4obfyXpx8FbzunR7QjMgvedWC/oKGPucgx8g=
X-Gm-Gg: AYBFou1MVufvBYBI1v3my9b+QvYFqYnSxMubyWP0di08Xo20vfqntMJgqHjvVpS2y22
 wCaMneeq4Mbjr25KIpJzi0HRI9t4ur6E7l1PT5TBO3JN96k9o9hDbkQ6SXUrtFrv/5Kp/V57lEM
 lm+btCc5IjcMa5HMtfHF6+wtsexTxcA7yYjbqWNB1Xb5ZX8jXSGyJjp0xw0bBGzlJlkeU8/gZ0n
 hw0pwtJolu1WzH3WOoTnOolNGAHiMdMP5woG596muaVLsBAQaXBGr0msZGlZumqcfeUaMHCxuWc
 zd5Dzp2jmDk+YtbZB2DIjI5wARtAVOoKFDqI8Nm6VIGeh1Yp7D9qcxUEzwiaUzN7J0PKnD53941
 KBnC8Kb5aAWl+CtruiOZciRApy3ZwA5bq9jTX1gZbe02fU5DiQ1ezYVfxoCocTChKxfKSEeFV4a
 AroEdndVk/9Ql+cEbMXp5EDkOhN0rAgmL0ip/EMNBx1fj1f2VLCDJEMA==
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id
 5b1f17b1804b1-49cf7fdd2dfmr89381385e9.2.1788524300875; 
 Fri, 04 Sep 2026 05:18:20 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4761dd1sm136594855e9.0.2026.09.04.05.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:20 -0700 (PDT)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:19 +0200
Message-ID: <20260904121819.404834-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4c1871d0-8cf8-e749-7d65-232c16460a3d@crashcourse.ca>
References: <4c1871d0-8cf8-e749-7d65-232c16460a3d@crashcourse.ca>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual: update intro,
 make gender-neutral
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
> Besides just updating a little terminology, remove the awkward
> reference to "his" when referring to developers.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> 
>   just testing if this first patch passes examination.
> 
> diff --git a/docs/manual/introduction.adoc b/docs/manual/introduction.adoc
> index 476aa81edc..1a8cc6d13e 100644
> --- a/docs/manual/introduction.adoc
> +++ b/docs/manual/introduction.adoc
> @@ -16,11 +16,11 @@ filesystem with Buildroot).
> 
>  Buildroot is useful mainly for people working with embedded systems.
>  Embedded systems often use processors that are not the regular x86
> -processors everyone is used to having in his PC. They can be PowerPC
> -processors, MIPS processors, ARM processors, etc.
> +processors developers are used to having in their PCs, including
> +ARM (both 32- and 64-bit), MIPS, PowerPC, RISC-V and more.
> 
>  Buildroot supports numerous processors and their variants; it also
> -comes with default configurations for several boards available
> +comes with default configurations for hundreds of boards available
>  off-the-shelf. Besides this, a number of third-party projects are based on,
>  or develop their BSP footnote:[BSP: Board Support Package] or
>  SDK footnote:[SDK: Software Development Kit] on top of Buildroot.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
