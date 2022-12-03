Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3E4C4332F
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 10:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307214089F;
	Sat,  3 Dec 2022 10:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307214089F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFL64LJ2KKYr; Sat,  3 Dec 2022 10:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C8A408CA;
	Sat,  3 Dec 2022 10:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C8A408CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74B061BF831
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 10:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 508FC80B99
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 10:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508FC80B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzUkqtiQPSar for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 10:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3969280061
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3969280061
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 10:18:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b2so16906360eja.7
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 02:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fLYHcNUyvQWbNUsLUTqAVkswHhS1dkWu3EWcjcfzTPI=;
 b=1C2RmuCSotIWgjufKMWBJ3QnThJ71/3ybcBp4IofvHW550rMTskPcr8NbeAnLzb1bA
 FV/4sPRDFhTf8yDHkmQbEx7DebhO2rUj0TFFf7qhMZ6qgjTeNkLxIse8rUwAEhlL21Lv
 gIJsjsgGeoSCtTVyxkQ0SZBVOcsXKvFVq4DYwdvMquTkZzo8GI/Cd+AOL+cNO06+UAYb
 A9Xwos+/uqtitmr+LzT4Wz7/7Co/yayuFSJ55+9MhVjRuYJH/EtAfbGb/GugRTCxPYdf
 YJB3J9ODs+blMqXAyAziiGryK9LJwmCUQqaqIhkPREBOlph9CeEx9Tqd/cTLcxcxi9Jx
 dDlA==
X-Gm-Message-State: ANoB5pm8p4Z0Gx+KF6FUAEFdc3ByrB6EU3nPzFqSEphEG2lCVOCYwbQ6
 q6JBv224eD44OwN6HPpTIZwbNSe598MVFA==
X-Google-Smtp-Source: AA0mqf52FbhkloQ8tgpMpjVxpfrpfDaMCB2IxK+FcRSMM4YsL08pYSF1iecHpnad75tddfLaVmnIwg==
X-Received: by 2002:a17:906:5ad7:b0:7c0:b55f:295 with SMTP id
 x23-20020a1709065ad700b007c0b55f0295mr8498746ejs.424.1670062706498; 
 Sat, 03 Dec 2022 02:18:26 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007b29eb8a4dbsm4086620ejt.13.2022.12.03.02.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 02:18:25 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 11:18:04 +0100
Message-Id: <20221203101803.23169-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fLYHcNUyvQWbNUsLUTqAVkswHhS1dkWu3EWcjcfzTPI=;
 b=qi5Qe253yviUc9angMMEA+TR6kSCHrM++AbJKXbRAP0THcWXhIOIej15HgJ2BpZ+4q
 KXa2lH5xdoaZlpjbvB2dEYpPCu4w14Rf6qiQlqsIKQy8M0VHKBxfB16Y2DAFMMktM2qv
 AAAtRvCg/p12JUpg+rs5kE0VB92rAiDGhHodiL6t1fqSWew/x67ppIonKOd0mGW2rS0G
 nXfspuhMieMgRHJK+dUKeOAUQBz9oA2hgbN3im5WIKvCb1WXby/bf2YY0WTRs4cm74jG
 MnecAAjykYguWrjUCwGVn5y70MAQcKhzpULQli676RtZqGMrE85TepynoznmhALrLQRR
 VpwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qi5Qe253
Subject: [Buildroot] [PATCH] linuxptp: add patch to fix build failures with
 make 4.4
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Kulhavy <brain@jikos.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using make 4.4 the KBOUD_OUTPUT environment variable provided to
the linuxptp makefile is not utilized. The added patch will fix that
behavior.

Fixes: http://autobuild.buildroot.net/results/5294fac7ed04945d47ea4eb2d1448bcbea5352bb/

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch

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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
