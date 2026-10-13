Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7214FCC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 359FE80BE7;
	Tue, 13 Oct 2026 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ8bFfVIKJF5; Tue, 13 Oct 2026 20:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 322BF80CC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924766;
	b=hUm8A3/Xk/lfuy6EFQpX61Dg9/GETEev7VHvjnrCAdLNv5jRKIyNCdl6Tiugds33l0vX
	 ZMx0eF5otdq3fUBJM50ZJ7QyP55rBMl1vN5RfF4jMLrg4stBt+jaM3Zu6NUSX/qmyKgOC
	 +4iXD8wJGNQNklKx/6vG/kZipNKtDNQioosbc71Pscnm75IZGGnz9aN08EaweMYbyB6+t
	 85qhcScGle1Xcj8oirTJ7J4ZJ2K35DNn+5XZyQOETUfl0/KDgvE2zhQuEBpfqBrLPmNgi
	 3G5aCR9CJ+cHSg44nbF8Ma6bP8HmW+o6NYNH03VOXYmfKxVJMs/kv6NrDtcoSdV5Yig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vvF5XXZ2FHZMURetwfdWfZ3uV+K8PTJEr18kAbztJ4o=;
	b=lCMODMu5avKH2Gu2wlKH4RJFaE4HHA2C2BsOOdTvISRxykr/iIl9G1lABia/1Moyzbsg
	 qSLJbfaykStlj5v4CSnwkjtpgSpzyaPClk4Ka96YjwaxEpyGPrvwtiB5hqCnmScI1O5vb
	 d/PkkeVSu4BRxO/ZJFBG0RUPKvvzeGEcu0n6dZOvXQjZHfMV4DaX7617RZm362gNMGBHB
	 5CJprEtgrR2YD0njRGOEdNocMT+m6op6mVC2zP3+edaqmGdJSOWj3gqlhVTnqj1iGjxbM
	 MNrbysgO6hDWYbUEWctoFN2Cw8r5FNmuA/2vg5KUgOjyIe3nFzIUKxlaIK0WjZRcnlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924766;
	bh=vvF5XXZ2FHZMURetwfdWfZ3uV+K8PTJEr18kAbztJ4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dzTIRz+bZU9qiENJIEw/e9RBM8NUSuLAVPY+4qoAe5O2hxapT4KI3zMhMg35vfPPv
	 r73KZo9n6p4DlErrSEkWgS5zIW/7bIyKpOwgnM0Kkm6oePUSF24Rmo6jYKjW3ssLHf
	 MgDDtGOcQ8V4me4w642Lia1JPQfGjJOwzbxYxE6sWYCV2qgD2f41Ef3/4BK/R87w7m
	 SY41CjXivCZYMrcJ2qK9eRPSCCvrpN8IzXBLsbXUvLH+IkGChBPw3w0leG9K4WAkny
	 50DhRm+5rgDEhD7Fb7IONVPCjewbakG0eYSFvB8CvcdUcBX6lWGEXAzoegZR3nm/K8
	 ixGYvQWj1Igpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322BF80CC2;
	Tue, 13 Oct 2026 20:52:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C503D13A0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB1E607BA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTB-bO7EyUoK for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 14C65607D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=VR9vmCNZrdHqoey2Rxbu9Ps6ZYgamNmNayhyiCJDtJ67+IGcOw38FTP42Ik2ZondhxFz
 VAevVyhSry+QZqA2VM5t2B1HfwEXnko8I33lRxhKznPfJUVC2oXz8xST9RHS+Z8wIbzy4
 nLrXdYZzCoB7v60WwwI5ZkdbS1Y+yyAODq+A80mBFrJjjrfBSlenqzIEhcOruE4egr/I4
 eW9727sDnmqu80C/T+4SCwZyv5p/avGrBUYKHg4O0iduR/zC7+a1qNfNy78d28jfN6nDj
 iDB66EvhEmaxjiO/FCkrF9LUm6PpOFVqEvVxy/MWEiqxPJzvFxc9B869+4oJrS0FT3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9WpCsstF20GupWuiWoKa3ABUWBTaMlvBHNorVDzK04o=;
 b=ADd41D1v+FFnlND2dMH6JswSZcPh7H9jL6UkM27x4zNwO0IJj0oOjImAXq/m10hm1Edr
 EQ1xRqbvCI3thoNkjqc6WP6gT4qv4OedDeiy4rSe4PE3l/JFIgl+4G6lCGkL/2vlgdIlJ
 2WbTUMdNPxwVhNgBHhFZBoPzcaYZNY+N9u1dsrC+JTMeY2YnwhWFfJIlrD37QCTJfCmfp
 LnUpcqUD5i8CTPNXNzsSqAwryQmWdSXgNL/U+Bw3xRC7PzHaIAwlydU0jXwlvY8rZVOki
 uDUmlXhRKvWLF4HPmIbw19OKyjYAN0SwzQBf2rU++QHNW43uuiyJUuOs3BW57w/GGeg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C65607D1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DE739550E; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd3948ae7aa4ef0f50108a287d2e7667c769b4a1
X-Git-Newrev: dc57e6aa8ef34390c19b90b0ac0563b470cf4c0c
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.4DE739550E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 7.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc57e6aa8ef34390c19b90b0ac0563b470cf4c0c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 50a36404ea..f444ad438f 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  efd429da40e56f8f5e8da04b381d7002  multidict-7.0.0.tar.gz
-sha256  a7fcd089a0af2e0ef053c0d39c22c9ebf2434dddcb91034fd2f59ec99623788e  multidict-7.0.0.tar.gz
+md5  014816498e1cc303f03b9e552bd68153  multidict-7.1.0.tar.gz
+sha256  61a4e5d81b8d4e4ad61964b230129e7a2b914793d96289029078fc9009f074ec  multidict-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index f7db1ef314..8e33c341a6 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 7.0.0
+PYTHON_MULTIDICT_VERSION = 7.1.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/c4/64/642465a4827331a98ba4ae29f97658be25d1bdcb868872a2f78f7482b507
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/84ddb5ba16c4eb2c69c71db76ae3c579fe546e511f7170c7e27eedbab7c1
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
