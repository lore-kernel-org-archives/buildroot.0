Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAF2CA5FC5
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 07:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C58811F8;
	Thu,  1 Oct 2026 07:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY39eC9Q3H10; Thu,  1 Oct 2026 07:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ACA7A811CD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790838534;
	b=VRyLXlki9lWCttm/dDupu0OdivH4Stw3gnDWaboY2xFW9MFgMee/kWP6lQ4gcRNdaQge
	 Kgr5OcbRgq1yLh3tp3Bf22aDYDhDk7+vrYl9py9Xewm4b38r0s1mgRu1mmA0wBfr0BPqY
	 Byo9Yx7uI7Lnq7WGJAcQWOTSF3nLMeS2zhBQVpBbdW629l8j2oscCQjGSt7ejvMIv4/SV
	 Vf9ZZozuNPionUXzQi1ijndz0eK3+kA9P/36Ttl7QIwawm05Z581b8ghVyMphO3EfEGRI
	 1fX8FTZ/+J26YtqGq82J2XBMgPa/9+aL8LaAh2LAlRNCz/Ipx18FiAXFSSFg1gXcBMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790838534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0KwNIpKKtSjYP5KYJADLCSYDlpwlNc0wcnX+acowbpo=;
	b=AvHaB5vyN2wr4o7EhvxTpmloluZ+kPySU3ovYharsBBfsn4RFUDzPL5eXqyz9ThcZSSt
	 mxWtA7BlallqlYxrR3pU1MmEarTLqqHS3PqG8e1HWzBtsh2rMT1phac9FMtnRToNkQ4vY
	 SN0V/Q2GcvhFrKrTQLO/s5Q7umcEkN0BvMB/hTUAPE4LWqr1xv3/W5VPpBLrS/zc2Uizc
	 Y7gkWCA7TpqYueis+rMVXAO9V1uhTl/TXuLL6da4ZvUMc0zo0jJhFqsbPU69sJnCu+fFw
	 9jKAjlZ2BCznLSmS9XQPJ1JX7Ammd84wW/yBE4Vz7xGQbLByNZtldhnYWKADxwuIApw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=cfxyp8Cr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790838534;
	bh=0KwNIpKKtSjYP5KYJADLCSYDlpwlNc0wcnX+acowbpo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QhAMTYblYhaweQwoT4lsrQTInOZ2cswxfR9Ktoy0m91s7QjEcr2eUrIneP/JwdEc8
	 9T8tVOp0WfZuJSMOQHSufMIiDlMI2NCKoHrLOCwfUXZQoFFtKCC3pD/XqjlSQLdjyF
	 /Fg/4FrngzpSCkwMUGn0ejbC8GvlX2yKAkih3uRdwbAfYusVqGe4jwlWTIdrt9RphH
	 uNqRto0/GyK4Njsnxf+Vv2wBXwoPCpxoKuu25+SS3XSLmTlZBwWtyadxsZf3XvzFYa
	 TiUAmuINZ/rzYUNsO1UH9tfwF3QJzVJcz/LNHPSbLYr/Sl4RkNlZ0E6cZVIbqSBl8k
	 1doQdMi9UD5Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA7A811CD;
	Thu,  1 Oct 2026 07:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A101534E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92ABA811CD
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQkwxXDRfIod for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 07:08:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81CEF80F89
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790838532;
 b=BPvW9Xxi3oZZYnJsi65z8rxqnSMv4BbJIaZPn0x3Lw7iH5nV4qOeF0dVR6reS+0FI0fv
 ovcQwgmX+Kaxhtx5xgZa9lljOFK+cLH7WhHIv0J8kXaCYXwbSxboWfmRC0ZRno24wHrbr
 vaEa7mLbKsS5yN7mZS0oLhEm4VmC+QjBMaYNUVsaRJSNvvLnMCvOiJYi4NgdHiqqqp9hO
 OvR6VbUwnoaRI4ZW7a3KQPkpO92E6faQUruXJLvdOkGhv7VMFbWScXWE7+q5BuC3bSsSg
 EIGmIOqzau4yL5uVBpzZmlF6WpRdHpNwQpTUys7bwbg/z4h4o93IyQkNFFXuYrtbMeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790838532;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=K6fpHscysf8usaQ4z6JbG25CV6g1p9dv6rPwgo1tfyk=;
 b=aw9BExZbfuyn4zbH0U4KJrpir6FETzXFcm+N6fmGXTslQHzKbSIW+54NzoqlBcu3HE0y
 yczqjPhtVL36rGsj0cjGpoBmDRYdGnPoYy88oqp15uEltxPsSZNl96ClB8Cxj9GGRFK4F
 9AmQMu0/7ouo6FqOaxAPySWxlH7i1Liccj8eaxbpskjppdXx3AxcH3jMMDN0fwTDO9bP4
 oBZBZPPThPjotcV1VRwAj6x1AvVQI9ba5MWFfmCRxV1W3QJyk+GiSMoEvOk1qP22jS98A
 RLymYew6XGagkynFon1swNG0b5b6vcBUt3kHd27EsMeUqyIYVga+0qj5kTKFNrNpxXw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cfxyp8Cr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cfxyp8Cr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81CEF80F89
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790838526;
 bh=K6fpHscysf8usaQ4z6JbG25CV6g1p9dv6rPwgo1tfyk=;
 h=From:To:Cc:Subject:Date:From;
 b=cfxyp8Crdv/A8LmMZRdqADAyfquHFTNlcW19k+Z/1pbY1eNxARX77ckPnLn1f682f
 RcRDzllvupQ5D4FAkMb6WEXlM+gUqjEmVULnsom8MsqzplWuzTbdCCuAizzv6zcL7M
 5ywOkUm9HWnvZu5hrVWQHi2YAanmvm5w2HrYpTEfyhf7VFLjMGAspZXAAIpH1BxhfS
 qLoHWdeVCNygQZJFgwYB/GgB/V4nef5Nb6qGr0gk85p56/O9tzhOMhPtczzC1FGOg9
 ML8hU2gf8FuAAro5qm874kvk7MI3ecaE1pub6evW+iI5TkleUW7Oerw3smve40gXwh
 ws6BLFLv2EScQ==
