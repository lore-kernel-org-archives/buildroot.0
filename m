Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F27CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4031761514;
	Mon,  8 Sep 2025 10:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvisAK5O4PmU; Mon,  8 Sep 2025 10:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 619E361C49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 619E361C49;
	Mon,  8 Sep 2025 10:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC18186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 775B66175B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R38hKNmjuwHW for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C2061C28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C2061C28
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46FE883B4B; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:25:51 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: b6aad354dc64369d5118b1f06a85aea109eb34a9
X-Git-Newrev: d157e3e65063cf86c078de1d051a2c636be3812e
X-Patchwork-Hint: ignore
Message-Id: <20250908105918.46FE883B4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python3: work
 around GCC bug 121567
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1969592690708961535=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1969592690708961535==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d157e3e65063cf86c078de1d051a2c636be3812e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
(cherry picked from commit a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 337e1401de..082dd69bf1 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -192,6 +192,15 @@ else
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

--===============1969592690708961535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1969592690708961535==--
