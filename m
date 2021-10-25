Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2B7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:17:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9FF610A8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A9FF610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65A93403D1;
	Mon, 25 Oct 2021 19:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0kZeUCTQqOd; Mon, 25 Oct 2021 19:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390B6403D5;
	Mon, 25 Oct 2021 19:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7722A1BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 731E2403C6
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzugF-PpARF9 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D9F440288
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EA00D887EB; Mon, 25 Oct 2021 19:13:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:58:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f36483126e38d097041a17d4e0e916c19d8651ae
X-Git-Newrev: 1ebc5415e12a5c6936d7ce217de43f7d910ee025
X-Patchwork-Hint: ignore
Message-Id: <20211025191321.EA00D887EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: depends on
 host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ebc5415e12a5c6936d7ce217de43f7d910ee025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace BR2_PYTHON3_HOST_DEPENDENCY by host-python3 to avoid the
following build failure raised since bump to version 1.17 in commit
32b2a03745785afeb496979aa3c0f654bc6063ce:

Traceback (most recent call last):
  File "../py/makeversionhdr.py", line 117, in <module>
    make_version_header(sys.argv[1])
  File "../py/makeversionhdr.py", line 79, in make_version_header
    info = get_version_info_from_docs_conf()
  File "../py/makeversionhdr.py", line 67, in get_version_info_from_docs_conf
    for line in f:
  File "/usr/lib/python3.5/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 2154: ordinal not in range(128)

Indeed, this build failure is not reproduced by host-python3 (in version
3.9.7) so it is probably an issue with python 3.5 (which is 6-years old).

Fixes:
 - http://autobuild.buildroot.org/results/96f7b81f5d14715b0b6673a8016a31e9e1552d0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 3d69e152e5..c49ca23449 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -11,7 +11,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION)
 # and most of the copied code is not used in the unix build.
 MICROPYTHON_LICENSE = MIT, BSD-1-clause, BSD-3-clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
-MICROPYTHON_DEPENDENCIES = host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPENDENCY)
+MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
 # Set GIT_DIR so package won't use buildroot's version number
 MICROPYTHON_MAKE_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
