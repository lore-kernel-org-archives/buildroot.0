Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C352CCA9ED1
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305F24060E;
	Sun, 11 Oct 2026 19:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6I2mdAx-t9M; Sun, 11 Oct 2026 19:58:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1E424052F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791748695;
	b=Do954LeHz5lguT0cWTHwC/ggdjEd/E5U6Yx0JyEPE6i7vpl/qjA4WfbMnN4fGZ5TAHy9
	 7SKiLbijC8eEf2PyJOOzvwSrsrZtDkZPG3aktbSAezDSztNOK+SQU8/ARnO9CJP9wZUz+
	 9m4NRJln5ao6dSAuoNTHikcEquBypNTUKvz4nSYG9j/stc4UtqfpebsiHhAKz4Ghzb1mV
	 H+85XKVinLZTnz6s+RkhMjFjYfgyl3W0g72PdsW3a7RauOJfudfCAWqABvghFk1b0gKhb
	 p697nYQG6NydV7GjDk/uRMnjw3GMsiYFp9nfEAa9+K2+qmRNG38wTXOc99cNBsxUHVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791748695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=183Aa0GrL0ojSXuJ3M1Hij9kj9T2lXyRBUoVqTaFt7s=;
	b=tWk6NcSpc2U+OZwzwCyTdwC4o6SnpTSPcZTlStlEdHCGazzps+b+4B/AofK9RuiFtkBV
	 pFMH5jmKT5F7tgFt8EstKVOEp5fMJU7eCztf84L3RLK7YKd7VtpnvOF5nxpf4IS+xq91A
	 7FBWazjypWy608HlKkzhEQwSdUvVXouAs1W0vr+yKfeqhUXhoflRjq0xZeKeE2b7n7ytn
	 nNs2xHB2I/kOob6Xd3K/Wff37AhN6oFJvwbTV8z+0Jw2gdJiltSHcWot5P1oatCpvqTD+
	 W99Q0uTBhaqccAd7xZAk4XXmEs8z4C2GYdWOksasmaennh7lK6E8/cwob0yGOC0MwIw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791748695;
	bh=183Aa0GrL0ojSXuJ3M1Hij9kj9T2lXyRBUoVqTaFt7s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aWQPBEKx5OO11nr5h3tjhZ6VrQPH4eGEjDPt14tGLwqOaRW1z6uNCeUnoy02k2wTH
	 p3w+PH5lmR2yGGhKRxqsbcCsyDylQDVph2fB9Grk5+hoSHtR1y3jGf76AO4DsB8FEe
	 BbSbIZqvjqKVrveIgYsdaZWlkA2LYde8B5UQKiMZE0eHJ5fCXMVNnEeOury8TbiKcz
	 x5tEjuRfxfxZJRzVnaXXgO0ZBLua2KG6VsoQT/SvZbY+OcvfrZFsMov3JylLp3E19f
	 mqBz5uR9108dpaZuZw/SUr3L8LuY9no6TxezDlxvs2PdFdTDkXs5MtXjwb7TK6v/6s
	 yirXigkQGpDmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E424052F;
	Sun, 11 Oct 2026 19:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0AD5380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9206080A96
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vwb_Vdvw9IR for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:58:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C86C80A50
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791748692;
 b=i9ze3JfWoWSUUqNK7i7mBbN6c0iPG6EvNHuyn/+FUL6ZFmwQsEV3qGPiEdAEPJJBeGt7
 MR85+RR8q94rR4Ve/3N3pG9wgzxp4ZuCtj9c5jpuCclPGskeAn4V8HcpYZBGCkbkOSY6w
 NGkPGkEq022/zHJzMaaFaGYGi8qtc2Zdx+s+DRRO0gZeBLhVZS5e9XFnUEuZwbo+slfys
 OVQ2N+zqL9C1MyrrzwFXyAPAxHkp0y4hhIwiZAmaCrIcS2+5TZXBe7cwk/4PItQG3yu7f
 Ucp6D2Ya0wQwFOnZbLZW5bP4KUn07C0eWB55HNx+L/yd4jG3tsahG5wY8gehY98Ru0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791748692;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yrhPMVm8Qyd4xn528O6bHaBjoqXZlLNYvQAvOluv+yQ=;
 b=I0Yb2O8wWZ8PjhgkFw9E/f2VJOfyTpKQZKJ91yGuIiENpg55nNQCVJEdSTxJjE2Zu+kB
 imn3ln4v95XaTKgyNR/QGSbSUzfIlocQqPV68+eI3gKFC+XEsHnj+EyaC2vV1MltyJ8H0
 fWuLOMjmocMWcaYOLxj9i+Y5qhWhpgqIDTZL8WCCn6xK616NKNrtD52Jjvaj0CyjMMr23
 Woey2yCet6WdcEBFRadMsGD2DPNrAIYuzAAx8D3oZfSEHNgygCRMLmLS1uTH4nJlUgk87
 W/o42A3RB7XRGB83ZiyJdptHchkPX5M7tdtVVVtRFJbLxKcKucyGxYSe8lAubCRI4DQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NJVsB7Rn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C86C80A50
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:58:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so11082135e9.0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791748689; x=1792353489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yrhPMVm8Qyd4xn528O6bHaBjoqXZlLNYvQAvOluv+yQ=;
 b=B7VtCdn6DI9ls8G0N+FfWibJt4BMYRWL22J/yBBKpT1Kb7J3wiDDWCEJn4XOb652o1
 C5SpoBwNHkXgaWiwmgGpTG2Hgq+P8aDtmnsyqHoYkPshIp4vczNsk5TE1MCyV1Sd1UMf
 dtyL9Dcy8gQumf+LHTxEpga36tzwUpvLeFOPoHYgL2Y+LgJ6SgXB1xs48pVcjeUXf9X3
 pfImsr2nOk+OeqPpb/bQ3On1E2Rd8+78JhXvzVlOgYtyEIGpRhm7KCk+qbGrWLnEQkCE
 op1pKJp1+J1VTpynPB5Mja8C0O/3JHxQ0wX1KXpWoAgCoMojtYwf/HaFKK2bsEfOWEMX
 HtRQ==
