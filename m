Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A298AE7719B
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 10:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F86940335;
	Wed,  8 Jan 2025 10:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdsoT2VxkAsc; Wed,  8 Jan 2025 10:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A95B402DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A95B402DA;
	Wed,  8 Jan 2025 10:58:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74D6A1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 10:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4158560635
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 10:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvAeeWxrDXb5 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 10:58:20 +0000 (UTC)
X-Greylist: delayed 380 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 08 Jan 2025 10:58:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E946060585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E946060585
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E946060585
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 10:58:19 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7EEA62C86E68
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 11:51:56 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  8 Jan 2025 11:51:54 +0100
Message-ID: <20250108105155.147046-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1736333516; bh=itTsv4G6IiM47CIZ0y42fpWWbu1AmAkCDWemywKRPOM=;
 h=From:To:Subject:Date;
 b=WhhnFZZxdQ1aIid2MRoM9WVPmr31g/q05zgKoGqnVi15OK9IA7Y+2N2Zug2Q2reU5
 7CVrTufYva1Wd6fDu2HUY0EgfYK+EnEnLPrBAO0HinPgUq93/0vNDH1u/A00184U5W
 w6ho2IIvLfewKx9n6d7wXdkONp9TTnRoe/b+7rFFpkmNKsWyloyWyUVMlRLHdqY6dU
 qnTCyrP2KBVCcw/8QzqTZuE8hTZSC9BNyDs2T6Kb5gWMOctNivDWJOnns7UU4Z4dla
 19iGtv7epghMbbaZoTXSZE9QCowJRyQ+M8Ehb9uQ+pRbsFyLo+hZnCcV62AaVL9eRj
 F3maFrZGlJ2rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=WhhnFZZx
Subject: [Buildroot] [PATCH] docs/manual/adding-packages-python.doc: clarify
 how _BUILD_OPTS work
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PYTHON_FOO_BUILD_OPTS are passed to the build module call of the package
build, this allows passing options to the python build *backend* by
using the --config-setting= option. setup.py is no longer involved since
even the setuptools backend now used the pep517 build method.

The note about the options being passed to
support/scripts/pyinstaller.py seems to be no longer accurate.
---
 docs/manual/adding-packages-python.adoc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index b42c06e54c..43cf0baed4 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -128,10 +128,8 @@ therefore only use a few of them, or none.
   and +HOST_PKG_PYTHON_PEP517_ENV+ (for flit/pep517 host packages).
 
 * +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to
-  the Python +setup.py+ script during the build step, this generally
-  only makes sense to use for setuptools based packages as flit/pep517
-  based packages do not pass these options to a +setup.py+ script but
-  instead pass them to +support/scripts/pyinstaller.py+.
+  the Python +python -m build+ call. To pass additional options to the
+  build backend use the +--config-setting=+ flag of the +build+ module.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
