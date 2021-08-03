Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64890C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009CB603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 009CB603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD07883AB1;
	Tue,  3 Aug 2021 20:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y834iQvspoFO; Tue,  3 Aug 2021 20:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F170C83A72;
	Tue,  3 Aug 2021 20:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D77F41BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4DE7608D5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5r2aul7SdOc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:41:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4536B6060C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:41:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9387E8B3AB; Tue,  3 Aug 2021 20:40:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:34:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8f52c1974266fb27abeef0caffe22034ee571f4
X-Git-Newrev: 0e0e8c4fc1a5899138d99db47b809007a8bfd71a
X-Patchwork-Hint: ignore
Message-Id: <20210803204054.9387E8B3AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: Backport yet another
 printf fix
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
Content-Type: multipart/mixed; boundary="===============2282891946484148103=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2282891946484148103==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0e0e8c4fc1a5899138d99db47b809007a8bfd71a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous fixes from daa5459b6a caused regression that even more builds
were broken. Backporting upstream fix 383d787d ("nfsdcltrack: Use
uint64_t instead of time_t") which fixes it.
It fixes bug:
nfsdcltrack.c: In function ‘cltrack_gracedone’:
nfsdcltrack.c:529:18: error: format ‘%llu’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘time_t’ {aka ‘long int’} [-Werror=format=]
  529 |  xlog(D_GENERAL, "%s: grace done. gracetime=%"PRIu64, __func__, gracetime);
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~                  ~~~~~~~~~
      |                                                                 |
      |                                                                 time_t {aka long int}

Fixes:
- http://autobuild.buildroot.net/results/550ad9c74666775858887050ea83a8618797de79
- http://autobuild.buildroot.net/results/caf0a69121d49504db63910ce1df347802065cd9
- http://autobuild.buildroot.net/results/294d11f8c4330bcfd9412f47f21df22d4f2b6e82
- http://autobuild.buildroot.net/results/1cb6b19cbbc2b829a038a9a70b6734c084e81c93
- http://autobuild.buildroot.net/results/c0eb120f5d14798b4f88b90eaccd3bc1f657c00d
- http://autobuild.buildroot.net/results/a028299b612a0ca6d1a69757749a8b9e37094954
- http://autobuild.buildroot.net/results/996bb74445cfbde0e230b2185207d91d4ec46dfb
- http://autobuild.buildroot.net/results/624b6dc0793d0263f46831ed0f29fa265ff0e41f
- http://autobuild.buildroot.net/results/5eb2dd5d6bc0540443a52f0b9b9568af01892a23
- http://autobuild.buildroot.net/results/65bad834738d5c5b1176e8847777b3cfd95c4351
- http://autobuild.buildroot.net/results/3146237c356e5649163784fb6628fbbbc7c61153
- http://autobuild.buildroot.net/results/2c5e77600cbf5009e69f057e7a2dc164fc8b0466
- http://autobuild.buildroot.net/results/ec8ec029dc0d7d7d294f8ade81ee53ca2fc3c54c
- http://autobuild.buildroot.net/results/60ea3bdeddf71270468d6177ccf95a1dc6b68dac
- http://autobuild.buildroot.net/results/ff93a63cd084043db5f61ac5ea2bbbca4f0e6859
- http://autobuild.buildroot.net/results/cac3392373d05d78c299d07d8080ae4938773401
- http://autobuild.buildroot.net/results/438155f831d8a44ec6e0f7020e8783b48d2c8df2
- http://autobuild.buildroot.net/results/66bc1ca1a05e1676c4e65ef7364ba1415bdbc723
- http://autobuild.buildroot.net/results/5bacb3c38dc1012f9445a0c23e59336dcac5abce

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...fsdcltrack-Use-uint64_t-instead-of-time_t.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/nfs-utils/0003-nfsdcltrack-Use-uint64_t-instead-of-time_t.patch b/package/nfs-utils/0003-nfsdcltrack-Use-uint64_t-instead-of-time_t.patch
new file mode 100644
index 0000000000..384f4fd806
--- /dev/null
+++ b/package/nfs-utils/0003-nfsdcltrack-Use-uint64_t-instead-of-time_t.patch
@@ -0,0 +1,66 @@
+From 383d787d1b77f165da68495cb0363220b66935a4 Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Tue, 27 Jul 2021 21:12:17 -0400
+Subject: [PATCH] nfsdcltrack: Use uint64_t instead of time_t
+
+With recent commits (4f2a5b64,5a53426c) that fixed
+compile errors on x86_64 machines, caused similar
+errors on i686 machines.
+
+The variable type that was being used was a time_t,
+which changes size between architects, which
+caused the compile error.
+
+Changing the variable to uint64_t fixed the issue.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=383d787d1b77f165da68495cb0363220b66935a4
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ utils/nfsdcltrack/nfsdcltrack.c | 2 +-
+ utils/nfsdcltrack/sqlite.c      | 2 +-
+ utils/nfsdcltrack/sqlite.h      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
+index 0b37c094..7c1c4bcc 100644
+--- a/utils/nfsdcltrack/nfsdcltrack.c
++++ b/utils/nfsdcltrack/nfsdcltrack.c
+@@ -508,7 +508,7 @@ cltrack_gracedone(const char *timestr)
+ {
+ 	int ret;
+ 	char *tail;
+-	time_t gracetime;
++	uint64_t gracetime;
+ 
+ 
+ 	ret = sqlite_prepare_dbh(storagedir);
+diff --git a/utils/nfsdcltrack/sqlite.c b/utils/nfsdcltrack/sqlite.c
+index cea4a411..cf0c6a45 100644
+--- a/utils/nfsdcltrack/sqlite.c
++++ b/utils/nfsdcltrack/sqlite.c
+@@ -540,7 +540,7 @@ out_err:
+  * remove any client records that were not reclaimed since grace_start.
+  */
+ int
+-sqlite_remove_unreclaimed(time_t grace_start)
++sqlite_remove_unreclaimed(uint64_t grace_start)
+ {
+ 	int ret;
+ 	char *err = NULL;
+diff --git a/utils/nfsdcltrack/sqlite.h b/utils/nfsdcltrack/sqlite.h
+index 06e7c044..ba8cdfa8 100644
+--- a/utils/nfsdcltrack/sqlite.h
++++ b/utils/nfsdcltrack/sqlite.h
+@@ -26,7 +26,7 @@ int sqlite_insert_client(const unsigned char *clname, const size_t namelen,
+ int sqlite_remove_client(const unsigned char *clname, const size_t namelen);
+ int sqlite_check_client(const unsigned char *clname, const size_t namelen,
+ 				const bool has_session);
+-int sqlite_remove_unreclaimed(const time_t grace_start);
++int sqlite_remove_unreclaimed(const uint64_t grace_start);
+ int sqlite_query_reclaiming(const time_t grace_start);
+ 
+ #endif /* _SQLITE_H */
+-- 
+2.32.0
+

--===============2282891946484148103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2282891946484148103==--
