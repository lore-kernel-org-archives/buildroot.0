Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F93CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 682086078C;
	Tue, 13 Oct 2026 16:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oy5_yipBzbvd; Tue, 13 Oct 2026 16:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E2FD60643
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909783;
	b=OZR267BuICXJCuNyg1p59KD7F4WADR+HilgAv99QAS1fb43sQucOP0P1Uydk1QOsTCz0
	 UtQPevU5Sm2w0k7vuyIrFOl9FgAMbn8pejH8axLpzEVDUcWU0YP96SM6GG2Jo+cE1p3Fu
	 qwJ3LHbCiyRZXtPVefWb6nefjvMP1cEc+FAjPjSHaHQMiopOF4/1vcNkvO6/h12sjpD0q
	 WlgE7uZvI4+Zl6y9Kqk7QJH0+6S9vNc3CBEG8OyxOwW+hwk9AQDjIaiNaSitBfHMdAh85
	 +ZRbBC4H1tbSEMONNAgDxJskXJa5C3j1cdoRUG8ES4QyBIT4kdruKswNy5r0bkY41pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B/R0T9Jrw5jOj4hMjVuveLCDyH7Mo2nmYGe6Y6mQAjY=;
	b=dpK4IwNbUUlj3cmJ/Wo0UevrGTvKDh1zN+BI4bAMflLinX4YIoPvWpMfQCgu39MnDHZd
	 uK8IyTMCqFZfvycHPjdDWoozZoRaLWpz7BZs8vDQP40rH5QxNWBNV74o3FbJw+jr5bPQS
	 A7+pEhKHb6KDxv1xs8ObTrDIAOPmnag0MayXZp8lpwjRreJpPObzUuainTH04fEMRkJ1t
	 w6mSt0awPfqJZqlF6E4uri+sGl9wjf0s2tnEgn5ODcpU2IwSqcPl09jWbwj0QFUtOzm5u
	 UKpqjfXF9L6vyII0qEOxna2CoF91p9/ErKEMvvBrATquIOWoN5qHbTuPJ0bov3AUUCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909783;
	bh=B/R0T9Jrw5jOj4hMjVuveLCDyH7Mo2nmYGe6Y6mQAjY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jZ8LLbvRHCV1frL3vZvLa0HV7Y5Rvo3gw8IYmB9i86IS89B3wkkp/Xa6DtJvVRuCl
	 tQR6kcaKj+WGPqKU7XF3mUGBuDYujJiXBbwG9vNhK6eMOJhmOeeCWwQRvhVXFSN2FQ
	 PcpoKZmDGr6lx6YRLHaz86EWehGJiEZa1FrZVfrlmzhIqutjGbtIXkgLVAjUKrQe6X
	 LwRNCFk7AXy1i1gT4a6AtWif74P9w8Ou91PDykYrsrobS0clEDBZ473QN9LX+r6zzc
	 SnQ5/6I1pbytEApq5LvN6svyh/QdtXZhQYeOODhit9osrbJWw0UBy/GnMKSFBp8yPK
	 uPOnKRQEv2USw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2FD60643;
	Tue, 13 Oct 2026 16:43:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD89E1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C43A14037D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1x_2I0Eedgv for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:42:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0F624027C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909779;
 b=UySXqrsUn016d0UUr9d536sPU0RvvooOse6DGsvYg2rIGr4PHcuRKIROEowi1ih9T5wH
 G+CNQvg7PO/P6EkE0cN0bX/1+Kiq1w1oy4OaXz8WWGYfzuiQUJJbP3sKKXJjRIj316zCR
 pGDNIzKGIV5g5g+4zLYUpXuffTCq2aTVe3pl670dh0B4DPQuHpofpcKqu9LuJXfkP4SqL
 DRZymrIB5J5BKbHXZNwfGkpJVfl/PqzH23lR9x+RuI1BIJQU11R1WmzR1vj4Lc+0xrIBP
 yimkdjjBGWEYlN22moSPOuqWgSA0MwPISzXAQ57sTzHQt83xrfWXr1VbxlI3ks6Rrag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909779;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=l46S6XmbOWHZXgmflAU0/WhIlLw0ZwAKSt6m1+vybQM=;
 b=ZBsD+BbKcQ+M2q+RbM0n4TFyn1OlmVUhwinafYlWdwdJnHQAeMmoJBj+Cc028TORsESj
 ufXR7bdWvI1Je0B0UbQisZW0z/pQW3ktx8yvDrZJEHENRZ5Sw3uFOB8Wx+kIArD8EzzzC
 TjfY/S55tQPaJP6HwsYxOi+/JfUuVBWOXEYf5EwJ8IeKA+lOPeallenzCf4J6RqPfJoUo
 SbOfEY9tyjyQk+x/bebruT1IrlhlVo1kivX+uHAoWmdYkH+y9O5EOSxgCOqdbH55L36v+
 kHpAH1wcll3M8PDpNswjn5saM5zvPTIGKYmqPWcrXGe3syj8rqo+Cp0OQAUFkyhMYUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cEd7uEdt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cEd7uEdt
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0F624027C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:58 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6f74f6b46abso1071147eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909777; x=1792514577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l46S6XmbOWHZXgmflAU0/WhIlLw0ZwAKSt6m1+vybQM=;
 b=cEd7uEdtE3zjRwZEo03TMPnOm34y7EjeQW/GCZnM9SKWnO1JIWAzY5+WHNfSOoKmGe
 fGV7hA5zmBhIYTEY7ix9PKyRIhkWWOfoQlBtIn3hcUUsC0lWHIWx/p7BYh7z61gJBKRV
 UlgA5Lbh2kGEaO9scX084SdcHhKBhJYDtMVLDY3vKy7XxVz4V8qMy0/s+FdhePec2s5K
 g2wUk/KiNIJ1iDY19a+LJKaEVnMcCb5XFFKpObvdC222zrxanG5OsRUBQC5sBDX56IzL
 nhFYTRdh2pZUI5aLIFcY4iQ21h4uLNxIL/aH+8EcniES5R58CHRdOyKXjliYAYWlBjLV
 Kmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909777; x=1792514577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l46S6XmbOWHZXgmflAU0/WhIlLw0ZwAKSt6m1+vybQM=;
 b=iDsIoWWzIHutEk1eC+YpL6QssRf8pdGQMSM9SqYiyw7dgE7WQ9T4FwoInnNHikHmwx
 TIdfsoidy7pMM3X3TCJqxCSKe23/2QGR63dQ0ft4BZV1pX59kCYu7NBFSmAw8Qn/5KvV
 W5uzxBaY0MdpjbQbHHYziSj+45d3WCrLcdoB2AYzmmLwTP0LQAc4BWJTrULA7Mexh/DD
 KXXLyiWc4+/gD8CwhN6vW4RSMPQNC2cYKJqJKYJ1tFQ6p3IOVYxNAARg+RwypKQ4oWK7
 /JKOJtBPyOiy06D3lzjwXEECuSw0Jg+azsU5/QGqbhuKHAY4xagDLuFatxRMFHGZAQjG
 I9MA==
