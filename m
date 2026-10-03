Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667AACA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B70960DBC;
	Sat,  3 Oct 2026 01:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDKuPp8TzGkD; Sat,  3 Oct 2026 01:33:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2DD066065F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991221;
	b=b51rXj8erj9gJQHUJsKztbsKYwRCY4nfP5PaSiAJ9ioyntOmMf9f8o+5iIgXyeowHl2d
	 RV+/mhHsfwxTXAzOKY8PjhmBZD1svn7e7NcBj+SwnJAvma/5Th5dwlXRz6ghmXGdfg3d0
	 2UzAH1+L7vwWqutGXm7IXi9gXoJnX4UIwJSNx/Rt5+We9OPZ/aN9oscGWo4vgGc/8LyTz
	 YrKePbYcy51kyaE+NzKkVr+DWSL0m6hYe/u7HamWFIy/smfLY94912qT9QFItTE7MWVKM
	 wJUDG364qjCi/iEQlZ3HQNYdflij1ivnCidc0ILB/BW4vQqxTouUE+Oj/znSm+hoVRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0XtDlhialkORWTawjWK/T7M2YNgnaLiifnKA6M88df8=;
	b=TvOOHjNyMpKr5dYtYRewB/ao9cEjXAHgE2YnT7Q8ws1KuXPg2T1r4wl7BxDva33jY0sm
	 d1jyfhe/wK0X9Vcor/Hi0p3G4Ljj7EV4czajyefwZhnA7WclSJUsZSI+YV0GNU6UNWL9Q
	 dO4vWLvi/hz9QPhIOOxQsJjTiqrGjKWz18+lsuU16ml0srZQQeBQJo3GWaF4b7x9195y3
	 KK9FxnLpD7lAHhnUEq/naiPMuaHlYUuKR52sBI5NTv+auUCCWttQEAbAhybeugTe+SQ1m
	 kEM5VdIisBBsYv31tf/u4iVCgkto5ow3jgc3y9m2ODpX/AoJPA1XggzCD7CRL79FCow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991221;
	bh=0XtDlhialkORWTawjWK/T7M2YNgnaLiifnKA6M88df8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qi3g1CTfL5vPWaEoupJGCHIWRA4PejDj5SdNjmvbMpjWdzAJJYJjlltz0Zl2IlD+g
	 k1wjMPsnDZTMMwF6ag+vzD+pLsnZ/o+wuiWdbpv8iDI99mtTLXDXJHuqgwdiBj3Vsm
	 8xy4nRPfchTOBMjTBq825BrGVOcP95C+NYKWwxqCjqIGF3FEpGEK2FlYsr1pPEU99y
	 3bknpWp+GMeVX5JM1SZu3Q74kwc0L2lRqF9iQCTGbb/jsVPMCYwov/akuzoDOI7U5A
	 9l3E/j1MyQXLoG7dwyrREa7yYy0VF6WeQr0veV9LQ0jgPnIzRZzWBhiBLJUCp/vqF+
	 Bu/xVrLRYTCsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD066065F;
	Sat,  3 Oct 2026 01:33:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B9D7179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B1E4400C5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBScj9bMW__E for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3C94740059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991218;
 b=H7gi9mobWWJIUiHrorXCas9ogauO1Ruyhnjdmky0c6fBupgOI08XQs+kEYE3GF+faTDP
 n1R8dSRKsdLGVwNAAwX5SIAVHJX/TM9UViCZHFwfyYukGWpjqSHC1xO03jkr+qkazko3S
 Ck6WYgaxUgo+186z9G/BoZW7O+7Ej/utpbUrqc6lO0ZlwdOrJE6+XZmSD+oIA3qbB7x7R
 jQVs1JneFi7j8CVfEn+/6tNzHLORKU3RHcfdLaiU7JQyUpsq7Yzccpc3YxKwemoCSWPa9
 zGqpil4vFxsY4WAOtRlkSFa6VYdtJpZPY5m+vxj/CCS+em6Yaii6oenGmoJfqe6b6Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=srNC2wUiy0QaHjmRbSInx9T9IiiFd7oOg9CZ8KBPO6Q=;
 b=NlfhQS5pzrK1HnEFKZRhndg4Xa7FB2YTaaFfNCjUZZOeokjNqKFsjRyQc8bR9WkIN/KG
 w1p1djy0z1QSnFx3KoR7QoefE3S1kNfbEUokJe3StSc+9wzwIV9cNbQN8SYTwjZK8k+th
 bsrZzOHT+Se7CNJOlEpT4/5UEjl/h21SRKBdK+9OdpenE1DJDqXySea0VYZTUu/kbCsYZ
 +uHhZ4DuYeppgRHeVK4/9oRtf/mnrFfJ42guZKHKQbLH4mo7it+tUnpZtsHMH8i0pusre
 ETlk6WyU/Im0EsWygCgGpo4Apu3MSLlcAOdCV9soLiae0wNd91CTcajiB2bIVXv5c1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oDnIzYk7; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oDnIzYk7
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C94740059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:37 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-8049e44d0c3so346728a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991217; x=1791596017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=srNC2wUiy0QaHjmRbSInx9T9IiiFd7oOg9CZ8KBPO6Q=;
 b=oDnIzYk7NIFWOR9iRiPbWBFxYoaw9Qxy0L/dvjH94xNEQSbs05CmWih7PqOD4FxYwU
 Q4RdkoelSdwSJrSFCE3lrxi2XcWOyo/CLAFesh4I8YpxP7DXLrv1Fl20T9TgoWANnJEl
 BJKu48jOD0g7s8P5nA5YVq9/5+UKJUreG69AFqXH1Ddjvh0FZYMkdoT4Xoz5xIKXT+wa
 8VpsZyFQcsSZ9TW1bMlNO3e45xMpOIpCqQQQLX8UC7uy4ZjuXRVRfPNCmtwjkOwF7/z4
 BuzhFZZ+CZAOXmYGMWgum3OIvu7kGom002C8lSYJKsgcfMJmdviBK0cSldPGiMFnluRr
 iSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991217; x=1791596017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=srNC2wUiy0QaHjmRbSInx9T9IiiFd7oOg9CZ8KBPO6Q=;
 b=tJWy7iP/osPgdQAG1rJf4vy0S4EdMKZwZjerawviUplVESWIERwX6G/1YQzeyG2W3s
 1H5/ZMRYH5g7xCWsziv55+AKohVLhchG7ruBGNts7hncy/FmHVZnfIDWCIjaIeCqOAKv
 vOahcmDm1j/I0xHFz1DFxQbJUIWf5Jac9lpS3hBLA7QF/0aHh2f4MasqYoSjD8O1pe4i
 eUOZW9+jfTXXbTKId3vQ8KfnWlLzyp4N4ySreU/R7gNaHQWV+sBA892V0B5ve+eNF7jZ
 Zm99kVD3h9DtqmpCBVAXB900XbHb+Zv4WY7lRyHODj3dA+DowlkUewQgMT4cwqbDUj+s
 5R5A==
