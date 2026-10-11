Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309AECA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CD54065F;
	Sun, 11 Oct 2026 13:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtgBWzgOTauI; Sun, 11 Oct 2026 13:42:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B0764078E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726171;
	b=m0eflIa5P3vbSMI5gdARngYdBT9nyEvPiKtKqa9t8HqEEx/vyTLkaaHyUQZpyac0Tnmy
	 2EzJRAVMPT9lTTYcb+Tan5u0Vzg5QyG3PfbZ4tDUEfLxP0VHeNXPHeGo7RV4ERvkBNLZL
	 rDwxdyi28mui+heB3wyEmHK9wCu0MRh7e4otU+HmBM+M5mwGMmBobA7VvtuXDDFoRnSZt
	 1XDBDJOZ637KFGSbQRN3kyZbGblkGtpi4VxyHfjyt9zl69n4r/3vdDsWs1uqP0mJCZcXf
	 yUlsf/5p1l3KI7nmnT5I7egn7X7I4a8vJVf2QtxZ6ILKtspCYKGk+sFQXX3pGu/cUGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ABf3eaRdmgKyWz0gn8nTqpAXuSiWetqCZvh9keSzcsk=;
	b=c91QnBVbDylWkWkrc3hN/hMoxggB97DWy7u6meeyGhtzw9C8O41VX/RbamutL9d/rCB6
	 j81aooge+V4Z9q11XrN1Uv+jgVkhcrJjWX+jlm9EEkMRt4t7w2MT8afdR1R3Bd78IHk/5
	 CYgIjevMAEfuA7co8kbokmpewdi1Qj0X8Ncw5AR9SGCn/2PVOpaeyUdU/mu/5fXKpei/5
	 KR01Y/ICUaYKZwNZBqkjvOHWhkcq+nCOGU5VxsMRxXs3F52evaI/l+Rm0mm0xh9dnSfHi
	 IKw++oU8zvedBLtJElUqzllVqhBGd/Wd1+g6IrqeH4dDKVUTvIazKPLpAea6deGrjew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726171;
	bh=ABf3eaRdmgKyWz0gn8nTqpAXuSiWetqCZvh9keSzcsk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QxMX5JFS3SCH7R+EVUwSeccDvbB4b2kt0rpQU3KLC+OV8drLBjSCZx4zWmbtMaIFi
	 KApaIB1SaG0AAVmtrLWhbTSdtfYpiineJSYT4uTJ2BXXQZjiyOEYK4tMuoQ4Nca83h
	 2dwgCaRmNOxV0ONY8pB3l/FAe8T0UmiHUH0ver3iQLGM/ImNpZAzscDPYSyeJIndQP
	 CZY4zNLvFLSk6Lhyt6y1U6bpLTt7TeVyT7L1TKNliQkax41sRx29W00SVYidQFdfZy
	 CnfK51UuGShJ2p9YMhG3GrcZBBPlMdtxBJJNTafA8DffVNQoVYIiUCwB7VzTSnMYtH
	 VYcJ4WfCw8row==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B0764078E;
	Sun, 11 Oct 2026 13:42:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B4C1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5975560622
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CegfTEH43Jn4 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 849AE6060B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726160;
 b=rUUHlAeL3c+mcyMMRz2UezkCZi3hMInO5VrRKyRKchQ/4y3AEii0BNAmZ1uHLEi0y/+2
 8b2DCrK+bOgnHRaGkNd0MAKftPp+v1AD/f2XKKb5DhlkHXA+hFFHq6Ft0OxrfulfYAO2v
 dyM/mxMa2GWvEkQuLI2bOmrSeQRTuNG8uDWxGRdPTm1BETmEK6SSCsyGUCvKNfYgJnlmd
 jJuCumHZRvUFMLyoLirexR0Au8s+ckd1KDUGNNVdEFwit+MWTa46Vz2LaTNk1xUCaio0/
 AvF1ON21YoeG5CpoEVVGGJeKSQml8FJhF1STSl1gXBmX9JjCgPpzSnt/zGRWqyK0idA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726160;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RccHB9vdcdLPQR6MZuvZrNQzFdeVP9Ug5E+GdTczKGc=;
 b=Kx7wBqkTj6B51i/g8A6/0tQs19U3/1SiqHWNwVXJz5jU+46ezK72Kk2QVdbIb0ECRflA
 GW6HPt6CN903BXdj7sSHXhue/iDkKAuork42qSi4i6e/Fi/RDTj8IWj1qe/ww5CmcUyIh
 j+wFs7Zfg3F1CZvk+6ysfk1R0Tn7fMY4f+CE/IOH3E6J5g5aEWySfnxaN5v8R8oalzNSe
 GkHj8KsMB5BEIQPkKJXfREBZTrMfgNEvvjBaGAPLWsendMLF7w37joS0z++jejuANKxdh
 Bick0LoAb4glKaISAUmzvz45oKeK+i0/SPiCMfDHQdnioizL6aCmyEJX1tHyJNbuqww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 849AE6060B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE76294C7F; Sun, 11 Oct 2026 13:41:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:41:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eec85390148ed896c844ee9d6cdc183fe92acfd
