Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECF4C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C78860E73
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C78860E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9AD942843;
	Sat, 28 Aug 2021 13:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ung_mOZcjWrC; Sat, 28 Aug 2021 13:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C3A42808;
	Sat, 28 Aug 2021 13:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCA7D1BF312
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A921542808
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVtwwH44z_PL for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 13:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FF1842640
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:08:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so7043797wmi.0
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RYr8qbIm2XRle1GsJZFmUqrI6jpdYb2rhSvIkMexlo=;
 b=fu+eSgLc3pB4XvpA7fQi0mSgtzAUfs3Xpg5Y8j/pDvv1ckf8ahWCN/+pWWMK1WcL+a
 KFIhsHsBhokO6zjzamcpFsC9FQH7wm1gljkmqQnPIXvgPKQSPgbNPyjkcHbFiqhwlXw4
 Or3Z+eRQ82NpFzzJyXQNg+VFxYMxGlqmoqemw9aB3PFTJeYIg3lCscbhVhQ98PTKe8L/
 77KqtUY8cM6kj5kvOQdY5WQ5Ogob2uVRsjNbFHNo90c6g06DD/A3Vch0jDTFK49q7dFK
 IvujpD+b1E1De2a6WtpzcOQOGONM0pEvFHL8UJsGoGiBY/wo8faiSRSwmM0txadLb+Py
 R9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2RYr8qbIm2XRle1GsJZFmUqrI6jpdYb2rhSvIkMexlo=;
 b=amuT6oOBOaLnNs0PYfMFnP3swVjjH4lFm+kWu+HgDhR3DHsneXXL1IdsmE0jA0vQTp
 6/tSsEvVrA2woj8IATTvUyvBe/GBH9sSrAGA4TByFwqISDHcDvxsL+x3wbG9a6mM/9kA
 XfC7Rz944q9iIe5L3Y3biaTEKKi+0a9cUaa/HRDQpWi4eDC/YQT4I/GVhee8hBq1BwpY
 Iv/LoA19VSYcdADYeFLITgc3tCnwJfiUMiz8XIoXi9SwkqXrlgsjAy21PfEpjBzdnAJ4
 Yqe25k1VRrsEM6jrizRYW9+LLaIluXGg8zkO1jDOUJ5npgpndyIWhv+oe+1j5R/9gVn8
 r2fg==
X-Gm-Message-State: AOAM5336xkH1YqPv2l63qHPoFNaPEUgQd3YRXVD0kMxDhFjtTcbEoty4
 v9n/CgghnZXqEE9PQeE2lzgrVneIyfQ=
X-Google-Smtp-Source: ABdhPJxv5Gx3dSjjAlaBLY0lev3kNMaOvHGAR21pQmvbIg8M0HrLrp9eCX18VByQU1cEb8p8stbnyg==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr13577376wmj.126.1630156131697; 
 Sat, 28 Aug 2021 06:08:51 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 by smtp.gmail.com with ESMTPSA id n3sm8901707wmi.0.2021.08.28.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 06:08:51 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 15:08:47 +0200
Message-Id: <20210828130847.461996-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fakedate: avoid recursion if not first
 in the PATH
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

With BR2_REPRODUCIBLE, our 'fakedate' wrapper script will end up in
host/bin/date. Currently, it iterates over all the 'date' found in PATH,
until it finds one that is not the script itself, in an attempt to avoid
infinite recursion by calling itself again and again.

This heuristic works OK in Buildroot, because host/bin/ is first in the
PATH, and so that means the first entry in the PATH is skipped.

However, this is going to fail as soon as our wrapper is not the first
in the PATH. Indeed, in that situation, the current heuristic will stop
on the first 'date' in the PATH, as it is not the script itself, and
since our script was executed, that probably means the first 'date' was
itself a wrapper that ended up calling us. So, calling it again will
eventually trickle to calling us again, and thus creating the loop our
heuristic was made to avoid.

This situation currently does not occur in Buildroot, because host/bin/
is first, *and* we have no package that provide their own 'date' wrapper
during their build steps.

But when we generate an SDK with BR2_REPRODUCIBLE, then our wrapper
script will be in sdk/bin/, and there is no longer any guarantee this
comes first in the PATH, thus opening the possibility that another
buildsystem based on our SDK, but which has its own 'date' wrapper, will
trigger this infinite recursion.

We fix that by iterating, in reverse order, over all the 'date' we can
find in PATH, and when we find ourselves, then we know the one we found
in the iteration just before is the one that we should call.

'which -a' is old enough that we can expect it to be always available;
it has been present at least since Debian Squeeze, released 2011.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fakedate/fakedate | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
index a64d9b9cdf..9bef113357 100755
--- a/package/fakedate/fakedate
+++ b/package/fakedate/fakedate
@@ -19,15 +19,13 @@
 #
 
 DATE_BIN=false
-# Do not call `date' directly since it will produce an infinite recursion.
-# Instead, find path of true `date' binary.
-for P in `echo $PATH | tr ':' ' '`; do
-    if [ -x "$P/date" ]; then
-        if ! [ "$P/date" -ef "$0" ]; then
-            DATE_BIN="$P/date"
-            break;
-        fi
+# Do not call any 'date' before us in the PATH, or that would create
+# an infinite recursion.
+for date in $(which -a date |tac); do
+    if [ "${date}" -ef "$0" ]; then
+        break
     fi
+    DATE_BIN="${date}"
 done
 
 if [ -n "$SOURCE_DATE_EPOCH" ]; then
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
