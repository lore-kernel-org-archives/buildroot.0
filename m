Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58115CF9C5F
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC3E607C0;
	Fri, 20 Sep 2024 18:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU1XHUS0xro8; Fri, 20 Sep 2024 18:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E59607D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E59607D3;
	Fri, 20 Sep 2024 18:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84D561BF593
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 18:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74AA984BEA
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyeBhmRucYB9 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 18:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FB0684463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB0684463
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FB0684463
 for <buildroot@busybox.net>; Fri, 20 Sep 2024 18:12:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso28096355e9.1
 for <buildroot@busybox.net>; Fri, 20 Sep 2024 11:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726855956; x=1727460756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUuBDhNrGj3IC1RPXt8foAKVrFOOhCHdJI6nC8hOKrU=;
 b=kloVtkwYEnYE0DcoEZiy2Js+G5r9Pc1wUmbR3G7V3+H5k8Njx1Ed9TcQqqDdCQxmGN
 fpnO2lAbxFFO0FffX4kXmhTGyHJDhBhVyUXxlHkyRKAlbaS2dzAljsf7nwV6Zpjp8lzm
 fDhUU2j0vR1wTH/ZniykqIuf/cQMT73wVehzwk60S3d+zAhCwRB9XHaes/Ht9S+lt/21
 I8GqIja7gImEKsuFG6+jwdXXN2fmcquasZc4ngycuqcocFKDJhTIREMcIX86sQ9r1Waf
 cb7jbLYaPqdX6CQOI0AJ1ez5kwaHSWg/8LHh8+UL9atUcEVJSRM3Q+mNbwxbPKulrc0R
 If+g==
X-Gm-Message-State: AOJu0YxkbTrkbnzKSP/rRfrNZem8KBCm9coFfbJziS2pIFOqS1rtRMre
 F4R43Z+UqcX6U2OFLJeidGJXX2MTTfkpcL9qaH4FEQC1M1SQcf+JPkDXe4luxrRvQ8x5GMqH8qR
 JDQ==
X-Google-Smtp-Source: AGHT+IFMRJ0JklapxzcciyGLrlv7T8UMvqlqkJcOgnyjX6NDHbDviJDGFTdJvGY8gzeoDtDwbohSZA==
X-Received: by 2002:a05:600c:1d26:b0:42c:b995:20db with SMTP id
 5b1f17b1804b1-42e7abe3a42mr32263775e9.5.1726855956092; 
 Fri, 20 Sep 2024 11:12:36 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7af898fasm29548805e9.15.2024.09.20.11.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 11:12:35 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Sep 2024 20:12:10 +0200
Message-ID: <20240920181212.3572055-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1726855956; x=1727460756; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WUuBDhNrGj3IC1RPXt8foAKVrFOOhCHdJI6nC8hOKrU=;
 b=Yi7jIwxTM7TQmPm3FnKSFlKAAjgOBoDcJ5KiAxEzLa+Fe42U++SXLFDs01KZxi0nYO
 H9KfD5D1Wsn7Vii+Fz4cyPpfVe1fr1D8k54gbeTZKHaL7vSdLOi2PLl1UaphK3YtgVHR
 8nkkIc7XE4escRMP/c5EdUZmCgkO41TSbjGSHao/GDr8om4Dp1CWBm8Kmqj4BvUP1P+j
 DVNsY+OxHHBnR4603fBTZdfbVEzQxsdBzCngfzspGrdq0sFL2kt7dGIZlqsOKQSuSPWS
 DQQFOoqAZj4NcQBFUQ0yBbW22AN3F58Mq9NJz6JF6pXP02f/9RYtgZIsOCJKjxlLUPMd
 MPNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Yi7jIwxT
Subject: [Buildroot] [PATCH v2 0/2] lynis
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1 --> v2:
- refactor with LYNIS_BUSYBOX_CONFIG_FIXUPS

note: the patch "package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS"
was previously submitted in another serie,
see https://patchwork.ozlabs.org/project/buildroot/patch/20240313091412.20865-2-francois.perrad@gadz.org/

note2: at this time, Buildroot is unknown to lynis, see https://github.com/CISOfy/lynis/issues/1520

Francois Perrad (2):
  package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS
  package/lynis: new package

 DEVELOPERS                                  |  1 +
 docs/manual/adding-packages-generic.adoc    |  6 +++
 package/Config.in                           |  1 +
 package/busybox/busybox.mk                  |  1 +
 package/lynis/Config.in                     | 11 ++++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 41 +++++++++++++++++++++
 package/pkg-generic.mk                      |  3 ++
 support/testing/tests/package/test_lynis.py | 23 ++++++++++++
 9 files changed, 90 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
