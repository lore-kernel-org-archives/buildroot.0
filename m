Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F5CA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE00740797;
	Sun, 11 Oct 2026 08:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c489rKAKwZYj; Sun, 11 Oct 2026 08:26:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E18C240798
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707171;
	b=rtRdTtn5CxoXUoJ9BcI31tIvaZD+qkTMSfILUj4CfXUlX9t20o0LqJj8d1SIOmQHOB8w
	 M92tDnk3YNMiO6LxrKXavdBV2SxvosH7txbUeovpmrU8o8axR1ll3bcPf7LT5gqyVosPE
	 EoCDSRENJHDwmP44ws8PNgW7obxnzfjjpwLrSWCNEV5CSagJugXtPVl6OgF5mRRwk1eLl
	 FUqv5UnH3dT6a+6+BNno6hbwEUzB8/6gQL0hJL/zyT7KCggeR53quzJ1VdjfRZZlCZLgg
	 TojDKfl8EzWMPf2P9vsSiGNiY7Da52I8mkee8oZjAkVTqB/mlRwzsoYjJNryo4NVH9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kQ1sxJqDCX3zHFxZ+Fzo8Sfl1eY0lukUyP54UeNqNtE=;
	b=C9CIcrUnoQjC07N9n7JOCP0A9tcVV4f7/OOZa2WSx6eDaCEmqGw1ST9tUZ4WV5KocTAT
	 xF8VsIPZz69zVsg+cm7Y1rs2GA+ahDDiOQE/fxKPAlwRfB6CiT4IeNOf193hAClul9N9v
	 0l6NgODvw5Nk77eUe0wSxlyV3GKjhWaJqJ8TX6leWqNGCC4nbx87eWDB+AgAkUi6peIv0
	 o8q3R94D/2lGb8kOSl3TBj2Zxn1h7pce+LwwKSAhLoIQ34Cyx5twL5P85XoGa+i1Ty0zW
	 PnK913H8TRhhi2kBGlP/NAImCRci9xP+jac/+uuPIcC0+0RxcmANNW9cUnYrTAXyx0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707171;
	bh=kQ1sxJqDCX3zHFxZ+Fzo8Sfl1eY0lukUyP54UeNqNtE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qIFeOIEu2XZp22QrDXFgTvIijKUKm7V1crftHzSbuIfHOGqb/OrLcFip1vA/ldFjY
	 gKLcDK71uV69/tOZKl6GhmDCRrl5+dGgmMx0vaO8fQIn8VNbfx93maZk1VwIj33htp
	 rxjQdMtQcK66He7d6aj4Ki1Fh1elTyIFYOT8+AeZgpq7Mt6d6PmM2csUlat7FWa7c8
	 eI/wX1OqGGb12g0kX09qEenaDskRYBonPQdRE6WBtCM0i+5/osivoUhh/PZkfkVJDJ
	 /GWhqMAu6BdWVIQR4HWgECF1JQOAlAz/KhVJKwK4RWNpE9GyItJIRJZgYfl1np96EP
	 w12N3B1eFB9Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18C240798;
	Sun, 11 Oct 2026 08:26:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16EB3DE0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEEFE40042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGgjJ1AfqTLG for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 11C954002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707165;
 b=G1bwO16eiSZ8Y8WOKDlMohRUm9hP6UgT1LQ5z8irZ/i9OPB6PXO0sp5hJyrPB4yda8rP
 9qfPAks4vO6pp3cddLLCX9XRfeCILggoXljB79TO3tIK9YYF6uThBJN2TNE0F86CBlc5J
 U7pwe1XyCmBue+ZnaUpHR3a2CzCV4v187yqsXwg/LoLxl+H+ibzDviDWH1YXpoajGS5Aw
 BLwO5V2tXnBkORe9d3z46On82Hiz6bSMquPn+8WQvXWnvT59/jdOqrTCL8+syEULZ0Zgv
 98f4CIgfwOkEEsMJhx2S0QzRdsq2hFY02TtelDUkW+mtLaxHbHZI4oYjBMutNon86Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Azjgy2Fud6EWBxZaQF1PmZKb3kYsbVwqywdInoYGd9U=;
 b=kT88JC/ZVuyC+BC+jrEayFMXUcqtsV8JVAsC9/yhmFNfNFDNAt5bQ1RrwEkyJf9Q5GjV
 yiFaKv5uwZRRMnq+rmWZIa8Dhz6rYcgDi4VYLSYBvVD9201TnKhWl0nq3h2yOVx0zcB1v
 nUs2q2Vnd8GIzbsEy+9qPtTEqPw4mb5AUaReQqda3YhFMSPxPT8dsRJ2o/706Bip5Fitv
 203zWnxAt2S0G9+NAZ06uV54BFsvw8jZ9pfq6qVTFB486PgHnLG3gQpRrl0RdN+E5z8oD
 HxbMc+px0GbDgDmFzOjTowJJ5RkNCubaXxuuh1sKPioic7+vn+2GvViy9h1zuVKfhcA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11C954002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FE75935C6; Sun, 11 Oct 2026 08:24:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 10:23:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ac595bdd199a2abfaf792cc5ce33d08fa9cd63a
X-Git-Newrev: 552bf40db16505e1549f149b095d47e98da29594
X-Patchwork-Hint: ignore
Message-Id: <20261011082446.6FE75935C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: support other
 identifiers than CVE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/552bf40db16505e1549f149b095d47e98da29594
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Currently the MissingCVEPatch check will complain if another
identifiers than a CVE-YYYY-XXXX is passed after the 'CVE: '
trailer in the patch header introduced in [1].

If a package 'foo' defines the following:

FOO_IGNORE_CVES += GHSA-abcd-1234-efgh

And correctly references it in a patch header:

CVE: GHSA-abcd-1234-efgh

check-package will report the following:

package/foo/foo.mk: patch file '0001-some-patch.patch' is missing 'CVE:' tag

While we could argue that GHSA identifier should not be present in the
'IGNORE_CVES' variable, it's still valuable for users to have a way to
correctly ignore and link a patch for their vulnerability report.

From our point of view it allows us to track GHSA vulnerabilities that
could later be assigned a CVE so we can update the IGNORE_CVES variable.

This commit relaxes the constraint on the 'CVE' trailer to just check
for the presence of any identifier. We still only allow alphanumerical
characters and dashes, to be sure that any tooling that uses the
identifiers won't break.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout:
 - keep the regex but allow any alphanumerical string;
 - add a test that FOO:123 doesn't match]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/checkpackagelib/lib_mk.py      |  2 +-
 utils/checkpackagelib/test_lib_mk.py | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 065733d464..1fa056cbf4 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -121,7 +121,7 @@ class Indent(_CheckFunction):
 class MissingCVEPatch(_CheckFunction):
     PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
     IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
-    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *CVE-\d+-\d+$")
+    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *([\w-]+)$")
 
     def before(self):
         self.pending_patches = []
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 21effa9489..9d2950ef79 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -239,6 +239,17 @@ MissingCVEPatch = [
      {},
      'FOO_IGNORE_CVES += CVE-2000-1234\n',
      []),
+    ('invalid syntax in patch',
+     {'0001-some-fix.patch': 'CVE: FOO:123'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += FOO:123\n',
+     [['{}: patch file \'0001-some-fix.patch\' is missing \'CVE:\' tag',
+       '# 0001-some-fix.patch\n']]),
+    ('patches present with other identifier',
+     {'0001-some-fix.patch': 'CVE: GHSA-abcd-1234-efgh'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
+     []),
     ]
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
