Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B5BC7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 11:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637B341B8F;
	Sun,  4 Jun 2023 11:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 637B341B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkdIO5U24FBT; Sun,  4 Jun 2023 11:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA03418A6;
	Sun,  4 Jun 2023 11:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA03418A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2DA81BF2B1
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8156041B86
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8156041B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxHuDm6Cth4a for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 11:06:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B040418A6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B040418A6
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 11:06:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f6067a9029so4555769e87.1
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 04:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685876810; x=1688468810;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qj3dHs2BcLQVfHDndd7k0YK72M9jkRBW1/L5CL7RWEc=;
 b=iPc6lHbKFLcin08Jn5q0h1YXaegCZESw7aM4D7bXObAHtuxiYPkd4ro5z07KqEWtxu
 A6qqHxkBWsyuynmRgOtVxZRNYzH0vxav5ndA2KhryCapbcWITht+zYgEbeX/1N56UaCO
 dV/tHX4+Mi2oETYn1FBbJBiAfRUgfpnbY9nSvic9Gbhbo7nD/SqPiqmnaW70x42zEkjO
 zTtN4MI3/vdPLhxGatLDLuw2j4E2zH/Qw/+xMqEwuLRzx2BSxzSznQdpWVe6zPCkDVdT
 IkU2yhLxOwKTowWiFctf5um+QFDWj38NW6IYkulTv/UouHwB0dpw4t1aoiWRNhVbMGUw
 BGzg==
X-Gm-Message-State: AC+VfDypjLr6IyKalf62Q5RikoERH47XAFn+Pabe7GxivwEGy6Rur6J/
 dxBFt0GzQfm2z2St5wxkuPtGxflTlAY=
X-Google-Smtp-Source: ACHHUZ7nN5UFa5o9l2/ZHXjSTr12SEzP3paNQcwlB4XECiz2Cjua8clYLKh3HyaaAaar9KPqziNH0A==
X-Received: by 2002:ac2:4357:0:b0:4f3:b883:fc4e with SMTP id
 o23-20020ac24357000000b004f3b883fc4emr3631460lfl.43.1685876810295; 
 Sun, 04 Jun 2023 04:06:50 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac25606000000b004f39bb71ed2sm748799lfd.138.2023.06.04.04.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 04:06:49 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 13:06:45 +0200
Message-Id: <20230604110647.3418706-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685876810; x=1688468810;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qj3dHs2BcLQVfHDndd7k0YK72M9jkRBW1/L5CL7RWEc=;
 b=hSzfwrx+B3APFQTHHwsVUok6+WaGBf1D9fB68wr5ts6kLOod4ZqTLbwEgQRhXiDWjj
 cD5BMjg07dgVrrDbcdZieNb5Hj5mVN79ZqFK/mFV6hGi47l6pfeUxQCZAjJzQPySwXEZ
 Fy3RDjsQFhUoKKOb5NpsvjQwiLj5KCkVpLMSadLev2K56Jlu6ZjOzBeRmz8TzzuuR7jw
 1JdAYlzq6o8I3g1PyFxlDQZ+KzbTE2WSqQMht/mEWjodHHvYLbUpliYJyvIuFdZL7y4u
 HX8uB0nSh9JhO1Jv0LUF0+Mqc7uhu9L7cw+w0HS6vZu60ngmR4gLO2QgDqa1HgYDfvwY
 J1VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hSzfwrx+
Subject: [Buildroot] [PATCH 0/2] ssdp-responder upgrade with systemd build
 fix
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Bump ssdp-responder to latest release, critical bug fix for v2.0
   Note: LICENSE file hash change due to update in copyright years
 - Add missing /var/lib/misc for persistent state on systemd builds

Joachim Wiberg (2):
  package/ssdp-responder: bump to v2.1
  package/ssdp-responder: add /var/lib/misc for systemd builds

 package/ssdp-responder/ssdp-responder.hash | 4 ++--
 package/ssdp-responder/ssdp-responder.mk   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
