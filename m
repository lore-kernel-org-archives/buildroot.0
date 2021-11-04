Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84938C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:14:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E4661052
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3E4661052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE3380E84;
	Thu,  4 Nov 2021 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L669im5hnlDe; Thu,  4 Nov 2021 20:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5214580F88;
	Thu,  4 Nov 2021 20:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35FB91BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21DAE4025C
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmAM7Q_AOhQL for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:14:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E6E140251
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:14:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8C1878A597; Thu,  4 Nov 2021 20:10:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 21:14:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc8f7be3fd0bd6b6460d9622dfa7d4adebd16846
X-Git-Newrev: 9b0ab090d357d5e83a400059ec9206d424d3fd38
X-Patchwork-Hint: ignore
Message-Id: <20211104201055.8C1878A597@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: add
 host-python-six dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b0ab090d357d5e83a400059ec9206d424d3fd38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the wrong assumption that six is not a dependency with python3 made
in commit 95a63a34ac9204c4fe069154783bd97ed48c3ae2 to avoid the
following build failure with ca-certificates:

Traceback (most recent call last):
  File "/home/buildroot/autobuild/instance-2/output-1/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
    from cryptography import x509
  File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
    from cryptography.x509 import certificate_transparency
  File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
    import six
ModuleNotFoundError: No module named 'six'

Fixes:
 - http://autobuild.buildroot.org/results/2b6872eec31362bf3edf88c69b67d681b2f016aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e21b9db042..acc21c1227 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python-six host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
