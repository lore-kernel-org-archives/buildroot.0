Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB77FC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC08A41937;
	Thu, 29 Feb 2024 15:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFamDEpcoXBr; Thu, 29 Feb 2024 15:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C6341DA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C6341DA5;
	Thu, 29 Feb 2024 15:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02D3E1BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EF4941818
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pB4NK_eBCQJ4 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6221B4180D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6221B4180D
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5588A87DAC; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:37:45 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e5ad7256596a5459d0ce558144dff4792a06eb8e
X-Git-Newrev: 0412998ea51527982cc2e938f4efefcccb7d9663
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.5588A87DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] host-python-numpy:
 correct implied host-lapack/host-blas dependency.
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

commit: https://git.buildroot.net/buildroot/commit/?id=0412998ea51527982cc2e938f4efefcccb7d9663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Before commit ca63464e3777 (package/python-numpy: bump to version
1.25.0), numpy was using python distuils. Then, the default for BLAS and
LAPACK detection was to disable support if they were not found, even
when OPENBLAS is installed on the host system.

Commit ca63464e3777 switched python-numpy to use the meson-package
infrastructure, where the default has changed, and now fails when the
host system does have OPENBLAS installed:

    buildroot$ make
    >>> host-python-numpy 1.25.0 Configuring
    [...]
    Run-time dependency openblas found: NO (tried pkgconfig and cmake)
    WARNING: CMake Toolchain: Failed to determine CMake compilers state
    Run-time dependency openblas found: YES 0.3.21
    Dependency openblas found: YES 0.3.21 (cached)
    Program _build_utils/process_src_template.py found: YES (/path/to/buildroot/output/host/bin/python3 /path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/process_src_template.py)
    Program _build_utils/tempita.py found: YES (/path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/tempita.py)

    output/build/host-python-numpy-1.25.0/numpy/meson.build:201:44: ERROR: Could not get cmake variable and no default provided for <CMakeDependency OpenBLAS: True None>
    [...]

Two obvious ways to correct this:

- Add some kind of host-lapack / host-openblas dependency to
  host-python-numpy, or
- Tell host-python-numpy not to look for (or rely on) external code.

Because the host numpy environment shouldn't be doing any numerical
heavy lifting, we opt for the latter here.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
[yann.morin.1998@free.fr:
  - explain why the issue was not found before
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f6c33f3e89f7f26e5b7613a757c82c9efc62654a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-numpy/python-numpy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 383135f9fe..200fac20a1 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -38,6 +38,10 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
+# Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
+# in-tree code.
+HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
+
 # Fixup the npymath.ini prefix path with actual target staging area where
 # numpy core was built. Without this, target builds using numpy distutils
 # extensions like python-scipy, python-numba cannot find -lnpymath since
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
