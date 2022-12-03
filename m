Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF44C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD22B40151;
	Sat,  3 Dec 2022 14:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD22B40151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnjAjVW96MDr; Sat,  3 Dec 2022 14:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3AE240102;
	Sat,  3 Dec 2022 14:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3AE240102
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA20E1BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D3E813F2
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D3E813F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SKQqDpass7W for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6CA98133E
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CA98133E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B64C1847E6; Sat,  3 Dec 2022 14:44:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 15:42:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89815bad0a531d01ee2733dd9c17576a7647e1d9
X-Git-Newrev: e87d92966630a6c05857c3e29d1781fce3c16bad
X-Patchwork-Hint: ignore
Message-Id: <20221203144401.B64C1847E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linuxptp: add patch to fix build
 failures with make 4.4
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
