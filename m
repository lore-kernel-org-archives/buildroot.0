Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 20:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C237D417AA;
	Fri, 18 Mar 2022 20:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPLTn-aey1pc; Fri, 18 Mar 2022 20:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0222D4175B;
	Fri, 18 Mar 2022 20:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D521C1BF2C6
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B15417AA
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lV31EcFQ_mi for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB6D74175C
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647634845;
 bh=Alka7R2xqhoH+avs91AhXveEkSnvs8i429bkk7tNFAk=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=CLTQBjJov1YOWVB+VzHTAjti4h8vowSoJWAct1aMGQfyBeFHISiPFNLt1P1akDt9q
 pc57i/3mMxUd1Sx6ke8XhGgXuIgrvFphXJtXamcenfjPaNqP44pd4LUAAm42g8mAuZ
 v49oi4f+jschxYtIpl5fb/sDRHG8up0VVV0Bwyxg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.106]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M5QFB-1nUU8m23nh-001PHY for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 21:20:45 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 21:20:40 +0100
Message-Id: <20220318202044.10413-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:KtKkXaXXKhuqcOoeMkOImvO3z60A6T0nV1w++Euwjg5nQbei6N8
 bf3lu93hYHDWEUHZC8jVUZtcppRaHANpp56x4KiYx98czK58/uoIFs8V3nr7RbVIsfwb4OB
 PSWFyhbA7B8RGS7MieWhAr0SDosRdADGb/OfBHD74wRT+76ywofZWbVCmjQul/OnadzUAms
 muWtjnHLCICm4I/4+5UfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rYoXpesnolg=:cBPj8pTvYfqWTcvKuOBnEd
 fuEQdR4q18HiApCfmbR2O5kcSAZaIX1I8FwNp1buYQk7ubgWsPcZlTvehoW/s36cmk3F+pTup
 2LG7m+IN3SZ2Hv6QZ5mFIfEi8dZpiiOHwTNpzqP4EsQ3Am8lv6Lc0CEN6waqK6T9XEwZ3uMnv
 ZglRdqiyGA2oOdbofgh1OOmrod/GV3UlUbu3zMznCgQKeEPqKdam6kwh425hbQMWpTswCsBXc
 QpOcQ/EVKVe9zlVfeL2oz+CvSBOPdOTwPZAbNtVZZxaxciRNCS79QICVbxxGbK0bz3je5/2wc
 PPolZjVQdygaHJq0pvOfMokHExL5PwaioqktaMnhJC5IkElXfK9dblWDHPq62EpVZnSEWyyF6
 Du7hi6i93AI1oeIZ04fhxrSpYULEQ+Opn7SKWpplCp5TEA+6/0o2vFlIR4XIU3G8YqhDe0PDS
 ofwVArL/nWZEOxC1esantE4LfU9l7/olh1AWk3VJRT7H+poVIzfzTSSDdJP4dxAkUr+MceHYD
 cMv3bWwZfc5zM/8DUJfgZkzHg0I8dHkLaT4do0zIb31iJqYpCaFbxS62Q6+AEwkxie7fqLlIs
 XflQC4Q87ntqFC8qqExXsKNUTLRBABGyQdNcGY+UCEPfQmc2UB1Yx1mba1/e43yETTAWNXUe5
 FucAG6XApOEQSc0sXzFXQX/yHjYtekWolAKAC+ffkU1gD0w04tQ/PUoZzTi2/XDizYSm/Sea0
 J5xs8HURZ8DzKkgZO68/InjmU7WGiUKwIgxjTB2v9DQPGNa0QIQbyiQTtmIYv/Nas9CL9yLLx
 GubC7KIoGnxTPmpHtBmhcnV6q1wx3BE8r5amT6lzRt2q6aBvXrzd9st/Iwzuc8BRhUi4dsMmK
 IT8U0vpGotibkpxMijmxnCy5wF4u2tE727SY63rMpl/HhuL1ESUIkXPFpgBp+4Nb4SHiHlCQM
 8GJ7W+15G2Zgp1TB2ZtuaeTzDeP2pVbKEiMcRxDkIuff3gjpUaWb1NtO9KBrP0d1NkhvUraQ3
 tBdZsKFRu/G3BclH9HjxM7qAw2oWnB4BigJFPx4h61sZ9SfjmRXrfVAp+qwi2TSfLSEW1G3VA
 f4Hh51yjm9fPbM=
Subject: [Buildroot] [PATCH v2 1/5] package/wget: explicit set some default
 options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

- explicit set some default options (--without-metalink, --enable-opie,
  --enable-digest, --enable-ntlm, --disable-debug, --disable-valgrind-tests,
  --disable-assert)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split out from original patch
---
 package/wget/wget.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index f30fa39917..d100a59eae 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,6 +12,15 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+WGET_CONF_OPTS = \
+	--without-metalink \
+	--enable-opie \
+	--enable-digest \
+	--enable-ntlm \
+	--disable-debug \
+	--disable-valgrind-tests \
+	--disable-assert
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
