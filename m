Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF6AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:17:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB1A60F22
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CB1A60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB3883BAB;
	Thu,  5 Aug 2021 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcu0Trxyfd8N; Thu,  5 Aug 2021 20:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A7BB83B83;
	Thu,  5 Aug 2021 20:17:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 109D61BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB043405E9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCmtvUz4YCyZ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A99405A9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:16:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F0BD98C584; Thu,  5 Aug 2021 20:15:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:05:33 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1e6226b732785f71355bafcd5063bf70dbb91486
X-Git-Newrev: f544f572c77b028dd87636036bfa240dfcaaa0a7
X-Patchwork-Hint: ignore
Message-Id: <20210805201557.F0BD98C584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] utils/scanpypi: add
 setup.py script directory as sys.path[0]
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f544f572c77b028dd87636036bfa240dfcaaa0a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Even though the directory containing a package's setup.py was added to
sys.path, some setup.py implementations rely on the fact that it is placed
in sys.path[0].

An example package is 'cram' which failed to be added with scanpypi:

    Traceback (most recent call last):
      File "utils/scanpypi", line 756, in <module>
        main()
      File "utils/scanpypi", line 703, in main
        package.load_setup()
      File "utils/scanpypi", line 303, in load_setup
        setup = imp.load_module('setup', s_file, s_path, s_desc)
      File "/usr/lib/python3.8/imp.py", line 234, in load_module
        return load_source(name, filename, file)
      File "/usr/lib/python3.8/imp.py", line 171, in load_source
        module = _load(spec)
      File "<frozen importlib._bootstrap>", line 702, in _load
      File "<frozen importlib._bootstrap>", line 671, in _load_unlocked
      File "<frozen importlib._bootstrap_external>", line 783, in exec_module
      File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
      File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 44, in <module>
        long_description=long_description(),
      File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 20, in long_description
        return open(os.path.join(sys.path[0], 'README.rst')).read()
    FileNotFoundError: [Errno 2] No such file or directory: '.../buildroot/utils/README.rst'

The corresponding code from cram's setup.py is:

    def long_description():
        """Get the long description from the README"""
        return open(os.path.join(sys.path[0], 'README.rst')).read()

Indeed, the Python documentation says:

https://docs.python.org/3.8/library/sys.html#sys.path
    "...
    As initialized upon program startup, the first item of this list,
    path[0], is the directory containing the script that was used to invoke
    the Python interpreter.
    ..."

Fix this by inserting explicitly at index 0 instead of appending to
sys.path.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ad042904f45201370b886ef5762ff75a93dc8395)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 8327fc3fc5..fac22d66e8 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -297,7 +297,7 @@ class BuildrootPackage():
         """
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
-        sys.path.append(self.tmp_extract)
+        sys.path.insert(0,self.tmp_extract)
         s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
         setup = imp.load_module('setup', s_file, s_path, s_desc)
         if self.metadata_name in self.setup_args:
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
