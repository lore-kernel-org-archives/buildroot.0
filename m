Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A01B41143;
	Sat,  3 Oct 2026 10:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DstToXbq39Pl; Sat,  3 Oct 2026 10:07:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ACE0E41141
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022036;
	b=XHx2Wm7GtOyZh2jV9rOIwkPHyPwfOXtvO52FmFAQFd+pPLwt03i03uTVwNdBF469TlP0
	 k2s1zJ7iuUaSWsajtLE38cMPgGK+R911G54NAvbLf/VzpIoDfAGzNMfdmQrnuE57vFyBD
	 cBoJbiWA3BDhlxsYE2wRS45bI8YLSBnf3ZRIrMTq2pUbaIIrdumj3pecNXmiNvYIE2rsz
	 teoOZi+nAYJP5ukXnJDvIMvhabjqxB9jZ+3Vxt/Upl5M5pHjHxhUXtNq7cI4chPGlmjB2
	 x0/RqZD3TVcIKfSpq61cABlwpWRMYzTuHah9UyVRBCV4ElS708WwJTFlxenVyCIrjbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022036;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XDf/kicP3772SeM08JlgulpFduWHcd2fNuucdxWh9Rc=;
	b=i+g2jIIZ1B/uP/1gddGKcwNrJMSqeUyf01sX2slpGDgpnfZhlWKqbSGdfy+AYtDv57x+
	 uI1v5m7nU5h1oO8olQ9zFEZlp0wulXXCG/8wGwu0Bcv5HUV7IKWmVJAu44CbUD2NvUyOs
	 VBkNtuSqdbiERLpkw7SUU3/zkUQYsxMmU0kjl/jyVpTbGPq8Q9gp9cE1+zUCiVhjvhxf+
	 HZYIvUAMBTl9+nS7XRVAnZCsoj/HoPIWbMx5ObaquS8yiJTy8S4kvssT4WJWgbMNPaz8a
	 LOWcCYPF4uW/W3PCpI2lMtNdoUFFcjlcaOIKRcjlKijR6/TmNvNLY0Isy56Ill+k3sA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022036;
	bh=XDf/kicP3772SeM08JlgulpFduWHcd2fNuucdxWh9Rc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RgF9XZoPYEnz+UljrzwHiLecRtcTiTBnUGqt72IwBHl7TgcxO4KDM8Td2//JbXTUu
	 L/T/vA/20sT+ks13mxsf9zJvA+ztz0urQU2crUtKigP4ly3QKSoZlHy/U5p+m+GIYQ
	 WrSZ4cK9sHgJKSebr+0HvmiqAOhWaYKelYE3t3FeXwIVGdrZLdy/NG6Espzrs041da
	 8F5VwlkmE6IUVpxvt43peDHR/He3NbcuzjdbLGD7YsHjg+1cmcaKmmbpd2HE//xIU1
	 UYrNuma7vnCrURIpEhmtHHAJ10a4e1ccIEYgHKciExgdI68WOMjmppv5wRzgJ1Np0o
	 UNZHK11oNXxXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE0E41141;
	Sat,  3 Oct 2026 10:07:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCF84335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A328C81231
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaFJ2K76npht for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E5317811F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=nRFW7ch+stW/GmfS2Ti5RNnAer0dlCuETRyVjoYxT24LIVfOXe+aLw9pR5nodWeJot4o
 L9QNjuhP8vk2KEpaaTqPtq/MOvD2bfzrZ1oNm43HR36IHtiHhpvhJYVX/46wbFMWHf0zG
 YMDoEYyKkGq1BDdDZu67N0OffQYtk5uGrbD7rSIrNBQK93RgOjyEHQ1b+w/Qo1VkI64z4
 Z0EO3/h8NGL3jpwltdmJV+BjXMYDDEf5MFa4v7HOmvTMldBeqX65HhUknPjubKfnZU2SB
 reAmiF2deQQH3EaPSG6Cns8LuSsaEbNassfYFxtakp9a2//n2oQlVYXFKs8dGu1z7Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qrX7E5SNOduYoJxn4Wv5gPDmClG9+lSgoMn4+mg+mWM=;
 b=tU4N7BieXrawOpXqDeaQB8we5b+HQ3IG3OfF8V6fFA+PqxuRVCursCSwb78btVnijJ52
 5CqWvGzRcJx7w41+5fIxkcwpePZcL+c74ze0/iMc9IzZZaeq8oFtmAtt3gZfhb8zhz65o
 rCiKq69kkDGxAH9EuIvh8dKBpPTtqD4ir4+5YqW1c98Kn5nXm03yyZ4tOBK3IoZINLdUc
 sdGDypQGpDMP8lrZ0ApF/yEKRsKERcozjFhkMNIO6EyPiHkldVHfw88LpuIAwV0kMVZk+
 EZoEaJ8TdVMMawOj6IhkpYoQ3AYPcYRsZyU6/Ie+RWl9ZlB7oozMQ+uAw7ytWgDVBJQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5317811F7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F30488801; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cf65733de8fcf9f267725c7c64c8996261effc9
X-Git-Newrev: 1717226e5968737fba7f04f3c8a4c729dcaeabc3
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.4F30488801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-kiwisolver: bump to version
 1.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1717226e5968737fba7f04f3c8a4c729dcaeabc3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/nucleic/kiwi/commit/d28b726aa2e7eb4e0b2ce58e55c651855053f45f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 6 +++---
 package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index 636d339739..ee63ad058f 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  63d13da80a2420278c695d5784dc0b78  kiwisolver-1.4.9.tar.gz
-sha256  c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d  kiwisolver-1.4.9.tar.gz
+md5  d36514b0cd15dbbe94576202afe7a5cb  kiwisolver-1.5.1.tar.gz
+sha256  f1303ef2eec81262a4b708c3e858afe58d7c75ad91c1c05266eda7673369859a  kiwisolver-1.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256  cf20799d32de0eefa2ea904e3ac5122f47aed5d352930751eb61724762c49d90  LICENSE
+sha256  529c40e5f67f2f88904657a9f7879ae2f8dc76bc9bfef9cb10d988b48804ed61  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2b81c60688..3f005f5a32 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.9
+PYTHON_KIWISOLVER_VERSION = 1.5.1
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5c/3c/85844f1b0feb11ee581ac23fe5fce65cd049a200c1446708cc1b7f922875
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/ba/07/bd78e6a8fae171ea041ef5bba3ed21a003522fa088834b069b1909981f30
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
