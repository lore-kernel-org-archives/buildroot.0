Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB138CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B9A081499;
	Sat,  3 Oct 2026 13:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHzGF4VBMba5; Sat,  3 Oct 2026 13:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B5B0F8145E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035828;
	b=HjfIUcaL31+JnhR0bMXJsd2t8DOMCZLEHYN67ZeyCJ9nq+w2g8GsVrjqVCm41D/ud7pb
	 CkrvDv8dbhOSSl3+ZHQkK4F2220wcbzR5Ri+p4UoQA6kWCtpPRexodyGqpuySIutXvngr
	 zrUPRbIGUHXpCKo2+TQA0SNz9cD4/XM0KOoW/AU2wqfLEzqgn16FEQKs9jroObqeJ1Kui
	 2WDA1SA+B0V7e3lUbvX+m0LJHRNvQ+VIvgMRLOhQ9GFbyl1fKttqe+yDTNDyrdQWLnaQ+
	 4idA7rgARx9hUnP2dEr+GtzeD+IW7qNejyf4uQymWNqAugU2y0sDOOJfi/sJTR5aHJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DwfoFFX93bd3aaHeZwskJBe2rDus+Vw26QrWKs5ZtvM=;
	b=PKulHSsit5xpLHsdOXdi5JbiqaOb5B2wj2WKyheVI2YQAcsE1Z9LqTdxltEeo1Jctkzm
	 ziI6NulnThf25jfX6g4zYOvRI1W0Yh6L6FUQv5D7oF1phfkf906FLQe8o+ZCZ9gv24Xpf
	 WQmsRjhHkFFT5UWhN+SlcJ0/8tuwz7d4wBmeLdDabAZ7y+eh8SVvfqza0mzG4CyzQBGFz
	 ksyurW+5k6ynFTVa2fJonMNQmVzY/Ty/985AeDaNTjPuHF/RiYqxokk6yQZjMuylDNeyp
	 HgPSAn0SYgkJf4kaAfWsiZN0jHPA4o64DE8ah853XG+1msJjGBOaJkW2j/7qxf1Ey6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035828;
	bh=DwfoFFX93bd3aaHeZwskJBe2rDus+Vw26QrWKs5ZtvM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d2bJvmo5pR0TOj39FtNK9Q+0X4U3wYlLr4IwdVFh2fZcBzHgLB7UJwl5TI4bYFj+B
	 VtWC2zS9H8b/EQKFD5sn6UxSyAp3NmvFDQDHTG0fZoyfGcZ6+4L5eZT/JjupGZ0iP6
	 vZG6FRxrkvcIXf67vdpVO6mgu6oxTvd//lMIWfroeeTfEdDs2nPmNPKpvD2icfmRpI
	 fBF6exBtXxm9DwxYE04Fn5W0PX/UDTX1OsUggXCtlUdbiASZmXhBIQ1+GhbpOQP1ns
	 wRmPL/uh+o8QdPDnCg9aPzQR0Abpp4uH8VKm4euLq4Qn/9yqQi6bs9axUFeSGDl/vL
	 NBK2nmmn9ET9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B0F8145E;
	Sat,  3 Oct 2026 13:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F013E179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0A12414E7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maJvlJ6mbwLV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 29C11414CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=BgbRwfOmuyDFS/Te3sa4EgUvksayNrcSLSqJAUp1bk1c986m2h2kACHeHlai9feisThb
 nhSfmIRvybC5EwwDlHnknutUvTdP7J/VUKa/KLGH5lOD55OOIqQ1T6kB5qq31x8qdnIX+
 Nz5nilrBb9LEPTiQquaDd9YxOsD0tJbUubeZ01B4k/oUVUtcSqT18rW6aO/5RpRql2QWw
 /njYUBSYHH8I4JdOI/yVBCrbIeC5gU4zBWyJYyYKC6S1af5BZ10npFZzIKxifPvxbq3Zb
 wwqDw2LZNu/Bulwrj2vLhGc3VC1/bRXa3K+9IXlM96/fG4q2R6lidLPzUDRYFLy3EOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OIcHU4zWx/ZBsOZw24bJ58fT3r8SYrCDrSCHF/xHNpw=;
 b=tUXUuNojLnpP8l1hOE1l6FdCeZsA0rCH/NpYihmO6mOF3TQ00P1iPQJyAb0HYF8HiH8q
 WQNq44UznH/TtzBFgA1FGGTjr1oIEmwUiQVzUW0zKBpZGTP+PnMxDropZ/Kl8HBn77lnX
 CNO4lTNguns/UCTPSSaIwEHiJuDpe5WY8SNhSLeBcDd3NaRao88HUwySdGa+l1CvN5IQC
 myEGqbM3qjujyeN+Na5YR63a8fbuU3ECMFX2RhUFl23xBcs0+9KfwC0koNU7IbUiFCEnB
 r4Bgby2exbDvlJpGhyy+/cy8qWjIuEYG0Hxg9xBp5lAeBoZ2WwcN/39WqA/kBHW9k2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29C11414CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67CA88A31E; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 256b0dae741fed450fc629003f45a15de2352732
X-Git-Newrev: 999c01f82949635a6f36a9914b8b2020126c5bdc
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.67CA88A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump to version 8.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/999c01f82949635a6f36a9914b8b2020126c5bdc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 81fcefa4a9..dc080ea79c 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  e35da284dc6420c59c1885ccb22d9879  click-8.4.2.tar.gz
-sha256  9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6  click-8.4.2.tar.gz
+md5  39f57e4f423de0d075dd968c29b01539  click-8.5.0.tar.gz
+sha256  ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34  click-8.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 88fc66bc6c..8dd3d25f3f 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.4.2
+PYTHON_CLICK_VERSION = 8.5.0
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
