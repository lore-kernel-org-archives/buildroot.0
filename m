Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6DFCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 09:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6505B80F97;
	Sun, 11 Oct 2026 09:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGemN7N-po8v; Sun, 11 Oct 2026 09:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B5D780F74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791710109;
	b=oqV5O57ezy8GmaUAwmlJf50Ef5SYDdWds06lI4ub8OrCw0xU52JJI2ybmbwTQyldoBis
	 TqRh7keUcqIFIS2iKAIWK7zJKZ0UB0kGMZm8JNBXmDOTqaFA49nTLcTFoUqXWuWxkb9ja
	 82Q+EcsGUvLdHjiB/6k6F+36flWHLlcYM42wfxGzRH1iS0skpAc8hL9yXfPXedPdP3WGz
	 X9LYwGEhXnQ07Oj9VSL9HIKrXmnE+nltJ7WoKMgqGkO2sSH1YhObRWksnBOkavyW5/K82
	 ekwkAiDizH2vLZrKajg25YDaJxDHgJ1M+H5eGvBjbs8cr1Dq+MQy1WLpTyS+BE9hC3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791710109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:To:Cc:
	 Date:In-Reply-To:References:User-Agent:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lJyPAA7mhvzel42v088S21372qNdZrpPRPmt+63mvRM=;
	b=BVF1ufXK7NqNe4nm+eBRBm0YIOKvz5JJuWGZMrB0ZA+cqGeB0bhua01fHiGFR6ruVQq4
	 ZKivh+ODthzezCvi7rNl2ykb3vzgSgRwE4sR1LFULD2Me0hQGZAMe3bND6pd7Hw1d+CWn
	 4YtAvdvtFa9OO4uhhzQ52hvykaW5m0gy5MJ8Zyt20lc4/eTa0Ax10GANeBPX3Lvl0IImU
	 vA+DwB/CKaZ393pNSmtW7UiazBNuSH/CBDEvEit6tNHYKOnyoIyO2apzn0JJp91I4E8y8
	 T29vXZkNStToriZf85vFwgK6ccJFjeNMbLByM2ZhDQo9/FvweQX2zWInAcdFvAoL37Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791710109;
	bh=lJyPAA7mhvzel42v088S21372qNdZrpPRPmt+63mvRM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOqxX+lAjnhgUPriJvYOZdgADUuDmS7yLGQiN371Nyyl3RFncJdVlkRNdanlxkj00
	 FJHPvMtf8mV7FG5mQ+yFSDrG03VvslMX3gMZ213x9Mdc+68ILvA4htNGBAY1eRrQFP
	 DpEsiMG3gRsNSOrrbjFsFnzoTE9LseNUopzi6QJug1kND0kUl7Ks/C3azYCr2K1glY
	 YAqfInWAKMC2skwUGZmlSG9vpbZV91jCdGHRntn6ett5V58HqzfBw96ePbDLc9/IBp
	 bmhRsgO1OGpnQoAlxh7vZzRoMafFgFYsyJ5LMGFT3LaUExN0hhR2PYjjCUxsg9WGZ/
	 uFyMQLKQ0aybg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5D780F74;
	Sun, 11 Oct 2026 09:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C523B317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAFC260626
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qlg2RBvw1bp for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 09:15:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1FBD60622
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791710108;
 b=TZWcj6Hhe/Knj32CtMbjAIoS/9H1bBg21a9beE4QgTq3qQR6T3ZoufCe1ipBnC6OLRMI
 C8q9OYFbLKnDj1i+t9p0T1aLRRHltw1/DxpkfL2G4f0xkv8J4yAo/KqpTAJwwS/ofsUyN
 jdFLgNLWUhZjGPU+30o+DM1+lX+PPCJ1tL053iwW21052hKBBxKKTz6vE5fd51UVMf2zw
 PlO+F2nD+1BCIIMPnUa+w0CvgZJwqz2slqC675BomOwN5eos5gLRcMjIXmKf5TwRo/zyE
 TKgogkXZJGOdYpLwQU1q+rvbeXXWHgJvWJTuj2cCmZWSa4t9U8KcBrevPMWSMVzo6wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791710108;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=MXZ+nOLZ8jo5geCkAfdG1p+7c6xf0tc0av7P7kNLE1I=;
 b=OmAaC/vlr/3FU26or9NmZzslhtmdHvbpacOa+sWhv2cIsIUq7VL0cFYCD8KcrlkMLO9x
 VYbw62iernWya3R8upyHiMmn66RWTFMYbpporTpZtt3nKorbBPwKpE1cMyZtYPocbBcpB
 OGmIXCH6/MMJZqu5afcSgunZrLdTMNfUEzFhFFmxYWoiGu+JG5rEbWoSGByP1AVS9YYwZ
 7R8TiFSTQjJQPqO1/Fif6UADPbLwLoy7YNB6nsTKAh75oeH7aQHzlNeNXAmvV+EIWc6WO
 Z1EAWq6jcK8epAJWnMBxz/hO5m0MFLF5zDVVGoM9iwNCiE6dPZhVCQXUYki2wLuLLnQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rZ9LzwDt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rZ9LzwDt
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1FBD60622
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:15:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so665820f8f.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791710105; x=1792314905; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=MXZ+nOLZ8jo5geCkAfdG1p+7c6xf0tc0av7P7kNLE1I=;
 b=rZ9LzwDtSUSVivOeS2zhiz+Tm0QIE18CT3En9tDU+k/FZVmV30sezgMJ6cuVNw+01l
 rrsUb6tFNDnTa4z/B1i9Us6rUbr7JyiU1JOmdMTDqdJ70t0J5iBEfTPEu5J5wIBgf9x/
 CJHGrTH6RNzm96g8iz5azfci/MVBJ1M+DArLteV40c2zpjBNePYQwintuIVYzlNjW8vZ
 DziZ5GWeU55mNpN+0iy7QEpnMCXjlU6mkH33vWeokGgVv+/MRANxt2xgFQbkJwZwtoZ5
 i5bAUNTv9AMeUw+ahAy+gHwuy0GCEmjNU95tTOdTAqszjeMq4pH1Kdl2RiYonvEWpUWd
 OOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791710105; x=1792314905;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MXZ+nOLZ8jo5geCkAfdG1p+7c6xf0tc0av7P7kNLE1I=;
 b=ieHT8Vdycwq4S4YZ8QW/4VroKR3J1in1dTn/I7liwm3bz+ZUOgfeDg42wIXKJG+r/m
 9Vbab3CVhpzJJtw5Jyi/mx3uRwf54fJqlyZPJSKqOLac4ArfOZeY360xrlTSyxStYswB
 r/4Pu11sRfcqp5wyF0if2yVgfJJzRwAfQjje8trVPbPNn7hebT4GAVVtlIexv03YQaUJ
 zC3PxxBp9iuxm6dMBVF8Zusi/jVPCbBZYm1ZDP62iwDSP7LnRLAqrRNizmJIm0NUMwir
 ik81fp9Njsfk5J1or4H5dyNdNZtiVPH7bAh6dyO8heoMCdUXK9a3YBN0Q4pDTl3N1bEk
 lTyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByFg2qur386bZrIxOk7alWJgKDgnBz6yJ8Ch+QxjdNSZwDo9Jr88VfD4o8sh8/ibpCv+edq3Cze3lw=@buildroot.org
