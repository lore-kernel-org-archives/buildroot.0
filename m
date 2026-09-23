Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2BAC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC59C40F97;
	Thu, 24 Sep 2026 18:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNxojY5Rhkfv; Thu, 24 Sep 2026 18:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E73CD40F98
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276315;
	b=fIrXdP0tXCitmNDZ7iiiON4CYSW3KmRkWmnB4nhGbwR4UkyxDwBRuQ17kfo3E/aeNd5R
	 eoWNNw6hgSY5sRqRScBAVoFK3kM2AsIxesMbKE3S6Lrd+Ho15hF4sscJEK1KDYNAEj1D2
	 B5qikvfURn6P4noUWlofTe7LG7+pfUowOAaC8Igc6hcP6zB2LhD9Br7rgL2mSWWIVqxrl
	 lOj7nQpjaPx6cG4xZWb1jKFEwiPHrEyA4fdJF7wvVkP9nXqstBzDzMifP5+KXAXU3LP2z
	 ZoL8utqKXeDmQsFF6w5mdX5ZW+zA9+VUq8UAFHc9uiN8lDcgq2e8NIjUgQG/y+J/wlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276315;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=eDlUirUsktAJcqUgLGEpnaLbC1scydUb0xtaj1sNkZA=;
	b=lqr1XCdO3gqdQ6RdeQMgJFxxUezBtb9fd30sli55D7YhR4bRVAujyp+txzmC/Cd+N6m6
	 8vYNv5iW2J8O136XrxG+n1NXvDb7wtGvW7EqE5WIsZtC+9JCavUCZg6+OJhKFQkRzujjP
	 UJqiNwFEs1S26YOTGMHONdgfXI0haGGHH4RMP7swPsXe7UWbdwP2P0fhaU4IpqI1i3EAH
	 13bGeSKxDtEeF/+NmvfWSjyAmTBx6Uq63Nu8Jg6iQEHv5w/AhDstsqUkUeBCo+TQCZcfh
	 1XBtNxBLjUSHe6nHDQ9R0+sSgioTsXNDBbGJlw6tJGoh90HeAaDwmW+BQeINv/dDt0w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276315;
	bh=eDlUirUsktAJcqUgLGEpnaLbC1scydUb0xtaj1sNkZA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZTauK7d/dmmg411BcLY1Ead5pvZfD0ZOhG18+SA6e3WInHWLjpegK3/9ap3nZyveN
	 Pwd+MdMHOEYBbl6jSuunz994XQltz/vMfDMZea03UOyf9b1q+kWUdd80NhEOLlOaB9
	 9lggVpAiSvqoDc/kH/W6oi46nDXOlLvA4pIe1cPPzPtP6KSch9ZFLAI+USL9CxZhUj
	 EvmrXYqlSjYt8YW3qov5qOs2FeGyOKZE9EkNS8qwTRpT14daAo3V7HECHyi8eaxU71
	 jSTI9zwKD6xrNIkClDzryOHknSV6bYvJle+lVKCC0M0NL/qwiP2c/yTAF8/0q0/73j
	 iMSk6OACLEpWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E73CD40F98;
	Thu, 24 Sep 2026 18:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EBB93B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 711054017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZPk_nmDeGHG for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9A4B9404C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=kOVMDrMD1cukPHX5ZeZmgBuHt7/Kx3CZz77bBmJMQwJzMi9Rk4iWy3T1u2ce7zzEjTSi
 +SFdBUmcT3T44UhjSrI/HOAc+FITV/EntOoW5zTR39CKGAQXHi91XTWYcc205eZPUszzT
 WceomUWkps8sQgoE5caCWEnIQMuvxZR4jQ925TSVDo5I6D8sodDgpAShoKE8Y1CQmI0BZ
 WDVTTFJVW7KYYAGbg8gT2fWSRZxcYI7b2r742QHn761QGID1a/1foNjTuAoBo3Ya8qp/1
 6yQVCq4SYoDXjL7G7gm0D4N1cNG1wZHvfDjlN8cDa3gMLcmupiurUWvfaRwwSSKF3Hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nQoD8PhWhMx9odmWSTMn8J0WMNvjd98qf7/A4lUO3js=;
 b=QKLe8EVf8JxFIEPjS6cmAIcdB+Cm5uFsJyVrgsECcQHw5EFY9x4yAwn6iCw9XZvuopPG
 rIaU+sqJQccWzFrdj9p2YuQA9gev4JbD1dOLfqPio2hUV9/UH5ftegTDHF2klucC0y5ND
 KNAdpfq8E+pUqAc6UANBiVbzt7BtQ7QrBpWp/wPaQnGOrlgB4QqM/FsGcnMT8NJ8Rkv9w
 xr3anURAMRHLoRhvOP8b/dmpfBD6pbamPtjZFOVNjlZkIUkrU45wiwx3yXmaRGlhXTwi+
 yqmBX3v51WKCrSjK5ptwEzJAGAqwPXIqtdDSmTrGLe1QItP66VLicxLgf5/XUlZlHbQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A4B9404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E160976B0; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:43 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9521735392b5c4fe5a745b6d8fdfba5e7e51e754
X-Git-Newrev: 9f273c5a79d819beb4122d13348edd496c659fd2
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.3E160976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/getdeveloperlib.py:
 fix regexp used to find package infra
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1657889834504833965=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1657889834504833965==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f273c5a79d819beb4122d13348edd496c659fd2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

There's recently been autobuilder failures on
toolchain-external-bootlin, but I wasn't getting notified in the daily
autobuilder e-mail for those failures, which sounded odd as DEVELOPERS
contains:

N:      Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[...]
F:      toolchain/

And indeed, testing:

$ ./utils/get-developers -p toolchain-external-bootlin

returned nothing.

Turns out that the regexp FIND_INFRA_IN_PATCH and FIND_INFRA_IN_MK
used to find the package infrastructure, and ultimately decide if a
given .mk file contains a package, was a bit too strict:

"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$"

This would only allow packages named <something>-package or
host-<something>-package, but the <something> should not contain any
dash ("-"). So this works fine for cmake-package,
host-autotools-package, but not for toolchain-external-package where
<something> is toolchain-external and it contains a dash.

We fix this by relaxing the regexp a bit and allowing any character in
<something>. Consider the rest of the regexp that expects $(eval
$(<host>-<something>-package)), it seems highly unlikely to match
anything else but the line we're interested in.

With this fix:

$ ./utils/get-developers -p toolchain-external-bootlin
Giulio Benetti <giulio.benetti@benettiengineering.com>
Romain Naour <romain.naour@gmail.com>
Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This issue has existed since the toolchain-external-package
infrastructure had been added.

Fixes: 1c99d70e5210f9d7b475736e0360ed63d16584f2 ("toolchain-external: introduce toolchain-external-package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 592d5c517ef6ed003450189cf0c4d7af8801de59)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/getdeveloperlib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b5e7b89e72..4321df8bfe 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -12,7 +12,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), ".."))
 # Patch parsing functions
 #
 
-FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def analyze_patch(patch):
@@ -35,7 +35,7 @@ def analyze_patch(patch):
     return (files, infras)
 
 
-FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def fname_get_package_infra(fname):

--===============1657889834504833965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1657889834504833965==--
