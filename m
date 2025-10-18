Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F6FCCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A316062F;
	Sat, 18 Oct 2025 19:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USseTaZnxcvI; Sat, 18 Oct 2025 19:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BBA606F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8BBA606F4;
	Sat, 18 Oct 2025 19:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9DEC1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC6CE401BA
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxJxdp0oEZgr for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3D8F40FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3D8F40FDC
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3D8F40FDC
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:52:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso547152566b.0
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 12:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760817141; x=1761421941;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8EnKt99Z7Pg+SRJj+2SxsNFKm1n6j9CjVDVLnTefns=;
 b=XA2CM25hlyTYRiyc4id4DQlEjbpjWW1t5dC6zuBVD5AdaN/nxcLIWCfCTT88EYyxIy
 MQmBN9IO2F5hNGBsTHgDcPyh8NwjYw+QU69RPEqiXLHQqt/X84QpmNAiJ76WICaT+ag9
 hCd3d/sS/61CmVe6GKlywG4HJQ7/syKIL/Tjy7mOmdt55SWSeCnPF0W1V9aW3JF1HmaI
 lN4VEQQ0QDqlivNBPcF8P0Bdd+PBcNuY8f2kz0PDuX0RKHXGfA+XfatrPNecps4184nw
 c/QF8Pv5F6LIpiUQkVN5oMr6B0FdiwYNgYtxu+D2M9SRwT46xbIq5S1zB82e2tbeXdhm
 R27Q==
X-Gm-Message-State: AOJu0Yz7A38qFKAxlpH5BnuDRGr8XH1rQ7T2aDXBuZKuCcDjNXmSaSty
 J8o05wvsNA8GAKIeNRc1ze9iaR2V2Unz7IbmNfhxBHUrCuwlHJwp32w6
X-Gm-Gg: ASbGncufNgfGyLA4nEx90HqUA4yVe8Rem8pFIV/qAY9mgzgw6RcNB09L53kCFsYT85N
 pJfFDpZ1LeTwdnaj9bZJXpunrfFkP2yz0wTSq5YJ9Dt+VdE2IMGqjpLGtuG4OFyz+KNt1/B2QK8
 Yhml5Ii47/2wm1mA1c/ZDZ3IKSsY9vYd9DCzbbfLfZKh9X8FbOHxzDkdWjr50UGYXiD6chuPIaO
 RCkz+f7EJW3KFyPQ49z0MfiBKoJe82GccQKx+Po8n7Zwf4Gq/MwfSc9xVOnf+vBZNutuZBnXHpE
 wkiKMLyPSxOh7qkCKVll0p43P0RGwQidmkTZou7w2aH2wVi9eUZTmmr8RGo57dR/CJgs1BlqR8w
 dkzdlUE7mM92Vuc64Y9BD7pUAZc3VUbHXkX/zCIXF+YAIu03Rq7xgO8KMNbF8dYYW2QqfUEPJM+
 TRAwC6EXzfOeqL83A=
X-Google-Smtp-Source: AGHT+IFakcnTnyb5uMy4HSo8BVEmCW2N2IntH72P0RpCOELWjHl2ybQ0Hna8yOI+gFRfIn5rFKua6w==
X-Received: by 2002:a17:907:7f1e:b0:b4e:fc90:47a8 with SMTP id
 a640c23a62f3a-b647254f626mr926042966b.4.1760817140752; 
 Sat, 18 Oct 2025 12:52:20 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb526098sm315687566b.62.2025.10.18.12.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 12:52:20 -0700 (PDT)
Date: Sat, 18 Oct 2025 21:52:18 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251018195218.GA375409@pevik>
References: <20251018192729.3113082-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251018192729.3113082-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760817141; x=1761421941; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8EnKt99Z7Pg+SRJj+2SxsNFKm1n6j9CjVDVLnTefns=;
 b=Mnh5scliC3L+YBywePV4vT5x1dLQ//raJ3W1nFxhuX9F5bTu6EbHvbwDKgUXqjIZCP
 7gm3uESPQPVb/GxeHMhLN0za50opNQgzznGIdKUdV4ALUGtkdqLFL1eM2i+7SQA6waWH
 AkZRzbjf0gXo1Fv8c1tEO6If9aSx/3W6OoW4M29rbQ5RVdq/njKB86MS+32SrkD3kse9
 ZGA/gpEY1WScOpod4kfYRz4K0i1873SNTb6ExsGc9n56j+H+AiVuOzOx9x2rWA7bkNou
 E961SwZx9BmV3d7r3lJM7N2/jP9Xh4VaO9km95a6lU+Dn9QMh59tMRDsRoPI+o9k1JyX
 Sy2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mnh5scli
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: add upstream patch to
 fix musl/uclibc build
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

Hi Bernd,

> Buildroot commit 532d5561f48b6c430e7414ba5eacccf9b6c1bd22 bumped
> iproute2 to version 6.17.0 which added lib/bridge.c:
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/lib/bridge.c?h=v6.17.0
> and causes build errors on musl & uclibc toolchains.

> Added upstream patch to fix the problem.

> Fixes:
> https://autobuild.buildroot.net/results/951/951e4198b2ba109fd9c746fe2e6316a29085aeeb/

Thanks for backporting the fix!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