X-Gm-Message-State: AFuF++nNlGkbial4O41YAFldXYzeWDZ+qoVGmNptF23vVt5X+UPoLAb2
 hINzGETY9nRsH7Q7EzjqFwCuONJwIDEhTTAyzv6q3lZB5d/+BktIxppX+YzsMQ==
X-Gm-Gg: AYBFou2L18Ks5+9TMtrQq74C3EizXiq3ZPdRj9oHu9+niIF3IVH5Jw+/JYg4ZucKwlN
 TLXmhe/ZjylE1mIbtKQqeUMikqkgNEXE3rkDX9FcMgN96MtlszAYqU8d1+VWuz8S38WUOr526U3
 JOZNpHpc4WJjo3cPeE44LNxxSzOtNTuQdgkmkxyAzLIwwe1ydKv8RqLOC5yd1lS+ooUiPEa8Igg
 CQnjBtoXIYWYxy/7Mo2K8hHnZQHBWp5uMEwlmNlJCYaQuPh3OeX0+UTXw+2PqBv4ZYuVlkG+l00
 SCF5bEKQ5D8KoQPfkVQ258ro7j/Q/qu168f/U03UV1PE2V1/mQu+bHKD9KBDv4/omrpVcIqugUT
 kZ+neN67TgwlNSm43SjP+xEuLJpFCE6Zy3O+le0nNsOFlNJW7xL9bVjEj9nGiakhS3z3SiVey/2
 v6hzZo7uA0cQLIea6PzlAR1bhuqI3QUkHLlQKlObrkL4OubJfEg6MzxdClNSo6C6WRA68AZo1uJ
 reoX894uLIFhoI3RUweripwldwjhL7lvEKj7/BnxqRKdPluZBzTH6bkh2qKtKbFhWH5E79QE2eD
 s3kYE30ymLc5JzuA0/nQ9Jqkfcft1EJ6OqizPaMMhPTQA0dpuvWHCCei1vUh8/rQ1qs31jOX7u3
 97xFjE3M7tbXP/ktRf/07xuIemb3O8bxwn0Gm+eb6yDSLMn5eGArT
X-Received: by 2002:a05:6830:4127:b0:81c:a8c5:633c with SMTP id
 46e09a7af769-823fd303ebbmr1217936a34.17.1790991216819; 
 Fri, 02 Oct 2026 18:33:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:19 -0600
Message-ID: <20261003013304.400979-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyelftools: bump to version
 0.33
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
 Olivier Matz <olivier.matz@6wind.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyelftools/python-pyelftools.hash | 4 ++--
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index 7c0867afbe..667b57da2a 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5  240cf39dc5dad992f25cb5a4e4244f88  pyelftools-0.32.tar.gz
-sha256  6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5  pyelftools-0.32.tar.gz
+md5  fe803bd1cf061e5330660a103d9c82bb  pyelftools-0.33.tar.gz
+sha256  660d82dcbeb8e83d1702bd97f223f761625da06111c0cc988eac6b8ab0c1b61f  pyelftools-0.33.tar.gz
 # Locally computed sha256 checksums
 sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 19fef11515..e2d56991e1 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.32
+PYTHON_PYELFTOOLS_VERSION = 0.33
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/b9/ab/33968940b2deb3d92f5b146bc6d4009a5f95d1d06c148ea2f9ee965071af
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/a3/11/767522582afab1b884d277de0e6e011640cb9d7292a38694b4b1a1df1ae8
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
