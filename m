Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDAAC44533
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93CE660819;
	Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8tql8LQjFJf; Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D7126081A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626786;
	bh=5wEREfXSp88Ha3qIVvg/f5tVI/+feZgWOtrGZ4abMMs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DtQ/gvCRVXLbh62NhhS+4VJobf/zSwGu5o3iarlqgkVCSKPA0cbHWTyJb8YDhMtcO
	 iLJfB89A81ThkXMWYEu0WjzklxGkKKuMsn/OD2yFnwHUvFNpG+i9/1mSzdQCJz/VVy
	 KrpKsKUtPTE6B9qb5uDFhi0PNUbVvTzcy7trft3XXH7HMTYbW+a1i9JDr73T3ubTWk
	 ySWy3Pme/TEzTq6EJeGCuEhlcDGN3IL0v2e3pOnysxVIPSMqRLYB1+Y2DuQpMkOWAH
	 x7CLzSTOawaVPgqXPbNt1yA7s0GU/mLnH/QC2R+aeQkbeojtsQ/coaYtNweaButZjo
	 FQoboWHJ0B7Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7126081A;
	Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E70942A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2EC80BD1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xETryXGmSwAw for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6D6980B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D6980B5C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6D6980B5C
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso16504005e9.1
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626782; x=1785231582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MhuPOrAmi4jFDrutmV/54axuPcctF1wG7c0nuEUgQ/Q=;
 b=EVLved3IUPhD+9E76eZ7dwobeyRjTALYVrkbv9ZPsACeCkESEB1C+YTSOpEnvLEBIn
 arZ7Qqma8kNcFzgrueKdfVVV/q2DoBHPIhpopbYOvQSjA0BV/3FyRntzsZIyN9+Nz/md
 OyN0egdvJermX0RV1VsO7PJLAdJbf8HAAZQSx3tcRitrGEf3KBtnK4AqpoI78xJxN5g3
 fJbk4kTOUdSelB+Ikn3M2/dHE/AouXC2foqDmCNUyG272rTAx/B+V1IChj7iEYXjmIW/
 1Bj9rdEXM5Wduu4P9qnU9Y/eUFqSqNoeemKeiNi8oWKe+Q28uTRcXtf6TIVCAc2TsgVB
 Dg9Q==
X-Gm-Message-State: AOJu0Yzng/VpQrhhUvjtA0Jd0hbC1KGqXezazYrsvFSurA1wKEIQS3oW
 fDg/C/JnWUHWJmjyp3CmNSmucAtsbyI3DdLs7J83lkO7K4xcf2KJmJSEvi/Qjg==
X-Gm-Gg: AfdE7cle0oGsvYd2dKE597yJAMOnQkG/AUsgZkZvyb7ZRqmOKRZZlWamd9uEJKCw3YV
 mDctluu/LXZN7ISfZ9X/Kmq12sdl/D+03lSEpR1Ar0MP3Nu+lT5GFzmGo91lbjDCF9z9YHp/Mz5
 0XvMQ4pk+QOqwbgetCJ3bEjqCwd70xFe8UscSsAdUDXrCZAu07TNP0ivAgputQrrxfdJYt9wLWG
 s3p9yPNZC7RTjDcWiILAwpdc3a+9P6Lzys4BD36guWQco+HOLJOzb4Km4mIweCddi+C6Hdx0Pzd
 DZpyu0XTpO1o0sobtsIGh5Stz+E6nogkVw9bpCLX7BxwUndqrWG1qT4qx/9uGdX2Fxu2MSpdgji
 gkHc/fW2eaa50DfQdbFjOrEz529CJ3p9TZqfVTTRZ/pUm7eVFFixonZnIl1rHBnLZZ7lWvWTD+s
 b8qKskppAzCdn6Ipjo8r9gz95NJa8/Xvy7zZq4GUL4fFRu
X-Received: by 2002:a05:600c:524c:b0:495:4e17:cad5 with SMTP id
 5b1f17b1804b1-4954e17caeemr193484725e9.26.1784626781497; 
 Tue, 21 Jul 2026 02:39:41 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:40 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:24 +0200
