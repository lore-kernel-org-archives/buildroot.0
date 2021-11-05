Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9075C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:26:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D9CC611C0
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D9CC611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B64A40799;
	Fri,  5 Nov 2021 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCeFrgSN-_Np; Fri,  5 Nov 2021 16:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE8140762;
	Fri,  5 Nov 2021 16:26:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F83E1BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381DA82730
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4sASfrU5WDj for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7294382718
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9AF118AC05; Fri,  5 Nov 2021 16:22:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:23:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c033676c17de0db6d2aa6fb3a195f6af5fa61bc8
X-Git-Newrev: 33160aeeb4c77fb7678545f07766d8a831beaea6
X-Patchwork-Hint: ignore
Message-Id: <20211105162201.9AF118AC05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: add libcap optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=33160aeeb4c77fb7678545f07766d8a831beaea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap is an optional dependency which is enabled by default since the
addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 1c20c49dee..d66a9602e2 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -33,6 +33,13 @@ else
 NETDATA_CONF_OPTS += --disable-jsonc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+NETDATA_CONF_OPTS += --with-libcap
+NETDATA_DEPENDENCIES += libcap
+else
+NETDATA_CONF_OPTS += --without-libcap
+endif
+
 ifeq ($(BR2_PACKAGE_NFACCT),y)
 NETDATA_CONF_OPTS += --enable-plugin-nfacct
 NETDATA_DEPENDENCIES += nfacct
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
