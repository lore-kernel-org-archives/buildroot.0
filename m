Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54230C9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 20:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C2F40AD3;
	Fri, 25 Sep 2026 20:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3aJuZzPcbcFt; Fri, 25 Sep 2026 20:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0161840ADE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790366412;
	b=CyStWtcwD9LGqydKqtFlbT6CwpLw1eiMvFpk9OwI39iOCzOlKCVYOtGmSroTUhqLclvx
	 uLL3vrfeKCK11E+p/UPQyjuCsfBM+Fhfeo9+5suEFkc00ABGiG3a+fwKEuZazINnfjA6n
	 9d7xA8DYphFX0Zo8z/YivVQcgP8KSb9zRp9oQgpeFJrlOdBFjxjsb4XJGjDy8cDl7tGf2
	 7zfyr45Bv8ud1Q41e6VmLZzf4Q3ncqFfZWIG47s0/N697urHNY3nR9erh4iLmzgPHguQR
	 y8Ga2BmsAXRhtJ96hB7WwTe8nWNoQk4b+6hFWrkGN2fuNTnI2n0gyYqpZU/3cNph60Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790366412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fzL3JUMv0G/Uu6w1KqSuzocF+cPkqjyj9Vb+x+OJo2Q=;
	b=PH4mXiSybE01dJEKEJmWBeyAL/Hrs1aeAf56Ru0Udwmeouj+t5J1QMCuegmU2CVJSZfZ
	 efpiagEWvUfm9F6a8lqDB2V2OUuqza/yfl6jSDHvYSs6h3p2bSVI4lKCgVo4zUitXewJs
	 tlgQQRqhFvMxIU9k3m65KW4nLmTha4VbITTOcdhGiUgb1DGGIMCMfmS6iJcUMEEYrhTZy
	 +49BM/pN5upJ9itryAhydBPcXGMhgThO3gtWutqSKcUAB7XwhbNOnyvrZDS2vVyb88yn8
	 Gcyj8eU4lUlKl8wRJ90LRhq0Rc0A4nvJ2kNS7qp6WWIc5nMfyilYDcXMQSFT7yTOZHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="UH/vyKDd";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790366412;
	bh=fzL3JUMv0G/Uu6w1KqSuzocF+cPkqjyj9Vb+x+OJo2Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HhCg59OyTc7pvFzJ0qiJv0zxmxzAVWRUgNOf8x6bTsyr95prLhvQR0bhG/AVhjmaW
	 5j3l106a+bjfjj8tPmTK2a2ra2uVl76lLI85nAXgKU7xd6RlR8Il6zAMUoWXr2Sl2/
	 C5YmBQ3QMC9p08tA2Eqw/uvyco0dy4JhTORrJn8b34SobnkrdtT7M/tGq+P9jEqtI4
	 LhKMzYhEgRta6rELfJkytP4B08Kp2MO9zReqiffZ5QgdsAw+Irf6CK7d6o9d8XaEt6
	 gglq+G+KzyxKkbzmM59ykMDx7EkVweNOZm1igr7d8c34sdJDl6T3YWc8+wAYraZVfT
	 Ry9xbDB7oAdng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0161840ADE;
	Fri, 25 Sep 2026 20:00:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C38AF46
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 20:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DA6240ADE
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 20:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LygKDJJAeDC2 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 20:00:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C28440AD3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790366409;
 b=Rx0kJkmcN8Q6irnv8Gw93dkTHhHFg9H4eJNmRavao6y8yFaceogvw4K+1jFqsMvxYpar
 IgHBpy1YqkYZPoepbyH/pwBwzWEK09ylveLQ9Nrd6LSJxA8gSWFbvSJRhcZSiIHK8b8Ic
 KrtqvNiL4TLhUUsr2ixWbC4Cxbh0T6mmxsPaGBH465NLOzyjAQin4NzNV/LxljexwTI3S
 Y/rrk6MzS6eR0IwFQX0n19xJAtyg6ccKUR6gwlZKXsDiX75a/MyXhbQLxcjjS2tDfJbF8
 JLQxHjM7Nwyj1/HXzQGmDolwh79dZ4L0wDc/A/ZKj3V7Wxns+U32JE/EEP3pUuREeTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790366409;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wsyZumcrrBZpFnXS00ALHkqosWVVQ9Tg9yILV/TMlvM=;
 b=efUCIcbHMbp27EStKE02+obzf+u//x2sksh0Yik1w73KFUnSTqtONzQx9r9yKl9K/xLZ
 Mk/mYiHceGe5YJRMJaV0aXnjm0rTVvDhhJAPJJ9Gohhq4DaC2P+5Dswtqz401Thrg+JbP
 TsAwRjsjmfzy0BCAAOlTzmzvnfozYXhDo179+eoyhLsQOebLl8pmFt5LkXQjAg5GNV0F7
 ++cTP50xYjGovYdQGdMg+TU8PdS8zRvpGYnrGMl09PnWlHmyUtWqy2y5VlIil+lzuk6rn
 rfYRcRT+cyNoLD2nIavERhuQxJPMYSflme/Q8F2ukyUzTBwXcdzcaeH/+TDA7SPhhHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="UH/vyKDd"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UH/vyKDd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C28440AD3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790366403;
 bh=wsyZumcrrBZpFnXS00ALHkqosWVVQ9Tg9yILV/TMlvM=;
 h=From:To:Subject:Date:From;
 b=UH/vyKDdA7XaLvy+NNDNECcigcqSosrz5pde6UJkQnRkpX/0pa2FhfwSp/1w6YRnX
 kinJWn4RnwJLSTuONFxQPu+cQvTex1gRrrNfqWCWphtEtU7FtnqNnDEPhSSrt8h9zr
 9/9p77zVt4whBp259hvUFPmRPXiuqofA9B/PAmHQptIZy5uq537MGLquS0MMx2Po6B
 h7LyRKADLrzgsW4IGaZtPfTFiMHlyWyCODmhRsrfg7+GzOEjV69eqqvEV+Wwpa876S
 Wfqa+PRJSiQ9WqducnQhrlYRNFUmTMqCjtzSidCvZ3BoOW8l3znhn0DgiGuylKKj/o
 WAZMD5o3vlc7g==
