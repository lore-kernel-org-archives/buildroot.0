Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DA8CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919A76142C;
	Thu,  9 Oct 2025 10:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_LnEHqcCbuS; Thu,  9 Oct 2025 10:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4921613F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4921613F2;
	Thu,  9 Oct 2025 10:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5869921B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A9B83C2A
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JerJEB4aSjle for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C2C83C41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C2C83C41
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2C3B86E15; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:50:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 58fff6a287411a7eeffcab4c634921be1559892b
X-Git-Newrev: b461e9602ed24176c37ac0b8af837b832f70f338
X-Patchwork-Hint: ignore
Message-Id: <20251009101600.B2C3B86E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyopenssl:
 add missing dependency for deprecation handling
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2187399904609266456=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2187399904609266456==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b461e9602ed24176c37ac0b8af837b832f70f338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When commit bbdcb75d7f19 ("package/python-pyopenssl: bump to version
25.0.0") has been added, it has silently introduced a new dependency on
typing_extensions that has not been ported in the corresponding
Config.in, resulting in failures at runtime when trying to import the
module:

ModuleNotFoundError: No module named 'typing_extensions'

The upstream project has indeed introduced the following deprecation
handling snippet with commit 1b2b0ed21986 ("Use type-level deprecations
(#1389)"):

  if sys.version_info >= (3, 13):
      from warnings import deprecated
  elif sys.version_info < (3, 8):
      _T = typing.TypeVar("T")

      def deprecated(msg: str, **kwargs: object) -> Callable[[_T], _T]:
          return lambda f: f
  else:
      from typing_extensions import deprecated

This then breaks systems with pyopenssl >= 25.0.0, python < 3.13, python
>= 3.8, and without typing_extensions.

Fix the missing dependency by adding it explicitely in pyopenssl
Config.in

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyopenssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index 56f38f5888..184ad3c5f5 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PYOPENSSL
 	bool "python-pyopenssl"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
 	help
 	  Python wrapper module around the OpenSSL library.
 

--===============2187399904609266456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2187399904609266456==--