X-Gm-Message-State: AFq9FYIeaRdVK9jGkH/jfHfI2VjC2dEhSWKMlUFyYUhMp1b705r5MR+O
 BhW5QOz89kfwxq3sjq3h92ZH3yKrrbvALW3pD2BpUO92qaVMZAnMvi55WIRcbw==
X-Gm-Gg: AYBFou0kdn+W3+F1NufN6zeUmeJ7iSzRx+elP8n4Zk/7b02YbkcHx6uCvwjYeZYNw26
 kRmjyWEfXoNtNZQL2HvfTUV1b3h4Zrn+lhwE84JstsUJN81H5KWBNF5FoQepl0c2JZBzm9OOrRe
 XJo7l9V8MUZAxXxYjpHt89JooBr7lh/lZTnfrbT9+co15N95IS0Htk0xHMBIYMZcbIx5x31EdqP
 v1+jyKKx29shMy1G2qVc0za8LV0DXReVkNBBtKig8uSC/FBOh5ePSjyVEADm8qYGpdjrXR02zNf
 MSy8ZyoqtrNHH3Nqt4gFRZu9GS3qTruaWEa9YMo5Z8j4jmxdX7ezPh8gWEsbgJQhQOAILuIkuxX
 bzRSIhS9D/EJw0U52rdIVHAldoEn8+tcpJZvPA5XE5lETnoHlfH6H5pR7UMcUuNkH86DfDe0t7/
 HT7sB/KzF24fKLbv1ksLEakbEYnYOKTK//U7e2Xyv44C9N2CM1YI/K7P7b3PkbPG3feL0T1lQj6
 Jfg0fKWpuCU7u0TwJJ2iYYRwRKmrs4/s1H+rM0dsGXDQbvmOlGMpNk3Mv1qMjnYf2gcgStbRmuP
 /UWTChdNiAlZBaQtzA7pCiyj2v0pe0DoAGipr4NgvRrvaBgW1k5xthhmLWF2j2MBtiYtx73zCpw
 OIFWpKwS+4/6n8vi6g7kj3BvLqEHAsXq4daZ02be9/FY=
X-Received: by 2002:a05:6820:99a:b0:6da:e0c:c3bc with SMTP id
 006d021491bc7-6ef02899213mr9059308eaf.0.1791909777322; 
 Tue, 13 Oct 2026 09:42:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:42:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:48 -0600
Message-ID: <20261013164254.1476592-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bitarray: bump to version 3.12.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 8661d21936..b9ff325312 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  07b44aa7a18fa6f800bf30cbe4a6e978  bitarray-3.11.0.tar.gz
-sha256  bf19437ec00ec3d40aef82eaeedc14cf4000be9b635c4f5049796506e6630dd8  bitarray-3.11.0.tar.gz
+md5  0c5925f54da81648a14ec51368134c27  bitarray-3.12.1.tar.gz
+sha256  b712ea178c26c00b60b14bfd17fd0bab6138a05b515884b0ce418c0f6fecd2f3  bitarray-3.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index c803b4793b..4ebd26e593 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.11.0
+PYTHON_BITARRAY_VERSION = 3.12.1
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/04/f7/6765577df59e2345036e435f7e983e1c291d67b7d76a51918eff04ad1494
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e7/af/9f136a8191822bc9277fa6af9241619ad6a21e0638b694bcea1b0f8d0d88
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
