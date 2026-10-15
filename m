Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29E5CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759BD60686;
	Thu, 15 Oct 2026 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ICz7nIzsrrg; Thu, 15 Oct 2026 19:30:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B30A608DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092640;
	b=AWZF59STRKFPH7r+ojN06tOpfYdcWAWcFPp0QmN7/8JKnQ3qy7vAyAaBZcGm/IfoyiKr
	 SSl9GDr09cJPrUCUBjYb5z5/adUkdRwb3HumsZg9WciadWZp1HMfmG9ICljLCrke+oTNP
	 D2bHJTTifzHUqVvJfpi1UO8epjQCj0U5w2paagiXDxDfpUhA/qmzKxw4f5ZlovKhxcJPc
	 EDf66UxaDdNqXpGXJ4NmErGy2GHIDZSwuBIfcryGGvcfzjWtqy3SRHK6uKQ2+34KEGVsR
	 GKrh5UDzXPGs96sOrwQB+kIcALWoNcfWo/yhTbdBxk6HAZedn0Bigg4ROrM1OEzgQLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jjT7oM5NFHSltrO2yj/fWJxQjkedBS32ieCpG8RJKoE=;
	b=H8RKaMQmb/09SJ7YrG8VCqjFOyA3Jlqw8iym35DV4hsLeSyEirW/vnny1eHkQXuAoLcM
	 /cHCLwBTR+arGjQy4qH/c2BYeJ0CdfoqH0LyzpRcp9Ot0RDZxzF2HwDkeFzZjFCoq7dHR
	 /2nqNnaNvI3wI4qEJ47qus2+6KK5P7Z87By2ZA6MFtGPubzQ7Bj+LHZQK+11J4jApvADe
	 SD72wu8uoCCTz7lF368WcN5avc8bF5Xt1FlWPQMyi041A//FZEQhk6uKh/OFAcoIpjFo5
	 gKMsImYgecPK1Q8Ll9NOqBF9ojaFXAikzSSwFxTYUEAxclDs5CoB42S+n3M9dwMdHVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=F4j2kyDG;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092640;
	bh=jjT7oM5NFHSltrO2yj/fWJxQjkedBS32ieCpG8RJKoE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fTcHZk+fMTD7K9OyZmW62CZuwJ178sAgjg6fpdNeYuo7GyMjo16jnke7pHG1Tr6SF
	 xQHv+PFFjleAkLx4vxKr3cP4gV/ElGr7vYzaHdPpyKLRJNk/3rzpkWQ+h5YRD7EtCo
	 hGjaqXYQTw+XzzEfk2bc4aEny1+78IlqUrBGY0+zpBstvVtlztUIYttesK3GvEr9Bs
	 qf7IYBcDH7Sm7o76j6K5KQeIKUGWGzTBWIFUlYdvPHnJ0WT0gKMY7dAzh5WWFE0Pf6
	 rTyuvSBClZ9wY4OXBOan/pA5yOQa4Y+kwqDKyRMCSpVM4oHvaugCodcC0MHLBAZf/b
	 ieuLdNe/670/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B30A608DC;
	Thu, 15 Oct 2026 19:30:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 877F51AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D113608DC
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVYMx25Qo_RF for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:30:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF95860686
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092637;
 b=XzdeHZcpcExftZgmss2bLfxmg3DZ1cbFzWQvTMb3bktMeLSS8qEhYgiCGmL52I5qskw1
 Lkyy2Xz1lc+yh444sfEa0HCvREwhSOaBGT2hGAq9rnrhgicnkAGsNwdJ6hbNrH0Yd9fV9
 1Iy34OUz/PpH9SgT2WBsM678ITP01IutpNCu6XrB3guIzrDrWj2LAzTN0RQONoYAVTLyf
 jBORPEg0/0b/hnH0Kdxvczu87amDGEauMgr14M68I+i+kbEY/NXDHKcy0ClT5XxcTyZ4X
 rqCqfgOP5YpacMLOjwWYi3dlDi996FHPXlAzeY/M51rjzYD67l43xHsYIS2sfyhh02g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092637;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Hga6dMwPDLju8Kqs4pXhPphcW7twEk/JUZ8IWLt6Eso=;
 b=qYAdHdj/fC9xKKnrDG5hgxF4snEESiNLTuFEhISaYOwrg5QThsJ/vd3uqnFYFx4iqMf/
 lI1REFQWsMKoMuJ6U/uvOM/6ZWQlsDyf0VFO+WjfPNKCe0Wf5Hco/oRzAErH94arDUy4R
 IbZkqk6YsxT5zkkqrm4W3CaenlRggmXIs4pyzuWPSbYu9crD24sSRPE/pHyGWw9/QD1sb
 TvAyO7P2sN060EJUxZlBu/zQsH7CtJq08X5F+BiqZzLOMBS0n2dL77z3nBg6O+cbkSXWA
 MuQQWQ02o6HlbLmRIVlo1BbwUQ6hj00k8tGMty2CJ4dcdGrptxZbNUqFwhjZ4cdf1Lg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=F4j2kyDG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=F4j2kyDG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF95860686
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792092632;
 bh=Hga6dMwPDLju8Kqs4pXhPphcW7twEk/JUZ8IWLt6Eso=;
 h=From:To:Subject:Date:From;
 b=F4j2kyDGhoFQlUvG49FWgGhpAjfMxvf8iTIOCuhu+83bFzmkTJhtMlbBtHRFM99qa
 9If6n3yY9IOMZBgIYt7JjBBw8AlUKrDW6c6F9RanXVmlJg3FC3fKxm/VS/klYDBGyb
 UvxgfzVDluUrMq5rQHtccRdxtAWul6n8fGPs5L9ugeh5thv5jMkO5yN7txeAus+mzq
 kJMXBEHMvoev191uR3oKpHC2Z1diLdN0YKFpCadMsoXJdXamKN1yiBXNz0Y5aSq4aK
 a43774G4MihYCl3qzf4D3RA6fsZk6f1OrQKZw+9LTgCe8jNIjSDKdGeL2FwsjemH/V
 GJ2KH9eeZNK2w==
