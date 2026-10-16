Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD58CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352B860AC3;
	Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxE8YBWI0z_a; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 14AF760AC9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156112;
	b=cJIJDJLUYABoVFD6nsh2r0OktjHzBGOxtz+m2yb16xaWb605cfEGjyTTGhBvqIhcZjaF
	 GvUYQ4qNJUvzoPBxlnwL5GvFgFrMJ+aVQTd//BJCh0+yGhpzagcHwSVVsaVxHOzbpcAcu
	 DQYw+KZPAga55zgPOeF4hnHLGprgbRaPnJLTjfEg465ivizQhwnJ9RaoBe82Zk73Y+4SS
	 7drI3YPyrRwk9sHiaXlKxK21/Dek80i9ZW1YiU3E97b0KIevy1ArEMx8jj6lw8/k63ocR
	 XDOXgufIGCX/bfV+Txzf9Ohz4Et6G9WW7PbfOPpFJdFFrbJzHvGCOKu/YawmSZRGlog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156112;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vo0YP0o3ydWDrmDSRvz4T2kbsnv1OsUloXuIQeIMr5M=;
	b=s1O1qpIaPwauKBbU51yR6QXH0HcohcYJHXLxRY5k7P0XjqTp4xx66m505lXSi7q/qS4W
	 wBwcwxS8l2AUKqCpy7fwv5cqAx3oSQoUq9M3ODtU+phDrqaKWotIdAOGD91VLJhzDC7m6
	 gu/7HgD2GOAy7V8xcI0Rha8Vf6/JpdBMqOK3qenQIrMZ2ZhJruBmUF35MoQ/brZNusQ/b
	 hLN5nzDQoYb6Ftfpt/tARnGY5W98QsgVMFallF/Syme7nYm1/VPMzAqf4+NLxe4ZNMj7Q
	 NSQ9s8UOGy7tIodyagrhh6X3r4GrI6iZmWFme4NAne4dV/zYlrIcbFf2nEWfmV2lUmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156112;
	bh=vo0YP0o3ydWDrmDSRvz4T2kbsnv1OsUloXuIQeIMr5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hHPxCF2TJuU/LLhWnbZGIRV6rsvPh+LU46EezENRjFddqhNQzW7D/i/3gG6X0qmeI
	 IS4HGffCvPL2UK1Cf8CohymHbiCAkJ+WPOY/M4SDYzz4NBWdTaGZlSOIBcJcVIc+fQ
	 mBeA9xf0sNz+6FYpUvMY5SscVb816T/I5BJgpC7N2k04K2BIZktCmeMiXM6E+Sa9g1
	 pDGk+yOGD9lqP4ENQhDgtsBvK4UUUIiodwTGx6XiIC/1mHsfYrJLe6tc4FTH9d8MJP
	 L/vlC7RmvrEMpm3PNdIJqKPZqXmnPOumYWAa+Q7OA+UcWi27IHLYw+R0Rc1JvBHPgF
	 crLMecWA14eYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14AF760AC9;
	Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6256255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7FDF40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VqDJCTiHP0j for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BBB2D4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=kmSEVOJG3mYUrv3kpTg9fZ0YXh7dpaL9jYuIFCwYXf2M9brD1ARI2LB/V2XKhFioSRlz
 Qxuvw8zK4vMKE5tddYk58umb+mjk7K9Uz1E99T4Tw+HCapsoSondx+zIF2MUeIeYyXo12
 2jDN6vaT5Y+7Uv8jCF7PAqTACZcuvmKjpLaxreL5jhvW1dVY0dHDCyuNF22QgWA+fNzK8
 mXjOCAgu78fhnL+l67MHhKMbaXeWh6UXDxSd2oTWaE0f5Wt4vMnjINFuyXJHJbDc7YBl3
 MOG6nVGRhJ13ojlmA7FytvtRRyfwwSVpNlIlv2+zuKE9+AFv7IqJtCqyIJIqq371g8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=68jB/1L+gUfsdKlOVZ96Tu4P9gKIie4x9BgYCdmJil8=;
 b=Q4RBn5Z8asxiJI4f7LaVcuGUN7W4Is1x+iZ/f4frX7njWldWeKOP3Jh1c5SoJ7+38pT2
 /q9JzoYnACeBKw13wod5+iaDSthd49nAXkyJf4bxXaeZpjudjONChszaiMB3E+bqHxEhC
 cDQNQcgqr8b7nv/Sfn/YQhDz/4BOV1/UJbzFtx8OBLPXls6EqvmxmpZPYNaAZzX7aumVk
 6etJ+9G4fvLOnlQU8E/i7cCENiVOOfwdVTszfTaqn90JG1DNwZwVRUvxtwCVEqDF+B5Ht
 a9EZTBqocabL2wIN31EepgUTyYZxcMA5KF2Grd/7vrvvkhhl6StA8ObRQsMQyKXkx2g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB2D4016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF7C960D8; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 34dff36a1bba6b36b1b868badc56f01eda8f3f8a
X-Git-Newrev: 42ba3013d94a536778e9559340982095919754ce
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.9EF7C960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tzdata: bump
 version to 2026e
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
Content-Type: multipart/mixed; boundary="===============7365584770065966689=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7365584770065966689==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42ba3013d94a536778e9559340982095919754ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/L4IGHJRBUQR53F7RTEHM5IS7ZMBR3YXP/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b3f1d6d9d3cd6bff010ef8ab638b1f55defd58d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 4d4d410ce1..e2b278ddac 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
-sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
+# From https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
+sha512  5be2f875f73b75e5783c474bf7a6c768e433cc90283f8fc6a75e3d05bd92aec97936e8a55ccca5e880b5dacc18ba65932bab0e783e1ed5d2af4a3a4df95512be  tzdata2026e.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 71f8fc3ac1..221e34773d 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2026b
+TZDATA_VERSION = 2026e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata

--===============7365584770065966689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7365584770065966689==--
