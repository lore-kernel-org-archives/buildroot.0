Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B0CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 22:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7282817A1;
	Fri, 16 Oct 2026 22:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGHHT5YAtjIO; Fri, 16 Oct 2026 22:51:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB6F6816D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792191069;
	b=hq7EvOAbuR0X4mmRzv/A+A2+sw4w2D4NMruWKFx74T8txqae2QtFudUI1AGw5xhJkNoe
	 3lsl4PsuTkfG6KPeo7bo4AINkgFc9PRVAQHaQCSZauF+wQBWnYkPuKtgzcQRsMcvmptYI
	 EsRU8aTjJ6pT4UkgVvQ012C/nIyRQf8FxN4KiEs5Ap+oP/7iM/wFutAR7M4fY7V2uSZmi
	 Fa1JH5RP7JBeHfrmoJpBYGyOkX6r6LHrmlhpOQg1ccR9YR5PIsCNcDATTgM0ONhFIZb9d
	 NX8HtpeY1dmwPsNyub3Fhy5kRMGLV0pEEdYAguHv1TfAMJjRA0SPMBq8mnxkX3qPo+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792191069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=T15SFvxr7jL3uV9RXqexMKxzAs+0ariDBAIr3Ig8TZE=;
	b=ZWgM3W0NvsdjfB/300gNB+FvbtLMEQ9N87TMGl+2CrjmrVp0kf3Gfdyd/YbcCUk0rvcK
	 O4hst8JkbLn2ha+x8SalYsb/YWNZEtQyfH9u6xpUpCQjJitOQ9vucc/uVYVOtsdjv0REb
	 F/4e8GdwCz8E2TvD8FrxXRlbhoNyf3JhLBeOSmhh8yBGKKMVbslKAwG4h5ez8IE+noGGK
	 EqWiv2dH843i5ElG4LlkSS+KXsFxPiY5CdyZARN5PBxGVQYjZpyGNHWkR9MBOWMNvJNjd
	 Mh6f2hjA8FtViOUt3Cmky75+ttxw4sHb/+AzCMYvur6X3rwJaWcpz6s3OFQHlSfHXoA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IYiWSH+7;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792191069;
	bh=T15SFvxr7jL3uV9RXqexMKxzAs+0ariDBAIr3Ig8TZE=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=WH22U41HoSuPZWHp7nZFBu/bnCb10/Y/e4tMjKwqHi8WkltjEBJeEzPAQAS1Oytfi
	 zJZvYbCdVzAfPU+JW+HuwE/Kj8HCFbH1jFWs7PD349fQHOnTqxgTcQS2+5JBnIveVZ
	 ReaaDNVnoHEC5riTV+AG5PY09P7uqurbV3PBpoRGFS+epEp7ENG0uz8CXvBreobuye
	 M/DFLq3+S9MAf2pM/szk07wur2Juq3vvJ/h+76ua3c2nt7hn9v/DdOuJ+VtJVdeUjm
	 vX6HI9KM/TSZFghkI+gcBuQAB999cmeeZOYXmyJ5b/tdGjXafRFu0LOKfnCToUII0E
	 wSs2mD0YgQj8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB6F6816D6;
	Fri, 16 Oct 2026 22:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01A7879D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBEB281694
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhJEJqf9pla3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 22:51:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 05FE98153E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792191067;
 b=SHDToOVq726XVXHk7Rfc5XPYAo3C5eoezT0Z8sfMrZm09wmBzGEDJNk2wlc9YMHiu4IW
 THPV0ZlzPLpMqWvk6JA06M/TuIAt9Iqy++LdZTxKLTT+nGRz5b9HL9nldMEgBjIhBDDrO
 6NC4vl8wU9R8GMUAF/Rk76cWITZPqOzc+C/IU3psmXIhrFjpu2WLvvO0n1OTiQfw1++vU
 IaKWu08QM7KrbTU9il2Vtje3XVipgAflTlR3gKtmIOLrii0zdMv9DSStE3ru6S3T9RF5O
 CKguPfxza349eCyPzuOCbXQD9uUz49vv7xa6DA4GSEbjGMRx/q1go9G4Q29nPmXzivw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792191067;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=dTuQIaCM9gDdL9p3cQv72DlO00aIArMxfkbmf7Tuf7E=;
 b=YWY9qPZHyDj6o6oi5EoJxY0hzQMgMwJ+BsKE0aDWX1Ng57Hm8le3dq5yhGr0pc4X52q3
 FnWLZwGx6OgzeHAJX+StmxViGdoZwi8Gjp9lQCxth/uH1RxW8yMHVrcbfsp/lFAtWPlgN
 x6Sxo4KZvVUYXP7K/ITdYjQa9bLSTO7qjUkaWIkeda4jV9TBrxT7cHUnB3k0zHMkOKPzh
 TdZ/7/XariaGyJuspb0c7u2bDHu62+EysfcQwf0QIwefBEf9mEOFXMNamPtqZ+75FA6ZE
 kd3j5oqgOxQ3SI8la58ynIYnqKGRl37+JeunfD5EN1fdG4jza1ZSHkX8IqrwiLBgrUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IYiWSH+7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IYiWSH+7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05FE98153E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:51:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so5303945e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792191064; x=1792795864; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dTuQIaCM9gDdL9p3cQv72DlO00aIArMxfkbmf7Tuf7E=;
 b=IYiWSH+7AYZN5A44z8G9/zbekkEcK8tfJbx+pvNr/kANHuhsN1vrwPH8oxQ2AZi78f
 SYQbMoxkAgzqlVYktyGCd1YuuA6+6mc2KJVXw1MwHArPg7Dhankz9P8IxHdyFHjYJsvc
 /aSSS+YCzd2Mut5h1yT3NFTqbu7txSJBMjTB+NPHx+mz0MIltqmvjfjgplDiMv7BcPZM
 Alqb8PoRvCkfLAxl45rn1vRh20h3iYWRUMemkr3GLX5bLfksTqOYHu3xNmLJ5avyLaQL
 cjNL/Lio7j2vEG5pkJ63mMxXWl1CipieMA7FP0AOrWxkKgFO27mVTaNoILrpbA9Y3Vvn
 uE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792191064; x=1792795864;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dTuQIaCM9gDdL9p3cQv72DlO00aIArMxfkbmf7Tuf7E=;
 b=fXGmDzVofK/mINup/OHVsMHEqNJKISlvDRoRBl6f6TrJyV9RT9Axf0r7NJSq4o9+A8
 F9dbq60GWw3FBCUjWyOParecIIcsrKkiGTnYHiwZs0Hk0Zht4GAFsgbuCPSY+fA8PdDA
 IcE10aEtZLadAIBFpkdK9u/r6lY93xzHxksVTy0JK7GVPBzfNHxIviwWqUZIapfsk/6A
 A1InmgJcodryfyewVrmheQT9CCi09YABdTXXkEPMQjQzd+YzleiAuuDzcR7WA/bCWMDD
 KY6EUCpUqWkErT2eZq7zthA9iCENR7Kqsvn9KfNUMTB+Ux6sqQSXNgm5Kc1FPvAcXEU0
 kIQQ==
