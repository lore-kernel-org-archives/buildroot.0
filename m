Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FAAC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAFD4409EB;
	Sun, 11 Feb 2024 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vaNIMerinW1; Sun, 11 Feb 2024 15:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FD94092B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21FD94092B;
	Sun, 11 Feb 2024 15:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3D6D1BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C4640537
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgvp_hVekG53 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D454053D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D454053D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52BC687482; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:29:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 949c1a51b7f31982b66efe2d4adc55095a4c7811
X-Git-Newrev: ddf66867b192b5576632a44c4edfe23c98d8a3d8
X-Patchwork-Hint: ignore
Message-Id: <20240211153111.52BC687482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] doc/manual: document _CPE_ID_VALID
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddf66867b192b5576632a44c4edfe23c98d8a3d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The way we handle CPE_ID variable is unusual compared to the other
variables: we mostly compute defaults for all of them, and eventually
aggregate the various CPE_ID variables to form the CPE ID name.

However, we do not consider that CPE ID to valid, unless there is one
(or more) CPE_ID variables actually set by the package; this shows that
the CPE ID has been checked to be valid against the NVD CPE database. In
that situation, we internally define the duly undocumented _CPE_ID_VALID
variable.

However, it is totally possible (and very often the case) that the
default value we set to those variables are appropriate, and do defne a
valid CPE ID. In this case, the package will define any arbitrary CPE_ID
variable to its default value, usually by setting either the VENDOR or
PRODUCT field, though there is no rule or requirement that be the case.

This is not very clean, non-obvious, and does not allow for easily
adding checks in check-package.

Add the _CPE_ID_VALID variable to the manual, to make it official that
it should be used when the default values of the others are valid.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.adoc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 935270a19c..ce8608682f 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -516,6 +516,10 @@ LIBFOO_IGNORE_CVES += CVE-2020-54321
   identifier]. The available variables are:
 +
 --
+** +LIBFOO_CPE_ID_VALID+, if set to +YES+, specifies that the default
+   values for each of the following variables is appropriate, and
+   generates a valid CPE ID.
+
 ** +LIBFOO_CPE_ID_PREFIX+, specifies the prefix of the CPE identifier,
    i.e the first three fields. When not defined, the default value is
    +cpe:2.3:a+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
