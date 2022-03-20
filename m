Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA525C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B7CC40338;
	Sun, 20 Mar 2022 21:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTCL8bguT1Dj; Sun, 20 Mar 2022 21:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C579402EA;
	Sun, 20 Mar 2022 21:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B97A61BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B499F4023C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgy9B75YIg3M for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA3CA40219
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:38:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C1B2B8468D; Sun, 20 Mar 2022 21:29:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:36:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 414b4c5d86813393ae7816e918066dff9a98f569
X-Git-Newrev: e1fe19616196930cb803f52760c55340607c894e
X-Patchwork-Hint: ignore
Message-Id: <20220320212923.C1B2B8468D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libopenssl:
 security bump version to 1.1.1n
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
Content-Type: multipart/mixed; boundary="===============5092354486165884489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5092354486165884489==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e1fe19616196930cb803f52760c55340607c894e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changes between 1.1.1m and 1.1.1n [15 Mar 2022]

  *) Fixed a bug in the BN_mod_sqrt() function that can cause it to loop forever
     for non-prime moduli.

     Internally this function is used when parsing certificates that contain
     elliptic curve public keys in compressed form or explicit elliptic curve
     parameters with a base point encoded in compressed form.

     It is possible to trigger the infinite loop by crafting a certificate that
     has invalid explicit curve parameters.

     Since certificate parsing happens prior to verification of the certificate
     signature, any process that parses an externally supplied certificate may
     thus be subject to a denial of service attack. The infinite loop can also
     be reached when parsing crafted private keys as they can contain explicit
     elliptic curve parameters.

     Thus vulnerable situations include:

      - TLS clients consuming server certificates
      - TLS servers consuming client certificates
      - Hosting providers taking certificates or private keys from customers
      - Certificate authorities parsing certification requests from subscribers
      - Anything else which parses ASN.1 elliptic curve parameters

     Also any other applications that use the BN_mod_sqrt() where the attacker
     can control the parameter values are vulnerable to this DoS issue.
     (CVE-2022-0778)
     [Tomáš Mráz]

  *) Add ciphersuites based on DHE_PSK (RFC 4279) and ECDHE_PSK (RFC 5489)
     to the list of ciphersuites providing Perfect Forward Secrecy as
     required by SECLEVEL >= 3.

     [Dmitry Belyavskiy, Nicola Tuveri]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66868e9fab2806686fd08850a3e56185ef00b127)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index a055cbc270..22bb365bcc 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1m.tar.gz.sha256
-sha256  f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96  openssl-1.1.1m.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1n.tar.gz.sha256
+sha256  40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a  openssl-1.1.1n.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index bd8ef6141a..ae6658ed40 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1m
+LIBOPENSSL_VERSION = 1.1.1n
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay

--===============5092354486165884489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5092354486165884489==--
