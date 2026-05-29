Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 22:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A1BA84BE9;
	Fri, 29 May 2026 22:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu-R_D0yeWe4; Fri, 29 May 2026 22:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B0084A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780094450;
	bh=uhaResm32su2gV+JPYR0+pwK1E9/cFfleSGk8LvH1xY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hOI5A1vfw+IgHGzbSOS7GTyOT00wWdNZT1G6QSV2sywBi+ehcPDGKkpvQU3nevvZo
	 xEAX6OwQPRpOKuhtlkCIqnueL+OPaa9GAQaToWwnZWjbl2b4AN/6JH3Dn9/y2JYxZ1
	 cNCTYpetAWr/vxCM8sCD8fmlWe1l6Tem6ZKWC/2RgO5rMIEnF8s/YtbPUkpmnbs/1L
	 cJDc4zGeytxZSanfO1+OQw9kmmUmNdbaTVv33Z4byWNU8UMCpyRWJFscTTAibqDnd3
	 bt1Lel/I7XXr2FuFezqXZFPOWjhLqnKxz8gdycaWMv0mr/GP2CpoY3L1cD8y+AqU8s
	 us0wrTwh/3zXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B0084A50;
	Fri, 29 May 2026 22:40:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39011B0D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 287E042936
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDVHjFCjE1AK for <buildroot@buildroot.org>;
 Fri, 29 May 2026 22:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8308B42933
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8308B42933
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8308B42933
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:40:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -317298533; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 22:40:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wT5si-000000048xn-2goy;
 Sat, 30 May 2026 00:40:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 00:40:36 +0200
Message-ID: <20260529224037.987748-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YmqMMg5ngserkmspbLFu5JZLNKm12CvzEpq9yVchmxBL/Xn9wUPyaU0nybHI5cUjT14r90dQg2cD2s93erK7j801VwXvZSYufAa6WbpsASAlbtXW0uIOA1DcIVcs1AomrI4Cm0ZI2kIFm8iG6KE27ypJFmf1tNC9FaJ1pvBgmDqcDnAqsOHEnAwsgNFfEqBHJOQorSLBUhL5Pqlr9VsUmrLIZzbU2SkbMwMpVEpiasPxqZbaSsR908cIMGdgnxLW0PzdbiWBAeUhIICjZxJBAlXM4PRmhrH4HyS5CK7grzXX1Uairt5VL19Bvv37m10/1bD8N2Y47RsmzSExhKQpiw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=/AVbF5WnqvB72SYUWZXOJ6cDu1NB+lTfhSbeUs6mt4A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YmqMMg5n
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] support/dependencies/dependencies.sh: reject
 buggy uutils install
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

uutils install 0.8.0 as used in Ubuntu 26.04 has a bug in the install
applet, breaking a number of packages:

https://github.com/uutils/coreutils/pull/11505
https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2151454

The fix has been merged upstream but not yet released or packaged in Ubuntu,
so detect and reject the buggy version and explain how to change to the
coreutils version. Once fixed the version output will hopefully change.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9c2aeaf23f..8e97f0912d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -190,6 +190,17 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+INSTALL_VERSION="$(install --version | sed -n 's/^install \(.*\)/\1/p')"
+if [ "${INSTALL_VERSION}" = "(uutils coreutils) 0.8.0" ]; then
+	echo
+	echo "You have an uutils 'install' version installed which is affected by:"
+	echo "  https://github.com/uutils/coreutils/issues/12166"
+	echo
+	echo "Please change to coreutils install with:"
+	echo "update-alternatives --install /usr/bin/install install /usr/bin/gnuinstall 100"
+	exit 1
+fi
+
 PATCH_VERSION="$(patch -v 2>/dev/null | sed -n 's/^GNU patch \(.*\)/\1/p')"
 if [ -z "${PATCH_VERSION}" ] ; then
 	echo
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
