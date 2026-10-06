Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA40CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0699A80E07;
	Tue,  6 Oct 2026 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y_FeccIvcsF; Tue,  6 Oct 2026 16:31:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E31D580E1D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304261;
	b=Dz+M8G4GLS1Ra3NII0f07/iagLC1XDz6m0LrZABH8FMgJAVhr4iuUXP+lhXyiN6ypxLO
	 iwCF2LZLgVPP10T/bVVoVuivRMrgKh13DwyS1ZdAqVpiehNm/UzKoI5TedmS42oJkMEDf
	 A94Ioi+70GfF74NAcdB3+w6iEtVdubpmHZS4DvyKekndbrT9wkV9E13JZzNDtpe9hIP/X
	 Io2vd24YnjpuTYq3u2PVdy32WM7FbbK/HVOMGH4YMRuR29vn7PtoslTjOezZUSW983gwr
	 si1iotzF2oF5ZkyG0oxsdzVDl/3+KpCPgjUN/lMCnnt0c9qp2ATW8wc+W9p8hF2ZqwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	b=W6tO2XMJ0bs/xqB6lxWQcsmowncRsT396OsHkndCR65bvcVBf82dYHOj65J+0XEX+ke4
	 hZNs226PnAebQET2SSC/T8aV+uDxm+NXFbl5kF3LxxMO0+VnyyNDyqnZyUoaOBO3y/a04
	 3WY2lhSA77UnQzz6qKIOKQuAKt5SulZG9KMNLKLps8iVSYnGvA0xKMK66KfygQVxSGFlt
	 Q8umP3wYIfOIjBRwjx44Mv+7ItIQUBi9KEdjhutXlomPznEFy/MHkZaqTxBWZG/NTkX1W
	 ImeQ8EaUefAABxQB/eF8wci1w19t/xQ/g/FZoXRiwapYOraKKRwnba1LDRPZqL62URg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304261;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7OS0vTxGtyxqbMWHb+Tn/PANEU4CJ1BOqOKkpWWEzUTK5/Ov/CO4yVgGPLHESbLN
	 Ly2z7+5GUsxU/U/X3na8T51wZn/aJO+vdtzJqqprlnwWR5zhsJyLBpDj6IKf1+XCUb
	 Gl4kFmmtbhBHQa9Z7IMWTFGrHtvua/n9KHYcDxk1gHZn9kNzCCzCaZBvLViU9AaxIa
	 sIZwgdf6ZTRu3i7L5roZ5n8kUVAh+nu4slBUn/MHnSYO6FFg8MEmUS5Dp4NUODUAHu
	 knEIWlFzWX12jySPHdg2FDWndMCawsgqF5i0UifqynHQ1dAD5TOhX/BW5CmfqzNZVv
	 DU/Q4YRWBO8ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E31D580E1D;
	Tue,  6 Oct 2026 16:31:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2E74317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F95606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msbMPnvzo0wa for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E6F86606C0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304072;
 b=Be/UFP9cEVv0HkdEi4gUL6f+vWg2JsESjpVZ3SW+HoBkLvWZxCF2G3+f9EOaP9eGvho3
 +fqf0/Auv9IPXyR3nER4LkrN/f8YX3Tjbbgfu4vNjXSXfr7Oj9HXE+9WCcqso9o3E/Txn
 phSt86sPC59tjmeOd1L6+2ylJbRUd2utBEeCc+H6tfECCJDkUTXRbHW9hZw5R/WSfnN2V
 4rDXDr9+C5mJw1dHqbQpapoHVNWgiIrrKPgB5Iq5TtHChcXSsMKmfHmHy5JLupHHdH0Hw
 /xYxbAIB7Oq5FNKvTbwLSMWxgSfK4MmW5QgHFfWVccSKRoNuelKtv3A8ib4+AkPEJug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304072;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 b=Bjy7vEZm2dCEHrNDy4LhoevQy3hnz0FediIePIyEbhtyyDoKuKhovsT/UQDBS6+RLZ+x
 hjih68H+HTH2lhOKaydVJr1sfnpxUYGY9XqA0zlkKCpO9pcsKQ9ilHerD6u7pVaou+zC6
 g6x70oEWRD5thrUpUp/5+HEd+7TiuwnwFrriRLT8Ny2O/h23kOSZuC1IJzeJ8p5ApUxfj
 I/0xmyzgA9uvbTChLw0+A8iXR0VlelRxExeNLtfHfxfLU4bK8h1tdAr/t5usCVhHLEnvG
 Rv+aRxtJjK/VmhRoBvq8wvOnkx4mrinjhsDmflq5HrjWnqsUQxnXFJNBIbcMv30DfSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dkfKmBwY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dkfKmBwY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6F86606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dkfKmBwYSk2I3kSy+94P85Z0tZlB967MrB1oPiNnuzNy6vHOb89ORY1DZ4FoxQ17p
 lAto/u3Ep41fW7L8nD+upyUeI4nDodXfo4o92uIm0TaOZPNdXhFyrwi9BXyJKYOpdQ
 jojNywSAY6ebayZZE410S9653zgdyH7UdyRyu1hPy4hUxTC8ixCBBkC1B/VHkQf9N5
 hW1wcG63xj6WtWCqROhzN/w1/gDhNy7lm3xBi8Jcxb65Cr9BtYzuWRWn2BkVxsULJ+
 WQG9vKCKhxHayFPCULRWvGagw70YGrpWEN20L5jVQp7TRQes6xLIAvRsxk/eNKP73Q
 S+LZiER9u9N/A==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 h9atzcO3Taf4ed6SGR+VTLkQGlU69sJs0sdn5ODpH6Va+lWa9olR0cAyJxinaKxffMBTAU/SVfb
 nMSEIri6knaWjZVpo7VaVKf4Zga+MkS6UbsPI+p0uJcYgU8+2494alHECwg55LPa9tKFjurQCPh
 e+hk13SHlaKrSUyKNZIBs4/JOunK37NSiLTjQnSjKvJ7JbyUKGyWF7FV9hQM1YvBYNVRxefwzPH
 g/rReY6W0CWttMy3lgZTUJqD2tg0O6jDywybThzkWdz5p4TizAEtAXOmCA7nYDOjPifVGVp7obv
 ehl2c4yHhbh33QBY4og3or25yYwLiXtfPMEjNx2gLZXnD9+Epl0hwbtm6QCMMvZ251er8FRNZuY
 OtP/UFLb6HdPJn0cqRJA5+xW1GANXIARBonJ5xqFQfLUSsKnkoSeRjQqX7gnKD/ftMG2b2qHfac
 IBW+gGaq3pW4p8ZmXGAM59WlUMBhlPL+kFIFsFUKtLdbndVZBhWCfwEI8dInCHH0is+RNiOVh4M
 2eAXiftjY/0RkOnRJ4LtGC2nJPWyuT1rnjcCcKKP1xQnrvJl6QpbHJHKUNQOjd4pcRBDd21TGfm
 Oj3W2wQ=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D6A8A4C5364
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ut-000000000ir-3ISm
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:21:04 +0200
Message-ID: <20261006162106.3439373-84-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 83/84] package/kodi-vfs-*: mass version bump
 to Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash               | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                 | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash             | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index e65ba18fa5..79e861b1aa 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aab35cb6b03191609a7e97df02f2f102659c12e414f7b95595f9bb2047554daf  kodi-vfs-libarchive-21.0.2-Omega.tar.gz
