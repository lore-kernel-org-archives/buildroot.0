Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C24AEE0AE7
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 17:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE58B822E3;
	Sat,  7 Feb 2026 17:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsdD18MG-vQL; Sat,  7 Feb 2026 17:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2F682368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770484083;
	bh=4GRqk7fSOHBRuSr4+xx2QGm1uLFmVi4rkMhx9tt7Fmg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZqP7YPqKGH72J0qtZh3H8EVG3KHDvc70275Mq4IHDG1Qlfi07QA1sK5rzILr86Mai
	 Klg1yWpGFWre9N2pzfiLq9eFvHKK5kdtF7CUvLjXWpy89ec41CNaDcWK6icHS2P2Mj
	 T3W0xXtwW1SJx3ZH6lQFbMsJ+qVOgzW6ft4BWbO90c3PHr4N5Ln+ddoyCjOJiIGqlU
	 N0zS+yRO+ciGox9g/99g2fiByXZWB3grUlojNT1nNnfI2/Ap/yg/JpOgu4pZQWikBH
	 dcdrZ2IaknyBYoD2eg/CEzxkPkbirRkSZyqzbnuTFdkEpxkO+dmK1ygHDpqd0x7JU/
	 ZLv/Gz6phxK/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE2F682368;
	Sat,  7 Feb 2026 17:08:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86EDB2C5
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 17:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68F2840092
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 17:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgQq9mnOz429 for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 17:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BEA340283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BEA340283
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BEA340283
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 17:08:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -978476460; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Feb 2026 17:07:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1volml-0000000GsSW-2O7h;
 Sat, 07 Feb 2026 18:07:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  7 Feb 2026 18:07:53 +0100
Message-ID: <20260207170754.4022536-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SulwreJ0s2l2MYl/UYwz3G8bKH7A0BWOQovdiibf+am+CbUFO9ZmGigq/Ew9H11BGQ4wXEJxAdEkeaW7LE/W2zY7ZFjyUbLhfxgBJLjZtYwduH7cPgWZQfEgFM6dfokbocPe6tqEpJNbDlVokm8jQYYY1YP8LiU0a/ehxR+FODUgX7dJcfwZJlsR0R2tMTF9l4I+2y7BBPWGIy/eoR0GaKDEltUyUWs/S5yMaYSuzjNLafH8aSV3Qa5ChMZQ2AUSgLbcn6HDtsaij4b3rsp0fn4JN9s1E8tYg9Zyiuuo3X7DOFgIVM7QflFvsGuGlFQV8DbSODpSW0ZXxicEs8Vwfw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gAYGMRMV8BRvoNTDGfahQCtm4NNoYoMG10sgxGWOneY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=SulwreJ0
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/swig: swig-wrapper.in: handle symlinks
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

Fixes https://autobuild.buildroot.net/results/e656684298b0462f8044667e7384c64d6508f22f/

Use realpath when constructing the path to the real swig so the wrapper
works even if it is called through a symlink (E.G. the swig<version>
symlinks).

Reported-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swig/swig-wrapper.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
index 61c885fc90..e6cf2df134 100644
--- a/package/swig/swig-wrapper.in
+++ b/package/swig/swig-wrapper.in
@@ -5,4 +5,4 @@ if [ -z "${SWIG_LIB}" ]; then
     export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
 fi
 
-exec "${0}.br_real" "$@"
+exec "$(realpath "${0}").br_real" "$@"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
