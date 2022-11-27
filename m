Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB38C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B9E60B10;
	Sun, 27 Nov 2022 13:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B9E60B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wq2hLU8ixRwU; Sun, 27 Nov 2022 13:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E22F6605A1;
	Sun, 27 Nov 2022 13:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E22F6605A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6BA31BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9022260AD2
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9022260AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRD1BLh055ko for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C00605A1
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3C00605A1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:10 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id e205so8997937oif.11
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cikp0EEulpzCFR0AlDmg2kXgITR4MKVNwwpswSFcFm0=;
 b=eYQgpZPwsWsyG97ILuv2/goJtDNRzHsyW8k+98My0PgSzrHVWtJ/XBO+XGU8RqdKPc
 NG1n8ma0n8j6ICOQ6a45skgWYe8+Uemyzo7kQ6tdt3k6UDgpR0iISLmAjxqf3O6kgazc
 N53wti390OxRNAQoTj1P4D5ZRI8bF7hj6pj0tKNR5VaSiJtL1mmr2N7dEJ1aqAmKBBss
 NHINiooC9nDVNa0wA2kijPjclioRhnCwMpKG9C2GbpKf79Lza8K517LBTIGyLvgX1UBG
 j/gmqn3mhAF8JSq8R3NkK+wN4fe4E5fmIuHXOxuWqXpuDzRg8acD2k89phwmBeWCEtOB
 fc+w==
X-Gm-Message-State: ANoB5pl/xqt+UT84LYO+ddLBcSk2AokdZgBuoXlBteFawtNHaTfDsD0t
 Io0IsmixymjyML/RGJj4mkwtmp+AL5o=
X-Google-Smtp-Source: AA0mqf7l/K+6wEoC5TWoceLB+s4J3UoRg/KyTU88tWpjLQV24N76umo0bkJE+RzO63xlGXNfF3U3GQ==
X-Received: by 2002:aca:1306:0:b0:35b:88aa:be80 with SMTP id
 e6-20020aca1306000000b0035b88aabe80mr6913936oii.41.1669554489543; 
 Sun, 27 Nov 2022 05:08:09 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:08 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:19 -0300
Message-Id: <20221127130739.1862398-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cikp0EEulpzCFR0AlDmg2kXgITR4MKVNwwpswSFcFm0=;
 b=iho3/hYYeN9BR5B+g/GIFiGDnWDL+y8SjMFq+J7lOSwfGswpkxWl/65nX/X64EcywU
 foTfYmHzTGNftGlrbwpI+YUBY0Z2I0Q9dwElQ8YlXyRv805WR6p/nbUmc7BOkCa6oWzu
 iKeVzoQJrRYnJUVYCg/KBBLgoyuMCa2pIsaeiwp1GGoKvoMSMmBrbz82ytVP3g0koPdn
 Oazku4Th5fHeHb7M48dLD+coLSR6xfB/MZcH9pNOG+T0EixhbnvqfcBDGMwW+6nBWvWo
 iqAGZECtchJjUnwprQtyAvqCYMOHvManPKs4p9Trenib77cdgmBTd1dk/uia5fDXpkBi
 rR0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iho3/hYY
Subject: [Buildroot] [next 05/25] support/scripts/generate-gitlab-ci-yml:
 improve test-pkg support
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the example of test-pkg config described in commit
"12c7a05da1 utils/test-pkg: add gitlab-ci support" to test a defconfig
fragment that contains a disabled option is currently possible, but
it do requires one to change the git config core.commentChart so the
lines starting with "#" are not discarded by git when creating/editing
the commit message.

For instance, without the indentation the 3rd line below would be
excluded from the commit message when the editor is closed:
    test-pkg config:
    SOME_OPTION=y
    # OTHER_OPTION is not set
    SOME_VARIABLE="some value"

Requiring to change git configs is not very nice.
So make the developer's life easier by changing the sed expression to
remove indentation with spaces from a defconfig fragment found on a
commit message.
For instance these lines become valid and generate a defconfig fragment
without the indentation of one space to be tested in GitLab CI:
test-pkg config:
 SOME_OPTION=y
 # OTHER_OPTION is not set
 SOME_VARIABLE="some value"

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Example usage:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704846763
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index aa43aac019..27f586f1b6 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -91,7 +91,7 @@ gen_tests() {
 
     # Retrieve defconfig for test-pkg from the git commit message (if any)
     if grep -q -E '^test-pkg config:$' <<<"${CI_COMMIT_DESCRIPTION}"; then
-        sed -r -n -e '/^test-pkg config:$/{:a;n;p;ba;}' \
+        sed -r -n -e '/^test-pkg config:$/{:a;n;s/^ +//;p;ba;}' \
             <<<"${CI_COMMIT_DESCRIPTION}" \
             >defconfig.frag
         if [ ! -s defconfig.frag ]; then
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
