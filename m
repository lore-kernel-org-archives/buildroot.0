Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39014C5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 12:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAED7605D8;
	Tue, 11 Aug 2026 12:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Af6RErT5RdAf; Tue, 11 Aug 2026 12:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0884F605E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786451209;
	bh=wTV7vtPNy9sixln3/hlhOehdFswsXxsNoAuJInxsTnU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ftxqBdcws5WPcoWuBAXmTzCeHRnPlTEHlzi4HBc2C3tmrc//XICq1eBMIImkF+d7f
	 kJID8A+If58N/D18AKbi0QRfNlRh/1qLq5DRxGJurYahiNEcobbBN9cmGVY2/48Geg
	 EsvGFb8P75DbDl/K4HLa8WivH12bWxMhxsr33IUB1ZtF3rJIvAIZmio12zJfT0SQmP
	 5MkVXPfw+MrtMaYzeMU0nFcQDFWVWqW2KOmx02L26fvCgUgfKoXgh9w/VjgywZWaTc
	 HltZ/hD1EV5M3FOaQRrMdVsFp+j1iRAgU5luJKbyAxylwwhojyaI+IKiJcK7HLvCcl
	 IqIpMqAYuaxCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0884F605E6;
	Tue, 11 Aug 2026 12:26:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD0C40A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8E1B40100
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kaci2bP0Kqq1 for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 12:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BAD340063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BAD340063
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BAD340063
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:26:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so18323465e9.3
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 05:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786451204; x=1787056004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YFbe44M/cssZhjCeBX2L7vAat6tqomVti9jcCaqJL60=;
 b=g9Dx925o4tbLZOpnodAtzwzw3N90UTDlVBXBKMFuZbhsF2xmh5k2b+XMKnlw8pq8Tw
 PePQFsXwCnhqQLbu2SE+dfGF3cH118+nCaShiMOF31E+/jGDMUcYv1vrhy5OMKlLd42o
 egRswLHU3eMVNqVSrQj6arKgYkQ8HaWtB262uP1YNSSydzl94/iAAmbpwUhViPpJpqxB
 IFY53AZG/tvQbVY/yX/l6OtJQu/dihUmZEQHn9r/aIgNCJDBp6EQD8OxsCgFJVz2mDmk
 8wvMZH1j+SOpoMTv0LLGLbKaowlZQSUqPEaLHWjKnYqWnsCNfU42Qyp4JSxseN8ejOcC
 5zMA==
X-Gm-Message-State: AOJu0Yx9v6F27W4Pfd9Wb+tD70pXpgkgGth3Fm83pZzrDld7gzuvYU7F
 xV2F4+qXQGHgAizCIAKRV03Usd5xKZlyPdOmkxRkXgzo6FfiHEEVvxX0HQxYZcM2mU6j/F/Gjn7
 fRCME
X-Gm-Gg: AR+sD13vSuSrmF7RIExIC+d66b7WmBsW5wLfJ/ziXVMSI5ZZdEw27AlnqrPfbzjIfzs
 gv9j9vlrplfjdqLEPfxmSp7hlrrHS3qeaER9VPBttd4ZwhMgMWj4yH/DWkf1Eu8c7L8wzgJvyVf
 sD9Dq2bS8Xe8diX3DdNy1Q6j+VgG1tln+6oMyv4TUVcl32x5zw61uPYn4oZbQmDOYooSkI/HBbY
 YyAUX2z07h10XKYalLE4cnCagfiMDm+n+qy+WX8iSReCtj2UCCiXBaNKn0JGaggqSqePoO8nAX+
 ZJSxXIvVGjHW9tL3R9Radj5plCd5ETFgWM4MmHq+9Uhi24rM3Ku7rN9HkXs9GOKSPMcZ15dhT/P
 cKL/8pqXjEfE3rgqpxRglidSpeqGWlrkmVXUxAAmEzi72MpUrD57LwSJn3O6myCbGRsoXjci7PX
 GgLMy2zrmlGHkiU4aIePUHoos6AKkcuHLfUbauV3Uo3/0qOU5GjH89CARPjWJzxvl3
X-Received: by 2002:a05:600c:4695:b0:496:c1f3:e8fb with SMTP id
 5b1f17b1804b1-4997844bf06mr49229725e9.8.1786451203699; 
 Tue, 11 Aug 2026 05:26:43 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740dbb03sm66223695e9.8.2026.08.11.05.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 05:26:43 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Date: Tue, 11 Aug 2026 14:26:42 +0200
Message-ID: <20260811122642.142680-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786451204; x=1787056004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YFbe44M/cssZhjCeBX2L7vAat6tqomVti9jcCaqJL60=;
 b=KCbTzSXdSCTvim1DPPOM7md3/H1BKNOFfHNV+QZv2kr+daVCOyFblQwg5O+FxY44XO
 SMjD0D4BP+DccOLkgAOUN6CNwq3hLOAVMdzc0+5JXLr81boZvLSOJ+IKl68gXDb8doQd
 /v2IdMP9cK4a6EcjegccVKsPLDCrmAERsrbnJtIT1jX3mKQj3E4JhT4dtaedZ7OW+Y2o
 9jrzURMPJOkZP+zsweJAnTxvKBkQ8s3DJpYkBQUpzCxYomPYuVqoE1b+soF+C93K02MN
 uxDxbsK/R65V0f2moqlGGmVmZg4D/+gidWYGDkohrolCgkvnKtIY05lafybR9qT+J+OC
 YSzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KCbTzSXd
Subject: [Buildroot] [PATCH v2] docs/website: link LTS tooling documentation
 and staging branch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users asked where the notes are available and if the information are
publicly available.

Those changes clearly explain the location and convention of the staging
branches and also link to more documentation on how to read the
annotations.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: took into account review from https://lore.kernel.org/r/<f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de>
---
 docs/website/lts.html | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 3bfd2a4374..7513acc885 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -166,10 +166,6 @@
     <br/>
     <br/>
 
-    <p>
-    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
-    </p>
-
     <div id="organization" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">How we work</div>
@@ -181,12 +177,25 @@
     analyze based on the previous week's commits to the master branch. The
     commits are then annotated to define a list of candidates for the LTS
     branches.
-    <br><br>
-    On Thursday, the candidates are cherry-picked to a staging branch to be
-    reviewed by the other maintainers. On Thursday evening the branch is
-    synced with upstream and contributors are notified. Feedback from
-    users, sponsors and autobuilders are then collected and vulnerability
-    analyses updated.
+    </p>
+
+    <p>
+    On Thursday, the candidates are cherry-picked to a staging branch hosted on
+    <a href="https://gitlab.com/essensium-mind/buildroot/">gitlab.com/essensium-mind/buildroot</a>.
+    Every maintained branch has a staging branch, with the <code>.x</code>
+    suffix replaced by <code>.pre</code>. The staging branch allows other
+    maintainers to review the changes before they are pushed upstream.
+    </p>
+
+    <p>
+    On Thursday evening, the branch is synced with upstream and contributors
+    are notified. Feedbacks from users, sponsors and autobuilders are then
+    collected and vulnerability analyses updated.
+    </p>
+
+    <p>
+    For more information about the development workflow, see the
+    <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
     </p>
     <br/>
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