X-Git-Newrev: 053898a9c10b8b78278aa4d434fedfcbaf95162a
X-Patchwork-Hint: ignore
Message-Id: <20261011134120.EE76294C7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpcore2: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/053898a9c10b8b78278aa4d434fedfcbaf95162a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-httpcore2/Config.in             |  8 ++++++++
 package/python-httpcore2/python-httpcore2.hash |  5 +++++
 package/python-httpcore2/python-httpcore2.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 407ba05d4b..15ba968e7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1167,6 +1167,7 @@ menu "External python modules"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
+	source "package/python-httpcore2/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
 	source "package/python-huepy/Config.in"
diff --git a/package/python-httpcore2/Config.in b/package/python-httpcore2/Config.in
new file mode 100644
index 0000000000..73e1765c11
--- /dev/null
+++ b/package/python-httpcore2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_HTTPCORE2
+	bool "python-httpcore2"
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	select BR2_PACKAGE_PYTHON_TRUSTSTORE # runtime
+	help
+	  A minimal low-level HTTP client.
+
+	  https://github.com/pydantic/httpx2
diff --git a/package/python-httpcore2/python-httpcore2.hash b/package/python-httpcore2/python-httpcore2.hash
new file mode 100644
index 0000000000..c088cfa87f
--- /dev/null
+++ b/package/python-httpcore2/python-httpcore2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpcore2/json
+md5  345513f80f9ba004d66a8534c5b74dfc  httpcore2-2.13.1.tar.gz
+sha256  e0aa977abe17e69a3b820a24542a6fa88702676d83880b8d194dcd18408e5103  httpcore2-2.13.1.tar.gz
+# Locally computed sha256 checksums
+sha256  c4df125c807b0613501e943a5c92496dd11d2c16604ce396097a8dde396304d9  LICENSE.md
diff --git a/package/python-httpcore2/python-httpcore2.mk b/package/python-httpcore2/python-httpcore2.mk
new file mode 100644
index 0000000000..48c3d64604
--- /dev/null
+++ b/package/python-httpcore2/python-httpcore2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpcore2
+#
+################################################################################
+
+PYTHON_HTTPCORE2_VERSION = 2.13.1
+PYTHON_HTTPCORE2_SOURCE = httpcore2-$(PYTHON_HTTPCORE2_VERSION).tar.gz
+PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/cb/f3/1db7aa2bc2524062192bb0e0323969492d1883152a232fe36eea65f4e35c
+PYTHON_HTTPCORE2_SETUP_TYPE = hatch
+PYTHON_HTTPCORE2_LICENSE = BSD-3-Clause
+PYTHON_HTTPCORE2_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPCORE2_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-uv-dynamic-versioning
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
