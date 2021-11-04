Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A64EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D391761106
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D391761106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB878195C;
	Thu,  4 Nov 2021 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2RT-YSjtg_6; Thu,  4 Nov 2021 20:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B338195D;
	Thu,  4 Nov 2021 20:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF101BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF756075D
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PASF5N-Jh_Jj for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:42:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4721F60B61
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5ACE18A5A6; Thu,  4 Nov 2021 20:38:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 21:41:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6d24f5ef80adcd4ea926f4ec64d19f7e73caa69
X-Git-Newrev: 23a2ff949e340edc4c8df27640d5120aecb734cd
X-Patchwork-Hint: ignore
Message-Id: <20211104203816.5ACE18A5A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: add
 host-python3-six host dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=23a2ff949e340edc4c8df27640d5120aecb734cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This dependency wasn't added during the removal of
python3-cryptography.

The conversion/dropping of python3-cryptography was done with commits
[1] and [2], and the commit log of [1] states the dropping of the
host-python3-six dependency was intentionally:

        [...]
        While at it, drop host-python3-pip and host-python3-six as these
        dependencies are not needed. Indeed, pip was never a dependency of
        cryptography and six is not a dependency with python3 and will be
        dropped in version 3.4 and
        https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
        [...]

But the package python-cryptography is still at version 3.3.2 (and
clearly depends on six)

[1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
[2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a

Fixes:
 - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e21b9db042..081dfc06a0 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python3-cffi \
+	host-python3-six \
+	host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
