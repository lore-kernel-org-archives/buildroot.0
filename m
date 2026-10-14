Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D99CC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC7874077B;
	Wed, 14 Oct 2026 16:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd8zKEqDgY-D; Wed, 14 Oct 2026 16:44:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F40654077C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791996262;
	b=hDvifb5la8Jx8nMCrfGZu/HQwUy6s5rcqRDooZNnSZwugPYCTOJ7Wl/N+cx6yHC8qsM7
	 CJ2Ovg8Q7hYEyp1V9BeLPTFkNt+cbmwBOz/sTvgG7HeGoif/Zzl9clkofPGFmyYgN/Dp4
	 EBvb1WRr9z5WZ5v6nTiFmwoByCVusZBBLmZ2RuQPWofD5PqFBmqKG65PFXdT6G0c4SbIo
	 5JBrfKidFdZGoGTuN32vWWVreDlW6Qg214VOKA1IFbKN+2iKoZBlmzbpBXuCnmPK8CN1B
	 Ma/niRWzKFhZZoPGUe1mHKnSjbxWklkix62zHD9B5qtsv3f9DdgUzlR5CMr5gQQGFJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791996262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0O4IpU2q8zjaAvDIydzNorDnEL3SmrIt0Bz6OOOHgM4=;
	b=bpQkjgf54MdW2cJ7cLp8ocG8ih2sf50cv+CCH4eoVod/6VsSghV+wc4BgcrT/lRInEZr
	 aKrIGf/CE3I9AEwBLjOy0gaQelJ1ZFTjaXAS1HG5rDmkGPvzSKv2dzadv91KIps7jyMCr
	 VmadS24scAhlW0aOAcpEbPv1/PwDcdZcfxW5H30N6Vs0PL0IrdpqfrTJ96WVKCHiHMGOK
	 5xyxpE+DFCAHLywpDPT7ObqQixUA5e0P0sCWgrJL8jpFZmacRC3N74R2wAF+Zct3fl/1H
	 fALZtosovjdN4hUfq9oeqRC/IpceWdIgnpU720R5JYThp4DXTDg7sGRydbD+dbGK69Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=mptoat9T;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791996262;
	bh=0O4IpU2q8zjaAvDIydzNorDnEL3SmrIt0Bz6OOOHgM4=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KpKjLHE7hm6CkYu2yylMIbif99ZMp4OqW36TVF/t63+KuJzFRwDg32RAtS7/30VTU
	 /on/Y4rC+aUwr0k7u2DAXCzlQ/CFIniHHe3tULIfXurBqeb1yuvbvMJDbIBuibO0/9
	 sKiyxfsOfHIQA3NomR61MllWfzFJd2akGBcFMPGnFf0aP2ZxgnQUA8bPMDQKU77chh
	 Asx2N3AV7G/nBjHfdG0k6NcAoUr2iiX2j7zXtniuqBTie9d4CSS2E8qf0+PYwu6U9T
	 K6QPb9lwGW5nFeupAVxqSIOY2BfU3cY2/d1fq6I2KsDOB9S/+msiXu4koHwlRG+Enx
	 W5tNhGoWB7Jpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F40654077C;
	Wed, 14 Oct 2026 16:44:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD781DE
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1639240755
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVrPW5BOSvza for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 16:44:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E5F8B405E3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791996257;
 b=d5FAaHYQ9u2rRNaNQ+etO49EaTESOpd784rN1Yu+EoZhpR9oMkGML5NxrlAThaadazUp
 FCuUSl7YoH+vl+pYY6nIiWQkjArrwq5nEyyRjD74e0orSIz3HYh2dvDijRmWP6bA0GOhQ
 7Vr4LouETblm0IcHK0bzyv4RWnThXSRyUc3oYO9La5zMC2ef+/YsY9QhBU1IswToZkXvJ
 sQV7yA5gI3FNat/gz40Wu/8nXvkzeXU/t4WL+Nv7hUROWNoxL0M/xO/FczSgiBA0901Kv
 Buy6VE1fxU28hEad3C1z+jfOrfqk0moRklU0ac1OAMGMohwmwzUiaWLCsPNn3BA8Etw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791996257;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=iquAlmhMWiPja9pPLrmhCvhKumJhEOuHMaYk0MqaW0w=;
 b=h5T7aN30sO7I9GUpHMdLwC1L61IVzhWbq4842Sy0HHNdQHjIJZAsAxtqk+F4PuhyeA9f
 2t8BbEe2H65P0WX1bt2g/S+Co8NV90GSJlKrf7zgCZXN2Q8OJjoce7HNyw2U2PuhahM69
 aLu1UjPsgpaMyyeHZ4+X9WdvleIA/DqhgVgmLLncdCZFYZsIGHCGTmWykvdUmksczfwMB
 SSm2Nhlo3uMJlT3QiIrtWn8LGhVecnfupDjZRe4MSuUhz9Wbp+ZnA/Hp5kwSWYPdL4vym
 eYKzjW5eeuuummZsNEhugL5qny/J55dMazgyWjlNSfSMEJMDivgTT0NBhXKzPJti7MQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=mptoat9T; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=mptoat9T
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5F8B405E3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:44:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=mptoat9Tex63YdrKAsBaHPrKmR2NJJAn7+K1tDrEiY4bYAEwibpvOAclNOhSkFBlyQrW7n66rF1HrKELJzaglL7beA2zKWxUJPryIu4RFu14GpWIqTjLCcGRgBOVY1MlOclh3JQE/eViZQgJI/NO3PtjKe+zzSDT8C1c9MP1aKgDt8I6uml9Mb9VbiWMj7550x9bivWYNQS47IDyh8ClK2A/otvCv3kpPDx/mpXxuYx6/MiZWF9Dwx5cXIVK3mVrNFXnKCFpBKn2HWx7+rLISHQooRGe6EejfS1e1NbxxZVS0zIbRRMaJ7vJUbXNr3JocuPjCZXe5XlJ2LusnDbZaQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=H3533qa8108mkrjzHm0LV5h4WlDpLUyOVTxuWcEsALY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -138135477; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 16:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xH246-0000000DG36-1Pwe;
 Wed, 14 Oct 2026 18:42:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
