Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A88CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B5A760F8D;
	Sat,  3 Oct 2026 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjpZqQsYCONn; Sat,  3 Oct 2026 13:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A62BB60F84
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035867;
	b=FWFRDRTpXXs1uOZMK3pDpQfrPUQAMXi8Kz/i/36e7QsvvnIw6yyZ9kPAnmUgnJEpcHVv
	 o/7xw/vNws/J8usr3jCRRVKpeGW5cKpg13MICodqHQIbk9p4H2YXJ7KBrPOOaNmcvv13n
	 jo+7IJT0Hj/QEU3FJ3QYQbWaCVF+PzqZi4vcPKk7u2WpWLbGhrvm7VcaEEhM7rXZBoGEb
	 +4tjvHC4/AuGQBh8CgKzTValpkX5XqNwLb6dGv1OEVxBacZpsYQ8LDxp1JAeCl2scskt4
	 cYRJrZLHQlvvqSSPKTup4g7VIHbtWbNI6hgMZEYcxYE9/JV2AaoNaK45zrvfYJQZWBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ftFy7iBKGEsv3sUhqr+LIdoTxcmGyLaW0bfl9g0dFZc=;
	b=M8gBa4skx+fqQ0Wg1Tk2J/QbECqWVzrXkAJO1eaWREGxH7ijUOP9/ws2QG1r86ZJtRuZ
	 mr1emkcldBVdd78W6R3wrJ/1g9Ef8b9cRhPefmKeKp+7Enh9A2169m7yudfSDIbfOW0yB
	 P3y3CaimE/NzmMIbFGKD3KB//Yu1GVx4gZKUYqJURml2OquBPgkKertEuSV8M+e9x/rRW
	 aO4E34BCQUbmK8/ukfUgXwgLahWMswCNcIlkXI0strGeBnfXYrKroIlqP0rp3jIwCz1PJ
	 19eea+N32IuWPHg0y0fnR4glB4nQoYBhWtCByMdb09JA+6uueDv0iWgLProuZu0EGUA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035867;
	bh=ftFy7iBKGEsv3sUhqr+LIdoTxcmGyLaW0bfl9g0dFZc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BiwOn2aJoMikCpiM5UQxw/Uy2Ek5S5UEj0vY09f/1XyVPV4yZCYSan2rElLA2SAmy
	 aVWT+PhoJPddH7hVI40hFvWzsINuk7Aws7F1F1lzNrzyC0AXIS266jGFE+/x/OSUiH
	 VWgGQUgc0LmAp0FWNy9QhwcDWCH0DAVwKxa//IwP21BFUReREBdad/lroUA2/Em8yU
	 wtxnzfN8IiRKlCe5g7ABK6vh67Ex2cDJDl0qFk3pMCpJORMVdyJqLLW1TWv44uR4eU
	 dgqeRkrcD1F0HPZdSw0H+jUykN1gPLIwJ5uUyGJKJMuwY7wXy694G4O6JsCJWaS52M
	 jQsO03aIAW+Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A62BB60F84;
	Sat,  3 Oct 2026 13:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FE9DA12
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E81414FE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1ezEn0NakHc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8F0F1414E2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=BN3hIEVa9W2QjXrwewmVw8XVmjzdpk1V+spHIyGwj+7EzARGD52GpP/DGCBdTtuKKlLS
 Gmf1OGGGFJp7M9vUQskaGO/vzoJ9lgSRM8t7q0nb9TpaQfus+/lguDsxFApEvAsDILQA4
 EXpc7bPdew/Sqzx8gTjX8nxOpSAg+QHBTJan3i0X4t0CYuSUMAab7aSO3KCItj70f+PTa
 E9ylX+pX0KypWyNjPhVtJfvvrYGhQ995og+NZ3wTqJFtJRsXSGoB8vrPdvWu1K2ivdUvW
 rpzVXttpNWjDQnTPt1SFIT/V689TVnaMjrQJGA4yjzpL1I4CjI+yte+R1EewtYPhKzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wUsXfGtP8pprs1gAbSXrXaQi2VZA/vqgmgqIR91tblw=;
 b=PrOcypR5Pdd0qyQcwd3GfzeEWU62yj5DaEqlVEj/bVacdIb4+cGG0Aq7+gbYyjnDa9av
 iCaOS8zvZWNzwhfjgY1LzlclPeWHQ+7AvLsUC7sRe6nXG3v20Tv3ew4ud147eSGjqyql/
 SEoSl8JKT8oNts5CloeGk4kSX8dTL9zZ3MN0fYyGOCwRzcrmh5B9JuVffy9P2kjzTYmyM
 SfLe0FlUuMECOhy6OIyOZI+zYdA/f4Mw7WKP1SP67PNPNlmsAfrM4VbDeXnMQaPs7MmR3
 3GTiyrYSSu4jGSBSprWMv8OWN6jZuHQT/DzKrTjko91AoeA6wNqbpg4GY6iP1InlsPw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F0F1414E2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAAA288699; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07c4b03cd4a50806aa0e09ab090173075bef9343
X-Git-Newrev: cd61c7f16fca3ffa7b811ad697ed9840dbeb84fe
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.DAAA288699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yarl: bump to version 1.25.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd61c7f16fca3ffa7b811ad697ed9840dbeb84fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 1bbc3e9edb..e3f70e83c1 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  323301056acefbfe0d57e8ab8ba33eb3  yarl-1.23.0.tar.gz
-sha256  53b1ea6ca88ebd4420379c330aea57e258408dd0df9af0992e5de2078dc9f5d5  yarl-1.23.0.tar.gz
+md5  e79fd328e8d575b8c7a1766fc7fede31  yarl-1.25.1.tar.gz
+sha256  03dd38de09bc213e9a8b29761eec33ee1d5318dac0e49d8af36e4d27830e23a7  yarl-1.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index d04713e569..11fa128efe 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.23.0
+PYTHON_YARL_VERSION = 1.25.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/23/6e/beb1beec874a72f23815c1434518bfc4ed2175065173fb138c3705f658d4
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/75/16/e8be8e2fb175bbf41a0680381a319f1199fae256588241a2ac8677eafb49
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
