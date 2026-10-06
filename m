Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7904CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908E680DAC;
	Tue,  6 Oct 2026 16:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LD2DU8GX_2Ps; Tue,  6 Oct 2026 16:30:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AC0E80DA4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304234;
	b=qkZJIKwGUE/4epY+91pJyXRt1l5kxqJv7KH4FP1O2jmlswjoeSoPv5kbL8mMZYLnxbQi
	 vJaCMN44UQIrzqvEcJWaCeNdHI35mCpq5f2CHYbamz3uRremDtwCzKcHFLKP3CLtGU7V/
	 lP4n10uXrEwOUk1DRunnBt2FBFRv6gV4L8oQeTKEze5LwQOJSe9xtE/VwIvE3adNFSJOP
	 7PF5qzP8ntl35tqrNr9iWRk5BWRV32jV9SCO92uMRSJwe8AxkFeMdbDRhIxVuoY/YXbCO
	 ufhbS75xfN/vAuEvGgA9LTriH5VXj/frtAE3S9RO0aNm36dhx7jsrcYH5sthMOlgEDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304234;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RhfoNcV8ufbmtoE+bP9bPEXhRQBjjIjTBjVP5zG3oLQ=;
	b=I3uLcBpctUE60rx/nSU1hCjklnDjWP755Xk3X9OOMYF5dGLCXRkEKhVP179w0UXj4qZI
	 2XGVUBReQykkNUNUGx5VP0fEXU0jzoP0U5BAuYSnZq3V9BkIMYsBEwyCwUY/J6Pl57uC7
	 u38oSs0B1WB5YxKcBf8HGysEAsW7/wXj1EVdKcr+u7cRcEyaEuU+KA9A1t6GLPrPe13US
	 NXIvpLz+4G2XMOAQpp+kLFviQjh8yZVP2Ws4/gpQkYPSppZmFa4E9Euu9KC4a0bwKWXni
	 tCh04303MuYqlA6tT6IOzfbTm1guvEugaFVqkS8/c7im5y5COX+xPAKnEYK5LJRk7Lg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=C4kdu01Q;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304234;
	bh=RhfoNcV8ufbmtoE+bP9bPEXhRQBjjIjTBjVP5zG3oLQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cADcvVSWgUVxDujiwA/pnqaAOwBDnCjasvLjm8SW/s9B3GWazoe+FU/17SLB0JYq/
	 sFWcHl3VwTLwURYheUxB6wmj6HM6jAmD3EjWfIefe3nbxJUNWWXM1ZiTisZKmQsTN4
	 aNoTxZtEf0EmRF7R/KKoGZYXmBj7kfMv0ofFWI5RV3vRYXlzZwwK132mUxVaeuuxpR
	 HzmY6EF1oglA0+jnuAVKREpf1F++m7nMdLS1h17OVqxrYubkMQ4X5XRFFZhhCERfHw
	 WGsp0ZQex+QUOcvJB+TERDCCTRPLyBSekGpSPu1Q5MNskR2AFHYkQ9TYtII9LklY6e
	 9Hjg4hFNXQI8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC0E80DA4;
	Tue,  6 Oct 2026 16:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD8E5317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB58B80D96
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikFTrfaZ4h0J for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:26:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DDF96809B1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303973;
 b=HAbN5LUo6AyvjxiuyX8ywUulFHYWnp0NJhYcncw7k8dCG0EjGNl2rF6a38ACSEi7NuHD
 y8eSp5Snfb60ULVWk3KuI3PgIN/s3DBJWLDf6luL7RfR5Qgo7IAgv7xXEPkPSZ1hu4SgX
 G9X7LC0g8e3gTm/TuOLGlO02CNmb55cEBOmgZVdL46HjIlvnEDA4EP0/cCartEv4KzLRE
 FgpkHfsJJTe8Vi6nAltvZ8/jE1I9vuR0winMvRN7AXDrNEf9VQlU2yzZivBjGB4moSb9r
 8MWq28XI/kS1HMykzERR0EEQzMFH4OBgYgITXMB6GqPEBD1zZuY8x1u79pu7/xceLtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303973;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ud6j7hyQM/va6XR4rghQThvwg7glZEFHHMAGs8JYvzE=;
 b=sIBDqqqaSS9e/QwxQhv3kWJnrgVgu3hjQnje+PJQXjODssBZZRRiPc3Ik/8MuY7XleNW
 WWfYkAZOSgoFcduIJfn3I1N3+VB+RH0/tKPbe1FJCLg0RxDqWinYJvtXfCT5MFN5vWqBM
 rzgaSF53VoDm9MxOE/oai0IW5cDKm18L2Z44rDv9SN10Q1NY60oYaVLWAMiaBdms3Y9oH
 ZMtLPwrZl4SIeP7g6X5iFb0/SI6IYyQkF97Oxc4DYdxWTn63GIricaG2sZCK3rOndV1s9
 zBeiAGQhBnQ4dzn7EgZU5ILslRV0cURbFucjBYO9CxcJy6QztWXuSMu7jnA4tn8XufA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C4kdu01Q; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=C4kdu01Q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDF96809B1
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=Ud6j7hyQM/va6XR4rghQThvwg7glZEFHHMAGs8JYvzE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=C4kdu01QjzSBuB3ZLUoAIqmFdGduKJ3Ks8p94Uvz8PzSs8FVdXDRzFVD+O+h3wgtz
 m64NRW/8k3rVSGFSYHe5oVeUPE43KiyhZIMfEiAWSqDry/ujwH6OolqD+JtH1kqE/y
 5uzRrmpoJWdpvzttXXJ/QFmMZGhaDu8fZJmzPIIHeu038oKIfwgoePQW6bkqgsoS3D
 vL4POkS4YOsDrAs3QYMqTTXMnwIwDbNi9YJlIPmreMFzbPWZWQLO2+gkTypq4uZ0Vh
 U41We6dUp2dP3VItIbh13HK+D6LMb4PW8GSFp3fRPnrkr68F+PDRg2e6DsAQIhjgJQ
 J6KzEAxKRAcgg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 uaHe8vWmjyHq2zEcJk3YsP+iGQQVDhrdOcIhKrojHXAHuFA7ctQUr2qnVeHEz+AT1Oztduc2atk
 4HJq3wJbACAYpU95R4ji1oPJ1/VMDPnJikC2c94olzVQuQ/xiOq2wbDGcxHYasLNw71T96QNMru
 Yj4ShA/NjnuD2NBKGyekkWfkVvcAD7A1hn1M88WABNMSREU/QThfarHg7mPVmTb5VY3yDsiGasY
 gp/7vk+bhE5jBjYbHeI8nw9nj7CSWmc0ycIk4QPYUtsPtjoRe1+X/HuC2mrbKRxm6E/IEjvqRdC
 R3+kZGH8H3ky20MK+8Ty8CoH7DVkA3AH/x59tkLbrhWtIdYIpxDgUmJenlz8JegCgoGROI7JeFE
 uvLcjP+P+c4REHkwarbW+g5NsunahG7JwuPF9rfVPy6X61X7EJD82qv+ZE009tRcysdLH0MO80a
 1smERSVy2vVJaAp9y6ZW14WmSHtav6iAwGSxTLue+va/BOCTyoEl0Fq1wVt0dMzzQUBXR3YyJYF
 uMvXPO9fMDu/WMahc6F1LQ97KaSLCgjvbYwT6UdrQ5ufcTxfEBKnX6Q4ToUX3SdGdbdb28PuO7E
 8pe/uC4=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2619DA4C529E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-1Ed9
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:54 +0200
Message-ID: <20261006162106.3439373-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 73/84] package/kodi-inputstream-*: mass
 version bump to Piers
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
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 .../kodi-inputstream-ffmpegdirect.hash                          | 2 +-
 .../kodi-inputstream-ffmpegdirect.mk                            | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash        | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index cfd0b62fe6..8844714a85 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c4a458045bf4edfe51a1f9f03ac777c7101c9b00e0e72c76ac51a2b3f530779a  kodi-inputstream-adaptive-21.5.25-Omega.tar.gz
