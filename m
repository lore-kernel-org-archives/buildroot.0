Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7E8CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB418220C;
	Sun, 24 Aug 2025 10:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgAuzbQCh7j0; Sun, 24 Aug 2025 10:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9991882143
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9991882143;
	Sun, 24 Aug 2025 10:54:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2A41D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FD8740530
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAzcrDY1V8RB for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 10:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70AD440528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70AD440528
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:54:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C189879DB; Sun, 24 Aug 2025 10:54:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 12:29:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1838d8e5ea7e5c3497cefc16980da330c38e7967
X-Git-Newrev: a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9
X-Patchwork-Hint: ignore
Message-Id: <20250824105425.6C189879DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: work around GCC bug 121567
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
Content-Type: multipart/mixed; boundary="===============4757785151325603311=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4757785151325603311==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Python 3 is built with -O2 or -O3 on SuperH, the build fails
with:

Objects/obmalloc.c:503:1: error: unable to find a register to spill in class ‘R0_REGS’
  503 | }
      | ^
Objects/obmalloc.c:503:1: error: this is the insn:
(insn 18 243 23 2 (parallel [
            (set (subreg:SI (reg:QI 176) 0)
                (unspec_volatile:SI [
                        (mem/v:QI (reg:SI 4 r4 [175]) [-1  S1 A32])
                        (reg:QI 7 r7 [178])
                        (reg:QI 6 r6 [180])
                    ] UNSPECV_CMPXCHG_1))
            (set (mem/v:QI (reg:SI 4 r4 [175]) [-1  S1 A32])
                (unspec_volatile:QI [
                        (const_int 0 [0])
                    ] UNSPECV_CMPXCHG_2))
            (set (reg:SI 147 t)
                (unspec_volatile:SI [
                        (const_int 0 [0])
                    ] UNSPECV_CMPXCHG_3))
            (clobber (scratch:SI))
            (clobber (reg:SI 0 r0))
            (clobber (reg:SI 1 r1))
        ]) "./Include/cpython/pyatomic_gcc.h":105:10 407 {atomic_compare_and_swapqi_soft_gusa}
     (expr_list:REG_DEAD (reg:QI 6 r6 [180])
        (expr_list:REG_DEAD (reg:QI 7 r7 [178])
            (expr_list:REG_UNUSED (reg:QI 176)
                (expr_list:REG_UNUSED (reg:SI 1 r1)
                    (expr_list:REG_UNUSED (reg:SI 0 r0)
                        (nil)))))))
Objects/obmalloc.c:503: confused by earlier errors, bailing out

THe bug has been reported upstream, but until it gets fixed, let's
work it around by using -O1 instead. Note that
BR2_TOOLCHAIN_HAS_GCC_BUG_121567 is only set when -O2 or -O3 is
configured, so there's no need to check again.

Fixes:

  https://autobuild.buildroot.net/results/cac123ee9f3a6df6263b69dce3ac0d535518ec3f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 012a46edcb..ef0658262a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -189,6 +189,15 @@ else
 PYTHON3_CONF_ENV += ac_cv_big_endian_double=yes
 endif
 
+PYTHON3_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_121567),y)
+PYTHON3_CFLAGS += -O1
+endif
+
+PYTHON3_CONF_ENV += \
+	CFLAGS="$(PYTHON3_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 PYTHON3_DEPENDENCIES += gettext
 endif

--===============4757785151325603311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4757785151325603311==--
