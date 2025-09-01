Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DFFCA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 14:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68C5181191;
	Mon,  1 Sep 2025 14:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plvVR6Xi5hZV; Mon,  1 Sep 2025 14:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F360811A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F360811A0;
	Mon,  1 Sep 2025 14:33:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E0D169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 14:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25F9B41593
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 14:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EtGyh1yW5FC for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 14:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9FE44125B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9FE44125B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9FE44125B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 14:33:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1943460301; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Sep 2025 14:32:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ut5aa-002p3o-0K;
 Mon, 01 Sep 2025 16:32:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 16:32:52 +0200
Message-Id: <20250901143252.672903-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nrsMNGSy8C7hf4uYHJKP+OA1pMkuQnMf5H1wYbnrka9fPgJx/3HP1kOonpUbSh5GH2srgGmESCMjgmUC362bsGOGksKEFX226qzhHVsBQ7CUQH4AqVY9P2qa7z1Iqvax+sPukfT7DlwykGOYybllDNwX6XAMW/V28DLFTZJNd7Mt1QtHtER7TEGzNstrsdlLGdJaBQvJ5DvKNnoXfOQc/7eEbAW5JjwnyRNx99YJSQwJWTCb6nj9TNrB1iMeIqTt9Rib+NQxOFkdtr+IQQr941V9fWT7Te9BTQZDJNjixs0SdjC2H4zpgVcgTxxSqmLcYbAExjIAlh1vfoJNCSj/YQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=32TJ//6r9Ep2w849ObS9Ww0n+zyAZoeKQyvPdV07MQk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=nrsMNGSy
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/jose: needs shared libraries
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

Fixes https://autobuild.buildroot.net/results/bf23e75461877a4ca3a189626f30cf8cde24de36/

Jose unconditionally builds a shared library since v11 with:

 commit b72f8cad002edc87286dd1f2331c359158c512e8
 Author: Rosen Penev <rosenp@gmail.com>
 Date:   Tue May 30 12:18:30 2023 +0300

   jose: build library only as shared (#119)

   Needed because of constructor usage in library.

So add a dependency on BR2_SHARED_LIBS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jose/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jose/Config.in b/package/jose/Config.in
index 4a9ed8da65..32e17276b6 100644
--- a/package/jose/Config.in
+++ b/package/jose/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JOSE
 	bool "jose"
+	depends on BR2_SHARED_LIBS # builds .so
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JANSSON
@@ -10,5 +11,5 @@ config BR2_PACKAGE_JOSE
 
 	  https://github.com/latchset/jose
 
-comment "jose needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "jose needs a toolchain w/ shared libraries, threads"
+	depends on !BR2_SHARED_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
