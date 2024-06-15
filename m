Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC41C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D73C240949;
	Sat, 15 Jun 2024 19:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXQ_n6lRMI4Y; Sat, 15 Jun 2024 19:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F88F4096F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F88F4096F;
	Sat, 15 Jun 2024 19:04:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E97A01BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFAA360659
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlM_m_oo-q24 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC81860774
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC81860774
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99D987F16; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:36:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 15025dbb181cd97da8f668d1ccafc4a46cdb99c5
X-Git-Newrev: 9a780d2acaf54e7798c74448d50f4d9e7331a96e
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.E99D987F16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/infra/builder.py: fix missing $HOME during build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a780d2acaf54e7798c74448d50f4d9e7331a96e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When running a test that uses host-python-setuptools using the Buildroot
Docker image, for example running the following command,

> ./utils/docker-run ./support/testing/run-tests -o output -s -k tests.package.test_python_pytest.TestPythonPy3Pytest

The build fails with the following error,

>   File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/build/host-python-setuptools-69.2.0/setuptools/_distutils/dist.py", line 354, in _gen_paths
>     yield pathlib.Path('~').expanduser() / filename
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/host/lib/python3.11/pathlib.py", line 1385, in expanduser
>     raise RuntimeError("Could not determine home directory.")
> RuntimeError: Could not determine home directory.
>
> ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel

Python setuptools is looking for $HOME but failing to find it.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4dafb8b5c2adb6208f56e2abda954e264b8e6fdd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/builder.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index a2abb9ed89..295bc7b83d 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -52,7 +52,10 @@ class Builder(object):
                            "> end defconfig\n")
         self.logfile.flush()
 
-        env = {"PATH": os.environ["PATH"]}
+        env = {
+            "PATH": os.environ["PATH"],
+            "HOME": os.environ["HOME"]
+        }
         env.update(make_extra_env)
 
         cmd = ["make",
@@ -79,7 +82,11 @@ class Builder(object):
         in the environment that calls make.
         e.g. make_extra_env={"BR2_DL_DIR": "/path"}
         """
-        env = {"PATH": os.environ["PATH"]}
+        env = {
+            "PATH": os.environ["PATH"],
+            "HOME": os.environ["HOME"]
+        }
+
         if "http_proxy" in os.environ:
             self.logfile.write("Using system proxy: " +
                                os.environ["http_proxy"] + "\n")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
