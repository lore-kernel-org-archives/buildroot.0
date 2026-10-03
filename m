Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C492DCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDF560FA6;
	Sat,  3 Oct 2026 13:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC8tK8UQiIWy; Sat,  3 Oct 2026 13:58:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B585A60F71
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035882;
	b=J2fQMQKezQvANZb7rCMo4wtMKqEwZnrkklw41nMMNubjpxtIUhba0d1bifINeqGQsXGY
	 lTL4WEkA3vxnRhwx2Wrrg1fVSEHCksQFOUhGWUjZOB5hj+lrbRhBUvq/kSguaf/LZ9SQ0
	 S42dleTspJ0NRDFtlJmLWenret7mfblazwlRaIbmkVafXhBxyitiuiemuNhuAhPxf5uXY
	 RutEAghmJqX9qP7wxmkdYkGKncHwg1XLqr040aNSplrfIXZuShoaBr26R5kk/vvS0PoqV
	 iITdpInjtSITuG7vWZQGpC1xIl+dLVwDVaOMATqYwm6sDv9fwRZZ11Exl0ZqXSxFT2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H2W5DqVDbpkP9w2Eabw44QMijAp/uYjcizxw6mzD28o=;
	b=NxN5+q/d54sDT8P5PzECP7LiZU7ZM/YFCJMLSK2DbVvL2dcVymQjeoBT2PCQL6Cfz+hn
	 aqkad49j3Q1iiJjsz7eLl4dzixp2oCa3L+KmxV6t74uwKil/UFnaErM/lEkw6rBKGFsPv
	 JxoMppEGwublQnmk8kLrevBXa9QQERvffgZ64uBSjiNo0ZDe6ZIy0lArv2dWdhs7yw1u4
	 Pi0/UASa/yFlq3UIgUyEwLpryR8YtSBvKZtorAsMJ6452PIlv79vhP1Qt2m1BvQwfjm76
	 asxagVPIZOFb2Ks9/vVoMhSIHbYsP1LZrA3gse5tOSyLct9ocCbfOiKdop/W5r7CVmQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035882;
	bh=H2W5DqVDbpkP9w2Eabw44QMijAp/uYjcizxw6mzD28o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m1wadQu2Efb1YYs226EgByPypagmQwa9B7FJyN6Nx9pj9a/j7+lFsik2wv7vqyf57
	 Mg5cceyypnSrxHFBubIDVBBY0cbWTTyUfJt0qp+v2r6PcEoANJl8FFUwljARSSizKv
	 59mYtENf/pQbHR05Qx0Op151CLw1MVxcCYr2qNOPIA+LgN4AugaU2JBHVEFESppyjs
	 gmBKqhXVaFHm++Vh3X+pu9R/O173pbN1kwJDbDhc4XO6GVxYXTZ2iinRFIeqLI2H1C
	 n7Y/vFPd4KoI7B8SIx2yRFoDn71n8kDnkSnjRtEL6jVINIpM0kmyuIcuxOw+ff90EE
	 p4k0kYniHoBfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B585A60F71;
	Sat,  3 Oct 2026 13:58:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C70C04B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3255414C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbFvPT5sItIg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 088C1414D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035817;
 b=la7jkfXWkDzHxgayM+ZeiHYts4lFIMQ25Jw8NHSN4VCTanKtqOoXxISIvDjh2qK9vX8C
 4pc98jxWIPHEAZpA+hdam6gelCa3nvfKVcC2/Bk3j1sD9ze/pzaM95ZL88nhoEX2hPlix
 pOYXjh06aNV/ZR55dZdK9XKdpO3Wal9dGMZoP8OpUpE7Q6Qjae224TNOA4xoKXEbVK8WJ
 gKxgu3BjctvNoIGIivRPOb9shhQ9BlmXm0f5NKukvmu6cEnO0ONEKl7hf9nC58/mZcyVl
 GNl7xFKWC0ZjyRMmDK7qnFx3TJDBuKkIVlEK2oSUPmBYvvtPYEQTcx0DaK3qnjMDZBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035817;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BFNAghj0I8bnUEtPNPXbULZfL19RPem84bALco5EJcg=;
 b=a57n+dWdiU4rDddIFGVaV48luL35y+7x0LgiyotPiIj6r3CjVUtxL/L3W5EN5sBqWTcx
 3Czu7BfLKJLcswENl6/rTbwMnjERjVUQkCIaykGi7av3SkOOzY76CyO/MSd9SD1pqusGD
 RMuB4wuO74oVt4oc+SMNq0MFVGyzvlaoHnI6gRYF+bFYjoouD/0m6WYXkKygUVQxJ39fI
 l0mdW/YFiUOPDUn7fUuFGkBfXxSKsvkH8nf8FMG4Ax7+H12TRM6IJvg99PruLvrdGyBXJ
 jP9AfEXn8/+Vyui3jxs7OBfxPDUDcE5kz9w/IASwrVi+cY9OJJvcAlf0eQpP7C6DT6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 088C1414D3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52B128A2EE; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76d891b48389ce06d7330798b840774245a6e753
X-Git-Newrev: ef9480086c372ac43ca74f5c142e322d2b1b4893
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.52B128A2EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wheel: bump to version
 0.48.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef9480086c372ac43ca74f5c142e322d2b1b4893
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add host-python-packaging dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 4f0640bcd8..346962ea84 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  3e73dfac6b3b47a7d1cd52e81885618f  wheel-0.47.0.tar.gz
-sha256  cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3  wheel-0.47.0.tar.gz
+md5  f668e4885de814378b332eceea04a8a0  wheel-0.48.0.tar.gz
+sha256  94800765601e9171bf5d58d066e640662842bcedcbab982b2c90787a2c987322  wheel-0.48.0.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index ae379b7ed6..20101cd406 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.47.0
+PYTHON_WHEEL_VERSION = 0.48.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/39/62/75f18a0f03b4219c456652c7780e4d749b929eb605c098ce3a5b6b6bc081
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/d0/20/50ed6bdf27dec98b568a8ae25dc599f35baa3d9709f9e83fd1edb56b9a90
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
 PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
 PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
+HOST_PYTHON_WHEEL_DEPENDENCIES = host-python-packaging
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
