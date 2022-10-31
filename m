Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EEBFA3743
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB92260D5C;
	Mon, 31 Oct 2022 17:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB92260D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNjBevQFQinc; Mon, 31 Oct 2022 17:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DE8160D56;
	Mon, 31 Oct 2022 17:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE8160D56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 569F51BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AE66415C7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE66415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj7k-bYvDSvc for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:46:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ED79415CB
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ED79415CB
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:46:40 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d3so17679067ljl.1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCxFcegP6oFzgRb1NXq33H6iR6qMEV2DqJPzlKhlDyk=;
 b=T2Psdk12km2CvoA9mlIS+dhnsEQ/dc1sNwEhRVuC6K28tRe22LlgGVOtYdLi2bjhVm
 ciqHUcpSpk4rVGEYfcHh270BOIqJ2XdMqNgq9zw11yamUcHA5G4odvyfJvJb7AiUwm/X
 7aPpsLTBmbe31wvZVhMpFRKJRhKnAovbdm7zX2u1nFKwkmmtDojv6r7QeRzND5toeaqg
 TjpvriOujWdvkjAGU3qr9O6gnt058rm+gL5WMMomwFtNg5JYZBWd6tvpNkqIMUML6bfH
 D/FaDferQE4Cawx/8chDUIhkl0ZQK0uLqr9wxYQ40D6Jj3MuvrqxlEgWpnvCWAueBxtE
 Bjhw==
X-Gm-Message-State: ACrzQf2mjTft5Dhas2xQVBXVqgP8G6fG2/w4ocn7j5oz7JFvzlqs+42P
 fhgAP3799/59RmKb/D5ExEhhmRPfLAY=
X-Google-Smtp-Source: AMsMyM4t8cyfOcmnx2fuLe7WQK3yzhdUOvTUjmyHTDU9u+cHA5a+fNbpNoPv1NBn91epCKuUOuKOjA==
X-Received: by 2002:a2e:9304:0:b0:277:6337:da92 with SMTP id
 e4-20020a2e9304000000b002776337da92mr817025ljh.522.1667238397882; 
 Mon, 31 Oct 2022 10:46:37 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05651205cf00b004a9b9ccfbe6sm1362239lfo.51.2022.10.31.10.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:46:37 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 18:46:29 +0100
Message-Id: <20221031174632.377586-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KCxFcegP6oFzgRb1NXq33H6iR6qMEV2DqJPzlKhlDyk=;
 b=OLt4jfC23P0ifSntTj4dyC+IGA4MigdKjBfdQaOCso82Ga+B48UKuHWRcsk1xmGzib
 5NiOuDARXOT55V1V9UJVkFXwLKDxhfp2FBhQhnMJ7bJJqVb2ATIRH9ulWJZE9LnFiKJw
 GC0xjYI2ta/ZkQFW6UBpSosOfa2MhmcMNUUwDz3+IN18PKhg/2Q+1tpoXxylO4DbpYeC
 eDaNDEkJXIztGtWn6rjRH+bOwC03AumWKV8LnZzh59HP5kotiUcH+CfWiF+FTfeogm1a
 pUkzWXt4PCPWukXu2/2rDdi9uT833lfX0PiA6JrlG4edoeNDZbkVARSO/w/zA5wsRGQi
 AieA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OLt4jfC2
Subject: [Buildroot] [PATCH 0/3] package/ssdp-responder bump and
 check-package fixes
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

Hi,

here's the upgrade of the ssdpd-responder package to the latest release,
as of yesterday.  Also included are some stilistic fixes to Config.in
and the start script.  The latter changes suggested by check-package and
shellcheck, fixes based in part on the SMCRoute start script.

Best regards
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
