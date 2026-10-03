Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A2ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8199E8148C;
	Sat,  3 Oct 2026 15:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rb5dhX8eUH7w; Sat,  3 Oct 2026 15:55:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A96D8146A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042947;
	b=Q0/suc1K4t3r5j1YgddWCC3axk2wPboiyWBXQE4ddEFIYycJh7t0suynh4rXE/fIIMIA
	 B37WT4GbvGkkrxs3hf4CI1dJ06jSiZMPtR7s8LhL+255f8Cp41rqt4q/GWi6JCYvbHRlr
	 oXRiZkOBRZeTn5AHtIWyjErDN0LYG9wFURLKAvGlzRDMxSrMGRy6XPmqR1NX75pHoCmHO
	 yvC9J9msW6WAIXJbqPEExvVRuwN0aCHPlM6cfg6K6kZSt2Cr5bz6hjsiqdVMN3p4QZ2DF
	 8fpSVvDRObDVLBJvQeLwZOtSwad6pnZJVl++2KVCaiEvJQaYY7OC38ZtaeL4tYxPdLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042947;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=G4HOeKFEk2QAU3+BQXHxa3adCGAStcpyGHOLDDEOBlA=;
	b=B0xQg+ueflJk33eKvrg2vKRCyMJBe04a58T6/6eKMmEZH1MKCwsUwSnV1RpRrA+980St
	 yrAhWPiRuFGj7V1npxJnrIEEqYT9WzNrxROrO1j8kTYA72pcag5+AcTLZ8NnRYLHOjvlP
	 +B5bjeGeWwKMr+qFwE8/aXCcp4KNoqJevNCz+nQ4M71eed+hnlcClfc+QGESlgrngcQb3
	 jZThz5+lRDN0DBs8mLB9dXLlWY8TgYhlsXRIdKz0NMjCHjjl8YldydER3KCidOyqmjDvE
	 upFfj02Ia91bdZ4lvOHo77v9fdO3R301ZkXOV+3p/AHYEZp6o2BFIb0KBPFpWFdF/CA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042947;
	bh=G4HOeKFEk2QAU3+BQXHxa3adCGAStcpyGHOLDDEOBlA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AOyIk2kjH1mM5CCyQ3hJTk9ilj4BlveuNl6cyIPeryYkbS5O+CmfmSQT5r8C+hHJA
	 g998trNjCSp9Rt6QuVJgrk8hUsxMCj0W4plUVXsLRMC9zaxb2623MfxF+eM/EBxR2X
	 7ugFeKQskuhxbdh8kSbn3z00rf1gA7iRXx/+KGVylud7TsW7ia0OK8YeFshNcPb5Xh
	 QcJPxk6u3urKndeC/eyJ7TQIKHORhHZT1RGFHp03ZES6KXtm2I7F2PvwTyfysaEpop
	 8R/SYPQWvuFgXBEqVcT1qOHcw1yBRklQvjkb+lKPaHMqKK7Og2nQ7+0WB3rZb2gvBN
	 /zF5oy/w5R8GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A96D8146A;
	Sat,  3 Oct 2026 15:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF5B335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 914BC606C4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gv5MRwkKv9VV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4FDE66066E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=aBvsTjWdKFUbPJ5DColm1/Fwem44BK6yXmRrvObJlCmtoHmg8Ds/RTaMEIaeAThrNAJs
 9eNCKgd2abLl5NXzMkkC1E+lYeLQsMJkdiBlI3VoLu6K9aGLY7pwpfTBY4t2IQAD8sNka
 ue8elYSZy6a01awMnISRJFkJB5l27nND9/8z9fQi+W9pXLEuxtOW24GTMAzbqagYBmiB1
 RNTjugtgoxVhfBQGXE1Ga9diJQ+FZwqut8GeIKw0yWa6e9z1V27WQWQbW8WcqulIilRfv
 D73hHvlt23DN9g1QlJOCeqnfFfQSoFD9IXmF19qaNkc6LXIvn1dxnDPs3BhqDyy+ypg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=++0trmW56BJW6aYu/45JKFY9cadEQterm85gvnXL3ag=;
 b=ZT9pOaJ4P6MCIx2GGUcvsU3mbD9WNgstQN+RVIHOMCkxS1crZ583v1DH62x8TIAClrUE
 Z0Uv9Hn3viXaSltsW4Ujo/caY/nbRBGvN8rCr1ObmuxJAGHD5WlBkWmpi3qnlR96xXRuC
 IARNbgFVMrk1MOeF0C4YM22oibnpnf10wuGsJoTNwBkwa55Tr8CiJ7ABGZYjF09giPMUy
 7WH2xHAIzIe31xdK1DHY96YI94g6LS/pib4Iwt7tIbEuQtj9UrSE67qqxzOTqvvc54lU4
 nGlAdoK7Uu+FJFGoBAMhpUs87O4qT0IKisHuBnmbAbfluS8JjBtS8Ld3hbEWxNcuEjA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FDE66066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 906A4886DD; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3af07e4e0f0881bdb5571ee4d34d801d1d49a48f
X-Git-Newrev: eff3016b684a5e651efdfc6a1b82e678ce54b3a9
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.906A4886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump version to
 2.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5909249248046265929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5909249248046265929==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eff3016b684a5e651efdfc6a1b82e678ce54b3a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 85ef73d18c..f3a55962f1 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  e7e941a14ffe78d66bf23cdaaccdee7d  sqlalchemy-2.0.49.tar.gz
-sha256  d15950a57a210e36dd4cec1aac22787e2a4d57ba9318233e2ef8b2daf9ff2d5f  sqlalchemy-2.0.49.tar.gz
+md5  d02bc876368c10e73feb00f82803093a  sqlalchemy-2.1.1.tar.gz
+sha256  fcf3cbb33bb23bad75d2150157c21804618745731e9931ab27e61879a9f6123b  sqlalchemy-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 46a180a4d4..fdea9e4325 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.49
+PYTHON_SQLALCHEMY_VERSION = 2.1.1
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/09/45/461788f35e0364a8da7bda51a1fe1b09762d0c32f12f63727998d85a873b
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/a8/cb/7c68da82239ffae9378eca076afe14c310e17a4f01e3d315112f266e26c7
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============5909249248046265929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5909249248046265929==--