X-KAS-Sym: v3:f51bdf72230551df:QQd+YQ+yQAfxaEEjc8NjAtznkScXkAzksabqHbVWUpHsL
 TptUiE9Iq8awMMUagvGgHvEBF5QjURRryH3T4gutFBS4hwVaVGy5vWHcQjkMFJLPKD9iHF6+Zll
 ei7khti5H+hRtH7XctcSctm1o27gpKvKN4DxKLmfkSvois7lHv2VTN3fHvB5tn4X1ehHiXs+Rzu
 x36Xb3ANpvDp2/MNC2ffeerasgsgPmI3TFr50tmHxP6CB1v2Ik/CHsTlRpvysRB8pC5Hj9kw2TC
 S7TSsObZHQfu7SXzEaVNFTofA2aW3iXiImg8tb+wgVavThejUlr66EsJ8jF/Ytq/eevsVAVA==:
 9+qBBubhg2SikZfDqYl9EJI89w940XtjsOiQUi/Z+cs09W3ZfTj/cBKEBkr/VlNpeNJFLuV2aNM
 ngwR50I72b0pG06bXPiDkNKHBMnmZoBM4M6kZHxH3CGNxGxD776wEMmaYIhy1d5Xx92xwRFMCaV
 s/59mQmegphn9SiSIeYrgGTCTzIN9+R7rGuYerYnftUy6u0zIOJCd8/IOohFblLYnyArvwx7ZSA
 /vCwt1MtVO8JE/+uUNmvusbfHZ7oLJRf9JE/6FU6ZZdB2kJP2dcMu+nNtsTPBXLND+tTmabCN6c
 B6bI5XSQhPpkbh6EVjnKlLurMOP9tsDjnyhk5+pDaEtuADySBXdfGYHaz5NbctARp4we4VgalOU
 wSTvXq1EQhxfRbbR/FSuDP96wjXCB0LVIJ6ROerktKPEwFKjUq+08nexd8HgCXinryeFPNBF/pi
 CduD4iXUR9+eogOkEJtU0b6Zeh7yeeeEkeCgMZONbcZtQoN2djdxlvMU58fOU6v6skaXOPUsss0
 ReU2I6xmYpYPzUMXXxxmLIJXBipLZ1QZq9J+5ggvYn6/BoqPGPYrdyMdkNyEeXvpERDjXRhr0Xb
 msO0TXvYEvdikgoitabZ9RRTu8gf57vlj18NJfBsJCNYgTKtMkuDhOfTNqxXcdy3h5Bxqcq6iN3
 qFlwCzlj4COJXRTjNUqBiuJL/36PIwrDcY2ohtd41aRgFm+aMUU8cFdX+kQM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0B79A4C2954;
 Thu,  1 Oct 2026 09:08:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47526)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCAuM-000000006CB-2fDS;
 Thu, 01 Oct 2026 07:08:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 09:08:46 +0200
Message-ID: <20261001070846.1275054-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.14.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3148/
https://docs.python.org/release/3.14.8/whatsnew/changelog.html

Security content in this releases

CVE-2026-19445 gh-156293
Use-after-free of a server-side SSLContext when sni_callback switches
contexts

CVE-2026-19553 gh-156793
SSLContext.wrap_bio() missing validation of server_hostname parameter

CVE-2026-82049 gh-157190
tarfile extraction filters allow file modification and content
disclosure via hard link to symlink

CVE-2026-15310 gh-156002
Memory exhaustion in zipfile in bzip2/LZMA/Zstandard decompression

CVE-2026-19672 gh-155999
tarfile extraction filter bypass allows creation of directories outside
the destination

CVE-2026-15806 gh-155694
urllib.request.HTTPPasswordMgr credentials for one URL scheme sent over
another scheme

CVE-2026-17084 gh-155292
StringPrep algorithm considered Unicode codepoint attributes outside
Unicode 3.2.0

gh-158446
Reject float format precision near INT_MAX

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/76546945dacf6721d513c30cc57db9e172c83c33

 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 97302bc750..ae4a00c319 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3147/
-sha256  3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81  Python-3.14.7.tar.xz
+# From https://www.python.org/downloads/release/python-3148/
+sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cb5e1a4b85..788d993d75 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
