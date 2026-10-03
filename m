Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D360ACA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811FA40F52;
	Sat,  3 Oct 2026 10:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWXM7qBBP7rX; Sat,  3 Oct 2026 10:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2C2E541172
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022056;
	b=Tb8E43paCa98Oo/rLMhj86FmO+islVHuxUGCWYIrRnQWBOOUZsMWpAKNR5CoWI5Jfcwq
	 mgcjxJsVPrxwU5XWbdAPbPkLBwACrjqw96KXEGKsOovuoa1qEIzxa1nuDLWPobhKQZDF2
	 /eLMVlaviQWKO+WY664eNxs13eSbMMSrl0KYcIFzcZqh4HQgYbOJt3uGTktaI4S1JDE9E
	 UZaBBiK231fSEqZRXKbbUhvL5ZpvvSOTTfBoHc18RE2bUrHTmdp4XPu0K7TJVtjJxjhGx
	 sqpP1QZ3nbmc2qwVvDgpXdW0cV6iNuaQLPXiaoteIznu96uczwmh6uOjstwTTnG2Qdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BqL5NY0vAIBqG15RFA4F0mOz1hfBpFUwL8X1ZlMpCRw=;
	b=sJSoNpuOAQW9AjSdJMdDpiHpH13DOt3XfgLiho4r2IFzvpXyzZd0CxOSePTLF98EuZ8D
	 Z9eE1S1NclylQl67YnlUDq7N/kcS0mcQ3cj4rLFAGRc5G+TyzMaorwAnfvlhWv2F/Q8el
	 8ppTmeQAkYmbwFi43ERS0NdLN50MAi5N9CPd4k1DKlzXhJFUWwydgfz4Nb3hbyisjffbf
	 N5jWo2rNxgAWlzTriYMGcsw8iLxgFkQwKWnsKQaFeh6Wf++SO5vuP8291HTvHsC26y2AR
	 i3vIi+xo6Ruj0gcMEJ/s8vFpNN5ljZBaqAXbv9O4QowTMnoJd2s8WKgVh4MLn7kMeHA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022056;
	bh=BqL5NY0vAIBqG15RFA4F0mOz1hfBpFUwL8X1ZlMpCRw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c12g9Ltir2Y+jVzKjqDMC6XKSU8rgbr/RI8qIQzWo69H3ZObizcsnB2ZRkg/iUhRy
	 omFp/Yoz7P4zecCRJqGmHIjuD0bB8aydP/i6oGNNgAsMN0JK03yShBwrNDGWpIOUrc
	 9clIXZ/Wqq6ZCi96NC2w5i//dmHVHyUUko3+eWikUe9KgQ4RRuf74xFScEYkW8WHV3
	 qxDLve1VohkhkXOSqY1DP+eREc42EXtWhENxCA3ApfQRrbQxN4+WJr/f8yFqF7M1Fk
	 VBua0KpgUmgCkcWfa6EN7suCOPRmJaczmdhmF7luFywg3Wz3xgX1768fm/XUZzIM1i
	 I1Da+nE4anDhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2E541172;
	Sat,  3 Oct 2026 10:07:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95429335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 879EA811ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU5v-NJ8Bquy for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C4276811F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=lB4IStt7HjcLONb0MeUiC3ebQFfhvOR5+LLPlmgbDu7DxfZoenZd38K7N1wS20cXSwof
 x9rt9PuPkpHJ64HzBfLu+ci2RdgMNgRTbwMReuSu4wmq1UgmTSUhyMWX2/9vWGDLt0YmD
 udbZbNbeSC7RhAD0m5FggOA+5n+tEaTV7qxVVzVXBVHiUKV8HaT7ncoj5TjkEtf2pUxCk
 uccvN/lC7xhma5NXZU+RxZJYoeQnfk+OJeItgGgJFPlzY/mPcGDhMsNsiX6KUmC9ljEpQ
 gF8AYydG7I7Np59GGoDZjr9QN3XBqLuet23eHVTzKlM/g5AQ81S7TRXT6W0lIOPcGtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9VU7iUOSGemrbPZVOS2LHCRRcdzz1aZShzR1BC8Z55g=;
 b=Y2zdjqzme10dcT1QB+r84i9UIvdOXRLEVrW6IG2fcFv7A8Xkhic7WqPNCF3icmtYMy2R
 X4CuTcIdLoHm3VU282uu1Xm38iypf7IK8QX+BQv+eahBI5rapemKVb1MN8rB7VIxExNvC
 5O3tEFGJHXoXQWj7zxLTVL2IsvlJk08SffEo+Iv+CiFkVEeeMglt5fmNKCrLTgkH7JAHG
 4iAYMRZa3xaKU8JjOAbVn9a1jzHJGohaUJUUrGb5hIVbwBN49+XuyV1zXlbDTl+MRdPwq
 3pQfHqfEiMxGIYcTfuEPa2lyQWnnizjmKU0joRL/xu1zGvjmbh3RQv5YKEb+nJaVmTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4276811F7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F2A3886EB; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbb840e83a7d51ab1ed9f93a060ebcf193497b40
X-Git-Newrev: d3af06441fcc4b3c3f42704ea8812ada02c74119
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.2F2A3886EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-werkzeug: bump to version
 3.1.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3af06441fcc4b3c3f42704ea8812ada02c74119
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 4cbeb14e23..0761734b39 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  5b3063a0bfc95d46cb35258b03b9f30e  werkzeug-3.1.8.tar.gz
-sha256  9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44  werkzeug-3.1.8.tar.gz
+md5  786765fcf7f7c9fa43cfefdc8147eff0  werkzeug-3.1.9.tar.gz
+sha256  55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060  werkzeug-3.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 745e93f443..20d856702c 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.8
+PYTHON_WERKZEUG_VERSION = 3.1.9
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/dd/b2/381be8cfdee792dd117872481b6e378f85c957dd7c5bca38897b08f765fd
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/a4/34/4dd12fc8bb7d61c91467ec3efe415ffa7d5456f799954b40c5bbaeae470e
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
