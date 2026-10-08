Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E4CA600E
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 20:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF4E606C7;
	Thu,  8 Oct 2026 20:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axissoXvFCP4; Thu,  8 Oct 2026 20:35:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E87C6084A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791491736;
	b=OPTqdA9M8lT2XMp3CP+kHqiJpu7EIBGfTxu7kkxuTgLC4NJQlf69mrnUn46YconwmQd3
	 gYr6m0qQMM/F/Cx9UbotW6IJCsJ53ckoKfPSIUXPZBSAgJ5gjGxycu33nuMw1ZIqxytG6
	 eHQs4RhPFqjN5z0rUtoEBiZT540qeFlqozNLoPpaWiRxKvvDqFbzVL1HfYGBVrQ6vrDz3
	 xbUQ2unprxIjBz8MIGZNuwBUBhqcFhXFBI6MZvrYDzzWwKwHXUYr+ytJvH3cPJqw4zJIF
	 XJ1z6RFqVw5JYgdPYIwlEBdaoWqjFsgMhd3+TIn8Bf1jAGwGXFMRXEzoMHaxtooCZCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791491736;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T8OBvgbxhHsA14PkyYP+uA3FwEvFgWCgGctmtvWV+sg=;
	b=Q0a7vJYht8k3M/bXPnIqZhPw2BjtYlGPQBmCcN5gWsv+MNtRR6AsI3QBB85zZ57CRe0Y
	 S21VNuma751YRkwnQduuIDqdqRuQQpO5JNfVQ35M9FF9m0CrByEvUPeZiDOnHKspXDt2r
	 jwmGV9ISPTN8Uy77qpkNs1fqCO7LETV4jNDVcW3m2BSjLbjbccSmVR58zozsgb9e+zYkG
	 6RGRze9tUeD0ZjBSlgR/L+gmZobMq+ehYseuf5m7j4XnnspXpMAdfMIDykHpD2nr6+aEt
	 mJ0z9RLGhjqxNtV2x8SGqQ7A80Xd08pXYr9QjanEtfOX2N2T2drs+/xqrff9SroSStw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jrPJ94Kb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791491736;
	bh=T8OBvgbxhHsA14PkyYP+uA3FwEvFgWCgGctmtvWV+sg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M9l2974B6ESY/KRnrqAjIlSgVE1GjCy8deaLES0DPHCSQ6147sdyGMh/MlDr1mnvG
	 aLOm8Oob9Wv4nkPUxkdXBo0cHbDucbUTFovHpgMz0ZctOGYMIqI0KLwZQMCObEpABd
	 j7nYva8yV4mDLZwedCknrQrhREZ+FXeF4QGbJWQs5E+MXHqWKK0fH8W2S/VZZToXEX
	 Hp6NskpAZ7YNPjZHXp3lDOyiQoHnYMn0rGMs+q0qUvfKeKwq+qZXEqpRQaTr6ddvUk
	 zBycKu2bl/wN/SS+dMUK4IyrkapFviMKGVAcJblKU/3wJKzp6r9kj//hpdMUpKddib
	 S4fWFb8bGSDAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E87C6084A;
	Thu,  8 Oct 2026 20:35:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 013B634E
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69F06084A
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPsrOCxAYvOP for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 20:35:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA55D606C7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791491734;
 b=YUi16lCIX4VSbVSdgfI215KCgjCKyxYC/w9BfELF7kvL52xQoU33ujKX47iaTSYMH3vq
 4uSZN0vHjyKOWqle9tk0K+26NoP5llbJres/RDi8MRw4hKGHkp/pQeyqcdkMMN+rQUuwI
 +aQ7EfhYUwqBUxz1ShXOrpva3RRCJEli78q0YyfH97f5bu+9PN4GwuAF15+rirGlc2mQK
 RoNlFkKKGAs3UDEMUWIDKeN3CqOO+JLKIGaQ3Sg/fFbwCcE2LBP3ksF1R8FDsC7TmLaa2
 iDsYTAtE6QiHVbPsgaZeBL7JGtt7S5xZX63jlVamiUMV+XOlJeMbElVAo2SynV984KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791491734;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SKOSpJ4SPm4HZLAoXXatnCvRCqtMAtjK0sZyyFc0png=;
 b=l2spScAN3CK7YJaTXW8WJamMgy+/likA2ClOu0GPWk4V8EOHGWMfEQeNW7NDBpahh1Sk
 RbVIfyFoHhZdFxROjUR9rLXZW85SKCN3Ex4/JlRENYE5M3KiF6Wjc9a5UBjHY20hAngSZ
 AXru599AzkZI7pDt+zEKCgshlgM3/HrUPhEciKxtpeW954zyiTaCOmC/IS1XH1nURuUC/
 4NC3tjyT7sikGe4Y2//GML+8zXO0Fkjjwy5n1y80QFVksKz9S3oKnWVV3/0boqyFktHl/
 OtpfH1VsT9JxtX+rnDMJPl906JwJ0gLy47hFr5/5/olOOJ1cPdPnm6dA7yPkr6lkxLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jrPJ94Kb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jrPJ94Kb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA55D606C7
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791491727;
 bh=SKOSpJ4SPm4HZLAoXXatnCvRCqtMAtjK0sZyyFc0png=;
 h=From:To:Cc:Subject:Date:From;
 b=jrPJ94Kbj0ad+nUdz7H9E+oByl9fEjsHgWK77e226IaZp4ZQHyF7V17HhhM2EP2fR
 +fBzdhP9EqDf5sOFritz7NWLTGy64ab1ngILnEa0fWtVAvwvPFrqMzyu+2BlOzodfN
 d0H95CL4QNSVh0Ewsiufax3/RDWn96fI2ZN+unaO8iWnCNaLYZSqtxYLW5b/livy2y
 UzV11GCGE5HDNrue2NqUs3mP9J6Q1TlTPsbPtlLY4FigOmKpJdbNRj0YtqU5A/wsCJ
 hwaTZ+aysx/Js/fvx1riJaX1Baaa5ZvzAiJbwrNKQVvoJ1jlJDnOsqhKMpN/ws4N3r
 nHrM2E1mNt9cg==