X-KAS-Sym: v3:f51bdf72230551df:rMKa8vlqxjbvhwM3VwWqzuoBxuexZw2deJKlRCue1U2VK
 jKgI9C3niYcWOX4IK6iHD7/UNOH/As5CQlU5CD7/8gU/qLVlV1yKFf+gNMsVrsEqvKOCVV9zFzk
 nconTbIUAwEZEJ8mfpHap44aVLGj40v503GE/gTZ7NRRjcpBVWTq1KnnE2nkrRaJ7moLhNjl1Or
 +nzDwfbGuCYZY513qVE3oZF9KG6scIpfhM/PTjaojxU9Qb/SxetWXbCVaX/Tl23BuGk4eWGcPYT
 mBa3cTk2DZrqK+xtxFM4g/0D31Ez2kWCOvKZ/vI03Kcv0vQAruduqqILjoKUIkXVmEY3TThw==:
 oWZ0qVx6/CoeYxtLzn/XmPh2QTxmffOsXX+GyMNRKx3ZY+Cvvu1ic2+vJ++ZqRubfjN08bXnpfb
 kBdWGNiPsbPk5ANxILnoRakjXlv/rvfcNXO2Cup6leJ9CAcCpZVMhp36RpP2Lk1tj5OElvhLr6l
 Sf4qACDGStEApqabrMcC+7ewPvnnfDdoZCINQQf64qPxOwrKYynRJjdpNrRe0CxqTCpkE/QJ0kK
 Kq9SHjPKgD1EnCFA27244XaCtyPULSKQTW5/u/PupIlYWRHMMWQvpCJs5gwtp2IXCVIMhz3O0BJ
 rwf1I6Fbqy0IuPwjBZQb9VCJ6+4qwiK4ASfJ6ceLzBDfZ5jHHumBCMM8C9qsEDK6V+6r+gVDvOa
 s6ZNs7o0DmuaE5b/ZpSmCEcHsVFtvBTiEn/zspYwCgwEKCfeAQp7sjFyCrxXq6b2/NeBMxkAOaW
 xuCCQ+y5l+aEo5GCHzEAwSVOt1UAoVLj7nwXUoo0B1xj2Q37yKBjUzXhDlG9U0uw92sS4LPxB3/
 YdCsnxktC2N37IRYoas9ZlNNvhA5R3gLAigaWf241UR3bQrOvBEgbviDpJWj9jV3ZQ6Ouk8Xfde
 2mdxdA==
Received: from fli4l.lan.fli4l (p5b3a0d0e.dip0.t-ipconnect.de [91.58.13.14])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CAA20A4C4B5B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:30:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46084)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xHR9r-000000005EV-3IAf
 for buildroot@buildroot.org; Thu, 15 Oct 2026 19:30:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 21:30:31 +0200
Message-ID: <20261015193031.4104937-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

