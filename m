Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB40CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1087761411;
	Fri, 16 Oct 2026 13:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnXBaFQCSWRu; Fri, 16 Oct 2026 13:14:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB263613FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156442;
	b=b1oqx6i5LBgA05zu204klxfBUDopYLuYtPJwlv/x1hbOm2dhyw6JDpZXzsCHg0VvKvOs
	 kkN5yHj3OvdSZqRD/rgZLMbXsnqwVr8Wlc3R+UcXJ50TOAlTeaIlfRHc4skyMfiVn2wNj
	 hiUmxOrNUXl//6q1H3/tc6RloArPFpBgVNsWhExWjbXIqXD+vQ1o17uLytk+3L+UctzlU
	 4Hx7/Tby3CFWI54PJokt2aYpsLBaToVp79QXtllX7PlEPAtwsSAONH29sMmDkNcwfGhBx
	 oaBFS1D7VMdTXqm3FVxDIRfbLSTeYoElEiAJSuW/Y5LvFGWxlkWbW1K4gbOhGozGJPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RcRU9ykfgi8wHJk/Sq0LQkdLjWPkqZojdOTWMaf5/TM=;
	b=Xjrtrxd4XrrbW2NhpCTz0RIMgewOWqkZUTwTDwtmxIW0MZdlajocJ4ksEbJir/FquwVR
	 JiIlgRKkie1D4fovB+pRBghlkNAtZ2dUv52K3qYYDzoz9AL3aOBf8taUME7mIiDYIGsGe
	 DlBujw2rMTsvCfrudIj6KLEN4ebhiWhmzH+sweGfP/u5eB3Hnbn/VvUUNAnZmywjxV4G9
	 4Q15HYEGDk6LzJaLcLFLDniIBqW+yUTMr8/ViIeF2aT1LjrmS5pxQoF0ZTcv1oeooXdJE
	 Lx0HfyKpVc1rANZQDmQ3nLIPwyG9KO5XbLnQmK+eegXiZs+J/X+yzA+06vPEw7lan1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156442;
	bh=RcRU9ykfgi8wHJk/Sq0LQkdLjWPkqZojdOTWMaf5/TM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cTuD61vVvZkofS/cqwbTKy/YLAy2A1EPtT0DD9F0imMuQ21gNHWBNIKZ7jCxGblPO
	 7aoUxV2QhfW7Zfq9sTYPz8FjLs0k+DYfpfmUpwrkTFpLNMu1QAT6tqa8cnYGLptPR7
	 bT0/U8KHh4DcLjvbhoqxHs0XX3BCSY4yIa2rbzGjaAf9fctqbyQYNxFRZXsLVEC1BF
	 0DlHzNcuYX/G8LWpz+TFhEm8wvUpuDYM+XhVF+x/A8haIWgCmIrxKOZ7i6fW3FfKee
	 v4HwLJOUkxdKgPcfJIvyxI2U03kVX1F8Z+5gUej0vsHk9Wa8VrI6xyFuaE+o1A/ut4
	 YlNdeXhZvPjNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB263613FF;
	Fri, 16 Oct 2026 13:14:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34EB8920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FBEF60F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2VvYeTAKLmz for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C15D860F49
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=R0/Tvy2bijxWuiAjs5wxgfH/v39mVcdc7wsdgQdQhEeyWik0tzWseTdFZN26S69eRd6J
 heOkQhbpXbQ/4rVC4s06TN7LeksujEAdNul+wn7DRSA2MIf++4SQt4Ods7NXITfXkoDvV
 DnNiFcIssvCl2zCo3koAx5wewFiJN79S/Q8q4oc9eDMCSpYksQ0l7/ihiTb6m1Y9stHkg
 v+F2iYDzk0ryr/Z+RPqx1ND6/8HeOswOWAmAtheRl+QM5exqS18Oe6DrPaOo9+l1+1Knk
 o5/oBqa1atmlZVE/7y7fNBacYOJhkVGSUERGfYQxmlAJsjr2bh3yq1rw5bILGZ8Yxmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bgjABEYbp9clViNteAV9kD1yn/LLUb5RDWGw15tl4Gs=;
 b=Uuo1kZmwCi1qVNfXXbRx9fePzcx0Xg2C2Pxs35w1WtrB5ilHrQiq+6KhmU77V1cBqAKj
 K11WLJj6ED1Z/KV/qC3sNpAijwCQ6xlwQThbUkLb+vrshc3J1N90HJjztSI46WSkaj4tY
 BAr/PfyNggn8I2LOju7jtNobsXesT8luaMK2ge1N1gyUBhTzDRxqJE6sTigTPUZPI3ss/
 mrztbHE4AAw7n3DDXriG3QEqGBp+8VfGcp7dMYE5kKAbt8ON3u1mUm9sHm0kNmF3PSTHP
 H5tNghGLUlsS48/aHVKQ39RTHqkUeV+WT2xpTXTB8ff9uxTwqI6xLV2CY0ewaAV70Cg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C15D860F49
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACF2C960D0; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:34 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: deb11f1c6d95052f71cbaa20670a4598c4c4b02f
X-Git-Newrev: 19cb3b1e5086956d4d0ea3bbda9a8101ad6824ca
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.ACF2C960D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/util-linux: fix
 non-MMU build
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3833553175586730084=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3833553175586730084==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19cb3b1e5086956d4d0ea3bbda9a8101ad6824ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
package from 2.40.2 to 2.41.1. This bump includes upstream commit
https://github.com/util-linux/util-linux/commit/a3f1255f1891ddbaf3bb6a32af28569c0e6f3b91
which was added to version 2.41 and includes the usage of
pthread_atfork() causing build errors on non-MMU platforms:

libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function
 'pthread_atfork'; did you mean 'pthread_join'?
 [-Wimplicit-function-declaration]
  629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);

The oldest build error of this kind can be found on the 2025.11.x
branch with version 2.41.1:
https://autobuild.buildroot.net/results/87c/87c74435be14956fd45f730269eac102e70d56da/

The issue occurs because uClibc-ng is not very consistent with its
pthread_atfork() definition: it doesn't provide a prototype for it on
!MMU platforms (causing the build failure), but it does provide a stub
implementation (causing the configure script to believe pthread_atfork
is available). This issue was reported to upstream uClibc-ng at
https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/WEA7IQC3YAWTSFDHCLYRQJZTC4IUIY7J/.

A backport of this patch to the LTS branches should be considered, but
probably not 2025.02.x as it uses version 2.40.x.

Fixes:
https://autobuild.buildroot.org/results/a21e81e64eccc866b575a4f3b1376c50f2ffd837/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d42fa9122749979e4e4226f85eca517fb64eb780)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/util-linux/util-linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b4175024c4..807a9fb828 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -136,6 +136,11 @@ UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
 UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 
+# pthread support uses pthread_atfork, which is not available on nommu
+ifeq ($(BR2_USE_MMU),)
+UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 UTIL_LINUX_DEPENDENCIES += libselinux
 UTIL_LINUX_CONF_OPTS += --with-selinux

--===============3833553175586730084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3833553175586730084==--
