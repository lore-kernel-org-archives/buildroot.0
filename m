Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCE6C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 20:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0D5405F2;
	Sun, 16 Aug 2026 20:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgb4OcH7-Pzy; Sun, 16 Aug 2026 20:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06EE1405F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786912399;
	bh=h/bJLeT6puZuJ3/LG+H/0PSWK8s/RV1SULaObzu1AeA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HWhivM5fZTW+25P+mIN8QVDkdTSWeH9+FAY8oF0KiqKbrKwFYb5VVce3F/GbasvMv
	 PpmIfO3SaLxyKq5jE4lJKWdvtb4ngjhDvdPrUs3mc6YVQV4gzfLGxCtgAl9iILRSk9
	 P723rVYKUbH4tMX1eP+YUYCIUtESGZMQ9tAZKuSCoXlTGv5DVza7EQvuBRc0TsKYrR
	 OkhyZTEUPFv3bMf370y2/1r+3/qqTj4dvi7P2gTVVZWLrseCyZHqiZYQ6QQOxP7Biv
	 E6y+r4mMpGuLwh5ZauI1O+6lP45AsKbbpA0BTaDWszuhcCzHhbqKzWuOVgfdwmJ2RX
	 I8dqvBmU46mUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06EE1405F5;
	Sun, 16 Aug 2026 20:33:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D075823F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2CF2400B5
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gAQ58rNSgNd for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 20:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD57040086
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD57040086
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=M7nEOyMu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD57040086
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786912382;
 bh=sE+mGIMIUp6n3dx3M47O6mePEKcveZPsDgbp8NAoPDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=M7nEOyMunghBWaNJefKke27rpA44UQs9zIatDQ8IGFDZWp9Idj4D4/x6d79rOIbHh
 Gb1vfhJCK1m6CsRKJk81+2s9gmezaRR441M9fixU0h+lz2l84qq9Kv49WpyI5YSFn0
 Pf1In4gajnBKTxFdRkUODeca28b0n3cnTPDBuli2WREQfupkPdrPT2DLpMet34Ajl+
 arsYwgncDcvW4tRtblr66wV8hHSD764vGLGqXSAE7mmuFfbyPetsdqTMW7bPMdNPdZ
 FaXYGykYx+fYVYD6+YQ1IyQL7rzMa8GkZWIK8E8R+SZenrpW9AjV3qaVP2xFUCSMES
 BldUlatj6/h2Q==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12B93A4C4D88;
 Sun, 16 Aug 2026 22:33:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53480)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvhWZ-000000002MC-3IB3;
 Sun, 16 Aug 2026 20:32:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 22:32:07 +0200
Message-ID: <20260816203207.3980846-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816203207.3980846-1-bernd@kuhls.net>
References: <20260816203207.3980846-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 5/5] package/runc: security bump version to 1.3.6
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/opencontainers/runc/releases/tag/v1.3.6

Fixes CVE-2026-41579.

Rebased patch due to upstream commits
https://github.com/opencontainers/runc/commit/a8e53f2c6d6d25cb3dd643cc514f118aab44b097
https://github.com/opencontainers/runc/commit/42cfcbe4533a094cbffd23d17dc355bbb25938a1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

 ...ror-checking-functions-with-their-er.patch | 31 ++-----------------
 package/runc/runc.hash                        |  2 +-
 package/runc/runc.mk                          |  2 +-
 3 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
index 4e103099f9..6664b62191 100644
--- a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
+++ b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
@@ -35,6 +35,8 @@ Conflicts:
   libcontainer/container_linux.go
   libcontainer/intelrdt/intelrdt.go
 Signed-off-by: Romain Naour <romain.naour@smile.fr>
+[Bernd: rebased for version 1.3.6]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  libcontainer/configs/validate/validator.go      |  6 +++---
  libcontainer/configs/validate/validator_test.go |  7 ++++---
@@ -286,16 +288,7 @@ diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
 index 31d05174..abc372f3 100644
 --- a/libcontainer/rootfs_linux.go
 +++ b/libcontainer/rootfs_linux.go
-@@ -361,7 +361,7 @@ func mountCgroupV1(m mountEntry, c *mountConfig) error {
- 			// symlink(2) is very dumb, it will just shove the path into
- 			// the link and doesn't do any checks or relative path
- 			// conversion. Also, don't error out if the cgroup already exists.
--			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !os.IsExist(err) {
-+			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !errors.Is(err, os.ErrExist) {
- 				return err
- 			}
- 		}
-@@ -613,7 +613,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
+@@ -625,7 +625,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
  			return err
  		}
  		if fi, err := os.Lstat(dest); err != nil {
@@ -304,24 +297,6 @@ index 31d05174..abc372f3 100644
  				return err
  			}
  		} else if !fi.IsDir() {
-@@ -910,7 +910,7 @@ func setupDevSymlinks(rootfs string) error {
- 			src = link[0]
- 			dst = filepath.Join(rootfs, link[1])
- 		)
--		if err := os.Symlink(src, dst); err != nil && !os.IsExist(err) {
-+		if err := os.Symlink(src, dst); err != nil && !errors.Is(err, os.ErrExist) {
- 			return err
- 		}
- 	}
-@@ -1132,7 +1132,7 @@ func setReadonly() error {
- 
- func setupPtmx(config *configs.Config) error {
- 	ptmx := filepath.Join(config.Rootfs, "dev/ptmx")
--	if err := os.Remove(ptmx); err != nil && !os.IsNotExist(err) {
-+	if err := os.Remove(ptmx); err != nil && !errors.Is(err, os.ErrNotExist) {
- 		return err
- 	}
- 	if err := os.Symlink("pts/ptmx", ptmx); err != nil {
 diff --git a/libcontainer/specconv/spec_linux_test.go b/libcontainer/specconv/spec_linux_test.go
 index 66359f79..88156516 100644
 --- a/libcontainer/specconv/spec_linux_test.go
diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d3132b1008..67511d2939 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72620f9b0e62d8da80c0c08a6265ab10d24330c544115c30713ba1429bde706d  runc-1.3.5-go2.tar.gz
+sha256  8816e8d4181d13012d16733e837425f5f67df57dfac28bc58a68f7dfcd54291b  runc-1.3.6-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 10ff98c9d7..e0c93baeb9 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.3.5
+RUNC_VERSION = 1.3.6
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