X-KAS-Sym: v3:f51bdf72230551df:bXIS+ero9+aRNSEsM67qKvTiFbb2GH0gJ0cdwP78uQugt
 vDm+k6wvx+k3fTWNWklqqpGtkKBUzHRVZXjKRv3X9ZHhRkAgzy9//q1Z78W7Yq19svBoIN+j1dk
 wxWp9lZ8DTcB6GBq0iKvZIXHc66G2JVbUJget8RMHNuXsmQrC+o2zwibt8ELvgqq/guZNntO/z8
 dSivNhQIWvJ56D2RdQlmCNDLfRBlGaqWIYddzUH/OrWWJ2SGrel+CXFuTkD/iuu/OkJ8k/+2d7v
 pcxfdNO/saZYnEDd81hOhQAi7t01NerSqeC1QmZ/lnPfg7ZTLi3TQoILbGDvKSZL9rd95ojQ==:
 abe3JClkHHMloK1+rBsJsWsz9PrbasnbkAq0pS/SUBaBjOa//eFgu2ANDovPLDvAniWTiT6MjUe
 5vz4q1v+WuQWG6JehptAPoNHtfL8ESrkxGs9sJAn9fTrbU/uPQn6lW/xDCUdU64TlYy8hpkUzA/
 Hu923jivdsyGvHkXikWf5WFAFUKmLmB7JmYETwjL7jzXKJAcO1itnJgYtdKz9l44RPGd18IeZzM
 ox0yV3FH/L/ZFuhQy5FwLqN28le1cRKqRNmguOVdH7GS19vt7eXXQ50i+3vn95jhhkHKV/406L6
 oHKgbKkjF4rhIEKQ5pVrAGfbt6mbDdy0WeiM/jdkOS2kzZ+sopJrA4Em+pqQ31Ju184H4A5dFTj
 mGrKKfzq1G3LXPT3oz8SRIlwAJxz5G503qxCngOYYe0c7kNTKqMBOJh5asQz0b/2E7nCFFmxHIF
 IphlGKU5fVYpH4k5OYP1Svl/aULHG3qOhTRdy7Hd4zpuYroiPAuE6qVbry9ItUjwEhUjnLsGEaX
 BbHL23JBcC6e1PW2+hQPllWVOGEg9JSQmrJNmlpELzNNJDtBLVWhHxOJ8deTzlBoyMMkHgLXod0
 ksFWIQLAlxfEi8hm5xGMwPbJ0q8wtGh8f1AjgTG4ASV7MvE=
Received: from fli4l.lan.fli4l (p5b3a055f.dip0.t-ipconnect.de [91.58.5.95])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E996EA4C4D3E
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 22:00:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAC5T-000000008PV-2MAN
 for buildroot@buildroot.org; Fri, 25 Sep 2026 20:00:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 22:00:03 +0200
Message-ID: <20260925200003.3565628-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.5.11
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

https://news-web.php.net/php.announce/506
https://www.php.net/ChangeLog-8.php#8.5.11
https://github.com/php/php-src/blob/php-8.5.11/NEWS

Fixes CVE-2025-1218, CVE-2025-14181, CVE-2026-6103, CVE-2026-17545,
CVE-2026-91765, CVE-2026-91766, CVE-2026-91767, CVE-2026-91768,
CVE-2026-91769, CVE-2026-92842 & CVE-2026-93682.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b2fb4c48609427e6024c97f3d805b3d0bbbfd8d5

 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0b3d87fd97..0f2b6785bf 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  6a8bebaa4d5a979a38db29a9373e9851f60c6b11f72172c585947e78f3081957  php-8.5.10.tar.xz
+sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ac5730a22c..48525b7e29 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.10
+PHP_VERSION = 8.5.11
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
