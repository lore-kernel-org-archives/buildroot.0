Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911F0CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A8E60EE2;
	Sat,  3 Oct 2026 15:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa7l2SdZAT3S; Sat,  3 Oct 2026 15:55:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 526D360EE8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042950;
	b=drSkQmwKOr3X5a7EZCVZtMQ/tWldD4cx0hd2yLzfTh9ibS51RV4xwseMZmedOX0nzzyn
	 SAQ4AvqaKqnESJDfnz+OU/d65OFUmg71ZTlPj9YpuZom7eMTbogEAjvnj1sxmIClsBckB
	 v1w8BwWoQdlkhKcLONYFzFNFjmhK6sDpxMI0x5LeuEcT3XFBugbXcmqR0YKU9ZqydWUc5
	 V8jpiFTN4KaHpCllQ03LrQJQZFz665ijB5EqfxatyGvyvIyp1FDNPx9NFiM75GvmAAg6x
	 h2UDdlPg7rTM5TpeLtd9WgyaN/Fd4CtvH1Baxo+FHYT80oHAKKdbkdEKgAQOv+RjQww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nhlR2fNRsFMT0aThmIlofGvtMZMOgwMDytSEvFqN/UE=;
	b=q/P+DPhjBfgOgzuDbonUmi7auQJ0dzBmTuk2lBrohG5wVRlwIrwxgj14QBHPbroQ7aea
	 fgylhM6sgI+0lUlqi5X5CcFEawdiQ+XY8E8ohbf/3EKrus6X5+W4tRd3Brm3FkctKCH16
	 N2P2huHiMcNOkgdf7awYWFJsyytAb0cfx0ccn3w6ew6NmYC088gKH5cuWldIHHVdBLf9z
	 6vPGM+Krhq0R/KOm0BDTZ2Bywdx3hjrjhBHK3KzDRS0kBNjR/Lh9+Dwr8wFUP5mW2UI2Q
	 mg9XWqxXDfFytgesVeH/4XTcpqPLBAQeMz1F0vQqbsn1Z525M6BP/65VBop03flhpJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042950;
	bh=nhlR2fNRsFMT0aThmIlofGvtMZMOgwMDytSEvFqN/UE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=esBXXXtx6bLP9uQFUTUKAjvPQeISsr7WfrkZiMl0J1z/fcXEozaTjrUYUvy8GafsJ
	 yKYU+WkuTGYXU/7U0u12cGattMa3iZHXuhAZR2cpj47TuQ/dggw1KAXssWFakhMrZ/
	 e48dMgPExWM1C1ecH+eCQZqgefCFNx+lbHzNqX6vsrg+5T1KLv1I2qqpTHXB/0gkoe
	 tx7utjUW/nSaHl02MLehWgtCjJetIS79G+X50DCD1a6WZDb6MqEu0TUnM18SaXoMMT
	 6rt8o/6n3uqg98n786GnTCHXnaskSf8UnsG+m9373P8mrDA87Tm+Q8qcJCgMoFs5ye
	 5cl+pxwlLKBig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 526D360EE8;
	Sat,  3 Oct 2026 15:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6968335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9AEA606C4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZSpXZ298a9Y for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9873F6069F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=i0vz2DMrLMai6Vhmr/mxw+hm3/DZb8zwk/Dya70pOt9mQGBilxzuEug9c4LlGE3FL+Sb
 /mCQ+sJYoTKY4iAqf5GHznFyJj+UNVekFWUQNrEL2u/IFfOdA7WD0AXtmwWltFSp98L/C
 Vsa5/47ftOMSwUfGUcuPZUxxvGVYItkdJCsIHVRNB1TRb4Nhg+/TczMkkqdZhjWnVzipb
 sQj/KmKwODmSfBd8J6hVYzLe/Lai9Xigc9s2tN+Q5zmdVDF3+mvrFUgdRKaSt9lcA0Q7M
 enATAsk7xXhcvUn79Jp/3ox3WKtMtk7dL7fDP6qbMDG0sFLNNBJvWDGnpmuh+DqvqTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+RDSu8GRTw6SUrRRYtA00S0zM1X6MPmC0CW7pcDEapU=;
 b=IIhF0sxTW49D1jQu5Def+rbt0cRfU3NhJVB4TmR9gvvOGWU23kSbMqMnkPIHuN49sEWe
 Pe2/NbNwgDdaOHDKETQ6EJP2AobwicVxz7HsQ8oxjoMqKRFyafz9+VPB2W2rbSHTDteFu
 GRpCOvdifZPZ3jS8dsW4xnkT9oCspbHbyrUUdUFLhoPv4gAmXxkpGZgoNrZ6rlhdkQQ61
 VlYZtts+KqLc6BBSWPm9Y1UYr+Km8Z3XnXrbLLOTgygUQIJktImt+Oi009afaQBPPPpad
 lHfvLj9ZZq5QQ53oQv+wy+EHL5b8FWvTHvTDo4m9zhjsqOZV/QTq0cMP3q1A4G7UX6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9873F6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9AA888806; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0b917292835da43571551f7ef7eeab7f6717e3b
X-Git-Newrev: 690a8eb266d79436f60c0cc2d70970d5d42786ac
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.D9AA888806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tqdm: bump version to 4.70.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/690a8eb266d79436f60c0cc2d70970d5d42786ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Louis Aussedat <aussedat.louis@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 4bb81e11e7..33a1e08675 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  e1be20b64fdb913d2246c635cdf97b28  tqdm-4.67.3.tar.gz
-sha256  7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb  tqdm-4.67.3.tar.gz
+md5  2f74946f88e128654c7c03cc89570e38  tqdm-4.70.1.tar.gz
+sha256  cefd0eca11b2a37a3aee776544d4f4ae913f02688135b5556b8788dfa474afc4  tqdm-4.70.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fcff87c3a47ce8028a8512aa182d4fcf0ad1c90544ee75cf9b343684cac194de  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index df455973f4..6c7e762ce9 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.67.3
+PYTHON_TQDM_VERSION = 4.70.1
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/0d/ea/b2a5bd54b28a324dae8211928b2d730b6547500342c7e6c6dea08bd0a485
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
