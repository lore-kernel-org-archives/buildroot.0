Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1366BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF28241055;
	Sat,  3 Oct 2026 07:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RCe_g8CGr8V; Sat,  3 Oct 2026 07:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 027204104F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011900;
	b=NMSNyhRAbXZh4Z56Syws8hnLFPHIBHbk4rgz5myBhFnYD9e7BgTNNg4BKWUeErWWf/OR
	 4MpsxWVtrrSbRygdVLu4l382/FVZcQJREXQF0Td+xK6XtYagcLMPZ348yI8f3bvxQOlbu
	 4WQO1hx1gXDSCIKv+YsjJFOKPNiiCK5i8pfGc/smtVAdTAIHG4WuCFp8GaISTexUzwliC
	 g4e5TTrayVyipsstGwVPEuTd+h3AXx8kM9cr+Ap4k5hKAIp8+BQUZcpKcdccIb8t1Gk1b
	 W+SpougLBypGXeffT1kwExPSmMzY0EzdGyhOMQd5elOKDFoO0/lWXzqAsUlMQVP4c1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SNXH9wP3+s4hVOs9BGMFJiXuI0xuPZjcxMNhQtFTUdA=;
	b=ekR5YmUrsB/XdGr5/HNdcnTTCuexOgucIckWuwBGM7DEOr34umwn+mY2xLjSPtEtopPt
	 i3uVY5H64H/Yb3fiNVE7vlh86LeKlv6cAjG1VwzTrz/Xe+eJem2/7/5iho0qMPI1/gp4G
	 xhiO1Ouq2ln9UoyUo1WvMX3veeXTsx7yC5568NtUkaLxijF1XgPILzdQx/z8bS9mcIlbM
	 wvyIlXyh7hfkjM2xFIAj2qF27EB3/hDnAozN/m4MsWd2m95sV4fNWU/p0L5bdSjhs5ZO2
	 ApbAXxxVCn927/ki2NOO5DqNd/O3b/X4ekAyjjIRdVoaI9D7WF9pXEKCI4veMelmHxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011900;
	bh=SNXH9wP3+s4hVOs9BGMFJiXuI0xuPZjcxMNhQtFTUdA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=baqNl5DXA1g75Qoy5DjnPeqo5Dn+uUAiVUbOdyI88JoPUGMZ0eh+n9Ldwq7PWDUKg
	 2fYlcUb2YbIOyTtexmvmq9BsboBl9WyG66YNsAMBplhxjkGdGlkjRAMap/qg2rEKrA
	 i18YSss7v2hqPoq9QinJ6fSlvwKUSnX7dFQZYROiJpZf3FqOCOFaRy529MUkQHklVB
	 1EeIWZQGLSiKqaQd/Xa0aMAVfcWub4MOmnFBNrqGHLEfJAKWigGEycFcUorYWQZWEi
	 15n7j0AMVKV/BdpG/Q4Gm2SH3D18Yge+vNlPfiOrhJduwsyS9pKl7iPsG3KEE3txnr
	 8MgUI9EJEdw0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 027204104F;
	Sat,  3 Oct 2026 07:18:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E6AC1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0505560DB9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmxqBBWzysnW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:18:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 119EC60652
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011898;
 b=LQG5NUnXKxtvO2cbIDdRRImU8+JjtODtXGK8dpo7czOyxsVnI2gpDHbXz/hHRrN2Jc/4
 MBHjXGgPUQT51NqY0MK3KyAo59sKZS1QGhI2IbgoKRGbmK9ui/IAVJnRPjGtAUddMpjTf
 h9TVMEXcELs1Inhi9v+xsmxNlDXX6lpSP3TYi0cxs1+XMWTIkmYB0PNGcGdjbgmItyoQ+
 /lyeNdu1glcZEA2GDhpkUXu1GbM9dKimMeKnBjyfAZ287TDc2tbQe2ikYZQXJx/d+Ha6A
 73ygD/kJBEM4xR34AcbRkidDRt+JSdsK+JNqoVWioVGWdUpt9r/Nwm6z4SC0LmNi55w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011898;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AV5Ff4YI+6AyMtCNNHruRXvslAO25LIo7uh58bbDgfM=;
 b=eYcMXxMrENvTftJTxlrAkHid8DQNeQvlb6aBN9fpAWSjtFxEeLqVqvQscEo/UmIphfka
 p9UMqpyoUG25C7GgkXiZh3eBMXj1dypuPKErcFzrCqirr+2CV2MTNYPbXml1H5+wlyQNH
 EQ72IhnyqNJD+hhmUU7OosucgPnRmJf9t/noAhk+9pZ5CPmh5QtwGwz2/m9ADW8yaO9dM
 lKjVqzZIqnFJWOibHVpT9Ds69VQr9p3nncuwQaolFHHtigRdaQsDmF71SO7UNOEegjwZO
 dRJdSRRw0eYP8CXwk8VBDJUy8fIV38hircBFDlEFUbnkEHevHFtXCBZSXMsP+oWdOKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lI7kMIxO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lI7kMIxO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 119EC60652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010937;
 bh=AV5Ff4YI+6AyMtCNNHruRXvslAO25LIo7uh58bbDgfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lI7kMIxOfbKiAgD+3TQRC1XPlrbQeZKs+tteKogjGXusR0OCbp2SzfMOag2E2zgKh
 60p04q1RZ5I6c1HfFZ70kYW5EDRVyIxdwAiia04TKZ2IvReQSB04IBOjhqgrOqh6pR
 izgdrIiB+7ZDjQg8qJWRU7pDo8EezqRPOfNtXFexCpxm0kN+WYEtB0SS/FFiAlRGls
 iJFN5Fo57yoc/48Lj5zRDQf0pu0u3HTxYcNL/QR2Kjqovp32N8yuKZo8Ydf6jNXUh/
 r9Brmg9SdgvnZmUz+kt/k27mUO2Jj+Rdbrf1ZtGZ9oQjVxvrpc5wYyQa1kM9oT201e
 ly+nlAnHe7jqw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 2BlGdu/z/NfIPuMV6xvlJCZRuyQyszWZTswmTafTp9pAowNvx/EtSQlroX1WElpQMBoW0Lcn4l8
 1ZKDkxXns0DLf/LgHVEBVop3tKiNTSCoHhT/hDXoXvvec3Jr9duBIIG8RkpUhOQcteBemph00KV
 Ksj3vCw3RMDpuTRUdQUIbtKDl83LzCpHeM9cGwBUg2JpckxQjimdQe9piJEvYKWNZApGQZIQFIc
 4ReH70W+NHQsRetBwq3fvSZFOhokym3d+aVtApCH73n4zvIKt9MW6sdKcORSZqbEsGwqo78Zcgg
 LJID/2s2ZPpn811WUNUwdCqkVwZUtSZhqKY/Hf4qYAhARP6aYVZpooIZ3ggFF/KYqQktHlxQS66
 Rj+9CsiQ4BG2gy3RA+PR9FZubomUAYj1aUnMUzBMhZzskUF5wHISzBHjupWiHWPHDYjX+LCCuEe
 rttl3Rw13KRjeXQhdS+Inz5kdzL9Wx7VjPOyHOVBbzWkinIS4Zo/Xz3EhnXcc8HevsumncrRlSe
 u+Ky4fKGkMPTa0+FC6kkT2zrArFNKvl5ZIRE8GwXjpKXJcO5Xe1+a+p3IZjL+Mn1PwemDZ7QFGY
 UPOJcffO9YkdsB+71xqcHZ2KjpoaERClo25kKBj4AjMIVbdbJntnzDg38FFqwgHQS1fUwliIMd7
 xUCJksbGxucIfGiQBliotXk4NP+3Za/c=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F7CBA4C5477;
 Sat,  3 Oct 2026 09:02:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-27So;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:51 +0200
Message-ID: <20261003070128.1295458-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 019/114] package/python-docutils: bump version
 to 0.23
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-docutils/python-docutils.hash | 4 ++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 7393c029a5..fc3ae0ec80 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  58f718cd60a87725d4dac56ae427c9f8  docutils-0.22.4.tar.gz
-sha256  4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968  docutils-0.22.4.tar.gz
+md5  39d10acfd1fc81b87f5de84418b88be9  docutils-0.23.tar.gz
+sha256  746f5060322511280a1e50eb76846ed6bf2342984b2ac04dc42caa1a8d78799e  docutils-0.23.tar.gz
 # Locally computed sha256 checksums
 sha256  6ab4f27c76c74f96e5e692da5944a6f82968f3bddaac5660a4aa723e70eb5d8f  COPYING.rst
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index bad9ce56af..9de630d786 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.22.4
+PYTHON_DOCUTILS_VERSION = 0.23
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/39/a4/5180d9afc57e8fca05601dd652bdff19604c218814037fe90ffc7625a50a
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.rst
 PYTHON_DOCUTILS_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
