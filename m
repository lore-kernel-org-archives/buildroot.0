Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E2D5B15F
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6E6605EE;
	Sat, 13 Dec 2025 18:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VDWg4KBtqLe; Sat, 13 Dec 2025 18:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FD76070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765651204;
	bh=ooC3h97ZpeHJ6NjKBmumCmNS8SOZiDSsghm6gOhU/Zo=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=s8B+5/TgwjTRHKKXp7j8o6UcEo3Bz8HrubTWpScf7acCDZS/mHH5+gYJo7A8KxPvw
	 mvJ/4KQv9g63vN+cH8oMHr3+CwRdISou+/7/cu8nZkuqzNAfTaIGJoipggCTylOQUm
	 kVJL/O6epjn+jq80ruAjodTqgIx6Zciey+uZOt7cjSrRZ6Hnz9kaN3gHh9FHFh/pL7
	 TT1nR8AD77GGb0AePaPhZ1GKsHRut120IxASEulopK8LBlJqIEX69R/Qbu8WAA4YTA
	 U8KAxZOOGCqa1aCAiBouEhAyGkb2S/AESzZclLE/o1TZY48V2CeXz2W6UAQB8+VpuY
	 gIk7FYtPyDmZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FD76070C;
	Sat, 13 Dec 2025 18:40:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A41117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68DA940921
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Z3U-SBQCVmp for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 918BA40910
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918BA40910
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 918BA40910
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:40:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477632b0621so16153205e9.2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 10:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765651199; x=1766255999;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZjEXV2wpdDobRovHBM6zBvFKy6dvMt81h4ZpJQAeu7M=;
 b=DjvCfojBVJmmL4zbBpPc87d5KNpHxEL0KO8HATi1arPu34/86Lk+ajJsO1DaXh07sP
 bxjgRRRwir5Uv2DAiXaZm0D+s7JpqZd3WbacbIhNHV3hQ/pY0JF1jVgXVpOnSLi9U7wP
 s44lMxV2Z/VaKWOpKlljS/hreXummprFRuQy9x1hXBe8KcI4otSnpgJD2HOl5Aj809To
 rO1W5Rbwkb0BIrSdk2OWazgJHJEHUnNbH3B1L1wap6c9h/muISJIjkQXkKWsglsrmp/a
 wCnGDS9Ou4oY5Ww7guSZXIvoyBNhIIw50Defxq4+BwufE5r0stlNhvGZhyLpt2KJP4cL
 o/8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUBgXAkaC4tWJlL+BC7aCz4Ml55HewVEu7zG9sqlsyiG5sAPoHJR+CNOc7Bs6SQJdaMmhcxp224rw=@buildroot.org
X-Gm-Message-State: AOJu0YzJrBSU/qBMEpSkgIZJsTNyMy43S1WEZZUIb/omkPzGALs3qfWN
 JU19K6GHXZJeQu/j4QstLA7v3/QERJnzrtLb+unCGYGgPHx9Ygn3gyHL4sy7O6b0
X-Gm-Gg: AY/fxX5v0GSk8hBCK4dd9Xx0e19WjWPsuqhpNq0qitwpHZROt5CXKUiStEgv59W/YMQ
 Qgel4pfOZLlzJ6ZVOEmchBgVpPqhfg9m+DqUS9r332LGh9HQzvcKqVgyNlNocz03kIsokUtmdpX
 FABIGpMc3WKWT+BXtlh3Gk++kSqqlOExJPBAqx5heLTdae2JpjmhSAcEM3X9Sm+g00cNyIMwqJ1
 7sYxAyzrfvr2RW2WeXLgu8vPcEq2UBx+aBIzeeeFCX9/2HvllQgzeMw5B7PPOL+uudrklK8LGBh
 psJKXUi7z7PTkN6WD4THedS+4L6frqdIRrhG3LyfmPtx2T1O0yfxJIvrJwEDVE0F1AyYEiAiTtM
 oYq2g3cd371l4Tw3WjaDAMxcsy4GHxK+x5IGGkqYHMe4a4IytSgDvA5P8kcoWhaFff9YIA8NIpr
 evBPDY0BaiGGkbGXe/HzdVgOz6sSmJGCKLMIm7sbvLt1Ypjc9R
X-Google-Smtp-Source: AGHT+IF8B4FL6Hb9zYHuFLU+XdaTOnAZQUd1I0md/B7RNyQt5sYUzY0Kab8b0/xpSVB2+OxwntZu4Q==
X-Received: by 2002:a05:6000:438a:b0:42b:43b4:2870 with SMTP id
 ffacd0b85a97d-42fb44ca69cmr7853058f8f.26.1765651199445; 
 Sat, 13 Dec 2025 10:39:59 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fbab2d3b6sm8516488f8f.23.2025.12.13.10.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 10:39:58 -0800 (PST)
Date: Sat, 13 Dec 2025 19:39:56 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Message-ID: <20251213183956.GB183913@pevik>
References: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
 <20251213151730.821513-2-giulio.benetti@benettiengineering.com>
 <20251213181423.3a3d23a6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251213181423.3a3d23a6@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765651199; x=1766255999; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjEXV2wpdDobRovHBM6zBvFKy6dvMt81h4ZpJQAeu7M=;
 b=mHMXRHH2eO6cYoRGt80ZwLfJaNdKHMGEEZhHk4p2s3RTLMwP7iDcEi+MG2voKfOnRa
 kxYV+hUlcsgvAvMVfWpspMGLlQv0hUDs6MVkMUwwkZGyRR8XNcTEA86zsUh6isjySf6e
 UshESPxzCLsaOQEMg7AhB/+tkBBoCFgRuOJEvZHlOpgTBLsREogFwAEMaV16qwIXTXZY
 kfJOBfI35T61zGx+QarW/lBg4hXfJbTH2gsLK5J61/SkqfJ1dBYaDrswnhXtHXrwg12I
 A6tBRtXTVsztWtFtdqaNgQ2lK8XxEuZB+CWFy18OGlUISne/EscpqKdy/a75sgQqeQgK
 f4PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mHMXRHH2
Subject: Re: [Buildroot] [PATCH v2 2/2] pacakge/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_DB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio, Thomas,

> Hello,

> On Sat, 13 Dec 2025 16:17:30 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Pacakge nfs-utils requires libtirpc rpcdb option, so let's select it by

>   ^^^^^^ minor typo

I pointed that out in v1 :).

>        select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
>+       select BR2_PACKAGE_LIBTIRPC_DB # getrpcbynumber

Maybe also here note the reason?

I hope Thomas can fix both of these before merge.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> Since when is this needed? When fixing an autobuilder issue, we need to
> understand what introduced the problem so that we know whether the fix
> needs to be backported or not.

> Thanks a lot!

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
