Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2658C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 997FA83E6A;
	Fri, 11 Jul 2025 10:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LBHR4iDXX0U; Fri, 11 Jul 2025 10:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050BC83BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050BC83BA9;
	Fri, 11 Jul 2025 10:21:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 289E91E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FDC640EB9
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sN3CZm6mmb-V for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B0740C81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B0740C81
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6A4786337; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:35:03 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 1b72e438a7e59c039449d3a2e2d1ddf33a1ee5dd
X-Git-Newrev: b27c3ef88b08b96bcc411acf7f7442a4e2298070
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.D6A4786337@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/daq: fix build
 with GCC14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b27c3ef88b08b96bcc411acf7f7442a4e2298070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The daq package fails to build with GCC14 toolchains:

```
daq_nfq.c: In function 'SetPktHdr':
daq_nfq.c:395:37: error: passing argument 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
  395 |     int len = nfq_get_payload(nfad, (char**)pkt);
      |                                     ^~~~~~~~~~~
      |                                     |
      |                                     char **
```

The issue can be reproduced with the following config:

```
cat > daq.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_DAQ=y
BR2_PACKAGE_LIBDNET=y
BR2_PACKAGE_LIBNETFILTER_QUEUE=y
EOF
```

This patch port a patch taken from openembedded meta-networking [1] and
is tested with test-pkg:

```
$ ./utils/test-pkg -c daq.config -p daq
```

[1] https://layers.openembedded.org/layerindex/recipe/37594/

Fixes: https://autobuild.buildroot.org/results/c69/c69ab134463a18eec65ded836aecf89a5cb4a75c/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 533c0aac289a545d07efc69766227d71d2df9d80)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...3-daq-fix-incompatible-pointer-type-error.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 0000000000..a15d325cd6
--- /dev/null
+++ b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,31 @@
+Fix daq incompatible pointer type error when gcc option
+'-Wincompatible-pointer-types is set:
+
+| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
+| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
+   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
+|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
+|       |                                     ^~~~~~~~~~~
+|       |                                     |
+|       |                                     char **
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch?h=master
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ os-daq-modules/daq_nfq.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
+index 4de94b6..a6de2f3 100644
+--- a/os-daq-modules/daq_nfq.c
++++ b/os-daq-modules/daq_nfq.c
+@@ -391,7 +391,7 @@ static inline int SetPktHdr (
+     DAQ_PktHdr_t* hdr,
+     uint8_t** pkt
+ ) {
+-    int len = nfq_get_payload(nfad, (char**)pkt);
++    int len = nfq_get_payload(nfad, (unsigned char**)pkt);
+ 
+     if ( len <= 0 )
+         return -1;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
