Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A595CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342F58143C;
	Sat,  3 Oct 2026 15:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SI6Hfz7VSg-S; Sat,  3 Oct 2026 15:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 687A880D85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042879;
	b=CZYXc1NdWumwZs4Rom6vPenkar624GnsblHrQjqH9gM8780BEsqZy3yqC569RaFY3+Yb
	 cqnApSrkQLoif9r5X9e4823W8CfklXkyv95K5RQRu88pLsi6Fm0d0twbrLoropIuvcV1D
	 Jc3XkZO2OzC9VhNClUYRCw3cXIzK/etQ0/nbNFf9m0pqqWn1aWlYY6/na9/lFZDcfZnGh
	 fIy5WnCoOcvWJ0fj0ZdKnAdLBatDjao0CQokTjzYolB7VHDheuccJZGJl2Sjt7L4w2Ipq
	 1mRvxcH/LKzb6qacNp3F3/qaAYmZuIgv5QziV0jyu1j45fAccqFxn6cbKtWUpjQ+CYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ccIYSB5vYXlMqCeOu4l+B7UdAEITFaydwjzy899doyc=;
	b=Va+TF+Lv5Mb1wHqInfCwooRzYCx95B0xtfzBGN47mIgDpIPhZkdJkiKCXpePkz/AZ7to
	 RISgCWstcTCgUwMQQ3u05k9CeUIGzCDTABfOIduYyQ3NWa/W8zEhNyAbLtYA56bu0coXv
	 HG9iNCDZV6vwiu0TlR3V8fal4RJWIWghf4ilqN4A9pg7S1+oWPvhngS3NwMx5ezcT/PFY
	 4pLzhL+Y5Yed53dZsDcfAONyjys7Cnhle5Y09C+yi3T2rCr5UKuSYkgU24C/jvek6iK4a
	 dbvEZYpowHj7vvjR7HfDbLrIN2HAUKGnW5J/Q64UHlNWURNZ8psJYIfXCrEF60NWOng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042879;
	bh=ccIYSB5vYXlMqCeOu4l+B7UdAEITFaydwjzy899doyc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NlOg1q8WPOS6hFiWFN4lXbIvf1Zs/+dltIcmjJRzZHDGcUNpiZldXwEpRHPrG4H21
	 XqhZ3eilwtQYdkygwuas6b2nNCUdALA6Hm+23JipO1E/n1aFbvxDB/d5qNb09XLBmi
	 ru+MxBVTKs/ydS8/dP4v2wyz5Ktoh5bxoE+HtW3x4PD3x6isrSAeQhJ3sBm2pCGYj4
	 rgiGdelF0eewpdyqI2RDW5aLOKvHnwrnA6mRjSOJyyPogOGbyhQqNGqdiM8LEIFG6n
	 elt13YsVdtkgysDZpSjOZe1eCgCPShj7V5lMWOujAKLPTnqcuXjc3MtERKPD5IDaiM
	 4sfnDOmdT9Fhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687A880D85;
	Sat,  3 Oct 2026 15:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE881D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F946400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZKK25l93BpT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8C78C40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=oRV8XcGW61zKJc/gS3ovslm+fDDOAbP5NXLU4k/vFPp2236NrDsLorjpTQrxTtF1X7By
 EzfAm3yaVsbgDs+965OwgxGZ3rFlofsSJZbsmVaTQ0Mlyv6kzDbUTB2f4w5QseBrDK8tu
 VxYirJ0c2VqBmpQpYMqzRJJK/hEfHTk8pM4PMKkm2ekOWTKdlq6XJKr14+1hVfp9uyRYp
 TkyvOWGNhZz1K8kHFngzWi66jW2l6sd8naDTBToR8uByrru+7NCSYlv9tFXZdfd45mOmt
 l/cG5gbYHqYZls30mGTur0olaHGSBV7W0RYuVY8A87BXdEwSasTLMUJg2hS8/H8Eucg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6UIBkswhNk5ngDlsXhb+sWrXdlChZ69tnQdm3kb5UNk=;
 b=XendPwVT+hJ8a2elKAa/ZwXYBklV4KAGeBvQFYPssUV9JsHk+P7EgD8Qp+NMcviUFvzK
 5LPqc/1Ll1Iu8eg73TeQIebQSNHRPBidAZJhitt9WhsV7NxxJVrfmDTUfUk+ULQa+pFUl
 UXFzc5iLZWy/iDMa3ScNmFuZBlrAhzIilHrtoXATiB+AzXncFYiYSV+HDZOpgjvBO9OeR
 BhhG2amiLlaThyPrEfgzfaCJzKBabJvaylB76TyqiN3ac3ITUOZDqYbkEWqsC/K0dEpzN
 7sZOK2v7/F2TJbG4IVrvrhKVU1+awJck1p3KJ0BwyLYcXRk3OMF2ZYBLaTa7WQ9wmIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C78C40049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDC798A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad11789d542762c9f6f93a38f41a47306f4ad160
X-Git-Newrev: 49ede56b2999921a7d6df77bb54d27c370891b42
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.CDC798A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmb: bump version to
 1.2.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49ede56b2999921a7d6df77bb54d27c370891b42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysmb/python-pysmb.hash | 4 ++--
 package/python-pysmb/python-pysmb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 55374ca005..ca0c4279e8 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmb/json
-md5  a719b8d2f333963ccc7cc71d4fdea184  pysmb-1.2.13.tar.gz
-sha256  89d37fc4f061acecf40e6864e555898f2ecc49994ec06949edbb94b94239a808  pysmb-1.2.13.tar.gz
+md5  8d5160914f8af29a6b50ab56b9062801  pysmb-1.2.15.tar.gz
+sha256  1c12eb0e251152e80b4bde5d816b33cab14d04b261b5f790cb4a5d9fd9653881  pysmb-1.2.15.tar.gz
 # Locally computed sha256 checksums
 sha256  d2ffe0ee7a0160534d80e21a8e531d78e67d9c29ca83b0c41ded5f7f6b50b551  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 9c8da126c1..17ec9d2c8a 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.13
+PYTHON_PYSMB_VERSION = 1.2.15
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
-PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/de/79/f9a2f2f3aea92ae5647079fcbf28e3969de9af7953bef10e31898fe435e2
+PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/9d/84/f5158ec04fdd813aa4f8df229a5f6319f20c6a555adb3967a33d69e24347
 PYTHON_PYSMB_LICENSE = Libpng
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