Message-ID: <20260721093932.282565-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626782; x=1785231582; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MhuPOrAmi4jFDrutmV/54axuPcctF1wG7c0nuEUgQ/Q=;
 b=SU6N/k0irm2Hn2PNEA4nEYicWRMNyvs/A44oBAU1CWw817qZ4EsfWsdU/kasQWNuYK
 hrHu4DwJPNP7oOUm4yFDvbFSuRcz6sHgGNpKpztDPY4FfjU70ijjkdZCpI9KWfEWCqdV
 QARst4t1Yrnkl2kUSIcIcJ+BSHhmYqkIPjhizunp/dcQ+DhxV/cp4u7alD/KMHL/Y/KF
 jRyZyQNUdHe8IEtBGYljf8CZMvGaWfRDnO286axeUe1HV28oJw+kTIrbygL1gOf+bPGu
 MB3MxtipmaH5TH4XgNmsItNF8pkp8drHVaZ3dXgMiEBKPNlQN+V2ntdq6BQsyUTlI26H
 Ms1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SU6N/k0i
Subject: [Buildroot] [PATCH v3 0/8] support Hare language
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

Hare [1] is a system language which aims to be boring.
Hare uses qbe [2] as backend which targets only aarch64, riscv64 and x86_64.

Hare seems simple and lightweight, like Buildroot.

this serie adds:
- the host-hare package and its 3 dependencies: host-qbe, host-scdoc & host-harec
- pkg-hare.mk an infrastructure for building the Hare packages
- hare-dbus as an example, with its 2 dependencies: hare-ev & hare-xml

1. https://harelang.org
2. https://c9x.me/compile/

changes rfc -> v2
- package/hare: sort dependencies
- package/hare: full refactor of config of cross toolchain
- change title of commit "package/pkg-hare.mk: new infrastructure"
- package/pkg-hare.mk: add comment about grep
- remove package/hare-hello from this serie

changes v2 -> v3
- update with my new email
- package/hare: refactor with HOST_HARE_TARGET_ARCH

Francois Perrad (8):
  package/qbe: new host package
  package/scdoc: new host package
  package/harec:  new host package
  package/hare: new host package
  package/pkg-hare.mk: new infrastructure
  package/hare-ev: new package
  package/hare-xml: new package
  package/hare-dbus: new package

 DEVELOPERS                                |  4 +
 docs/manual/adding-packages-hare.adoc     | 87 +++++++++++++++++++++
 docs/manual/adding-packages.adoc          |  2 +
 package/Config.in                         |  3 +
 package/Config.in.host                    |  1 +
 package/Makefile.in                       |  1 +
 package/hare-dbus/0001-fix-Makefile.patch | 26 +++++++
 package/hare-dbus/Config.in               | 10 +++
 package/hare-dbus/hare-dbus.hash          |  3 +
 package/hare-dbus/hare-dbus.mk            | 15 ++++
 package/hare-ev/Config.in                 |  8 ++
 package/hare-ev/hare-ev.hash              |  3 +
 package/hare-ev/hare-ev.mk                | 14 ++++
 package/hare-xml/Config.in                |  8 ++
 package/hare-xml/hare-xml.hash            |  3 +
 package/hare-xml/hare-xml.mk              | 14 ++++
 package/hare/Config.in.host               | 14 ++++
 package/hare/hare.hash                    |  3 +
 package/hare/hare.mk                      | 47 +++++++++++
 package/harec/harec.hash                  |  3 +
 package/harec/harec.mk                    | 26 +++++++
 package/pkg-hare.mk                       | 95 +++++++++++++++++++++++
 package/qbe/qbe.hash                      |  5 ++
 package/qbe/qbe.mk                        | 22 ++++++
 package/scdoc/scdoc.hash                  |  3 +
 package/scdoc/scdoc.mk                    | 22 ++++++
 26 files changed, 442 insertions(+)
 create mode 100644 docs/manual/adding-packages-hare.adoc
 create mode 100644 package/hare-dbus/0001-fix-Makefile.patch
 create mode 100644 package/hare-dbus/Config.in
 create mode 100644 package/hare-dbus/hare-dbus.hash
 create mode 100644 package/hare-dbus/hare-dbus.mk
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk
 create mode 100644 package/hare/Config.in.host
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