X-Gm-Message-State: AFq9FYIyG0Fse/xAThzCbdfY881Xnq0A1uXSRh4vr/QeO7/haABwUOWe
 GYECpeLKE/BSIZjhYKPlc4pgEqBBnkGVtAwtsG3FVcsVnr3yxjxYCfohjLMBCtJNjsiafWXdARX
 5+WoWiew=
X-Gm-Gg: AYBFou2BnC5FfKnFhV4Z6W1qDZ/ay1DBP3VtBJdrggXx99c/i89/7N0P11aqkkNAs3k
 52gSd0h5P7rrMWKvHJuEV6hSp0p1NT4i0z6UmwtqtkP7JG3HzTjQ5JcPa55IoyXozOZXs0f0hZ8
 wecump6IsHReg67bh5zYAnWgMUNjlycGIDhCQPsJm4wlo+dqpB/r5/EJ2mjTFAesIk7JrbwLbeo
 d5+n1TCpZv37171HI4Lt0c33baHjvXKgg/OoH25ke+/JGFIbOmFba7bTOBA8Ga7Wt1XQ8jqf/CC
 FM4Ok0bBFrmflv4uft09EzynfF/faYPVO1Po/QFFG7TMtrglMrm1gPqihsqVwPCkHI2TvnvkLYn
 5v3vfMkhvbhH/aDAtly3lnfr30HctqQc/tsaYryaokL218FhMepIJhEPFNm/tzZuuh8HhjaiqkO
 2dXohISHPptshFyWFnwLDvps0cFeHZWuSdRbjz1/+hV/pTKTG8CZihtHiU/3cB0FD0H7Bfpc6XK
 3v7sJ0i
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id
 5b1f17b1804b1-4a18e4adcbamr126930955e9.22.1791748689450; 
 Sun, 11 Oct 2026 12:58:09 -0700 (PDT)
