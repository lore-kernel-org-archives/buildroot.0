Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DCBCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2E4405A2;
	Sun, 11 Oct 2026 13:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JmZhWCIFPLJ; Sun, 11 Oct 2026 13:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 302E040765
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726167;
	b=BbJlILq7fsiL78Nkvcy9vpDtisGZzIc+YO5cPpljAFmcDdkDIVAeo3wZn3PVsvsFCnRc
	 46FhFm0k6n7sleGHe5iMlJk5I9+ZjDshaQTV3scGeFiFuLSpO1Ndimpu7sL90ql19gwv7
	 y6BW817GNrVQZ7S3vRfM8uJK+Zd1dMhLh6gJuD1RjIq5WFawjc0u3o/dd7t1DIOmeRFCB
	 8XnAV54Lv4WiCxXv8VY0hqtbb3vk24QbTpi4+B2DL/pSRl2YjynbiyrTnm0JLWvYNijn4
	 V4wEV370AnGUBG+vEi2OCbhYdx6YRmKHYapfLRoE64PirDpLnVSVaB0J5jMevdz6XLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tZNYKqrpanRiN9J3TNceFGL6QChhP5CyqGItZsrjFw8=;
	b=mEK3JnGfITItk2smuyt55RjSIi5kMxZ2uLTsYOqhNIHy7dD7Q7zNzpS1kQv+UJwhTFOJ
	 pXKQZOXT98P4IVdOFQC/uPwqpXNnGqVI0diIaUDrpRR+NWfBw+Ghmdq1ASrYyemsHSFN4
	 x2D+yRmSZxD9Z645iT6jk4SA9tCyerWkzyxfr7/zV5td5d2327dQMAROcZL2DuRFHrg50
	 XWcZhVan5yTkPbM8QL7peknsAgY7yz7fAZItbETIlJ+bc7AoIGP0EhW0V7jmOYfAQLAeA
	 EMlyZ4gndj9SJ2hvVzgDXqgw3+rwpbT6vNcNT5vgfVmlgpTQrUGvwPh/YREUcxERycg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726167;
	bh=tZNYKqrpanRiN9J3TNceFGL6QChhP5CyqGItZsrjFw8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mlaD+GvgOecz03vz9ggseeQ6181ajH+fUx1iYu6ChfLGzmVn+bposuqMdUtoBRMG0
	 1i0F53eTghFZQL95KR4pdJxk76CGeBorGaPdehNlJSg7UvE5Xbct8Fynx88XUfMv32
	 ElFtq5YF05cCC4B/obc+N1UQvElZ5w022ozoBnworFkLQ9TMBRLwjY+GoyJ9J/1yyZ
	 LQilk7c9eTeFwgrMHSkvDTZ/dqHWX5w50qBr3PeJiuyQ3Hh3bCtXbanyjl3dnduo3O
	 ji54UrJs6fFTVmGJl17D5kSxNGmDImr0I74ZYkqIILbG8djYo+XFBruWse2TSh3Xe9
	 QUvzzP2lGtDjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 302E040765;
	Sun, 11 Oct 2026 13:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6091A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4077840071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XL2YlH97N7dI for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 986794002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726160;
 b=lNkt+OyxPvYXoJQ347uobYqSEj6lhFSb8wneXjHWrXjauosaZkVjYl2gzIrYAnq5YSkH
 gYnRHnwU2/u3HAoJlMdrU4pB/OZ14EKxKDlonQItscYDD5+O74fuco2R2ijnhv+qJ4dl8
 vW/dyVRQ1JLJIPozkJ3FhMRTwMQU2gY16uaJiABCDDS/44Ow+AE1JKB955QOoXl+1LQhi
 9RiVQlUzbMfxmaXKQ7jh9+rCOBObQfTNE7eKo2LwCJJEQ9VmvN2h8QZuaJt5erhpQ/zZx
 xFJINUpDvITS4U4/6+I8ejbPFZfAlLG/fgx+1LqXBM1EpcCBNIOcszchO6rOctxAkcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726160;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uE1v0tLDr7UEfDwCck8Me5PPgyq5EoWyK+H0sWVvBQo=;
 b=hQKr7QbpRqh1bacjaCZkGjA9ZmQGdXwkgbqv/f7xUPB5t43XoorreKPXqOkZ/koiHQkT
 mTVdTPuQW5v4JbGw8FW9Sa8zeyzBXfqvkrPSCE4m9vANOWwsZ8s9E4xCTDjrnfaM9On3i
 JltJgzFPfUDAqTBrcEQ2x6uBVkxUZ+E/5cXEV0TUanm+OwOtS+mxN/3gL8Foib5vRfQyG
 DlNuJudVVMeR7UdSyyCyk5WJ/7+U9hneeD4sakvgeQNW+x54rL0FvPZ2QVVxKZYwl2tvh
 aCwqg+3spZACIyfoozYs3XhirAlDmwauz4dNzUTr0MqNDVGGmr5585n5xjIojLKlS7g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 986794002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE0B49429C; Sun, 11 Oct 2026 13:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:42:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca81f734c9d592763b2e9cc31493df09a528d250
X-Git-Newrev: 1a72cf3fa83ca85d1aeb17dba6a8986d864906de
X-Patchwork-Hint: ignore
Message-Id: <20261011134121.CE0B49429C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: adding myself in packages with
 LTS policies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a72cf3fa83ca85d1aeb17dba6a8986d864906de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

To better track the version of a package before a Buildroot LTS release
is made I'm adding myself to DEVELOPERS file for those one so I receive
alerts for this subset of packages.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 01d98f8698..4324774a49 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3239,10 +3239,28 @@ F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
-F:	package/go/
-F:	utils/generate-cyclonedx
+F:	package/asterisk/
+F:	package/bind/
+F:	package/clamav/
+F:	package/containerd/
+F:	package/dpdk/
+F:	package/gnupg2/
+F:	package/haproxy/
+F:	package/libopenssl/
+F:	package/lxc/
+F:	package/mariadb/
+F:	package/mbedtls/
+F:	package/nodejs/
+F:	package/openjdk/
+F:	package/php/
+F:	package/python-django/
+F:	package/suricata/
+F:	package/subversion/
+F:	package/tor/
+F:	package/zabbix/
 F:	support/scripts/cve-check
 F:	support/scripts/cve.py
+F:	utils/generate-cyclonedx
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
