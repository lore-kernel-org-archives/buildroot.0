Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2327CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4DC80DB0;
	Tue,  6 Oct 2026 16:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7sgRm2Daehk; Tue,  6 Oct 2026 16:30:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A242D80DD6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304252;
	b=dw8fFRLy4qoB2F+0E5HVgqgU/EYx+TTFH+EDMnHcrnhd8w96Mr3ixm7fwKFSk12aNBfI
	 KRZaB6ZDIbNo4hZ06WmllsPQnLabkDuxUAvsxwvi2GDSQJN8Rfj2gTHG97rgiz6PNb582
	 c06dx7/TZQZGyAP20jSeb/gCx+luK7Jl+MUOoa0OK6wKK0dgUXBYNiqWpAwZkngzEMTcG
	 vKyvqoFTbbv1nHL7nukIzYAhXbXdEIyHssbzPy6U110Ut0sm5l2eYR+uV0641Gp/Ytznv
	 it8/RsnOEkgvhzjLn9JftKRS1QJNwIicmXUF7tyzJiB8g2lAtDTIJqtrnvMd0nTHijw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9k81l6ptCpe4HxI12oXwAJlZO0xkMrNqyWmMTLIpXmQ=;
	b=QbBkwuR1X/xR46TaMuQsGy9exEea/3N1KcGW33n64vL0gwlNg6MQB21lnO7rWmsC6DiU
	 tRZoJgxBFj3Dc7o4Su5GJXXvrjXhe9B5TQgz+A0S/zRiVoZ5OWHC4Oex0JBPOKksPAe/s
	 yNZnRNlQrnMVSNS3oumoaTUWLnEUFo8tGq/tbDxtqDhoxJm/FCfqYehAz1FHSpga6DpMF
	 xRbX/9/DKLddJy0NNX6xTo1vwzBYGYLiYY0WGhDDFkfa9GoQaoIHajm7nIO65DBshjzsp
	 UdyKDBLI7gUNIf6Rtpa+hyfqsBxVnJvD/4V47sg5Z1P+9JNqj+GYn6vTVNs7lpDmW2g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304252;
	bh=9k81l6ptCpe4HxI12oXwAJlZO0xkMrNqyWmMTLIpXmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qtlPSIssmab0s7yj5ZtR5R3xNxJ5yc85IaAH2ExLTBUiVGVJbwkuJ22yuovZl9qX4
	 bJHPWYMsBbz5o3LnzDGp1ZvGFQtSgtkKDhdL5drsj9zK20L5qd/NHDGQ7b8an7BgWX
	 sqIuJjMEJNpxviYOfUGfP5iJRLt0v1JkPfTzEvXTb9FVHkpf0jo0Lr0d7Okt+9uV40
	 94iQ9w19/NDU/YjHyxtxP8CQNTaqKYxnDuKPVPqODmnuUy1V+WjxUNc6yF4/f/LwfM
	 19RsOjmZp6bcx66KamjccDMaFtW+KDoIQktaVqe+843RD75k6X9SYfThjTvpByXEyW
	 cNLh2h3VJCnjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A242D80DD6;
	Tue,  6 Oct 2026 16:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B17361
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CFF4402F8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcl4RWHvsaz5 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A3EDC40437
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=SSMab27iw+lfJSLIk7nIB/yoUoOfzyLbiL6Rk1sFZM4/N6Nt+i3Mbcawna4tc0zOvebr
 pq9yWACYC6YjbdprQDM0xHA993X+l/LAhzJZ0H5vQXP3KVYwrTIQhEI10EEHbPaqQ1FKe
 4USHbWqolmMxUeO7sTxOC1t6uVoGMJBdyuM8rRTjHGCdczGHMoyYb/tSZBhXUF1+EFKAQ
 RyxwC8t8+adyXJfWZDEigM/Bu/oSlYFnHySrw0j7XKW3LzwTB19fizUn0Ago83aaEnXM2
 j1IT7b63lz7QoZmLmTpFefB4Fb1LRmk/90vVz33xzueMJqdCCRmkZ99mj9j+xXMmbXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UbLuc7KssKo4Xeio5hVfTaUv4IYfwT6mH9tkagoHVSc=;
 b=VnqyRoyHU1dwNVwDabstqOSE30lvUAnpMOrU7nPZ7hhs6uiLhKUNjX1IdKX3Nt2yROTZ
 XtZagYyjK1j9ecRdNkWQMo6x399MRBYub0Y5RJe2f5syu0HjxEwQmBjeDEPSEHKIPJAUf
 6upmgXRtXqvWx3B5MXhjJanamDZ1EIxwms7yt+NW+IBuw1b70sOEhyT0QLvKKDVSoKJ+l
 8opr1OuSvqLYz/903fYqBnxuxwbOhsdnKS8Vbel9NUiKIvwecEIRVBLYjdkxB88x8gbQU
 sGl0JcOxvZ5TGAeXy7jhMqooCmt5wCQUTcqTD2y7XkmAze4DrtsiZRIOQWplr5sy8cw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3EDC40437
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6701D8DA10; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:54:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93636456ecb754464f27d4edd335c93932aee09b
X-Git-Newrev: c1b063571bcf688cb34ad601cad178d21771db21
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.6701D8DA10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycryptodomex: bump to
 version 3.24.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1b063571bcf688cb34ad601cad178d21771db21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index af67a1639a..f0b9a052ca 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  c54ba32585587dd47087a8cf8032d72b  pycryptodomex-3.23.0.tar.gz
-sha256  71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da  pycryptodomex-3.23.0.tar.gz
+md5  f8298c5255a43e033703f758fc7c688e  pycryptodomex-3.24.0.tar.gz
+sha256  0428f19f13452c6b89bbaf2c530f84f369873811dfa77f0cee0da4f40fb0474f  pycryptodomex-3.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 9b367227c8..72f91b0c9a 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.23.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.24.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/c9/85/e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/4c/25/214ea825a9031f5af2c8b2506ee16701a2560d4712165dd00098dd527bcb
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
