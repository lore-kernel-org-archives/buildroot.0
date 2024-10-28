Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3D4D5B146
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E649608D1;
	Mon, 28 Oct 2024 20:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Do_thNME3Hye; Mon, 28 Oct 2024 20:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC8760A40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC8760A40;
	Mon, 28 Oct 2024 20:24:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7FC112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83F8581858
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8FtZ_MP0xnE for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A644081801
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A644081801
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:24:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90F19843A2; Mon, 28 Oct 2024 20:24:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 21:24:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2065fecbf30b0b91263fa7f30e5b1786055b968a
X-Git-Newrev: 10d8228886beb084072fc04d89785d68a99445ed
X-Patchwork-Hint: ignore
Message-Id: <20241028202434.90F19843A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oath-toolkit: libpskc needs
 host-libxml2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=10d8228886beb084072fc04d89785d68a99445ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling oath-toolkit with PSKC support, with:
BR2_PACKAGE_OATH_TOOLKIT=y
BR2_PACKAGE_OATH_TOOLKIT_PSKC=y

Build is failing on hosts without libxml2, with output:

    make[5]: Entering directory '/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas'
    create -noout \
	    --add "system" "urn:ietf:params:xml:ns:keyprov:pskc" \
		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/pskc-schema.xsd" \
	    --add "system" "http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd" \
		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/xmldsig-core-schema.xsd" \
	    --add "system" "http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd" \
		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/xenc-schema.xsd" \
	    tmp
    /bin/sh: line 1: create: command not found
    make[5]: [Makefile:1267: catalog-pskc.xml] Error 127 (ignored)

The build needs the "xmlcatalog" command, provided the host-libxml2
package. The previous error log does not show the "xmlcatalog" because
it is not found by autoconf, then substituted by an empty string (we
only see its arguments).

This commit fixes the issue by adding this missing dependency.

Fixes:
https://autobuild.buildroot.org/results/d22b8d9ba1f8a948125b4f9713720d070e208799/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oath-toolkit/oath-toolkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
index b36cd47053..5e8fabb05b 100644
--- a/package/oath-toolkit/oath-toolkit.mk
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -29,7 +29,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OATH_TOOLKIT_PSKC),y)
 OATH_TOOLKIT_CONF_OPTS += --enable-pskc
-OATH_TOOLKIT_DEPENDENCIES += libxml2
+OATH_TOOLKIT_DEPENDENCIES += host-libxml2 libxml2
 else
 OATH_TOOLKIT_CONF_OPTS += --disable-pskc
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
