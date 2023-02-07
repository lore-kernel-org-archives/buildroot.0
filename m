Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CACC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17884F1A2;
	Tue, 21 Feb 2023 00:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17884F1A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z71f3JX_LXZ8; Tue, 21 Feb 2023 00:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9124E4F307;
	Tue, 21 Feb 2023 00:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9124E4F307
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4FD1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98F42417DC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F42417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msYubaqfQsuW for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5A76417CF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A76417CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2EFF8648F; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:30:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5599cb1b41289adcff86ecf91ee6c069fefa9c1
X-Git-Newrev: b11ed25c4a0a6a4f7b9ee38390578d724caa081d
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.B2EFF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/toolchain-external:
 handle case of dangling symlink
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b11ed25c4a0a6a4f7b9ee38390578d724caa081d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

copy_toolchain_lib_root was not handling the case of "readlink"
returning nothing, which will happen if the symlink it is trying to
resolve does not point to a valid file on the build host. This
shouldn't happen, but it can.

The end result of this situation would be an endless loop of error
messages that would only end if aborted manually.

    [...]
    cp: missing destination file operand after
    '/local/users/mmayer/buildroot/output/arm64/target//'
    Try 'cp --help' for more information.
    readlink: missing operand
    Try 'readlink --help' for more information.
    basename: missing operand
    Try 'basename --help' for more information.
    dirname: missing operand
    Try 'dirname --help' for more information.
    ^C
    make[1]: *** [package/pkg-generic.mk:384:

Instead of looping endlessly without explanation, let's abort and
inform the user that something seems amiss with their setup.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/helpers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index eec46d44c6..1cd7494fdb 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -19,7 +19,12 @@ copy_toolchain_lib_root = \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
 				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
+				OLD_LIBPATH="$${LIBPATH}"; \
 				LIBPATH="`readlink -f $${LIBPATH}`"; \
+				if [ "$${LIBPATH}" = "" ]; then \
+					echo "LIBPATH empty after trying to resolve symlink $${OLD_LIBPATH}" 1>&2; \
+					exit 1; \
+				fi; \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 				break ; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