X-Gm-Message-State: AFq9FYL4oymya+K8G2tThNlPCtbCUH3X2PiJMIi9tqgf6IWYHRxa7ti8
 yy3aacFiT+Q4xIWZC7Hb/WG0YPc/Fp053l9GyUyRKkKjIYh/Nh0GlRs/
X-Gm-Gg: AYBFou3mni4k6CqWlyWx+o6G6SZ+SV4DDm1yyBVfzX1unwvX0p9mZ4rycdIR9uX/PXG
 /YowAZvHpso7QUpf1DeTfJCQWGICG1/lJed851sXbgyA/hoAqVUcOKwn5nYlmRBlFkjz/dZgiO5
 alUBIAuFKvcdXNZTUkdNbiYTYcGlP2NrZv6wpdqyDWf/x/ObOWWj2hzo8WUOupAZlS8/eZaNO+T
 ZTkaeMcS8Ilayp6YIuUsXDhVmnCwh6UAxPWax0Z595YX5AHovTBP3DTFRzeLw/TszC6yd7YRflV
 iSU7poidQJ1s4tcDbVmp3r8t3WinZQ4TxxqjohCvPbZZpdRlYiCsI5iJhJY44K9SpR7cCHtqXRu
 AT2fc1VJ++t1oK6LjkULeb2kKaUKw6y0doZsJnHM60jBOAv9BOoJXuTkJw9yWv6QzuDdZWy84CE
 bhJpY1rrlljBRDMggc37PfXCqIiOwKTIJdrs+3+HUUNQjjBfLexhiQ1Dhb2qejBzIBxreF8DK3A
 sAs2c6VRIRp6KIvVs8IvX8xYyGRy7uEPneImNRgnTRGhw==
X-Received: by 2002:a05:600c:3547:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4a1d7608dcemr23457815e9.16.1792191063989; 
 Fri, 16 Oct 2026 15:51:03 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd471a1fsm6618959f8f.3.2026.10.16.15.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 15:51:02 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:51:00 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016225100.GG331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-6-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-6-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 5/7] package/openssl: move
 libopenssl/libressl options out of the choice
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

> The libopenssl and libressl sub-options are currently defined from
> package/{libopenssl,libressl}/Config.in, which are sourced from within
> the "ssl library" choice block, each wrapped in an "if" on its own
> choice entry.

> With the old kconfig, these entries were reparented below the choice
> member they depend on, and so were not considered choice members
> themselves. Since Linux commit 7e3465f63a0a [1], first released in v6.10,
> this is no longer the case: every config entry inside a choice block is
> a member of that choice. Combined with the stricter checks introduced by
> commits 700e7a8d05ea [2] and fde192511bdb [3], parsing now fails with:

>   package/libopenssl/Config.in:5: error: choice member must have a prompt
>   package/libopenssl/Config.in:15: error: choice member must have a prompt
>   package/libopenssl/Config.in:15: error: choice member must be bool

LGTM, but (as I noted earlier)  we need this fix earlier, so that 2nd, 3rd, 4th
commits aren't broken. Can you please do it?

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
