Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB97C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072F640EE6;
	Thu, 24 Sep 2026 18:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5ykGsmc5mt3; Thu, 24 Sep 2026 18:58:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0882D40EE7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276285;
	b=BfPqDCabr1d5v+5u8tH9ofJhsPrYBCFjj/7fEITaX1NxgZQw16xOnsSaEelwl4f5aZ3N
	 64L+8gw8nEhpGRLL82bqXdpg/cZm6s8DVWtGOTOs5UCGCPfa0tkrxg/1FHoeNoO4FVYf1
	 Ol/hvxANWe2jOwVf8EYyCFW2EjxGWBsqShgHMP9iN2Rm4495lt/Wz+TJ7GH2H/ovw6/Fa
	 j/1KnvG6W1DrDJqKq0DNfCS+FCEA/L0geK39wIKAIy7AbXWHpUrHlCP/SCKy18Ik2yML3
	 a6aUxgEg2ikCikIiRQ94ZZyPRtttOHQsp8g5/MV8aCkK2klGDtH1OnlUFRlKxwOE7jA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4xQmq6AmesvknOIC/qMfAyZu8i51KjMvXREkAZMt328=;
	b=qSmETJGNfBtJzDyLgHMpy1Wbov+xVM31/fYC7qO9djYWEpMmSKAIBrldox4sf7or/wWa
	 eeGvpcE8JyK0zVXsx9vvCnccgnbZXrypf7qgdLZT4siPy99angAnB2PWTxDgGByMP6AHP
	 ZqXwLVI/xmKITjOzZ1lZ1ABmjO0iwTthmUX3IKlX6nAvRIdIuBYunYzY8Py3LU6qwugrc
	 GqGxp0rT23Ev6cVHGNOiYiXFJQIACb9er3K+9BWOFmcRQ8H15GUjd8hB6rSqRSO8oD+9T
	 n9nwl4lPDWyXiNAKfVPLWAtB4/LdjnYNmaEYbx2NmfNQH6DvzXN/wXThIGZ+MVSWfJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276285;
	bh=4xQmq6AmesvknOIC/qMfAyZu8i51KjMvXREkAZMt328=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nS0QiaC5hDpsuifdo/3coliqBRfPgHD1lwhRM4yof6aMDMQqkA2p/PDjglDBPghQ8
	 pclQnCPh+tQbB5Y9JbM/GH/pcMR90eUfdMJslQ26C3QHmCxgNLThlCrxf7qnTU4fY3
	 0Vvyp4OeYm3kUK1KoAgZ1DMHPhDJqWXT18sHHpLOXH1kS+YvsAUwZ+BqR05hBVbxpx
	 qLHtZhDHOwnpECrkI9uWyh57p8YqGMsUGV+sJ3BqTZqbM+p21rdGTXeY96EkDb4dM+
	 BUBxx5nNxBzspCwITOKnLcw6I4N9OYEuP4aZw3anbS74/w+8q7ytH8zR0XBnKmJUET
	 v7U0sTfESC58Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0882D40EE7;
	Thu, 24 Sep 2026 18:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BC94417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8954B40AC6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeJ4_ZLvdOlS for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0597140ADD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=ky27/5gfh8qa6l04XwvNOMUwVP522Mh+u8JOe9mNf+P1kAcepVnjcxg/Gie2kVpvix2z
 9u5bxbInc8+hGBKTzu00FVmbHPNhAcE1vXdDCTjfhEcK+mZ1XYqDum4Yiun2BYp1US9Tu
 GHW+eXA2Jv3dNkPaMVESzfZQ4/dNxm8jwO96FJtIwEFqewgnsJn7brvuEICYWgfW/8A4+
 c+kmZRk/Z3+WiWGyO70IIrCC6cqm2aKO9/hlk04zOC5m+rUpoCyKyJ+o6xASSh9YAatrP
 rB2wCBJsw6AI4cVzOGKIYew/hBvly0YDinDpOt5VxdydkTzYZmFvthIhmtrCkV0C6Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vugC1uwtZU0eLPoZHBMhCgn63zOoocf0krcZ33eaXM8=;
 b=n1Kdsht0mt4Axd+tiXzpQDP7J4nZdrxbq0HZAtOWjJ78No8qJw5/34JAx1oKhLZdWcd9
 KzlcvIHnKZeRp86WojpBFHeXe+zr7g+1pPq0OzDhkkAa/rTmIfB4a9UI2TFdRSY60wEUH
 2363zqjjscY5EU3qGA565+1vs1YMmd/SUcALBXP3S65ft/XKuza+6epTCy9NExtNA8Tfp
 DnY8JQzoue92v298o2OmlU5svCcROEPfj/QynShZlTzJBFmjvfGCUeojlYDCsg0zVgRPN
 TXHRnfUJ7lBOTClc5hyH5TpOJUGCY22y3eCB54fUbDm7X+TxNLNq/N6F6RbnVr/9t9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0597140ADD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E01794D3E; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 686c5972e8aa7e7e919322f35737b1426fa80c63
X-Git-Newrev: 4dbda7cba14dbfec5e43ee3c028c883b94e3f16a
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.9E01794D3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gnuradio: show
 Config.in comment only when needed
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3982595973861724073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3982595973861724073==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4dbda7cba14dbfec5e43ee3c028c883b94e3f16a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The comment about the toolchain requirements to have Python support in
gnuradio is always displayed, even if architecture requirements are
not met and if Python is not enabled. For the latter: the option
BR2_PACKAGE_GNURADIO_PYTHON also depends on python, so it makes sense
for the Config.in comment to also depend on it.

Fixes: 7a546b87d5b8781b03f3ba5d311d61f4169ee899 ("package/python-numpy: add reverse dependency on packages using python-numpy")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fbb9739dd8012bbd33098a05b6eae91ff13ce71f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gnuradio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 157f187c4a..d7cfddd003 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -89,6 +89,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	  Enable python component
 
 comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 

--===============3982595973861724073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3982595973861724073==--
