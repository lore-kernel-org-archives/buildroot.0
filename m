Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B028C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC2DF81368;
	Wed,  1 Nov 2023 10:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC2DF81368
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1pirT3gDnGF; Wed,  1 Nov 2023 10:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D3483D29;
	Wed,  1 Nov 2023 10:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D3483D29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4021BF354
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D841181368
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D841181368
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSQY_KbzZdKi for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DB1D83D29
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB1D83D29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51DB5862ED; Wed,  1 Nov 2023 10:52:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 11:52:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c16914c00e2f40b4e4addfb0d354f375b56d2de
X-Git-Newrev: bdf1506e9664b7b7d2441496192723e26383623d
X-Patchwork-Hint: ignore
Message-Id: <20231101105245.51DB5862ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sedutil: fix build with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdf1506e9664b7b7d2441496192723e26383623d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from ./Common/log.h:45,
                 from LinuxPBA/LinuxPBA.cpp:25:
./Common/DtaOptions.h:33:5: error: 'uint8_t' does not name a type
   33 |     uint8_t password;   /**< password supplied */
      |     ^~~~~~~
./Common/DtaOptions.h:1:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?

Fixes:
 - http://autobuild.buildroot.org/results/b6feb4fb33d595414b61174deb9867e8c30cd186

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sedutil/0002-include-missing-cstdint.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/sedutil/0002-include-missing-cstdint.patch b/package/sedutil/0002-include-missing-cstdint.patch
new file mode 100644
index 0000000000..07a617c5e7
--- /dev/null
+++ b/package/sedutil/0002-include-missing-cstdint.patch
@@ -0,0 +1,31 @@
+From 927cd88cad7bea94c2eebecc18f7881f0defaccb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 23:36:29 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint>
+is no longer transitively included [1]. Explicitly include
+it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/Drive-Trust-Alliance/sedutil/pull/425
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Common/DtaOptions.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Common/DtaOptions.h b/Common/DtaOptions.h
+index c012af1d..7530a0b7 100644
+--- a/Common/DtaOptions.h
++++ b/Common/DtaOptions.h
+@@ -21,6 +21,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
+ #ifndef _DTAOPTIONS_H
+ #define	_DTAOPTIONS_H
+ 
++#include <cstdint>
+ /** Output modes */
+ typedef enum _sedutiloutput {
+ 	sedutilNormal,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