Update the latest kernel releases to:
 - 7.2.10 -> 7.2.11
 - 6.18.56 -> 6.18.57
 - 6.12.112 -> 6.12.113
 - 6.6.158 -> 6.6.159
 - 6.1.189 -> 6.1.190
 - 5.15.222 -> 5.15.223
 - 5.10.271 -> 5.10.272

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{5.10.271 => 5.10.272}                 |  0
 linux/{5.15.222 => 5.15.223}                 |  0
 linux/{6.1.189 => 6.1.190}                   |  0
 linux/{6.12.112 => 6.12.113}                 |  0
 linux/{6.18.56 => 6.18.57}                   |  0
 linux/{6.6.158 => 6.6.159}                   |  0
 linux/{7.2.10 => 7.2.11}                     |  0
 linux/Config.in                              | 14 +++++++-------
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.271 => 5.10.272} |  0
 package/linux-headers/{5.15.222 => 5.15.223} |  0
 package/linux-headers/{6.1.189 => 6.1.190}   |  0
 package/linux-headers/{6.12.112 => 6.12.113} |  0
 package/linux-headers/{6.18.56 => 6.18.57}   |  0
 package/linux-headers/{6.6.158 => 6.6.159}   |  0
 package/linux-headers/{7.2.10 => 7.2.11}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 18 files changed, 21 insertions(+), 21 deletions(-)
 rename linux/{5.10.271 => 5.10.272} (100%)
 rename linux/{5.15.222 => 5.15.223} (100%)
 rename linux/{6.1.189 => 6.1.190} (100%)
 rename linux/{6.12.112 => 6.12.113} (100%)
 rename linux/{6.18.56 => 6.18.57} (100%)
 rename linux/{6.6.158 => 6.6.159} (100%)
 rename linux/{7.2.10 => 7.2.11} (100%)
 rename package/linux-headers/{5.10.271 => 5.10.272} (100%)
 rename package/linux-headers/{5.15.222 => 5.15.223} (100%)
 rename package/linux-headers/{6.1.189 => 6.1.190} (100%)
 rename package/linux-headers/{6.12.112 => 6.12.113} (100%)
 rename package/linux-headers/{6.18.56 => 6.18.57} (100%)
 rename package/linux-headers/{6.6.158 => 6.6.159} (100%)
 rename package/linux-headers/{7.2.10 => 7.2.11} (100%)

diff --git a/linux/5.10.271 b/linux/5.10.272
similarity index 100%
rename from linux/5.10.271
rename to linux/5.10.272
diff --git a/linux/5.15.222 b/linux/5.15.223
similarity index 100%
rename from linux/5.15.222
rename to linux/5.15.223
diff --git a/linux/6.1.189 b/linux/6.1.190
similarity index 100%
rename from linux/6.1.189
rename to linux/6.1.190
diff --git a/linux/6.12.112 b/linux/6.12.113
similarity index 100%
rename from linux/6.12.112
rename to linux/6.12.113
diff --git a/linux/6.18.56 b/linux/6.18.57
similarity index 100%
rename from linux/6.18.56
rename to linux/6.18.57
diff --git a/linux/6.6.158 b/linux/6.6.159
similarity index 100%
rename from linux/6.6.158
rename to linux/6.6.159
diff --git a/linux/7.2.10 b/linux/7.2.11
similarity index 100%
rename from linux/7.2.10
rename to linux/7.2.11
diff --git a/linux/Config.in b/linux/Config.in
index 95c9c83e07..4384968a97 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,13 +182,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.10" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.56" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
-	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
-	default "5.15.222" if BR2_LINUX_KERNEL_LATEST_5_15
-	default "5.10.271" if BR2_LINUX_KERNEL_LATEST_5_10
+	default "7.2.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.57" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.113" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.159" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index bd821b0800..d288e880e7 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
-sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
-sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
+sha256  e09b6727e5c521253f0d41694900b9c38fb7604db7d35238a8197aa9f7de2428  linux-6.12.113.tar.xz
+sha256  7206727244da5d85f4a03758d29e1c0673f2f01877793f494c0f3638c46b8fa5  linux-6.6.159.tar.xz
+sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
-sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
+sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
+sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3554a93713..96b0dcce55 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
+sha256  fd0fc479f983a8c05313f13e9c36330fe6651cf725396748c40d5cd93fa1e6a4  linux-7.2.11.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
+sha256  5bd9acdc82ec5efc3790ae840e5aaa40dfde7efff261cf6dde902dc570acf98c  linux-6.18.57.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.271 b/package/linux-headers/5.10.272
similarity index 100%
rename from package/linux-headers/5.10.271
rename to package/linux-headers/5.10.272
diff --git a/package/linux-headers/5.15.222 b/package/linux-headers/5.15.223
similarity index 100%
rename from package/linux-headers/5.15.222
rename to package/linux-headers/5.15.223
diff --git a/package/linux-headers/6.1.189 b/package/linux-headers/6.1.190
similarity index 100%
rename from package/linux-headers/6.1.189
rename to package/linux-headers/6.1.190
diff --git a/package/linux-headers/6.12.112 b/package/linux-headers/6.12.113
similarity index 100%
rename from package/linux-headers/6.12.112
rename to package/linux-headers/6.12.113
diff --git a/package/linux-headers/6.18.56 b/package/linux-headers/6.18.57
similarity index 100%
rename from package/linux-headers/6.18.56
rename to package/linux-headers/6.18.57
diff --git a/package/linux-headers/6.6.158 b/package/linux-headers/6.6.159
similarity index 100%
rename from package/linux-headers/6.6.158
rename to package/linux-headers/6.6.159
diff --git a/package/linux-headers/7.2.10 b/package/linux-headers/7.2.11
similarity index 100%
rename from package/linux-headers/7.2.10
rename to package/linux-headers/7.2.11
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f21f543f7f..bdf0bb58b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -474,13 +474,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.56"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.10"		if BR2_KERNEL_HEADERS_7_2
+	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.159"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.113"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.57"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.11"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
