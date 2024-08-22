Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB8C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8C5605AC;
	Thu, 22 Aug 2024 10:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyRKGvGdHa87; Thu, 22 Aug 2024 10:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B55360B29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B55360B29;
	Thu, 22 Aug 2024 10:20:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BE5C1BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 750CD407C6
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lROPfBKAEs85 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F391240789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F391240789
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F391240789
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:20:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B294BC0003;
 Thu, 22 Aug 2024 10:20:41 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 22 Aug 2024 12:20:25 +0200
Message-ID: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724322042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ntcvp9GytbQFpTtYSZ7Qf+fcReu0dW9Ug0DLQ5sSWqE=;
 b=SgYoe/qtTAyy2YG8U5OISY/ETQg6Fs7q7TtRDyBwocBbKbSgWuCG3GgdjzmqzyMp2DwZMM
 ObIYkFm3Aa7oPUQHiUgJVDdhbQuwSnkJBdbKUEvg7VqlEwt9XpczE02LFiv3lrFlp4DPQY
 LF45QyyqLLDVPFkxcEYK3jaPgh9tjehpY2pHuYl2YrnY2y+3ZsFln9RRcbM6za+uHpj4OB
 Uf+HEEOew2kG0GZ4S0boIQMad6Dr47idTRK9gasua5SjEjqxlmQO1dtduWUuox/DC4Zenq
 ixBS5lghFER0mVwOidWOW/wlYV/XnYOvMBElzpD8z674Wm+JKF6AqKvMF1ZCDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SgYoe/qt
Subject: [Buildroot] [PATCH 2024.02.x 0/9] Fix Qt6 CVEs in 2024.02.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The Qt6 version currently packaged in Buildroot 2024.02.x is affected
by a number of CVEs. This series of patches fixes all reported CVEs
affecting Qt6, by backporting the relevant patches from upstream.

Some of the fixes do require bringing along some related changes, as
they would not otherwise apply without significant rework.

All of the CVEs expect CVE-2024-39936 only affect 2024.02.x, as
Buildroot 2024.05 has a newer Qt6 version that isn't affected by those
CVEs. CVE-2024-39936 is already fixed in master (commit
b866afa68405564497dd60c1f8f33cdf71d22728), but this patch series
provides a fix that applies cleanly on the the Qt6 version packaged in
2024.02.x, so it should be considered as a replacement for backporting
b866afa68405564497dd60c1f8f33cdf71d22728 to 2024.02.x.

Thanks,

Thomas

Thomas Petazzoni (9):
  package/qt6/qt6svg: backport fix for CVE-2023-32573
  package/qt6/qt6base: backport fix for CVE-2023-33285
  package/qt6/qt6base: backport fix for CVE-2023-32762
  package/qt6/qt6base: backport fix for CVE-2023-32763
  package/qt6/qt6base: backport fix for CVE-2023-38197
  package/qt6/qt6base: backport fix for CVE-2023-51714
  package/qt6/qt6base: backport fix for CVE-2023-37369
  package/qt6/qt6base: backport fix for CVE-2023-34410
  package/qt6/qt6base: backport fix for CVE-2024-39936

 ...make-sure-we-don-t-overflow-the-buff.patch | 106 +++++
 ...atch-header-names-case-insensitively.patch |  57 +++
 ...maximumWidth-for-a-text-containing-s.patch |  88 ++++
 ...maximumWidth-for-a-text-containing-l.patch | 168 ++++++++
 ...Fix-specific-overflow-in-qtextlayout.patch |  79 ++++
 ...ay-fix-ambiguous-qOffsetStringArray-.patch |  49 +++
 ...gArray-fix-size_t-qsizetype-mismatch.patch |  37 ++
 ...-use-qOffsetStringArray-for-storing-.patch | 114 +++++
 ...der-Raise-error-on-unexpected-tokens.patch | 406 ++++++++++++++++++
 .../0010-HPack-fix-a-Yoda-Condition.patch     |  43 ++
 ...fix-incorrect-integer-overflow-check.patch |  48 +++
 ...-change-fastScanName-to-take-a-Value.patch | 112 +++++
 ...-make-fastScanName-indicate-parsing-.patch | 277 ++++++++++++
 ...certificate-not-signed-by-a-configur.patch | 295 +++++++++++++
 ...demand-cert-loading-bool-from-defaul.patch | 116 +++++
 ...communication-until-encrypted-can-be.patch | 248 +++++++++++
 package/qt6/qt6base/qt6base.mk                |  17 +
 ...Initialize-used-member-remove-unused.patch |  62 +++
 package/qt6/qt6svg/qt6svg.mk                  |   2 +
 19 files changed, 2324 insertions(+)
 create mode 100644 package/qt6/qt6base/0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch
 create mode 100644 package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch
 create mode 100644 package/qt6/qt6base/0003-QTextLayout-fix-maximumWidth-for-a-text-containing-s.patch
 create mode 100644 package/qt6/qt6base/0004-QTextLayout-fix-maximumWidth-for-a-text-containing-l.patch
 create mode 100644 package/qt6/qt6base/0005-Fix-specific-overflow-in-qtextlayout.patch
 create mode 100644 package/qt6/qt6base/0006-QOffsetStringArray-fix-ambiguous-qOffsetStringArray-.patch
 create mode 100644 package/qt6/qt6base/0007-QOffsetStringArray-fix-size_t-qsizetype-mismatch.patch
 create mode 100644 package/qt6/qt6base/0008-QXmlStreamReader-use-qOffsetStringArray-for-storing-.patch
 create mode 100644 package/qt6/qt6base/0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
 create mode 100644 package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch
 create mode 100644 package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch
 create mode 100644 package/qt6/qt6base/0012-QXmlStreamReader-change-fastScanName-to-take-a-Value.patch
 create mode 100644 package/qt6/qt6base/0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch
 create mode 100644 package/qt6/qt6base/0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
 create mode 100644 package/qt6/qt6base/0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch
 create mode 100644 package/qt6/qt6base/0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch
 create mode 100644 package/qt6/qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
