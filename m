Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC6C369D2
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 22:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADFD540632;
	Sat, 19 Apr 2025 22:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGX9c2DCLFaF; Sat, 19 Apr 2025 22:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007F340635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007F340635;
	Sat, 19 Apr 2025 22:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B36468
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 22:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30DBD40635
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 22:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBNaX6KLBxGs for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 22:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58EFD40632
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58EFD40632
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 22:21:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4572785DC9; Sat, 19 Apr 2025 22:21:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 00:19:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da142cf50305af66c9fa8bbabbc0587be661f269
X-Git-Newrev: f2c15f00d4a42042c54010e10aca773fea72c56b
X-Patchwork-Hint: ignore
Message-Id: <20250419222131.4572785DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix missing object
 runtime error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2c15f00d4a42042c54010e10aca773fea72c56b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$ fluent-bit
fluent-bit: error while loading shared libraries: libminiz.so.3: cannot open shared object file: No such file or directory

Commit 527deef "package/fluent-bit: bump to 3.2.10",
dropped the BUILD_SHARED_LIBS=OFF off part, because miniz uses
static linking by default now, but runtime execution shows otherwise,
so revert to fix.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluent-bit/fluent-bit.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index bd7c82b26b..276bfd540a 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -63,6 +63,11 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
 endif
 
+# Force bundled miniz to be linked statically.
+# https://github.com/fluent/fluent-bit/issues/6711
+FLUENT_BIT_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF
+
 # Move the config files from /usr/etc/ to /etc/.
 # https://github.com/fluent/fluent-bit/issues/6619
 FLUENT_BIT_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
