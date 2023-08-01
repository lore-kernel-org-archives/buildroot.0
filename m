Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F441C001E0
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 13:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA64C606CB;
	Tue,  1 Aug 2023 13:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA64C606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYkIhECZGpjS; Tue,  1 Aug 2023 13:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D793E6114D;
	Tue,  1 Aug 2023 13:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D793E6114D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F54B1BF31D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9835403AC
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9835403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tw9g0vu2OCzS for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 13:18:33 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Aug 2023 13:18:32 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B57D440201
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B57D440201
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 13:18:32 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 15:11:19 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2023 15:11:19 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 15:11:18 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 01 Aug 2023 15:11:17 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,247,1684792800"; d="scan'208";a="22642996"
To: <buildroot@buildroot.org>
Date: Tue, 1 Aug 2023 15:11:15 +0200
Message-ID: <cc9779f7c1aa962cbf837affdda39716cab219fa.1690895462.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690895462.git.yann.morin@orange.com>
References: <cover.1690895462.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1690895912; x=1722431912;
 h=to:cc:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:from;
 bh=80w6UMPt5FQK864nQtOdj1gG2ArLhgitftjHpKtqwu4=;
 b=hkd/Rj1AttFLg3cLQuCTx835BV7pmLVjIp4gDVNnqvkbKdUITTlYwGsN
 m/11naq+7cIbk2t04L0jdRDlxqeuxdO5by4eSa9s+apoea1rgJeNQg67f
 Tc6WUSixZ/za+xgb9xHWpMKDr8GvB9yuMCI0CH7vWkrX0HnioEH1tTk6R
 kY1zx+bfNY319HiZDz138XkcCM4FehRihT90x7hMXGlGlkuoNci400ISO
 iu8wVCUO6gwfEC9SzVoBQEJF0OFWWRTvyLMD8fAQUzlND+k5zX1vdsOzW
 J5NeNKoMLzCXOJTLxaFAlAL7xX8n5fb860AB/S13sQYXgJKDyk4ZHy5T6
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=hkd/Rj1A
Subject: [Buildroot] [PATCH 1/3 v2] support/download: fix shellcheck errors
 in svn backend
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bizarrely enough, the unquoted expansion of ${quiet} does not trigger
any warning from shellcheck, so we do not add any exception for it.

${SVN} can contain more than one item, but we don't care about splitting
on spaces when we just print it for debug, so we can just quote it
rather than add an exception.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .checkpackageignore  | 1 -
 support/download/svn | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 27c66d0bbe..427791d84b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1658,7 +1658,6 @@ support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
 support/download/scp Shellcheck
 support/download/sftp Shellcheck
-support/download/svn Shellcheck
 support/download/wget Shellcheck
 support/gnuconfig/update Shellcheck
 support/libtool/buildroot-libtool-v1.5.patch ApplyOrder Sob Upstream
diff --git a/support/download/svn b/support/download/svn
index b23b7773d3..d9325b7478 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -20,6 +20,7 @@ set -e
 # Environment:
 #   SVN      : the svn command to call
 
+# shellcheck disable=SC1090 # Only provides mk_tar_gz()
 . "${0%/*}/helpers"
 
 quiet=
@@ -41,12 +42,13 @@ shift $((OPTIND-1)) # Get rid of our options
 # being expanded a second time (in case there are spaces in them)
 _svn() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' ${SVN} "${@}"; printf '\n'
+        printf '%s ' "${SVN}" "${@}"; printf '\n'
     fi
     _plain_svn "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_svn() {
+    # shellcheck disable=SC2086 # We want word-splitting for SVN
     eval ${SVN} "${@}"
 }
 
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
