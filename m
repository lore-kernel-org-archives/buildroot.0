Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88DAE9411C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7316F60720;
	Tue, 30 Dec 2025 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_AgGth1FDIy; Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D657606AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082764;
	bh=EWqsZ2iAV4OEv4BhJm+J+yWeE09cwBh9yZRoWBxGsac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=iHCFSVmTww0Wug2RI7GiFNgYICkM6LaGGoEyYGzg3ud42ngTJNJ9wkxPbpAfa6A7Q
	 hUf/HTIGXnfNsPtX9BVd8GFTVxTc04fDOXY6CE5dvnhm/vU2E325d9oSBU8i9JpW9R
	 KuRJjA9sEDHIK49Ms5GepMm0z6haiLhxF2UYjGGAOQC8J9lntoJpsOuqqVcTjMthS7
	 JlE8EebyjL7bJoiVxr6+XmPPHDjJsouh+QYcahJlZwMBLxfnYXfIz6qfd6J7LhblOk
	 n0OowLDQ/D72l1Sm0K7w781ZjtYpKfP7w3Ty/Lg+E0535DbnmFd3x6zmsJusHQwOPG
	 eZfbOmouA9XGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D657606AE;
	Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB17D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C83A403EB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ4SPCQMPGCj for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A01D6403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A01D6403E5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A01D6403E5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so46461575e9.3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082759; x=1767687559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2sv5Hklg/oDB79bXurdqdiMMquETJpCFH+KTQVmi0U=;
 b=W0bMQ53Oqeg502SvMSXO3dKw9J7PdfP7C9nEdA3XAIkV1BJ5C4ml0fHXQ/gStQ0xYn
 q2FRIvZwYeT2K8E6gHy4Yhhepgj/t0hF8MXzob/xJGun3bNZxLkL4gBO2D/stPVI/oR2
 nuUXAvTGMTbes9UvJ6M6jBSnUp3Iic9fOZ3parFEjJmYLA0D2YkfUFa9vCWwS6P1SwKS
 dSRelG5BNgAkvz5S5pOAbVjMtRR0pb/UZS4ta7DcUhQC/kX1OwMDbfu0sZKeaNLBhpA5
 wvcAjFjt1Mu7vrQ3QqkTQeA+Xzz75mFWAhI4uow9tzVyKEa9TiVZ8cvdLOLNSWkmB4Jv
 n2+A==
X-Gm-Message-State: AOJu0YyR+lfugWazMAWtlQ47F7RQTYkEfzG8G7+/DE69v5FrRV/+b++o
 3hKUKy5BlBPms6MIMaQtdIytR3ktMj5qbbVhxPNQg8vWlGPAzEEmH/G5DUSm1iuypalZw7cQMS9
 0gWDFCt4=
X-Gm-Gg: AY/fxX775mZlRFnjRATtV/qU0O8ePdNpUG915Ax45UDlMJmIS+PXZLaOCx2XjEbmTkE
 qVLnawsZSzlfyT+3/6xhhjBP782iGBod1yjeYQGXlL2Zd8RDAr6Ivsoylv8yye4T/48sqh3CWZO
 VNuzU9K0maI4+tNYhoKRltlbqbMOx37tEHCxMgTKBB0wSebtfxTwY9Fe1omDTr45gV1RAUrvrQc
 6EUemhgulLjedXzywyDcUFi8VVaDIdYwGmZ6H4C/wFyTie9iZTxS18knHSL1BnnCih7LzN0+OKQ
 HJBSXAr+wnKNJwBl//KQ8C9/iasHCxWJ72UPWy2aVUSZXGS3xH8PeEoB7LUr3xN2mgkLopbaSGv
 YHExcWFRazz/zK2/GaBzywU9ktbOjy+YjfDjbqW3OKXxzOb/JOoZsGRpufky6X1vCGCsw9wyiTc
 qP8tA=
X-Google-Smtp-Source: AGHT+IG6hyGmZptZCX51N+35OZaO7cqVGH18rjiW54GACyiapJ0aAkOMGyQEOxnRKUdxizcFgNzurA==
X-Received: by 2002:a05:600c:4fd3:b0:477:a9e:859a with SMTP id
 5b1f17b1804b1-47d1958443emr386337125e9.22.1767082758685; 
 Tue, 30 Dec 2025 00:19:18 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:18 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:02 +0100
