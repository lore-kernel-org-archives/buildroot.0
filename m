Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D84CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C8360EA2;
	Sat,  3 Oct 2026 10:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HGWVHJKGsOB; Sat,  3 Oct 2026 10:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AEA860E8C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022050;
	b=Oaq44aW7jMnlh/iFbNXICgDGmC7o5Vl9SQlYdx+jRgA69Oz/p2n/a38pA3X4wwlsoiQs
	 wMtul/xBeHrfuKzXYeXC1CbudKAAINDMbzcOgPH0TrbXdZkFruNqUPJ4tt8jVcMrrXIp/
	 vg8khF25hq/H5otXclxXDo7aQ3NYCqHJ6SANnC6K7PeVenmOp1z8O/rQW8Mvsd7vIBDEw
	 2ymqFhFfU8bX2wa37UUl6UDc29fYu+G+kWEd4Kys1eIUEVlPrQ/HE0xH4C0zupMDqOtt9
	 IkpeeJ70Ten8ih9ce3fyqKEZYKtbgFJHZciH4HCudbxe0ncX2JAqAWSe/dgtDBiHTbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ocENnTJynPy+E9VpMYd0heWfSDZJFKCYDiAlripOEsM=;
	b=HHfX2qVL2z827W40xcCwSgaYB6vQLg3I1cVVtW2d0voFrRra8yccd2mwHDFW2hq3GMMh
	 8OuVVI/pHXqfWa68nHroRbWHJ1lRoChskaRmPQPT0/pKo5rnXI3X7qIWcKZV3kFbTxW9u
	 ntSY9S3APb0qi6EQWV7wgnIuDpY4xgujpDv4zNEQUqryGGTl5KkyVjtJzB0kknj5+oTOu
	 IrxtVxX4sIeQ1jiWK80zhewQOeAeNZfFjKGRuCB+4sZTlyYP7JcUd1FYECah/CnuB1q3k
	 WoE/bD4SomgGGfU8f7brUtC+vpR8W/NjhyzyKB5R9zzA0AQwHvqzLNNhHp/389vJI8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022050;
	bh=ocENnTJynPy+E9VpMYd0heWfSDZJFKCYDiAlripOEsM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UU3/yeEMxuBUUhMrJd/DVYi47goCKxZ3ionLM1gkgQH3E4YwhRrUy8wDuncE0xBvr
	 DlWNZhLvcQX9SN8bYbkNZei0zMJY88iRDLk8jbKjh1MZZ9/PV51YyIGpq20xgZdPwQ
	 8mxHXRPBRAB2y534LigSyCfPb3gUBVE9DZYQAF94EHVTjPYHCl7xQuRasQWw/CfGbR
	 JULTMZWYF7hBeVVfUxbaD4gH1QgqGRSA3s+VNsxQwMOVs6cNk2Q9fHrI3SJxgBmcoL
	 KdT0WM4Z//OU5jc6c0LQ3sgfBry0E3SqJ+sraZR14Gs0PTczHb9h85oDCQQlGVrJ1d
	 piG0zZoPX2qoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEA860E8C;
	Sat,  3 Oct 2026 10:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B2E3335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14DBE60E9C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQj3aYCPz60i for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 614DC60E79
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=XCT0zqokW1lgsU0PLwwOH8zhILD0/jZ3rPPjcZZNEkN0G3+nOUL6/JHG3qURBhG/eQbo
 wfatpARJo9beBZF+4VX48i3nZoStty7v7hBVPMR+Fld2NdcwkSLCpYNOjVjF5jlJS6StT
 IyWp4zA6+K8RBCBDQtL1Wcr4F6mzz5oT7OIfCSEqHfeQdLqeybr18zTJBSMl6PO+NMlwq
 wMTEcW5kMNbgs3jWlccqSB3WhNyuec0xkTK3VuaGruqeD8ppdHIn8uEIeSt0NST2jHt+d
 ZkEo/gzwcWHlUe9YaCkMQN3PH8xwhh2JfETHaEo6gSUmRM9g1O4M7FInlZFEYACVlVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GU6QoMUgJ+uAIqqzDgWX9YHwhowOPxI7v6pNXOA6MW0=;
 b=jLh10WORqS3PI0alP0z7l2FuQqCXnfrjXetz4qzP2Mv14BtbBqyIHQeV9QkfE1WULhEi
 Vjdbq1/YnA+4YEUL1PXRkOQaPprkERgkgT2C7JeVzpCpuJto8ShPaegVJTHIMSGbwLp8Z
 mMUapP3YtkKWY7MLyK+sw5KPjBzSX2TUzyblpcJknfKuJruZznaMwSEsWGVmukXrArUkh
 roiMDFTwQBDqls5XClQ8AkUCrY8cJK4nYe4F40xT4zAesvDBuXg9U7Y7wPewoYnuFbW7x
 JBb2uI08cOQeGhyUy8bMcAlxVpwxfMp51o6SGRSAPhlj4OayD38lC3Jcm1p5T6oJZsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 614DC60E79
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2B838191C; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3abe799e44cf05d86f97a48a9e04e39c7b663587
X-Git-Newrev: 88adb4c3c13f04af1e34b06c2c9ef49bfac6382e
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.B2B838191C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-babel: bump to version
 2.18.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88adb4c3c13f04af1e34b06c2c9ef49bfac6382e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/python-babel/babel/commit/56c63caf50b18b152541b5dcafd51f645d867074

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 436e49a9bc..154c6ce306 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  726d2ed119255a011d248ac0c9caa24a  babel-2.17.0.tar.gz
-sha256  0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d  babel-2.17.0.tar.gz
+md5  b5ea9705c2ad6f8c630e4a66d3dd2cfa  babel-2.18.0.tar.gz
+sha256  b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c5750937c992d  babel-2.18.0.tar.gz
 # Locally computed sha256 checksums
-sha256  7801a84fe811279cb350bdb4fb18f94c36b18ef813fa6aac043b6c6d39484d0d  LICENSE
+sha256  86bad5758c7859ba06251f8f12eee885eca31369923dfb2b87a7c13c3634d870  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 57e372fc1a..659db0fd83 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.17.0
+PYTHON_BABEL_VERSION = 2.18.0
 PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/6b/d52e42361e1aa00709585ecc30b3f9684b3ab62530771402248b1b1d6240
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/b2/51899539b6ceeeb420d40ed3cd4b7a40519404f9baf3d4ac99dc413a834b
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