In-Reply-To: <20261013184558.7397-1-flaviu.nistor@gmail.com> (Flaviu Nistor's
 message of "Tue, 13 Oct 2026 21:45:58 +0300")
References: <87cxtgh7kp.fsf@dell.be.48ers.dk>
 <20261013184558.7397-1-flaviu.nistor@gmail.com>
Date: Wed, 14 Oct 2026 18:42:54 +0200
Message-ID: <87ld80s06p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 1/3] package/python-cramjam: new
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Flaviu" == Flaviu Nistor <flaviu.nistor@gmail.com> writes:

Hi,

 >> So presumably something is not initialized to cause this null pointer
 >> exception. The fact that PyImport_ResolveNameWithPackageContext gets
 >> called with a null pointer is already odd.
 >> 
 >> Care to report it upstream? I see that there is in the mean time a 2.13
 >> release.

 > I saw a related issue reported with a similar topic that it can't be tested
 > on 32-bit architectures. This is way I specified depends on !BR2_ARM_CPU_ARMV5,

OK, but then it should presumably have been blocked on all 32bit
architectures and not just ARMv5. This is really the kind of nonobvious
stuff that should go into the commit message.

 > since at that time I found no other solution. I have tested today and version
 > 2.14.0 (released today) does not have this issue any more, so it runs on armv5.
 > James Hilliard just send a bump for 2.14.0, so for v5 I will not include this.
 > Here is the link to the bump:
 > https://lore.kernel.org/all/20261013164254.1476592-6-james.hilliard1@gmail.com/

OK, good.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
