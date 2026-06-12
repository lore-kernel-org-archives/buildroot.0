Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD7FCD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B82C815DF;
	Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utY58wknRlmx; Fri, 12 Jun 2026 20:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53612816EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297474;
	bh=+5CqR+I7yK2syZRcfVvQd1KE42F9gmSB7aoJG2aqClM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Dgy714t/pNSG+xsO5z/zaP6wIL2J8csgSBuatWI9QzISW2qA9OprQpezaHB5bae9l
	 K8jeneClcj0eoyqPVvzj93nibSDNBlZqC7GvkjGp+og6Za+5gAnsL/WYMwMD6deKKr
	 ZjSQk4cQ8HTYZod2Z6fW1rvjUEqIlQnsF81o6texfJ7vIFU1zGCV/HPzL/wbyvMn0I
	 bZ0IQNQXSPRxybvO6cGKYc7etsGHgMJEIK8vOZBurTfw3nJLWNOzOMFO8NEUUqYh+4
	 XU1/0kW9BmkArI5mXdh97v5FvoVMth6utkzUyPBZshLNB0b2yVXkczPqqVhdjewBmc
	 BWw/aYtcS7vBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53612816EE;
	Fri, 12 Jun 2026 20:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0033A1E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6582816EE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OefISwiaDfcF for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0420815DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0420815DF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0420815DF
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so14531505e9.1
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297469; x=1781902269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwf69b3iNQnxFEIyhvjn0geAKt/z+Pv86S2CHl9fmXk=;
 b=j3puISPhjuRQGu0GsCZ2XTbZQE/IqkeTjvWRpmAmSbUKQjNGK2v2PRkzUklBoSI6In
 jId2XtPtc6D9TXDik3XNqM75ih6MDRrvHiLoVnH7F//LTVmxF08olHuFJk/nj7XpE9KY
 +92JkYifWU0X25Mg1O/ksoumzZvWjPHhA38TfWdgVisd7kUIlmdUR3J2ru54IT0vlTIi
 2QWPTcgIsrJ/C+2qKvTm8xl8LZzCIK5lgHlIYnnU70KurOX9OxVoj8FoAfaDwpzDqyqQ
 Q1T9aA/61HIHtUj6K+7eXzBR0Gf12QXPQhDcK+ez6SbtqsE3JoWILA2ovfVQAsJ6AQar
 +fWw==
X-Gm-Message-State: AOJu0Yzq8H9i8S6c6znCFPMt6kTc5DRrHCgO9bfRekqm/ANMHZuhrWfs
 Oggr0clJa3ZvWVsP+DJPlWTMU24dV+VIP7ck3CFzPF5zhS+pC8zKpziJInxsvYQ/gK/ItOhSFEN
 3JGEh6g==
X-Gm-Gg: Acq92OHHfsD6XpMyRwIjjCmj4AYSzN2fMTesChpUwQuDIsMD+aEWuGTyRyLCOQCL8vY
 uN85xo9AYnnBFs/6kUDWkf4I8pZ/Xfu5478pZQe8EbgRkFd0vprYeEBKYGnyWNhFf2D1GfYMFhD
 AkDHMUFNEQkoOBRjXvI98jJFQZdz0/toYxcGLj5Qw2EiZLXO1QhDBEMOGr/eXpodBJciTMGFQh5
 BDP/KW5lcfqRO1pC/pEgSmh2TyuUBfI7rixwe3D7G7DHee1v3FcAhZdyXh4AmNcvngqJclou4Jo
 Y769Ndun0IpXi7zBeFsU+a/fo3hoF5qIN4gdK7NPr9369lZxsG4tdwH8bpJx1XcZ8gwjjX7f45a
 jG4rkfKfG9FZZgy+4sIRm22s2mXr5j4PoXHuzp3mlKwsVR4JXi0snj+/macOKi+XSS7iQ84d2+K
 RiUpUjjhsFKIgS7nntQPq+CU+KDyrdxVDs64prxvpN7/0l5aW0oA==
X-Received: by 2002:a05:6000:4213:b0:45f:f142:d55f with SMTP id
 ffacd0b85a97d-4606db9fd54mr5915425f8f.15.1781297468153; 
 Fri, 12 Jun 2026 13:51:08 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:07 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:19 +0200
