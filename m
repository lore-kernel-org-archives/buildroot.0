Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49AEA7940
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6672780E5D;
	Wed,  4 Feb 2026 19:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBqiKa7mtmbN; Wed,  4 Feb 2026 19:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6871B80EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233092;
	bh=cV8b2Mw+tYQaxy3gqp6usQotRH7tbRcEB72bhrO5380=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZST3RCA780mfbvGQ19VaT/TX2eaOO3z1vsyTF9MTV9SHUU7BKrHr29lLCGqIHkqMY
	 kgo6HF6t/xsDwaC1JBzcg32C8ClUt0u33/GYZxZwcJxZH/E40iGQIvepTnsmFii6tS
	 +ikwECPv9GP44RJXfq5g9iNoVII8193hk4eEUpX2/dHlC+XJXpP0iUsYly9UR5JEJm
	 I0gTjrgdS/ImiyKrIi7Q7Xa51DBE+zV/2PpH0ODY3+2otz70sRaJw9zPOnFvSa6Gm4
	 1EjzOctvET9JklxrY5eYhTqCjvWwaICKVj8j6AHZL65QlDRiu2Ru2gU9btx6qmq3GB
	 oEQWv1mpPHU2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6871B80EEC;
	Wed,  4 Feb 2026 19:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5A1A17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B79D24010A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9314Tga-WOWj for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.210.53;
 helo=mail-ot1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A995740012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A995740012
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A995740012
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:24:49 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7cfd0f349c4so96862a34.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 11:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770233088; x=1770837888;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+2sBkYqHKXAoLB084vVNoaq444NX0DVtFhnMBgsKcs=;
 b=ROYKMPRR3bCPFJWpzzXe8Y/eLTrFxEkAKK49vPy1xmCWDDJyZjjqeqJm+dmHpnsPSy
 I+0+l5Jakme2QSGwfsi15te6s0AtE5Lxd3zMgeuFFVe9boKLPk9xHRKqWBVc4caIWVUs
 htQmiTdEKlwtAWTpC6BZcy/zGZElk2hs3jhM5vlUtpmJtGWhqmRdaQkVvcf51y0+BBeX
 jsAQtYrjjrUaQo5fA8aXmBdpJFLi1qOxRIB3UhZ8OE9J7HsJOg98uDWYJfjIsHd0ncsB
 LW+EpWgS9Jc5CbVDa0Qpd2PNq8pcqnwNvDmRNDwHxgQH07FBEC5eOgUaZNFZYjp7u5y+
 QYYA==
X-Gm-Message-State: AOJu0YyApoDJ+wJbWJi9SWWFW8hbx6WFwSLfN3koZSWkWSANV9IOTIP1
 s/HXDFKZ6eK1P4vMaG+FB+RPd/MPshswN6Qdv+PkEeHKdVDpSK+YxaB4u9rmdsdS
X-Gm-Gg: AZuq6aK+GDltgisAFWAPHD5/tvknccj7WZ53hmUMwd4SUFHEkybf2BzkrD/ykCJCH/6
 xae4T6WX1mM1HJL/H2C8Cgojq5M2KWqDstM9z7I0UGnfVBETdYIybZR0obYcpiRbN9BweD78ZXc
 XiZJbukUf0NlQg7galNUKDnbqU1J2sXxwc3TNZnutGhC5cc+b3+W18z6+D08sZHwIep5AAAhspj
 7k7tN9Q0ewOOCPC6VZWezloNY7FGZ1odAw2LoJQtCSbtAz2Mbis4i8DCSk/qzXLGB0Ja45q/B0v
 L3/AuMm7WrkDVRrFRFDElpjxNHXUMwH21ywxpVkoOiciz2WoHYyHZWpz8j0ZtQXRv6pUDZ8vSV8
 hYjxRTKRdIialTqe7G6q4LQmrRxUkvgHP9GRIcyufz9zwFobrbxAN5Qh1fY0uLN1x+CMuNqlXzA
 pXHRVauhHLVJO53C8Aeuvp6COOsryi9LTqoBGlpSOxwxh3rbFc4qv6Bj/koNIWeK2jzBJ2CXkSQ
 /+U3t9R9vs=
X-Received: by 2002:ac8:7d4b:0:b0:4f1:b93d:fb5a with SMTP id
 d75a77b69052e-5061c0c7686mr36206341cf.7.1770224297688; 
 Wed, 04 Feb 2026 08:58:17 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5061c1f9470sm20424801cf.24.2026.02.04.08.58.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 08:58:17 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-50145d27b4cso449171cf.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 08:58:17 -0800 (PST)
X-Received: by 2002:a05:622a:491:b0:506:2041:13db with SMTP id
 d75a77b69052e-50621332879mr23148741cf.49.1770224297033; Wed, 04 Feb 2026
 08:58:17 -0800 (PST)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 4 Feb 2026 17:58:05 +0100
X-Gmail-Original-Message-ID: <CACXRmJjmbLoGTpJnMC9j7ffKg-2KbA=ev95KuyVc8qSUZN20og@mail.gmail.com>
X-Gm-Features: AZwV_Qgfo3FetqbsRIjwHxaGxI7SMOEvtWT9Vc8ZlhtNCSKQ4inXaY0ekgZavFE
Message-ID: <CACXRmJjmbLoGTpJnMC9j7ffKg-2KbA=ev95KuyVc8qSUZN20og@mail.gmail.com>
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCHv3 2/2] package/librsvg: Enable gdk-pixbuf,
 so gdk-pixbuf is able to open SVG
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

Hi Guillaume, All,


This was disabled at some point because broken/lacking
cross-compilation support:
https://gitlab.com/buildroot.org/buildroot/-/commit/7372c80cc5b07b25d5ee5bc9909ed807a9e69fd7

Are you sure that the same problem won't happen again?

Perhaps use this util to at least check most of the relevant toolchains.
$ ./utils/test-pkg -a


Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
