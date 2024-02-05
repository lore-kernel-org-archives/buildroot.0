Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC858C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B5540162;
	Mon,  5 Feb 2024 18:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B5540162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQdcEnY6hcOi; Mon,  5 Feb 2024 18:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E74D4018B;
	Mon,  5 Feb 2024 18:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E74D4018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCEFA1BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF9181E22
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF9181E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mlvmf2ZU5V1s for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:01:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8939581E21
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8939581E21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7594986DB7; Mon,  5 Feb 2024 18:01:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 19:00:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c43f12293d3a6668a79f5cfece402d46a87a473e
X-Git-Newrev: f6c33f3e89f7f26e5b7613a757c82c9efc62654a
X-Patchwork-Hint: ignore
Message-Id: <20240205180105.7594986DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] host-python-numpy: correct implied
 host-lapack/host-blas dependency.
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6c33f3e89f7f26e5b7613a757c82c9efc62654a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
