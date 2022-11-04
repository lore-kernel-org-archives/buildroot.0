Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7928EC4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 23:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA732611A7;
	Fri,  4 Nov 2022 23:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA732611A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RF6MsRYKdMJF; Fri,  4 Nov 2022 23:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C2161162;
	Fri,  4 Nov 2022 23:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C2161162
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A14D1BF31A
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5461141945
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5461141945
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmsLZANWJpyv for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 23:57:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747E34189A
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 747E34189A
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 23:57:33 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id v81so6758971oie.5
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 16:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFVgcrMViJUrDruT+SVHm2tB2sMKXiDnf08j2PV/ZUY=;
 b=YoO0lgBDWegIwZEUhDOafOSsKn3BXO7syoqHDeI0urp3+qvokjHuZZSJWNrm4o4i7v
 oLTJki/4GSlwD8bx/PvnHcLMPENdPJ9ttZkr99MIgsXEK7ChHN7rGpF3N17N1gIIrN3Z
 IsNFUZhSdeeuq1bXfq7ZaKoSVi93x2H4cCcpONHL/rRQBDL0Ey0YkPwHKOqOWG1XAF+X
 SyeQvUaLl9wOdRtLVMhRK2+L4/Rt7+m0sWP0jN4cEgWpT7g1m7ifu2OJj7OI771UDCPu
 4i2sORFzxGRqvEbE6y52+0a0Ko4VgaJDfkkOXQZCkJIAt1yfqh2Ymap9ZMPv4OcLFPf7
 lMBw==
X-Gm-Message-State: ACrzQf2WAlRz7DX99cPG5hojQJXzHbgIwIbr1GptfwWsOSxSPFgPDY4S
 u60SHkAgbEf/LGyMtwHYsGYYGfpn2Xw=
X-Google-Smtp-Source: AMsMyM41Wd5mgAdpv3QuchsbIMhbFlBvVl5ShBGqz7DWAuPQnpmx7NaURFgd9kQTzZBoGBDmsCH1IA==
X-Received: by 2002:a05:6808:1644:b0:355:6f12:ca0d with SMTP id
 az4-20020a056808164400b003556f12ca0dmr29026930oib.61.1667606252381; 
 Fri, 04 Nov 2022 16:57:32 -0700 (PDT)
Received: from casantos.remote.csb (177.204.173.152.dynamic.adsl.gvt.net.br.
 [177.204.173.152]) by smtp.gmail.com with ESMTPSA id
 k131-20020aca3d89000000b003549db40f38sm165638oia.46.2022.11.04.16.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 16:57:32 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 20:57:24 -0300
Message-Id: <20221104235727.587650-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oFVgcrMViJUrDruT+SVHm2tB2sMKXiDnf08j2PV/ZUY=;
 b=jQo1c3MbMaTV0oMXldIYvFEap5XqL6jhNs/oylWfSuJirXHpHpY61d/YI99T62KhiB
 bmnwpoN3a/N2fHfPQEPEVO6drFujYfveEDzALFCDXvYUIdaqObBg56Kc4tVIqTMKIIBD
 aMJgGh1VzNhsjnV/x4R6EzOP5aeXJFyPo4PSgKpN6KI6ugp2q+NEG6G13qog913VEZk6
 VJVe0o8+uhqwYZ3qSd3zk9xHnVAT2w0Uge57n4AzR8DaKImqMsxfZlxZOrhID8hcPi9N
 qF0L28LunRouFKRTOyCPLU7QOF3OOOYRmSasQ+F4OKByFMXChvLlJkGV0sQaDR2DtURS
 3nqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jQo1c3Mb
Subject: [Buildroot] [PATCH 0/3] package/qemu: add option to enable guest
 agent
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

Before doing it, fix two small erros in the configuration menu that can lead
to build failures.

Carlos Santos (3):
  package/qemu: make "custom targets" config depend on !BR2_STATIC_LIBS
  package/qemu: select FDT for custom targets too
  package/qemu: add option to enable guest agent

 package/qemu/Config.in | 18 +++++++++++++++++-
 package/qemu/qemu.mk   |  6 ++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