X-KAS-Sym: v3:f51bdf72230551df:djoEyD1gCZYJzS1e0ipcseL3u+Ww8cgcUu0cTw40/D6ST
 66048p+czedini2B7s87A6wSN9Co2+5VyoLB//rNj+2ZxB+iLanHZMRdPIhUE16JOqOXILRfYQk
 nhpXxzl5jt2V3go1QLKJeLuOYEuWOAFktTKHzgbElSsGPu7CeMUbhkU3Zrip7IRpVEyjhiD2RXZ
 +7x4HazyzcHx1spPJU+6ZA4+O/48AdlifzJbbVTPqlX1zLrNr3OT8fiWcl8U/zv6INq6WNmuzGb
 B0y+5u4QvH5G8cgi2T1XJO8DDBBOXCdrgp6fKNrJihS2QC8daSl9Dq2k+eXx0Owgkw8TWFLA==:
 jRZM5TGZlJh/5fhRSQzO5KipxN1wIGDa6fskalEG21yZW4YUNulT4jdm1fObjKZvqKBy7i55sXo
 nHrDnruCV6DZOd1CBDjlKygJavMl8ZdXgTUbyowWzv9Z2XdzxNb8H7700RI3b9Bd5j9Lil5Tbg+
 hQK5BUSfYe+tuJEFX3fOvLb1wlBsenILaofbBsDGg1M3t47SnWJvBU6dnEtrZY3o8Uyh+ZgkzNE
 tLMlyKBirnjYsvIBiY4+06Iu4CsvP0KqXbw6T3QcK3nxaIFyqaS+C8F2BW8XTsXFVVFFYHkDSPx
 Mxm4dEQNHO6qVUECgmqIcKzqJ7Gf2+Ysj3VhfFwt3f+fPc5p0L0gzrJWWtPA37sGvOa19Ygkm68
 1mxuAq0wjg4MElHY8tb24GZGBF+GV4zx8S2RcVj06/i8rbLeg2hd+pMzfJnBEjORy/YrMpVY009
 ghgXAjHEXQETZ/wJb37IvuZxI/V5JXEbR/hIeH/8Ih0mbglw9qc1bXJU480XMCKlzK5/aGO9uud
 SIzrraeT0P4fdMvugogmjewp0E2w69sHBeHd8vJICbojvyA2bOzSAsIKM79JJnYygGWAapB42GD
 ghTBAwfug4nCU7+edQEkGBz25qdtFFQ+01zALJ3O0ATPzmzUvPPr7tCJ/1aNsGpUh0NePiFiI8m
 EJHTipqcL3w==
Received: from fli4l.lan.fli4l (p54a1b058.dip0.t-ipconnect.de [84.161.176.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8DEECA4C538B;
 Thu,  8 Oct 2026 22:35:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42224)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xEupr-000000001bX-0ijl;
 Thu, 08 Oct 2026 20:35:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Thu,  8 Oct 2026 22:35:26 +0200
Message-ID: <20261008203526.3713797-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 23.1.3
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

https://discourse.llvm.org/t/llvm-23-1-3-released/92432

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index d092a2cf94..7df2f28873 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.2
-sha256  c98bbef08a2b4c2613cd50e9aa9ae7b69b1fe6c16b2c40373bc0ab6116fdf78a  llvm-project-23.1.2.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.3
+sha256  c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34  llvm-project-23.1.3.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index e3eb03468b..fa141fe8ff 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
