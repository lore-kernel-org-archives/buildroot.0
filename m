Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67A106F2FE
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 08:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF8D60A55;
	Thu, 26 Mar 2026 08:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPLqH7-19-Cx; Thu, 26 Mar 2026 08:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD48D6086B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774512888;
	bh=kQu8GZ0ekHMzOkdUamh5/t0f7tJqMOkk7Vx8+fjKG8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=KsTajntl7GDnk0HFVQwjpVsd1l3CSbSr9GR2gpJmg4ob6jcF9MhG12U9vdgnOFziu
	 zJ7JVwKCXa+omQfICr58qni2VQ3XmaqSDK8oBSYclKEZjWn+T3FOq7bdztvGFvTVcN
	 Q1+AMhEG9fZsAxxqJDEwwtzK9HVOTi77YFuig3Lvrc0GPiXneP/TEg930mFQakM423
	 mMlljakOyAdPdolCO3eGISFC1UPqFBGjvy9C7YD1l+pv/6CV9cQqXuSTVbcaofNegx
	 f0y9a3WQz4oHZterDOA9353pCYVTE+CqNpqCFbvBmMAjvmfX4vXKbpCKsG/N+9By2D
	 tmsVqJixpxmIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD48D6086B;
	Thu, 26 Mar 2026 08:14:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2D01D3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106DE40990
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6C2ZsKTYglOQ for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 08:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AA2E40969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AA2E40969
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AA2E40969
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:45 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-66970715adbso1279093a12.3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 01:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774512883; x=1775117683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YA+S8zKgXaZGRQJ86xB5356UdcysnSfJZDwjSaA3E6M=;
 b=Gdf+eabkTTfczrXV+xY9NPRDillG2/T5u3G6C+RdV4zPVasmf1MnafCEPE/5FkpC7L
 C9rqLoGkZ/vFQtVLUVlwSUD1X7AjRSbzYQTePv460+u/SjsKABXlQSE2EKjpcZAb5+9N
 9pOIwTlBg8V9+C6/MhbM8vBCRnhWSGP1uvuyIyaiKbwfWcPTfhPBvo4kTZ2JEY6GNKG/
 BoYFd+Q6ig++3Qew7KYmh23pViKaujX2VYAUmwsCmZwHtwru864vICi7yimbKA1CHTzh
 HBlqecfsfnhaZ+RQ73Tf4oS+OYuRxEs0OCNvE8ghUt3Hqz0Y3RlSfwvTCQKIW08ytJy+
 IykQ==
X-Gm-Message-State: AOJu0Yx+NDSPK1IgdhkL15X7LeB3IIewJVWA+EhtnLwKmrHlwt0j5kun
 DPsBNDp3r9E3Jw1xqSQwi5pGK/bp/rBEH9C9cs3z+B1F3pc61AVlYcpC5D7Kv2wtbCr9zVVI+AI
 ruvik4jY=
X-Gm-Gg: ATEYQzxFKsxzy57EvW05tK8gZdnhfxlpLXff3+qJXPJ9qT+CMZl5CjMw5j9COhSjiPD
 0fMt872jxbTgpZIkqxN27xQY2j8IqCCYmUBb3tJCpGBEniNTqYFUySAyVxGWUEo+njIStW5lUO1
 lZgt0SxYbXX73fenF31bN1bDK2ZAlw8ea+k7yQIzo+1oWXL4nGwrY0sR7a5Yrri2o68Ye5OQGba
 UnEcyJUR/ohH1ACv3GHEAcP0i1PZ5JQpX8eeaUSf2EO7bIcbnSn+GKVFJQhD0Z1m4HWgYFBrME4
 AGQsc4o0odNMZ7PxtwsFOGIX0BNBYpSn/CmNBJBjjsZDT2BUGdib9jFobkXylpTn1RY/UkEd63t
 Q1o4EF47tE92illUasXNUl7ap+y8ETh32G5/jRR6VzwhMF8CU8ZSW28AaEcRmA4HTmgLAmJPpeb
 5xOVS7G4lHfi0DYibFLK9RJTyKcu8cv+N2
X-Received: by 2002:a17:906:d217:b0:b98:482:8ed7 with SMTP id
 a640c23a62f3a-b9a5429e2fcmr280294066b.38.1774512883338; 
 Thu, 26 Mar 2026 01:14:43 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b2043e7cesm83315866b.57.2026.03.26.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 01:14:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 09:14:20 +0100
Message-ID: <20260326081422.945900-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774512883; x=1775117683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YA+S8zKgXaZGRQJ86xB5356UdcysnSfJZDwjSaA3E6M=;
 b=gHibf/8EPua6jtJb60vOsQUdNvWiH/XXskWopwewj6rjIl4qf2cfhpmKKIWxTmxFXv
 Q0LGA/gLAc/pbNjPGPlALzJujW8TYpRkQB+PLduvsQD70ilGCUNzIyJYPMmRrwKRCEOJ
 IDxnVx7MD9yTNRODnChI3ieq+2lnZcPbrAWfIF4rATnsoUjaLZ8Y6UPbKokSnKOvbYFa
 MZpTFNCnnnbKYyBzMDwZeotIpqkLpooK0ovnSMdIXXzkXTo/QQoLkf6IbYo5UwyFeyD3
 J2yPX/qo9gq+uQT0jJiBw2xGyXPOep8Xmm/ghOmBbIJY3kzRi+whS0W41KCHRVNGOXGu
 xL0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gHibf/8E
Subject: [Buildroot] [PATCH v2 0/2] Add security policy information
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As part of the effort to obtain the OpenSSF Best Practices badge for the
Buildroot project, add basic security contacts for the Buildroot project.

This helps fulfilling the following requirements:

> While active, the project documentation MUST contain security contacts. [OSPS-VM-02.01]
> Create a security.md (or similarly-named) file that contains security contacts for the project.

> The project MUST publish the process for reporting vulnerabilities on the project site.

> If private vulnerability reports are supported, the project MUST include
> how to send the information in a way that is kept private.

Titouan Christophe (2):
  docs/website: add security contact information on the homepage
  SECURITY.md: add new file

 SECURITY.md             | 36 ++++++++++++++++++++++++++++++++++++
 docs/website/index.html | 11 +++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 SECURITY.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
