Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37762C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0340E6076A;
	Sun, 20 Sep 2026 14:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMvFys6OOEGX; Sun, 20 Sep 2026 14:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7EC266073D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915801;
	b=UbtEa3CpMCe1JOHQNqG3X+Qn76FVMjIX2rye7Vntm1Q4evxE4SzTMRXmKGR3OVmeW2k7
	 raasqnYUffkXB/wWOoz5BS5Ja93CzOf/5Fq34rEwHlmpH8bg3hvgvpmRK2fl/cf0y/wsX
	 WKZpnTI4jsWNTa28fl0Uh/1+5DGml4UBeyXTXw7eMmDAD8l0btrXI6MdocFpBdMCI+Hut
	 i5t4wAmm+6fsvcm2nZAEgFLoA5nQ+0xtObQNHG1Vy78RNaB9K5IKmZAMBz1hP0N0+nGv8
	 PQlfFvFGoaK578hO+5mvyZRRoxfE7KxkpqzwYbec7hL+Sv7jK39GDk3QNv1ghz2COOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	b=rwEKHgmsVfjwbRWwDEQlI7oXBsg0HWtDONntu4Atg0c/9M7Oc1/xaSvIKRS70vikdhR+
	 NChm1fSyb7H0KjCm/oo7RHm1HFd7XGJ2ntb9KkkpJzeZl7T2wgEWplmgj15pOEafFx/cs
	 cFDd7OF3nrHMoqXEz+dM3lfz0JuJSaolcT+lM08CQOXn55vJmXh/+ErchYYkqvTs1PfUv
	 Pu/B1EAh1phXOP4q6O5B+3W3jO9VzlE7BU9140OkUH5aAcC8Rz/hNoL/j5Wcxyk0hNMBw
	 9E5NmWF6N7X9KmC4G9VfW2HinOPXZXsaB3sa5QuVRuAL9Wt6/vZe/5pU/56hL2wYHaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915801;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/kYAkNffP61IgF/y0lVgE9GtNYI/4rrJukvwSjHgdcLmcTVqnGypqyuqypd5ENpY
	 wLXjHuQwhCyRNYIEMJqhKdSjkEKeygb4xOAmO9UYPYufAvK4FFNuJsO1IeOKNNe+pN
	 bi58UyAh9nzeIP/HXlqA54NA+JdVayrfF44/ToIVmQBpjjehN/ueKe6lJRk7NCCyBH
	 mxVUIEIosITbq5YgvpN0Mp2c+Z3gZ0WBe6uGk60Nr8+fB5bGHyudumuLxQlIPCrmdJ
	 pYLUubZsV0+db6Ubl8bkZzGgysqwKKj00FQE1VJLOQI/xtI9vDiS4qvh8BPAjtSi5R
	 tXs41kr5lA8XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC266073D;
	Sun, 20 Sep 2026 14:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD23E37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC0E40EA8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lT41yNOLrWFY for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:50:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DCC6240EA2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915800;
 b=EpA2QIhM6aMUAldoI5vZrActBUbD2iKrIEP45Owl+bR6cGDl5eITDSq4KUNoPC8MkHZS
 DNZ9Bcia97NoRZi2Wkm20E0vucAeLvq59sHQi3J5L2e+rOBr6HXjY4jm7RsgE4dD2zF3N
 cDRO8fBgkGnH3alwXnzkLdwdoaGa2uNul/2vsOhmzD6sME8s7l4CRiM/l5sefNs6VsQwk
 z7W9ltWzFSfdxjyDnrhxA8vjKmTqwtjc2rlAXpnHvwYZk3nwTCnsH+46osIviJENOUgZH
 WmwEWeR1jQLORT2rKgkc5SYY4RhJ3NF86uBUZ/GeqnxK6iVpHrcig2XknfZkGvDOcbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915800;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 b=eFrFBUu2BmsSrIW/9LHjH0w7oD6En/H+qrlO80J9mpnHI2xK2dLfcuea0yYEN8slu0FQ
 czynl0NoqF9hg4UGTFjGUcK69M2iMrZDDZcw+C8Zhc/s0HSlwj9TK0s2bLdhSyeZKqnhE
 xcQYspllSIwd6P6uYd4eXMCl5MZWDd2ngW3hIgPJ4snWeGed8cbJN6ARh0Y1XcapgAaC9
 z1tjyCCYtHP8w1BxtXy/ipRNZ5sCcbiQi0y7iYGk5h47Gqf5a7/45o+E+WQyv/uPrhn18
 Imb+Xndwnt2uUXtPf5On5mpzPyhxtwhWReqeEDuGSVXU5jck6vpwtIPvvVlE5D2QzLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BT3OSoiO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BT3OSoiO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCC6240EA2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=BT3OSoiOy+pCSfdZhH7DL31z0lcCcWLg8GAmQrCJImg4d668x2yzhmhaksCCEi2Ts
 LNAEk3CFKge89tDRmj/3sr/+wz0t5j7Hag5Og/807JFuTTDqyP0wCS80wMM9q6Rp6W
 /VZwMrefwbH2pV2bHaGCp0E+S276WDcqWTcyoknCoH582b/sK6HKVs+hRWqAyoGnlG
 0JEXle8DpmYx7V89xM5NWDDuSGYNaTJYw62JAJ45zlcH4Strnv1XbEebElosh2WgZb
 BT/kgNXJGTTkm6x1EC2nsxJzU+fXY9onVI1+47Zl15NerpU2yS64jT4XkyD6Hx0dNH
 jJlwwfvGyPNoQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:lT3TW18UuJVO9H4hOJcXtaJREOt4HPYTUjH01KkfvijmJJCyDaG+By+C8zgxGnvHnLi6/MuYscEfGIUf4Ca/AfzoXL/UICCzgRL1Pqybfy92HH2wzGQveiWUFav+7bdki2iVRloxNMRiNfZN/z8EAhAHCTH5jsiOKWwk4E3iZxvT0OcOtk6R9PMrP6AvM2nS7sCwIlmQD3lYnNOrSZz304zV54SDHlWxQoNW/BoGjcItJH9SFh8vq3DoQpbv2xZ+9h4Qwqf/Z7M/B05iYsBdFKX8+IKc5PXYwXbUDXHQJ59aJr7JsC3CYw+E8k24ZAsRjAd5NzXKbfLVr4r2Wcrrn7rbi/EPwe0qjV1Qlh3mRbOyn1FX+3J00h2MKSm7Jl4TxzcBJZFDR+XPjFa+muY9lf9153IyWhrz8h7FuYEzb7/6XeBYoRRk9eA1KdOCkymSK4lnEE4fXLMYuFqcrrfFAifkMCxj0IOeXOLe8rWVrjARtk9yJZgu/7TNOQ0cpXVqkT+xemrjT+I3PSUv43KC2Srb2C1/LnfoDf2rxSpVcW1ys7/U3XULevDdshOQnisIs8lf/z8EhO5crwsqsAZnekjFAi4wNQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6C6CA4C4888
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-0yvU
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:49 +0200
Message-ID: <20260920144428.3009612-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v4 28/66] package/ecryptfs-utils: remove OpenSSL
 support
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

OpenSSL 4.0 removed support for engines.

Please note that upstream considers eCryptfs deprecated:
https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 03e7f3e34f..aed1cae2a0 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,7 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
