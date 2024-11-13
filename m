Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A6ED41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB1B1820C7;
	Wed, 13 Nov 2024 09:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgJo1dhXO21M; Wed, 13 Nov 2024 09:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C8B820D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C8B820D2;
	Wed, 13 Nov 2024 09:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C1AE11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81191811A3
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ztx31jhRewY9 for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79416811D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79416811D3
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 731A98627A; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:32:19 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 142d1f38b469f76390fce270ef9a26276f5db7f0
X-Git-Newrev: 2c61a66f216a5d3de628dad89b2d986bd4f4868c
X-Patchwork-Hint: ignore
Message-Id: <20241113095505.731A98627A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/jailhouse: fix
 build when python helper scripts are enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c61a66f216a5d3de628dad89b2d986bd4f4868c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
build is failing with error:

    Traceback (most recent call last):
      File "/buildroot/output/build/jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560/setup.py", line 18, in <module>
        setup(name="pyjailhouse", version=version,
      File "/buildroot/output/host/lib/python3.12/site-packages/setuptools/__init__.py", line 108, in setup
        return distutils.core.setup(**attrs)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      ...
      File "/buildroot/output/host/lib/python3.12/sysconfig.py", line 549, in _init_posix
        _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ValueError: Empty module name

This is due to a missing dependency on the target python3 package.

Jailhouse Python scripts are using setuptools with host-python3 which
reads its sysconfig data from the target-python3. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L33

If the target python3 is not installed, this get expanded as an empty
string, leading to this "ValueError: Empty module name" error.

Pure Python packages which are using the python-package infrastructure
usually get this dependency automatically from:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L295

Here, the jailhouse package rather uses the generic-package
infrastructure, then installs the Python scripts (if enabled) with
dedicated macros. This is why the target python3 is needed.

This commit fixes the issue by adding this missing dependency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c808e271e3e487a46f23b144b44ace54f97f3aab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jailhouse/jailhouse.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 1354acf600..a1c86f0e91 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -21,7 +21,8 @@ JAILHOUSE_MAKE_OPTS = \
 ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
 JAILHOUSE_DEPENDENCIES += \
 	host-python-mako \
-	host-python-setuptools
+	host-python-setuptools \
+	python3
 JAILHOUSE_MAKE_OPTS += \
 	HAS_PYTHON_MAKO="yes" \
 	PYTHON_PIP_USABLE="yes"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
