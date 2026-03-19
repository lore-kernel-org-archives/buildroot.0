Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BBF1090221
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 12:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B204841BC;
	Thu, 19 Mar 2026 12:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwTGNUdcFxRZ; Thu, 19 Mar 2026 12:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9189841CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773924193;
	bh=3GMKflLpA8ANSQw+NtdncrLHeQ0WWrsnD4GtdUUpBww=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XBh8aDZWPvb5TX3n8eT/PSb9ppQupZ/IxVDlEIS2xV3/qzffi1NWp7kJTHzA3lvsT
	 asJHITq8x0fz1zY0cKGVjikB4zBdV4HNwK8aZxIyDdYZxwVaM8jPtOSCyMsNSKH89H
	 kwgwqf9Z0Jdy893XgsTVhwuLDYx7oH/HIs727ZEHyGfHwx/XSBDF3I6XEwOwCwy4h4
	 gmFtEsLr50vQEj1JOcPOYdEcVKaKAS6mE75Q0JO/7mh+zDW2PRpWj/BAhcVTNGWcku
	 MGdbbWNEaezdeQ84LvPObAKhvZ+lyX/aNzWhf/J/fqEFhzVbh+yLFM1WC7LjRu5liD
	 ar5HCYf7lKiZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9189841CB;
	Thu, 19 Mar 2026 12:43:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2A81BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FC766100C
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pYKJPgaSk-H for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 12:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED7DA60FEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7DA60FEE
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED7DA60FEE
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:08 +0000 (UTC)
X-CSE-ConnectionGUID: rNxwcGOmTD2Brth11jWCtg==
X-CSE-MsgGUID: 1Q/Z9RbZQ1SseVRWHGg/rw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:43:05 +0200
X-CSE-ConnectionGUID: y6ESqTgGTGC93kHfYDih+g==
X-CSE-MsgGUID: ITWGWofETYO3wuVk2EUsfw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces03_data.me-corp.lan with SMTP; 19 Mar 2026 14:46:06 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 19 Mar 2026 14:43:02 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Quentin Schulz <quentin.schulz@cherry.de>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Thu, 19 Mar 2026 14:42:38 +0200
Message-ID: <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773924190; x=1805460190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QC/xQXovaIhErLbc6e8Cpn//gg1BVyy1R4100IAqZ2s=;
 b=Fd0xJRydBZcSOhNlnYK4EIDx/MOCW6qMOuWdtqfkwj0o6i59XnZ8e2aN
 c19NDu8xrE/ew5OONLVbSeGFLyNH7OHSB/dkSYwk+KDvs6URMb+GUw2mA
 bM53OFibPiLcQP3cxxVrWVo1DoZJv2Oi642ZlHvSLQSHOlecAM66D7b5B
 mSma0F3K88/ruo7QfGfEHQS7sxHm4oSljn5+H57J384XPnE0cwmJgwUnT
 HtrniAfaQ+FBbrejPWachNPXcPq36JA8PyLr+ZZWZ8JudYnYVwuZNidHl
 6vqbZRXUrJDYX3yWytNQAILebeMuh5aaQOR3PzkT96/p2At6ogFSU6thv
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2025.02.x v2] Package/libopenssl: security bump
 to version 3.5.4
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As indicated by Quentin Schulz <quentin.schulz@cherry.de>, OpenSSL 3.4 is
EoL at the end of 2026, and thus earlier than the Buildroot LTS 2025.02
(end of 2027).
OpenSSL version thus needs to be bumped to 3.5.x, which is currently
3.5.4. Note that a new 3.5.5 release is in the making.
This series brings all the related commits from master to 2025.02.x.

---
Changes v1 -> v2:
  - cover letter added
  - patch prefix corrected from [PATCH] to [PATCH 2025.02.x]

Bernd Kuhls (1):
  package/libopenssl: security bump version to 3.5.1

Francois Perrad (1):
  package/libopenssl: security bump to version 3.5.4

Kadambini Nema (1):
  package/libopenssl: bump version to 3.5.0

Peter Korsgaard (1):
  package/libopenssl: bump version to 3.5.2

Scott Fan (1):
  package/libopenssl: bump version to 3.5.3

 ...nfigure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
 package/libopenssl/0003-Revert-Fix-static-builds.patch      | 6 +++---
 ...rialize-install-process-to-avoid-multiple-make-dep.patch | 2 +-
 package/libopenssl/libopenssl.hash                          | 4 ++--
 package/libopenssl/libopenssl.mk                            | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
