Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D996C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2FC821AD;
	Tue, 13 Feb 2024 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIU-LBT2Bkgg; Tue, 13 Feb 2024 21:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1898E822D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1898E822D2;
	Tue, 13 Feb 2024 21:15:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 488361BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE5C460C14
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2Or_q0nA6la for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9808560C1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9808560C1A
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9808560C1A
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:44 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so281436639f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858943; x=1708463743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKxDZ8E8GRKQgtKDTIZszqOBrq3ponHAuaLEAQUpU28=;
 b=iB0siclU/7/lNKJTJfbhCZE0lDIC4Ru2fRm3FdR/GKarenQSDrzAhknRRW0I99UUv+
 Kj1rFCAoopFjJ+Z0pxwE+6GNBTPVRCv6+s1yt1oQOuVa95qq1z/iRN3BzeDk0i5kKGTg
 STSOsUCHWGhNMgm05Wjfdjcxg2NB46TE/DL2u21n3/n55PNB1Ec1W2kCxvFBBrsOym6H
 eA6zLEsf4ZXi5D7eoJb/LDn66VR3cLz5NxH75Nf+N0CdHcxXWYQ4Zc1YWrYdu8YmBgSp
 7FV+AA3Im8cXJoaOdqgUAz5Zq3SHbW1hwnsymzHNlkSUrDTCLgbw9UShK1z5WnhRypes
 i+8w==
X-Gm-Message-State: AOJu0Yw2UIKjKt8dI6K1O2WTavGWxtPPZGlqoc7+M0htRU4jhmuR9ueh
 XASzmgPfOHyRioTalmA0brD096avGzMDMZFK+1dAGp+WiPhfbsOdyzViJDDTaqA5LA==
X-Google-Smtp-Source: AGHT+IGGmJfNewCWIEHDTeWsfI+oaqwppd6BaOCqthMnexEj/NFVVIWsFkC3R/MHi+DWyqN/t2rABQ==
X-Received: by 2002:a5d:9c4a:0:b0:7c3:f3e4:8ed9 with SMTP id
 10-20020a5d9c4a000000b007c3f3e48ed9mr1052538iof.6.1707858943086; 
 Tue, 13 Feb 2024 13:15:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVE8z/o/wv4GiiS1baITMmV/iuwJda457qr+gE3WQNZvjZwDpozSGTJGWwBkyOwCOgQfGp3VOt02grhct17Hlir/cJ0OQHJzECTL9N1Hn83x9qv6N+H49BHQXiJ4ENGGUx0G7/LfbNh0rRdYQ5xlYQ3Hb2yaYAuBTfqF4nJev1ebwOCerwTpEUb4ocoBr93JewQ8GxQDwDUZlYgBx51wYvczul8dF7X8iCrhcA6lwOQ7II2yAnNbabmhhDs9n/EZIxaOOgyunMmJNqz3CHXhwZKi8opjVgAftiJhvU0hjgOZtxFYH3fUyk1ZbW1z1sMUsT9q23SW5wWI3NFAnlqORJh+iMO3ZsNFlZzlHy4EJo/lSs391TohNHzKFohtaWU/JDyDVdmiF33pKx9VExOVrmLF7lc+mQh+VDQ4tKq9fVRUSbBQ9UP/kgGyFhbNUxojAefVYojQ/yJ17dVkaKLykZDyoVUF0Cgpb571onkLcSVyDyTE00lzcz0Qn6H32ARSNRZ1HJFnx7V2Z7j4NKL0s6SqJkzVzxoHJ4NclzgxKYGs8gSAqjmWY5ctE3bzOgpajDUUd9ffWw0Ppwl0Ij+EIuIiVS2gMjsbxLM5q+Rl3fgH5cE4A/O4DXJTu9V+v7wEDS0GtJxnRPoyQ5dHdvjraYaGOzfPRnF0nYWywXSxI9sd7D466JDg9Bfbq0n2ID8BMABpUTh7C9dORtS64wr0Ycbm0O3tD7akVmvj9qtPe7Lzb8W4kvJhg==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:56 -0700
Message-Id: <20240213211512.3918044-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858943; x=1708463743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKxDZ8E8GRKQgtKDTIZszqOBrq3ponHAuaLEAQUpU28=;
 b=gc4TESKZjzsQQ9iWIskXeN0NDAubwBDp5PHMAneW5Ix3WOs/rht0EIHYzr3wNbiHsP
 Q/3HxULQ9RcimICKHYm/rQFaPextUhGWcS4r3lsKVyj4OLXpR667WpzfN+WQRVg7zfkU
 aMsO90y91OO5+PvJ2ZVxrpte+sT8Ho6eHzXsTXnr7Zapu1mAWfG/+IzPt3qntAwv4TRw
 Bw68n/5+Hs+/gUPexsWWpFAwJcDXJ9pK2mWjTlfsWeCtMTKMXODgU/o1iM3cy2cq1OPj
 3v74Aa9Gkm7fXahg+mc2qa5OQvXKztkcx0CvrAnjLUAE5lsxfHoBzHV+zUCnBBRE3xmP
 ZdYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gc4TESKZ
Subject: [Buildroot] [PATCH v8 10/26] package/python-dbus-fast: migrate to
 poetry core pep517 build backend
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to migrate python-dbus-fast to the pep517 poetry-core backend
as setuptools is not supported when building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

We do need to additinally keep a dependency on host-python-setuptools
as that is specified as an additional build requirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index b890177c74..1456ce5e4c 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -7,10 +7,13 @@
 PYTHON_DBUS_FAST_VERSION = 2.12.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
 PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/f5/8c/220fcbe4337b842d730d5752f207fc8efd3a02405c71c329e61218e947b8
-PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
+PYTHON_DBUS_FAST_SETUP_TYPE = pep517
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
 PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
-PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython
+PYTHON_DBUS_FAST_DEPENDENCIES = \
+	host-python-cython \
+	host-python-poetry-core \
+	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