Received: from mindpad ([2a02:a020:5ce:d643:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac02cfsm14568240f8f.39.2026.10.11.12.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 12:58:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sun, 11 Oct 2026 21:58:06 +0200
Message-ID: <20261011195807.796661-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] utils/check-package: support catching
 broken symlinks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In a number of cases, such as [1] backporting a patch to an LTS would
create a broken symlink.

Those symlinks are hard to spot as the symlink and its target live in
completely different directories.

This commit introduces a `make check-package` check to verify that a
symlink is not pointing to a non-existent location.

Since broken symlinks don't have a pattern in their filename the
get_lib_from_filename is responsible for doing the check and assigning
the proper lib: lib_symlink.BrokenSymlink.
Then `BrokenSymlink` doesn't perform any check and just returns the
error message instead. Assigning the BrokenSymlink means that the file
is broken and doesn't need any check.

Having such a lib makes it possible to ignore files that are rightfully
pointing to nothing since they will be installed on the target to point
to an actual directory.

To achieve this, the FileNotFoundError exception no longer creates a
warning for symlink, since they are checked in the lib instead.
Files listed in `.checkpackageignore` are also no longer reported as
missing when they are broken symlinks.

[1] 176fed6cc0 package/gcc-bare-metal: fix symlink to gcc 14.3.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Hi,

Not sure if it's possible but I think that through introspection lib
that don't have a "check_line" method defined should instead not be
opened.

This would avoid us to have to check that the file is a symlink again in
the FileNotFoundError exception once again.
But this is pretty minimal change compared to change how the
'check_line' is called so for now I'm sending this implementation.

Regards.
---
 .checkpackageignore                  | 25 +++++++++++++++++++++++++
 utils/check-package                  | 15 ++++++++++++---
 utils/checkpackagelib/lib_ignore.py  |  2 +-
 utils/checkpackagelib/lib_symlink.py | 13 +++++++++++++
 4 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 utils/checkpackagelib/lib_symlink.py

diff --git a/.checkpackageignore b/.checkpackageignore
index edd5ddb3f2..6adbb9587b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -809,7 +809,26 @@ package/setserial/0001-build-system-fix.patch lib_patch.Upstream
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
+package/skeleton-init-openrc/skeleton/var/tmp lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/dev/log lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/cache lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/lib/misc lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/lock lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/log lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/run lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/spool lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/tmp lib_symlink.BrokenSymlink
+package/skeleton-init-openrc/skeleton/var/tmp lib_symlink.BrokenSymlink
 package/skeleton-init-systemd/fakeroot_tmpfiles.sh Shellcheck
+package/skeleton-init-sysv/skeleton/dev/log lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/cache lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/lib/misc lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/lock lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/log lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/run lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/spool lib_symlink.BrokenSymlink
+package/skeleton-init-sysv/skeleton/var/tmp lib_symlink.BrokenSymlink
 package/slang/0001-slsh-libs.patch lib_patch.Upstream
 package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
 package/smstools3/0001-fix-Makefile.patch lib_patch.Upstream
@@ -993,3 +1012,9 @@ support/scripts/setlocalversion Shellcheck
 support/testing/tests/core/post-build.sh Shellcheck
 support/testing/tests/package/test_opkg/post-build.sh Shellcheck
 support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch lib_patch.NumberedSubject lib_patch.Upstream
+system/skeleton/dev/fd lib_symlink.BrokenSymlink
+system/skeleton/dev/stderr lib_symlink.BrokenSymlink
+system/skeleton/dev/stdin lib_symlink.BrokenSymlink
+system/skeleton/dev/stdout lib_symlink.BrokenSymlink
+system/skeleton/etc/mtab lib_symlink.BrokenSymlink
+system/skeleton/etc/resolv.conf lib_symlink.BrokenSymlink
diff --git a/utils/check-package b/utils/check-package
index aa10280f4d..3c8c54ec5e 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -26,6 +26,7 @@ import checkpackagelib.lib_patch
 import checkpackagelib.lib_python
 import checkpackagelib.lib_shellscript
 import checkpackagelib.lib_sysv
+import checkpackagelib.lib_symlink
 
 VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
 flags = None  # Command line arguments.
@@ -170,6 +171,8 @@ def get_lib_from_filename(fname):
         if os.path.basename(fname) == "external.mk" and \
            os.path.exists(fname[:-2] + "desc"):
             return None
+    if os.path.islink(fname) and not os.path.exists(fname):
+        return checkpackagelib.lib_symlink
     if fname == ".checkpackageignore":
         return checkpackagelib.lib_ignore
     if CONFIG_IN_FILENAME.search(fname):
@@ -271,9 +274,15 @@ def check_file_using_lib(fname):
                     nwarnings += warn
                 lastline = text
     except FileNotFoundError:
-        print(f"{fname}: missing; unstaged file removal?")
-        nwarnings += 1
-        return nwarnings, nlines
+        # Since all the filename that get a lib assigned are always
+        # unconditionnally opened, a broken symlinks will trigger this
+        # exception.
+        # The proper warning case is already handled by BrokenSymlink which has
+        # the additional benefits to be working with '.checkpackageignore'
+        if not os.path.islink(fname):
+            print(f"{fname}: missing; unstaged file removal?")
+            nwarnings += 1
+            return nwarnings, nlines
 
     for name, cf in objects:
         if cf.disable.search(lastline):
diff --git a/utils/checkpackagelib/lib_ignore.py b/utils/checkpackagelib/lib_ignore.py
index f3698fc3b4..9615adf1db 100644
--- a/utils/checkpackagelib/lib_ignore.py
+++ b/utils/checkpackagelib/lib_ignore.py
@@ -8,7 +8,7 @@ from checkpackagelib.base import _CheckFunction
 class IgnoreMissingFile(_CheckFunction):
     def check_line(self, lineno, text):
         fields = text.split()
-        if not os.path.exists(fields[0]):
+        if not os.path.lexists(fields[0]):
             return ["{}:{}: ignored file {} is missing"
                     .format(self.filename, lineno, fields[0]),
                     text]
diff --git a/utils/checkpackagelib/lib_symlink.py b/utils/checkpackagelib/lib_symlink.py
new file mode 100644
index 0000000000..237b049a21
--- /dev/null
+++ b/utils/checkpackagelib/lib_symlink.py
@@ -0,0 +1,13 @@
+import os
+
+from checkpackagelib.base import _CheckFunction
+
+class BrokenSymlink(_CheckFunction):
+    def before(self):
+        # The BrokenSymlink class doesn't do any checks.
+        # The actual check is happening in
+        # 'utils/check-package:get_lib_from_filename'.
+        # This lib is only assigned if the symlink is broken while allowing
+        # filters from checkpackageignore
+        return ["{}:0: broken symlink to '{}'"
+           .format(self.filename, os.readlink(self.filename))]
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
