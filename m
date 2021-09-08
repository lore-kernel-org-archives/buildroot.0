Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983ECC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 13:38:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB8561168
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 13:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBB8561168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F6AE81C11;
	Wed,  8 Sep 2021 13:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkVkFyVjSdsT; Wed,  8 Sep 2021 13:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E611983139;
	Wed,  8 Sep 2021 13:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D53CF1BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 13:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22114026B
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 13:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wQuW2ybDmjf for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 13:38:35 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 194A94024A
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 13:38:34 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MOQu6-1maelt055K-00PyNV; Wed, 08 Sep 2021 15:33:27 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 15:30:10 +0200
Message-Id: <20210908133010.31005-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
References: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6nKVucgwwLrfr2vpkCdVLsDRdkltizvDawuU/HABDGfsBqjmaej
 2sxwnl4ytpiGX//EowPP2vvpIHB0Lf121qtvlSvQRXr2Vu/1lD+QmPwbEqmeyZXHyT9dT1+
 BCL+xXfQNigVU5CBav4RcLfYApjOM0pU/nb6TZp5AsqvYaEvJ84/OyMAS0oDwN7wc58ijvF
 GCdhZtP6AqD3SCJX0DPBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gECQja5iZp0=:UBxB5f2gY8aAiE9R3y0BgM
 EArT7zDSGUw7NShKDV+m99ScATIvKvDtJ4EuYzrdq/qeGvzVUY9F1tgBrgZdmP9yWWJUl+GZl
 TYnfbye75Pih6Kd21dspW/9RkpCK/Rwz8MJSmjXVURlcgPjL+8azCLN0g+Kb+7tJRPOj7bxZW
 de/PUqV8b+4cK3qlTUnub0NH833Y7Uhf+0Bpbz1huR7/gdfXIwB9nBimGOSOwbHt7tt1mXBuf
 HCVb/9Ivt2HA5B1wYTbwVZ4s74DjP2gSDR87oPKniq5LmL12Pvgkf/P2p9Pkt0lj3gPySUJBs
 oDKMV/N+cQqkTYFSHb+XiBFGOWW9s1Kug37nlWBjQ6oqE+ix5gzkXzdvALMi3gPs3ZaNeJdgw
 WgCZR0YxCbt8Vu2lB1qf9sp4h7NYqG8DhUaiPovNgpnCNJ8r6g2lBkch8siUyzIphkoDL6Llh
 MwMyr2U6+2ZFNfcySZdOeMxt8w6mbN3uJ4YPHr34480ScO0vvoTB5fNdgShDMdQhBiOAk/tsc
 loCo9lUJyZv3VBOndVvVweSOg8pDPtPKBUnBiLBVCqT5oxp/qP3tD+vAaM4Ykht9JK62qvmMB
 pnYkvNpNf0yUl7F2nBa0IRlF6tk67J8nPirEZg4Pq40lO/eEDqS+2L7U8iVmP1GHjzNwJur+V
 9336A5zdx73/izk0tG7Tc8mvMugEQDbhg1c/te07L1UC3q/cq5jsBhx3RyBeiVi6qHNrK8LyW
 Qchz9XQIokM6vyQxICne2NXvBWqkz9itr1/JUmV8Mkiak83JTmb1WabHrMnvuuNrEyy6XA7DG
 GdaDDKv
Subject: [Buildroot] [PATCH 1/1] package/libressl: depend on threads
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

If the toolchain does not have threads (e.g. br-arm-full-nothread),
compilation fails:

In file included from /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/cryptlib.c:117:
/home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/../include/compat/pthread.h:114:15: fatal error: pthread.h: No such file or directory
  114 | #include_next <pthread.h>
      |               ^~~~~~~~~~~
compilation terminated.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/openssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index f69e85978f..bdcf7e2773 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -33,6 +33,7 @@ source "package/libopenssl/Config.in"
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc on noMMU doesn't provide __register_atfork()
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	help
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
