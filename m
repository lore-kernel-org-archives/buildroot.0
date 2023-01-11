Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615B1C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0859040FD0;
	Wed, 11 Jan 2023 19:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0859040FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jnTv23ZOrt8; Wed, 11 Jan 2023 19:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FED74101B;
	Wed, 11 Jan 2023 19:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FED74101B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFC511BF3ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A6A94189F
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6A94189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IACT3Y4-HMPk for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9766A41822
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9766A41822
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86B828794D; Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:42:53 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: be417b433d80ca8fb937994cd22a3fe524421e7f
X-Git-Newrev: 4418e34d72d09d16ad2076f723ac83694263ebe0
X-Patchwork-Hint: ignore
Message-Id: <20230111194658.86B828794D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wireshark: add
 libcap optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4418e34d72d09d16ad2076f723ac83694263ebe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libcap is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/9250a69a9976617c735679aa5383e53802e5b43e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f70149c80cda5d2f6bbe2266b247d52818391cda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1e43a8f6b5..668a79ed93 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -65,6 +65,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=ON
+WIRESHARK_DEPENDENCIES += libcap
+else
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=ON
 WIRESHARK_DEPENDENCIES += libkrb5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
