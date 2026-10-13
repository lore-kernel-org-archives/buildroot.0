Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04274CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF6A840698;
	Tue, 13 Oct 2026 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teH_FU3ukAMb; Tue, 13 Oct 2026 20:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E52C14062D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924755;
	b=cB1Vz1lAyk/LxJ/eUO50OE4xNdLDT1BhbzF0oNYQANs2h5GThVVqysQahrwq58dw+FwD
	 8ekkEZbxaT/5Bya3yy8iGsKoP7qOIY0cizY6HUZB5KzbWEcowrq/0fOEquCCqaFrsjPj5
	 nLYr75bASQYsF8KAPHALGFLjxOhOP0oz7/4d5NFXgKJ/Ugf9T7PzZ+1ibyAqFuKeshgOo
	 p64blwsicmGkaHRcvw+1rmbgX5SN6yWRK2nb6tuBdQYYp9vU9H/2g/j6DSBsBstTFGPop
	 mO3FMHyKLpe2xgslwHEQLPMwFqtbvad4hajcioBiR2/hMyYC1UGM7O3AX4GEElGqmaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924755;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MRWL7awIw1v5mE2/s13AfEdbQtBuH0mLn6YtQpPdCgk=;
	b=Uoe+G3gQbDnghbkUDICGerPVj4BGuFAyF30nQCHldhZXTwLcIPpzynTN3mxjzsoOzevi
	 HkqoD4J6zVAsih97eHipGhynA2YBFmmvrbCbcvgeytJ2J12S80Yr5QA0VfB6B/UGdoHKW
	 Pkj2Y2iDWGqtAsVohg2ynRiX3y3Cj/sMD+nIj5N3SjFrhUlCtqgpAs4+q6ylvuMGBpk0g
	 qS1B8m1GPHizs8mLUDa1OMNGUPQn9QgweOSvorxEyGtGehEogJrfpvj7hkiDgN4NVfb4W
	 L1ldLFhGND+2YVDJbWy2712GlXci5nUQzXQo4JszI8VNMe4wZD2khdg7ZCG/RHkiZBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924755;
	bh=MRWL7awIw1v5mE2/s13AfEdbQtBuH0mLn6YtQpPdCgk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dbRqYiL1Dv9CwDeWix57UClYsQT8AoD+rUwwXOxeGZfzCJ01mwTMjRJQdRYP+wghJ
	 wnHc7IvfNDdBxn51YMS5vU3nXNZCJt6UTrgNOH5OWe/C/SdTwlkoqNAPq7it3XZwUv
	 utu9ONKDK9Soic5f1jc7yPlE3DFKPaA/sDB5wru8h4fVHvNDjIK9aO7Nmrc/K2nPsZ
	 0FBZOTAbPOU27ngLiy0WVd/iprnnOypxL37gGwlfh/kKKjfGWIyJlC+wsFk4V0/of3
	 Uv4SW6LhKpXkfUd3QDVNtE1+FCmiteFUjUAcHoK22zwkTnQyWiCZKuGFp3n0IfQjDg
	 XEyUXItURAB/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52C14062D;
	Tue, 13 Oct 2026 20:52:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7711243F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74C1460809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9heNdpF1wUe for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8DB16605CF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=bmeA5ADeKONBRbv5+fKBU5o4wsMhwJ+xJ26wzk61upC3z4S0vKKTu1kbDC/VPLlElDW0
 Q0pre70GTPe29uVXkc5rDKVcTG/m+RtBt99FRrGU0NUrH5BHUVApwme6picBXUcEktK8P
 S2wNkgKfj08gvR7qeHWr68D8vLbVu5YV+B2R6d2LX5JS8CKQgx+pPbGCsl5rmL8F2Sv0w
 kgtLwiA4wQBaIeRJ9yYyFQEJKZ59IgPx+9bmdR5jgf7zobFKjJLHbJT4fIu+W/x4r3QdV
 x0nwTebmlqlTVK9eVcTz73+9J7zV9XViWnVL4FdmEVEZ5P2HA/lQVxWV+OG8Vd9RrqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RFOxXlfn5gK68pCil4eOVqzgcHjCLUN2k3gDQXnvPtU=;
 b=B9DsF0Jx5J/sAwYDmsJ/N3h9PNDYN1Z95bqZ9ZY07jMCGHtCJDQ7WhakuLC3/lPWSi6f
 b1kL8Ex4fR/JIXjehtgMd1QSlS2Z1SbIXKHVNzndQgP8p6lzckPqYt4SBiK0TsvKyNB8X
 6bVTU67C3gm+LK51oreMFHcvElKoYuHdJ+dZuTf8geeLrAn67mJBamLx8HXmhc7eJRpql
 7RBTNfccF+Fu95kLRApOUeLBegVGo707g2bNNUXEdHMiwKggIGOqzUxYm6ynyy/vrxOSH
 JIzEArZGwMqzkv/CbkK6cjUBdlLYGyQQQB8qoGjPrUSBKG0GJI2wcB81lQMbw1Zy2wQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DB16605CF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA83D956DF; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f8c9fa81dd39d1e426aade20ebbf11f2677d161
X-Git-Newrev: 14cab37f94a34ae6cd1ead0896872699d954cfca
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.BA83D956DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cramjam: bump to version
 2.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/14cab37f94a34ae6cd1ead0896872699d954cfca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cramjam/python-cramjam.hash | 2 +-
 package/python-cramjam/python-cramjam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-cramjam/python-cramjam.hash b/package/python-cramjam/python-cramjam.hash
index 5459d63f16..694d373262 100644
--- a/package/python-cramjam/python-cramjam.hash
+++ b/package/python-cramjam/python-cramjam.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256  10892f279948fe9a2dd5f2c559ef78aae1ebf4b5d5825e1eaf68b03787fde402  python-cramjam-2.11.0-cargo6.tar.gz
+sha256  5918f1d51a7d114d56c9f49afd2f303a77c4bab13f90b6c949da2736c0082f84  python-cramjam-2.14.0-cargo6.tar.gz
 sha256  b4f882bfc80d27a3732789bd883a8c1d342e8ffea7f622a71b3dfded834205ff  LICENSE
diff --git a/package/python-cramjam/python-cramjam.mk b/package/python-cramjam/python-cramjam.mk
index e1e060bfba..f908a48728 100644
--- a/package/python-cramjam/python-cramjam.mk
+++ b/package/python-cramjam/python-cramjam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CRAMJAM_VERSION = 2.11.0
+PYTHON_CRAMJAM_VERSION = 2.14.0
 PYTHON_CRAMJAM_SITE = $(call github,milesgranger,cramjam,v$(PYTHON_CRAMJAM_VERSION))
 PYTHON_CRAMJAM_SETUP_TYPE = maturin
 PYTHON_CRAMJAM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