+sha256  efc7841f949ae0c3f5eaba3f8066f7edfc162619dc0b56e53a18911011263d75  kodi-inputstream-adaptive-22.3.22-Piers.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 8aab0c88e8..eea32fd154 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.25-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.22-Piers
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 8059858c4d..ed22d4a27a 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0648c6bbb2143cec0c3f48ad476f2c213f20c809caaf5ac74c8ceb4e53635f4e  kodi-inputstream-ffmpegdirect-21.3.8-Omega.tar.gz
+sha256  f72d027b0aafe9e7734ca83e88e83dd038ea4c9b912dc6c53dfadbcfdb069468  kodi-inputstream-ffmpegdirect-22.2.10-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 9fb9c95e13..9b050512ce 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 21.3.8-Omega
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 22.2.10-Piers
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 497efef7cf..c19949135f 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7223a30d2774e4c7cbd6c4f8a266bf4d186d160590077be627bd0490d80645c  kodi-inputstream-rtmp-21.1.2-Omega.tar.gz
+sha256  4980297ade011d9c9f34c668702d5ae9528650bb4dbeff34cfa640d3a86f57ec  kodi-inputstream-rtmp-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 7aef9c815d..7b487564b8 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 21.1.2-Omega
+KODI_INPUTSTREAM_RTMP_VERSION = 22.1.3-Piers
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
