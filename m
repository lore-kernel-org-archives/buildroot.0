Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52550C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1898A60BCD;
	Fri, 18 Sep 2026 07:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7reWaC_HAgjX; Fri, 18 Sep 2026 07:35:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 321F460BD8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789716948;
	b=VS5ueJBHnzh6nga/qeUdex7lqvsqbuhyzWGyKEV1PpxhzQFdNdn2M5FvV8I/OxCfU1Fs
	 DqGkqkBeg9G+Pi7N/YYLGzfYn3L9drq/x2Kv6/s1hvht6AjZFRHupmXtDS81VyAC1i9zg
	 H8APL170ay1Uox6Ju2ZbZN3XoIHpPViG+3J8lIX9vExvSaK84i3od3aFyy5aaC0M2QtUU
	 6COjEYZHpP19uP+hWSoeQ0fU3/0r7xYgR2xJQwv21/4OLInrNoVsy1CZBvj8beoTKhqGc
	 WBpl1JfnPcngzGRuNjD3FpOn1IfOSJupquLobmmIn8xaMSDGvplt7k0vSeBlH1j4kGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789716948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YUby+93X8Ri999lfv2CpboS/D/Sw+3MSWZDXGRyVdJs=;
	b=roENtuS+yNjGJXJHFgdkRgiEC1CJ4rVUwXevFvN9Ne7AbgURjvi36dwg8Mp/CkvJASkB
	 wjngKy34SSN01Koy6aNaQLrbdPVl18vKWwxY0MmvUzHicuzHskW5HyFcl/qUmoPa8w9rx
	 l2ALv0BkHx/5lNqRP1m15ZCKqIlEY/xPFr6fbXsj81uTzPOqHpxdzufyCMhtIjoIt65R6
	 yFvx0XjRIuaO3D4va9pIrERwyZfM39Rdu/gqvgkQUWkNbQJvyALdduPNLBya3+zmMhXKY
	 DVuXkWufDd7erxKV8fIIn4cb6vEh0QZP2vtUDHeBI+NqsEJjPw9UEjQl8EHzrf+UmfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789716948;
	bh=YUby+93X8Ri999lfv2CpboS/D/Sw+3MSWZDXGRyVdJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VEyzhmcm6ryC+O8Pt+JoJj9DdwkpqsrnAJhVWa4nXdYRfPgOnqW8PZnxkFekJOb1b
	 JJ65UmPDC2OWlCC9aucD24uEmKRuW1vn1+oUOetn7k+ROvYXI1WYvEjuyRFnUYkbBi
	 WPpcRSBE8YF6Kn5/nedgqwDjO/VWaOhW9JN9PHJlfxV04XwHwsXD90VOEFzkV6UvK/
	 TQIR2y4x9hu7efmwtsxJTUwMAQBG0N5YoKvsRPftWk1mK2vI5HO+Ixfbi7v9gBlavF
	 bUeHOqPA1puFUNLOccblb7JULD0xfb/W7miAljXwrrDEaO+1UQf1Ca/oM2Jq7nU/kw
	 R+iUQL0whHEGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321F460BD8;
	Fri, 18 Sep 2026 07:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBDBD362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A6F811B4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htZhhj9kPReU for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:35:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB8D281196
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716945;
 b=ZorWYMJ9bhxTy9urs0scfnQswa69O5c7SpBEJv92JNXX4V2PgRHkQuXsiIZ559bdLLHB
 Vepf1NF0r4TyQple//HcqJN3xKuHta/lV/maFvf2wtYZ3asCDnXjNpj2sllE2lDRuKcex
 RmSIiW3vCJ463PjflI3SYoBcvP3Srrxz35cHM1nNi2fdwvSe799nbFKrS/tniF2kSD5MF
 TtWIngB/KMQqLsvGdxDGZkRBfCTxvm2ZDyLQP9vUOaAzCxi1G+aDZjyp3gl4RWhNxTKfJ
 9Htfe7PDkYByAwJ9tVRBNUueZX8HRn8DvAFqJ2n/jRK3zXlTG/nsfpxwjUlXnm4ih9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716945;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yxYDW2ZtHCIMeBksr/SF14AxFuRkE6EJ17Q0CBN1x/8=;
 b=h8Vni41gRLwHBeRho/whByUvqeNb1DxkPq0Kjl2L/dali6L2kWFTv4FSloEnwJ3qvnVS
 GZf5I6XOsuktaEcY9vznIMKSXvVM9NFQ0aqAnU8//duGN9TNONkxX6TsVbsYIbzLPNUvY
 aIZBz3UjQ1eU6x14qKlX9a4Ids31FJKy+zrRi90Ei5XizSGMzV+Hyjq0RsbFasz8nK+dB
 lcdGOGhUhZ0SmaMr35N6X/H95gENSJviJP70p5lLNpb5cp1NCzBQga/9B4sYwm+fK74io
 sKlg1qaawPB0g5WrxTp5QYOuklTOc1U3WCuTQu72lP0svU4yXH6mtBuLl7nkVuJ8h+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB8D281196
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A5A796D5F; Fri, 18 Sep 2026 07:34:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 09:35:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c337b249bf14b136f667996df418be5579be6087
X-Git-Newrev: 4dc8e8b6f927bcfd11302a3cee68ea958cc266dc
X-Patchwork-Hint: ignore
Message-Id: <20260918073438.9A5A796D5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cannelloni: security bump to
 version 2.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4dc8e8b6f927bcfd11302a3cee68ea958cc266dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.0
https://github.com/mguentner/cannelloni/releases/tag/v2.1.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.2

2.1.2 fixes CVE-2026-37539 (CVSS 3.1 score 9.8, CWE-121): a stack based
buffer overflow in CAN frame parsing, in parseCANFrame() in parser.cpp
and decodeFrame() in decoder.cpp, allowing remote attackers to cause a
denial of service (crash) or possibly execute arbitrary code via
crafted CAN FD frames.

The advisory names v2.0.0 explicitly, so the version used so far is
affected. The CVE is not reported by
https://security.buildroot.org/master/component/cannelloni because its
NVD entry has no CPE data (vendor and product are both "n/a") and can
therefore not be matched against the package version.

Apart from the security fix, 2.0.0..2.1.2 contains only a handful of
changes: undeliverable frames are dropped after a timeout on a broken
CAN bus, variable length arrays are gone, the default remote address is
fixed, and pthreads are looked up with the CMake module instead of by
hand. 2.1.1 is a maintenance release only, as the 2.1.0 tag pointed to
a commit that was not the final one.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 625e43d157..6b45d497e4 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
+sha256  c704707f7dd9f1ed64e9195097809f8882c03b1fa0a79864b8e3bf286521e3d7  cannelloni-2.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 7978cfccf5..2e6a61545e 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 2.0.0
+CANNELLONI_VERSION = 2.1.2
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