X-Gm-Message-State: AFq9FYKoB5/S8k5C+VVm5mQ7k9rfVzDneXOb2jjiTsaELVEuAbYZuL2O
 DkvfSXzNcCtjYnG8igH8SPzxg/w8YYQT/eRKf2FCeDD8mNetreDS2viB
X-Gm-Gg: AYBFou2TBK1FV3h65nqiPCPZ/dQYSq6SyrYeDiYySxIj0Jy3xMVaR4kSIeGaRBUjI7N
 trJ7GBcvHrRVvFA4Fg/bcICpOExwPLkVHiH1Q4K7npUF6ffzm3gVNr7LGG1d9C94tjqO5PvnqwM
 JGVsf10fkfCj9xRWiXnN/mQ4/xcUj/7tfCfRUH5Q68GZO0xjsOc+TlF49LqLoIWSQJEPUnNI8T3
 ViMuSIujZv9l2/ZI24RAC3gZLoT9Wq7vzaVHR8FWpHr0BcPIv80AXCEhtutorz7CFPwQRfUkvKD
 /dhmKe5y3XWGhBbcyYOB3LUvnDHMJdTbSRYP5aI9UoRchL08ENjqhGK0BB4u9Hr2LCAlxBveDoa
 KvNOgY93jy5RaHpfcfHQSrgiTR16rfqGlKchmI699tFwD4m5NIM9iHIn71z/YtzNy1cQty2d3K6
 WZzf2B31P96U0gKFEgiTdYM/IKz/4XDGnnD7w9JV2gvwz0kD/ZNdgpJUawrjWJ7M6dcoefmq9GS
 4aj1J70U0W/SLcw186lrGayCZHAZMSRhekuxEggkcxoj9qpFavqlA==
X-Received: by 2002:a5d:5f54:0:b0:48c:5306:c11a with SMTP id
 ffacd0b85a97d-48dbaaeb832mr12187562f8f.24.1791710104985; 
 Sun, 11 Oct 2026 02:15:04 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd3aasm13041913f8f.32.2026.10.11.02.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 02:15:04 -0700 (PDT)
Message-ID: <9e5551a6a82622031b83c3bb915ceedb6bceb175.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Date: Sun, 11 Oct 2026 11:15:04 +0200
In-Reply-To: <astNq9p7MlKwp2qG@windsurf>
References: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
 <8006a4ffe97e560506b5e7dfa8634f18dceaae6b.camel@gmail.com>
 <astNq9p7MlKwp2qG@windsurf>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/readline: link host shared library
 against ncurses
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

Hi Thomas,

On Sun, 2026-10-11 at 10:50 +0200, Thomas Petazzoni wrote:
> > This assumes that host-ncurses always builds the wide variant... Should we
> > just mimic commit baa81362ef instead? Something like
> > 
> > HOST_READLINE_CONF_ENV = $(READLINE_CONF_ENV)
> > HOST_READLINE_CONF_OPTS = $(READLINE_CONF_OPTS)
> 
> I don't have the full context, but doing this is almost always a bad
> idea. It easily breaks as people change target variable (CONF_ENV,
> CONF_OPTS) without realizing it also affects the host package.

we might want to copy-paste both variables as well; in any case, maybe we
want to rely on configure figuring out ncurses deps instead of mangling
configure result on make step.

-- 
Alexander Sverdlin.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