Message-ID: <20251230081917.18676-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082759; x=1767687559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G2sv5Hklg/oDB79bXurdqdiMMquETJpCFH+KTQVmi0U=;
 b=XhB2FSNo3d2+R+kW3ghxGExtpBYuSwvt6sIeJKvbJ0qPD4C0mfR9TXqQ0Xy7pnjZzd
 mWdFcgF3+e9D+kqiNMIdxQyOPTLGzbqfysau6hDfc4qC+iMidH/ya5yb3eFFFekeuVAS
 s2UwHEFh2XtyLFdU9wWQrhJwUDQAhbBsA5gZ+doDdN0tzr/E9Q/82eCgAU4jaf+gocJg
 S1jnNmUhqjVvR955z5BkhnTaVLke4ZX+LNZWVbU17VHyKh0VquModSHq788PO28/GwAD
 85Yvp7l+J2JNblG4JM7Dt6FH2oUAsEncAYtdDfzNLpdwAFtLVyzdBOO4V6+xhYOTBXTL
 37FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XhB2FSNo
Subject: [Buildroot] [v2 PATCH 00/15] Remaining CVE_IGNORES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This should cover the remaining patches that didn't have a 'CVE'
trailer.

It remains 54 'IGNORE_CVES' that are not bounded to a patch. From those entries
we have the following:

- `unzip`: 13 entries. All of them are actually fixed by a patch but come from
  Debian tar.
- `sox`: 14 entries. All of them are resolved because we are using a more
  recent commit hash.
- `python-pip`: 1 entry CVE-2018-20225. This CVE is disputed won't be fixed and
  thus ignored.
- `php`: 1 entry CVE-2024-3566. Only affects windows and match on every
  existing versions.
- `openvmtools`: CVE-2021-31693 wrong entry on the mirror we use but fixed on
  NVD website.
- `mupdf`: 2 entries that are solved in another package but the entry still
  match on the mupdf version.
- `luajit`: 5 entries. Fixed upstream but not trackable because we use commit
  hash.
- `linenoise`: 1 entry. Fixed upstream but not trackable because we use commit
  hash.
- `libuci`: 1 entry. Fixed upstream but not trackable because we use commit
  hash.
- `libmad`: 3 entries. Fixed by a patch but come from Debian tar.
- `heirloom-mailx`: 2 entries. Fixed by a patch but come from Debian tar.
- `glibc`: 2 entries. CVE-2025-8058 not enough information on the db.
  CVE-2010-4756 match every possible versions
- `freeradius-server`: 2 entries. False positive the DB is not uptodate.
- `flex`: 1 entry. CVE-2019-6293 that won't be fixed.
- `emlog`: 2 entries. Emlog doesn't have a CPE id and match another project so
  they might be removed.
- `clamav`: 1 entry CVE-2016-1405 that only affects cisco devices but the CPE
  match on every possible versions.

For better trackability the packages that are patched with Debian tar could
actually be imported in the tree (unzip, libmad, heirloom-mailx).

From that point we will have three categories of vulnerabilities the one that
don't affect the package (sox, php, luajit, linenoise, libuci). The false
positives (openvmtools, mupdf, glibc, freeradius, flex, emlog, clamav). And the
others that we ignore such as python-pip.

v1 -> v2: Remove .checkpackageignore entries + missing SoB

Thomas Perale (15):
  package/xinetd: add CVE trailer in patch
  package/shellinabox: add CVE trailer in patch
  package/patch: add CVE trailer in patches
  package/tiff: remove stale IGNORE_CVES
  package/rsyslog: remove stale IGNORE_CVES
  package/postgresql: remove stale IGNORE_CVES
  package/pixman: remove stale IGNORE_CVES
  package/libssh: remove stale IGNORE_CVES
  package/libcurl: remove stale IGNORE_CVES
  boot/grub2: remove stale IGNORE_CVES
  package/glibc: remove stale IGNORE_CVES
  package/glibc: remove stale IGNORE_CVES
  package/freerdp: remove stale IGNORE_CVES
  package/dovecot: remove stale IGNORE_CVES
  package/cmake: remove stale IGNORE_CVES

 boot/grub2/grub2.mk                           | 11 -----------
 package/cmake/cmake.mk                        |  2 --
 package/dovecot/dovecot.mk                    |  5 -----
 package/freerdp/freerdp.mk                    |  4 ----
 package/glibc/glibc.mk                        | 19 ++-----------------
 package/libcurl/libcurl.mk                    |  4 ----
 package/libssh/libssh.mk                      |  4 ----
 ...x-segfault-with-mangled-rename-patch.patch |  4 ++--
 ...mmand-execution-in-ed-style-patches-.patch |  4 ++--
 ...-directly-instead-of-using-the-shell.patch |  6 ++++--
 ...nks-unless--follow-symlinks-is-given.patch |  5 +++--
 package/pixman/pixman.mk                      |  6 ------
 package/postgresql/postgresql.mk              |  4 ----
 package/rsyslog/rsyslog.mk                    |  4 ----
 ...9-fix-for-broken-multipart-form-data.patch |  4 +++-
 package/tiff/tiff.mk                          |  3 ---
 ...netd-ignores-user-and-group-directiv.patch |  2 ++
 17 files changed, 18 insertions(+), 73 deletions(-)

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