Message-ID: <20260612205029.269642-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297469; x=1781902269; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zwf69b3iNQnxFEIyhvjn0geAKt/z+Pv86S2CHl9fmXk=;
 b=B4DZb9dbqaTVG69XsrHt9gQdefpDXeSxBp/s1R2yh8T4JTU5IehNstZSzHstAR/47t
 rYvepmJ7yG5PBbqesJ+Faz9AE0neNpkFB5sQweip96UqhivfjUAYvuMlUIUMkAGpX/9A
 /F6V5qNS7fSD7WAHQW7X0YKQnwnp++OQyZEAn2jbTmERAqgOxqXmrCTeCXeUjgHsPJCy
 ffFuxbrVx1WVJJui8459yIKDR4T0Mhm+HJm8+WzN4EESMhFRijYUADoSAyiio6o0mlGd
 cyICIYNmSymlbe3snS6LgjQN6KmH+iltnmdXJCYA/6+yVEVROVRy2EwkL2co8KbzIoAP
 vTZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=B4DZb9db
Subject: [Buildroot] [RFC PATCH 0/9] support Hare language
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hare [1] is a system language which aims to be boring.
Hare uses qbe [2] as backend which targets only aarch64, riscv64 and x86_64.

Hare seems simple and lightweight, like Buildroot.

this serie adds:
- the host-hare package and its 3 dependencies: host-qbe, host-scdoc & host-harec
- pkg-hare.mk an infrastructure for building the Hare packages
- hare-dbus as an example, with its 2 dependencies: hare-ev & hare-xml
- hare-hello as a dummy example

1. https://harelang.org
2. https://c9x.me/compile/

Francois Perrad (9):
  package/qbe: new host package
  package/scdoc: new host package
  package/harec: new host package
  package/hare: new host package
  package/hare: new infrastructure
  package/hare-ev: new package
  package/hare-xml: new package
  package/hare-dbus: new package
  package/hare-hello: dummy package

 DEVELOPERS                                |  4 +
 docs/manual/adding-packages-hare.adoc     | 87 +++++++++++++++++++++
 docs/manual/adding-packages.adoc          |  2 +
 package/Config.in                         |  4 +
 package/Config.in.host                    |  1 +
 package/Makefile.in                       |  1 +
 package/hare-dbus/0001-fix-Makefile.patch | 26 +++++++
 package/hare-dbus/Config.in               | 10 +++
 package/hare-dbus/hare-dbus.hash          |  3 +
 package/hare-dbus/hare-dbus.mk            | 15 ++++
 package/hare-ev/Config.in                 |  8 ++
 package/hare-ev/hare-ev.hash              |  3 +
 package/hare-ev/hare-ev.mk                | 14 ++++
 package/hare-hello/Config.in              |  6 ++
 package/hare-hello/hare-hello.mk          | 24 ++++++
 package/hare-hello/main.ha                |  5 ++
 package/hare-xml/Config.in                |  8 ++
 package/hare-xml/hare-xml.hash            |  3 +
 package/hare-xml/hare-xml.mk              | 14 ++++
 package/hare/Config.in.host               | 14 ++++
 package/hare/config                       | 45 +++++++++++
 package/hare/hare.hash                    |  3 +
 package/hare/hare.mk                      | 27 +++++++
 package/harec/harec.hash                  |  3 +
 package/harec/harec.mk                    | 26 +++++++
 package/pkg-hare.mk                       | 93 +++++++++++++++++++++++
 package/qbe/qbe.hash                      |  5 ++
 package/qbe/qbe.mk                        | 22 ++++++
 package/scdoc/scdoc.hash                  |  3 +
 package/scdoc/scdoc.mk                    | 22 ++++++
 30 files changed, 501 insertions(+)
 create mode 100644 docs/manual/adding-packages-hare.adoc
 create mode 100644 package/hare-dbus/0001-fix-Makefile.patch
 create mode 100644 package/hare-dbus/Config.in
 create mode 100644 package/hare-dbus/hare-dbus.hash
 create mode 100644 package/hare-dbus/hare-dbus.mk
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk
 create mode 100644 package/hare-hello/Config.in
 create mode 100644 package/hare-hello/hare-hello.mk
 create mode 100644 package/hare-hello/main.ha
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk
 create mode 100644 package/hare/Config.in.host
 create mode 100644 package/hare/config
 create mode 100644 package/hare/hare.hash
 create mode 100644 package/hare/hare.mk
 create mode 100644 package/harec/harec.hash
 create mode 100644 package/harec/harec.mk
 create mode 100644 package/pkg-hare.mk
 create mode 100644 package/qbe/qbe.hash
 create mode 100644 package/qbe/qbe.mk
 create mode 100644 package/scdoc/scdoc.hash
 create mode 100644 package/scdoc/scdoc.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
