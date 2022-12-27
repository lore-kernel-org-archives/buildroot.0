Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805FEC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD961408BB;
	Tue, 27 Dec 2022 19:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD961408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZTZgkn2_NaH; Tue, 27 Dec 2022 19:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3781408C3;
	Tue, 27 Dec 2022 19:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3781408C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABCE1BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B4E605B1
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B4E605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dB40phlI7RRO for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 19:54:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D275F60595
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D275F60595
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 19:54:14 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9F68EB0051E;
 Tue, 27 Dec 2022 20:54:08 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:53:39 +0100
Message-Id: <20221227195339.86514-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672170851;
 bh=TZH4pzp+evbfl7wBXJWEWc70tUwr2VPoTxtKXqboCY0=;
 h=From:To:Cc:Subject:Date:From;
 b=SIpuD1qwhR02EUbP28jBpEK+M61tBB/BPoFHiSLqP1xoMJd/PtS3TOTA+LCPhqx29
 Rv+2+B4JU6JMnbhMSM6JUqqtZ7bUgMt1Qadqu2ZW9mLr5FXHTygPi93C8aF0wJ0DJi
 w+xvano72wMhAtB57cJ83bKzaulrElKY9OsE1jHxUXjPnGQPjfKVLnqaysakpVJurt
 eFhkCj2J6TD+CBKSwjfic0odqd1SllZxD5XbAYkBNRN5sz08Dq1yE4cxRsJzEcSHXN
 gGc3LLWXzoh5SWNLbVrdLQY28+S/LTEYs8UuLCYCx0hRf7P5qXvCFGvzWie9ATQ3HP
 9q6qGwYcwDMYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SIpuD1qw
Subject: [Buildroot] [PATCH 1/1] package/fmlib: fix build for ppc e500mc
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
Cc: Julien Olivain <ju.o@free.fr>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_powerpc_e500mc=y, fmlib package compilation fails with output:

    make[2]: *** No rule to make target 'libfm-e500mc.a'.  Stop.

The fmlib package "make help" command shows:

    The available make libfm-<arch>.a targets are:
	    libfm-ppce500mc.a		(P2, P3, P4)
    ...

The package Config.in incorrectly sets BR2_PACKAGE_FMLIB_ARCHTYPE
to "e500mc", which is then passed as the package make target.
The correct value should be "ppce500mc".

The commit fixes this build issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index df4ae440ea..7bccfd7c83 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_PACKAGE_FMLIB_ARCHTYPE
 	string
-	default "e500mc" if BR2_powerpc_e500mc
+	default "ppce500mc" if BR2_powerpc_e500mc
 	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
 	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
