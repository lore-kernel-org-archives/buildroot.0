Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFD2EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B1D40941;
	Tue, 25 Jul 2023 21:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B1D40941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zK0eraT0VeZ; Tue, 25 Jul 2023 21:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791D9418F3;
	Tue, 25 Jul 2023 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791D9418F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 151DD1BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2E5C60B9E
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E5C60B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oM68Jb33ZBp for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:04:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7992660B7C
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7992660B7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 639D382DDA; Tue, 25 Jul 2023 21:04:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cb2f7d236f15ce9178b51c915086b7a547512e6
X-Git-Newrev: 8d33993395a9002448bf21bb734c55c36fcd4c62
X-Patchwork-Hint: ignore
Message-Id: <20230725210426.639D382DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/helper: check_fortran: silence
 error message
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d33993395a9002448bf21bb734c55c36fcd4c62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check_fortran will display an error message if there is no Fortran
compiler in the toolchain. In the past, running into this error message
would be unlikely, since the Fortran test was only execuded when
BR2_TOOLCHAIN_HAS_FORTRAN was set.

However, since commit c7f641cbaae9 (toolchain/toolchain-external: always
call checks with dependencies), the Fortran check is unconditional. The
error itself benign, and the macro will handle the situation correctly,
since that is what it is designed to do. However, the error message
looks ugly and can be confusing.

[...]
>>> toolchain-external-custom  Extracting
>>> toolchain-external-custom  Patching
>>> toolchain-external-custom  Configuring
/bin/bash: line 1: .../bin/aarch64-linux-gfortran: No such file or directory
>>> toolchain-external-custom  Building
... everything continues normally ...

Let's suppress the error message, since triggerig the error is an
integral part of how the test works and doesn't mean that anything is
wrong.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 030ddfda70..27a5470ca3 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -382,7 +382,7 @@ check_fortran = \
 	__CROSS_FC=$(strip $1) ; \
 	__o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
 	__HAS_FORTRAN=`printf 'program hello\n\tprint *, "Hello Fortran!\\\n"\nend program hello\n' | \
-		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - && echo y`; \
+		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - 2>/dev/null && echo y`; \
 	rm -f $${__o}* ; \
 	if [ "$${__HAS_FORTRAN}" != "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = y ] ; then \
 		echo "Fortran support is selected but is not available in external toolchain" ; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
