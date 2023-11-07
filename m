Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A34C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 19:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1AD415FD;
	Tue,  7 Nov 2023 19:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E1AD415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JiDHxNNQhKO; Tue,  7 Nov 2023 19:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C1241603;
	Tue,  7 Nov 2023 19:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C1241603
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1566B1BF429
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 19:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1BD741605
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 19:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1BD741605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBa5V_B9rCR9 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 19:43:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCCC141603
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 19:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCCC141603
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C366386BEC; Tue,  7 Nov 2023 19:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 20:37:49 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 49c058cb0498089e7694dc5fdb96941c900bc6e0
X-Git-Newrev: 1adc7b166f7eddaf6c448aaaf50c3deb5e925d5e
X-Patchwork-Hint: ignore
Message-Id: <20231107194303.C366386BEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/sedutil: fix
 build with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=1adc7b166f7eddaf6c448aaaf50c3deb5e925d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit bdf1506e9664b7b7d2441496192723e26383623d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
