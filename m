Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C1AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8190A44E77;
	Mon, 20 Feb 2023 21:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8190A44E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZfdavBolF4B; Mon, 20 Feb 2023 21:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867034D462;
	Mon, 20 Feb 2023 21:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 867034D462
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3744B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE126610EE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE126610EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSTIxYRQSNOY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61EF610E7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61EF610E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C02248648F; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 15:42:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89815bad0a531d01ee2733dd9c17576a7647e1d9
X-Git-Newrev: e87d92966630a6c05857c3e29d1781fce3c16bad
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.C02248648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linuxptp: add patch to
 fix build failures with make 4.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e87d92966630a6c05857c3e29d1781fce3c16bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When using make 4.4 the KBOUD_OUTPUT environment variable provided to
the linuxptp makefile is not utilized. The added patch will fix that
behavior.

Fixes: http://autobuild.buildroot.net/results/5294fac7ed04945d47ea4eb2d1448bcbea5352bb/

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-conditional-assignment-for-KBUILD_OUTPUT.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
new file mode 100644
index 0000000000..73cd34f744
--- /dev/null
+++ b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
@@ -0,0 +1,43 @@
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 23 Nov 2022 08:23:46 +0800
+Subject: [Linuxptp-devel] [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
+
+Refer [1],from make 4.4, all variables that are marked as export will
+also be passed to the shell started by the shell function. use "=" will
+make KBUILD_OUTPUT always empty for shell function, use "?=" to make
+"export KBUILD_OUTPUT" in enrironment can work.
+
+[snip of 4.4 NEWS]
+* WARNING: Backward-incompatibility!
+   Previously makefile variables marked as export were not exported to commands
+   started by the $(shell ...) function.  Now, all exported variables are
+   exported to $(shell ...).
+[snip]
+
+[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+[Retrieved from mailing list. The patch was not yet accepted and applied:
+https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg06151.html]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+
+---
+ makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makefile b/makefile
+index 9aed383..ba3fb38 100644
+--- a/makefile
++++ b/makefile
+@@ -15,7 +15,7 @@
+ # with this program; if not, write to the Free Software Foundation, Inc.,
+ # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ 
+-KBUILD_OUTPUT =
++KBUILD_OUTPUT ?=
+ 
+ DEBUG	=
+ CC	= $(CROSS_COMPILE)gcc
+-- 
+2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