+sha256  378ac05a967e80dc02d36ddcaaff97dd8324ebd58c3ca7cc82b943037dec14a4  kodi-vfs-libarchive-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index ee1ca59b52..7ee7547f2b 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 21.0.2-Omega
+KODI_VFS_LIBARCHIVE_VERSION = 22.0.3-Piers
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index c69e57758f..eded39b35a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7492cf73d52299218acc982c4b35b020ea801d36d47e40460341f4dde712de50  kodi-vfs-rar-21.0.2-Omega.tar.gz
+sha256  b640feaa5579afbf1ae911eeb47abed78501d2bc2bb177ecc06022da04707181  kodi-vfs-rar-22.0.5-Piers.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 7cffe1274a..cc96dab863 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 21.0.2-Omega
+KODI_VFS_RAR_VERSION = 22.0.5-Piers
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 3a59241d7b..be2471c77b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01a23958331cb0cd78fd2e9367d1269d4319c20b84db5b132632f9c1acd5f3c5  kodi-vfs-sftp-21.0.2-Omega.tar.gz
+sha256  e0d54427f74874da2352afdea0288864dbaf8dc38ecc5bbc0b1711a129233e0c  kodi-vfs-sftp-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index 18ea2bc099..c6eb220d18 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 21.0.2-Omega
+KODI_VFS_SFTP_VERSION = 22.0.6-Piers
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
