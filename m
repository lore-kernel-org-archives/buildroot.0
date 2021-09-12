Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B46C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7281B61212
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7281B61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B3F6825C7;
	Sun, 12 Sep 2021 12:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJeFo5PYItMQ; Sun, 12 Sep 2021 12:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A01098276B;
	Sun, 12 Sep 2021 12:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8AC71BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5DF6825B9
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCXYMP1EEceH for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06D23825BF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B08318A3E9; Sun, 12 Sep 2021 12:41:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2143c74484e12afd81fd4bc27849a4a1f4bfc2d8
X-Git-Newrev: cae9e692b1e2f9a299af148a8358674930d3429b
X-Patchwork-Hint: ignore
Message-Id: <20210912124145.B08318A3E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: needs xdg SELinux
 module
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cae9e692b1e2f9a299af148a8358674930d3429b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xdg is needed (and can't be make optional as it is unconditionally used
in pulseaudio.fc) to fix the following build failure raised since commit
bf44a11cf67fde4ba96928a2a4196103b7ec4ef3:

 Compiling targeted policy.33
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 policy/modules/apps/pulseaudio.te:44:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 317285:
 #line 44
	typeattribute pulseaudio_xdg_config_t xdg_config_type;
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:79: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/818219c0f722080d9f6ef778fdc50e34dd4187ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 372cd98da8..a238315778 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -11,7 +11,7 @@ PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
-PULSEAUDIO_SELINUX_MODULES = pulseaudio
+PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
