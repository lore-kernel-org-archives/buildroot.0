Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF8ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2962816D3;
	Sat,  3 Oct 2026 13:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eiAKjNpPs-v; Sat,  3 Oct 2026 13:57:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A65C680AC6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035865;
	b=jhBu7LYkQwzjF1lAvk+Ayho5AQ6a/K3uNX4CwFQcLiAaa6wfyXnIwUl/l3+LccZ4UTkT
	 aOupqqJjGVDgIt8pOFrVhhR3/TlUmO8mTp4c+r+1rmlId4j7yFg/KbsA5hvmOWmpo20f8
	 fxEblM/xWgwUUA+mJ6GR/3TfMdE0Hm2FF2/wY4EjdJRAdg5UJwXQUThBb2Ncfthv4EhCK
	 8AZd4wMTmHgP3BoHHHrjw7LQmk/KyEElJrTa7bOsJJbytJ6yKnx85sQ+aMbSHBeqGob2P
	 oB4Arrxh5Sf1IHt8vb3wh8+oKzKGNHIQ30C6ssx+4CjyFe0sphW9+fjcZjgFoeDeODw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y9w9BlTj1ANnDY6Z85uiU9MeHsmjGOmmO0cjNqyaTLc=;
	b=a3aV8fAKQThTvuNwyVqYYv4yNCFLID/emQQbwQkqUT5i7wI2Mlp8l0KZwaV9K+GfXs1R
	 2LY5DV4zJwPUkevA/Rb2HTHVYE+QUrVm13TtfkbYN5V1O1334SEScXhFOW/2MAi0mOWaw
	 Fs1STZ67NPJf+/mU1QFSXucttgvCC/cesT/+JzvkJSB5SL+01a542AN0R/Np3vdk0grKX
	 rWLmabrKCsFLaKsuPK4XVv3f5L7qS+dst6ZnrqnmypINBKgqND3Rm324M5zjSKr+VNyZe
	 tlPzPExGfV6YNfxeoVMLM9K2kSc3UaczJGYFfGarsfATmlI39JUjtfDPyT+X7AXjRbQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035865;
	bh=y9w9BlTj1ANnDY6Z85uiU9MeHsmjGOmmO0cjNqyaTLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DYyYxBQzgRsEj3YI+jYM9P6knzjeLuYpenKIKSae5Oa3Jzs2L94Wpa2mwoISUOQDL
	 KKD5SZBeefooNMIae7f/hwI3RBbG6iJjLNpokTa6B5fNaESRKgheyxiniJc+KLPL7/
	 wHAzO14V89nEocz3lX+qJAVaOJZ7N9pZNBbgqcukE9j4LaAfepNVsE0oSptgD9xyu5
	 i/W6oNyBUYr2Z7Mct0/SxUn/uUa9CmOJ9n8h/Ems50zQ4Eeb0tqLHtBrgmZejcxAgt
	 RICOAhbbOl/Saw7ZEaevwzNQB38BigNR9IbGZpn860q+8bBuD34veiYFW7KK7tUTcM
	 SE+IQ/EcEmFtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65C680AC6;
	Sat,  3 Oct 2026 13:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2605F476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1288414DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yput6ytFbrn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B671B414E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=i/8weI5rkhIQWiEFyePPNUNwA2lBwCUz5h4YHuFj/3+sXQOmFoD1ucGYfQuoYcT6urHu
 Xv24Hpr+8Rab33tHdrnB+QlqSlL25IlkN0DyUTNFWZXgwrivlWbaOtKSSayrv3V701LWr
 WbzVOgM23wppERvsrIyByZCiLwkce6iBUjt99drCWlin48aqxXHfcufQ6zDwKYesOlIYR
 8UeSAYjJS7SHRVhGoqfryN/Vvwut/CaZQ7xTlMvOqn43Ia+34P0Ne5Sm1dbq7iP6JTt/s
 Up/hAhXtP3V3oth45CXYt676froxeAsrLQYEsEr+j6DkmI7z4FBO8R6+OkD68dSZ9Nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RZRNgy5uCo955Su8LYG+IiFhzltgdjPLPH8crzDBg7E=;
 b=Hs0sEqPFsvW9vQP6Z9oCeFXx0ZIzHBvs2MyjueEODi4ZXOnZoj7KzVjB3skbW1ZLAJwU
 XLvCli5L2zeql07MCNZjPnIs//mf+1yOshfjCniRR/c1b0YkcgmKlFp183mQYEpPGhcyh
 fepABx+FtZQAZYsQU9sOAcMdIgLr+pwTrGyRIq7Fsw4FDId7bMRIxNyr73N3R3lOKsjzZ
 EINcFkni1GWuJkv5upx1xazeQeUeNdNYLky7daVtMWovono9ow5BzRH9W6GmZTVb7THPD
 NVia9DsOGNO2V22xOI0sK7K+AJFUKVdRfsgueOYpKCYV0yjtV1RQC/HjA5Pp9CKsrXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B671B414E4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C5AA88762; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd673499e1def085fa1cdcf9c0ed092a40e8cb24
X-Git-Newrev: 08904d2a3d56f5b96035b681146eaf8b7bf6b422
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.0C5AA88762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dictdiffer: bump to version
 0.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08904d2a3d56f5b96035b681146eaf8b7bf6b422
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the hatchling build backend and add host-python-hatch-vcs
dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dictdiffer/python-dictdiffer.hash | 4 ++--
 package/python-dictdiffer/python-dictdiffer.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-dictdiffer/python-dictdiffer.hash b/package/python-dictdiffer/python-dictdiffer.hash
index 4984595346..81db815d10 100644
--- a/package/python-dictdiffer/python-dictdiffer.hash
+++ b/package/python-dictdiffer/python-dictdiffer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dictdiffer/json
-md5  524b353b969300d4dc6aa6720c953657  dictdiffer-0.9.0.tar.gz
-sha256  17bacf5fbfe613ccf1b6d512bd766e6b21fb798822a133aa86098b8ac9997578  dictdiffer-0.9.0.tar.gz
+md5  0395b09a297b76172bd55da70dbf033c  dictdiffer-0.10.0.tar.gz
+sha256  0b912acf663949d73b820d3ed59362140a188ab742c94efe13c762dbd24cbbd3  dictdiffer-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f9e05b3b9a6fad24cc67455578bcdfd3e89b09a25c45369a5254203bbe2bdd3  LICENSE
diff --git a/package/python-dictdiffer/python-dictdiffer.mk b/package/python-dictdiffer/python-dictdiffer.mk
index 569f923a9a..e81617356b 100644
--- a/package/python-dictdiffer/python-dictdiffer.mk
+++ b/package/python-dictdiffer/python-dictdiffer.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DICTDIFFER_VERSION = 0.9.0
+PYTHON_DICTDIFFER_VERSION = 0.10.0
 PYTHON_DICTDIFFER_SOURCE = dictdiffer-$(PYTHON_DICTDIFFER_VERSION).tar.gz
-PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/61/7b/35cbccb7effc5d7e40f4c55e2b79399e1853041997fcda15c9ff160abba0
-PYTHON_DICTDIFFER_SETUP_TYPE = setuptools
+PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/0c/31/84b2b2113c2c972431582bffd74f0d04b5efd9126538127b766275580950
+PYTHON_DICTDIFFER_SETUP_TYPE = hatch
 PYTHON_DICTDIFFER_LICENSE = MIT
 PYTHON_DICTDIFFER_LICENSE_FILES = LICENSE
-PYTHON_DICTDIFFER_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_DICTDIFFER_BUILD_OPTS = --skip-dependency-check
+PYTHON_DICTDIFFER_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
