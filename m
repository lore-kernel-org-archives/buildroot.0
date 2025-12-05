Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1653BD2F7D2
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 10:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3FB84668;
	Fri,  5 Dec 2025 10:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19OnOsYAyCJz; Fri,  5 Dec 2025 10:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68A7845BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764929201;
	bh=hdKURBP1hNMV246lxUvdHieUWQQJ4xYhqdvhIFaJH0Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=YtVB3cMDzuAb5sadkNdI8yQLthiX48ATHyiKsJZ6OxX0lCaf05kFh0U0JyW5Zo2b5
	 1tS+zuU86okWVvb9BJd/9sufJzstrugtOigdQwnXoKoReHoZoJqwiDwZDrkR4AErPp
	 y+u+XmUcI3jhe+tUjleD7ORtNTH6Yn3vGD0+doMgIqZlWNdm+Pkl1V2cF5BsKnqe9w
	 7In58JgQcDzzueSWuxYmg929C8sp5Qgs726s44A6NvF2edwHipMWOy2gvqoGFCGQmx
	 ZQcPh/7OvVkBV1pUofNXfdHJzpPEIdYJ0xVJPP3F+5YlH+BB34avE2LxOzeLUSOtgV
	 hBhd3TEmRcplw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B68A7845BA;
	Fri,  5 Dec 2025 10:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 294F91A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F078607D5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qM6iG9nQIhD1 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 10:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86EA460762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EA460762
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86EA460762
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DF6C5B00565;
 Fri,  5 Dec 2025 11:06:33 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Fri,  5 Dec 2025 11:06:24 +0100
Message-ID: <20251205100626.66819-1-vjardin@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764929195;
 bh=Y33x0u5SnSu2vJ3WBNPPBOyyFFECNj2nda6q6gob8ZU=;
 h=From:To:Cc:Subject:Date:From;
 b=NS8vDjEH5daQGEPzvka/6Dyt14Yzh3VZiLkpzhk8Dk4jFcY41fhzrhA3tzG8PxCAv
 B/DvnhpHzuxl4DwBnh4Ej4eLdoJmNttiozv5xlATTD81KdwPL2bYUbuhgD/mFVM9wp
 Fo+pw82VQGgKEqSDp9LZEOei740rLsOslurdH5qedGU2tvb8OBcZtx6GM00TvWtrWy
 Sn/QXsGsaVWJ1/1SpWzSn0GLp4XhLy7ueCboT6pvrm28KgFg9bINnpn8HSaBEsM0/e
 jWENu5W2f92I4rAKEwVNgv6YPf44RO1H6D7NY3ZAWdVMzr1u0atW9mabch9GJO5DcF
 GCCNr9EfFMmBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NS8vDjEH
Subject: [Buildroot] [PATCH 0/2] package: add libyang-cpp and sysrepo-cpp
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this small series adds C++ bindings for the YANG stack used by sysrepo:
 - package/libyang-cpp: C++ RAII bindings for libyang v4
 - package/sysrepo-cpp: C++ RAII bindings for the sysrepo datastore

Both packages are used together in our projects, hence sent as a single
series.

Runtime has been validated with the following test configuration:
    BR2_PACKAGE_SYSREPO_CPP=y

Both are sent with the same serie since since sysrepo shall be used with
libyang.

The series has been built and run-tested in GitLab CI:
  - https://gitlab.com/vjardin/buildroot/-/pipelines/2195059828
    >> it is the state before those contributions. It shows a problem
       with the bootlin toolchain 

  - https://gitlab.com/vjardin/buildroot/-/pipelines/2194922330
    >> ok for sysrepo-cpp and libyang-cpp ; same failure with bootlin
       toolchain.

Vincent Jardin (2):
  libyang-cpp: new package
  package/sysrepo-cpp: new package

 DEVELOPERS                           |  2 ++
 package/Config.in                    |  2 ++
 package/libyang-cpp/Config.in        | 15 +++++++++++++++
 package/libyang-cpp/libyang-cpp.hash |  3 +++
 package/libyang-cpp/libyang-cpp.mk   | 22 ++++++++++++++++++++++
 package/sysrepo-cpp/Config.in        | 20 ++++++++++++++++++++
 package/sysrepo-cpp/sysrepo-cpp.hash |  3 +++
 package/sysrepo-cpp/sysrepo-cpp.mk   | 26 ++++++++++++++++++++++++++
 8 files changed, 93 insertions(+)
 create mode 100644 package/libyang-cpp/Config.in
 create mode 100644 package/libyang-cpp/libyang-cpp.hash
 create mode 100644 package/libyang-cpp/libyang-cpp.mk
 create mode 100644 package/sysrepo-cpp/Config.in
 create mode 100644 package/sysrepo-cpp/sysrepo-cpp.hash
 create mode 100644 package/sysrepo-cpp/sysrepo-cpp.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
