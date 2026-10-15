Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D7CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D29612FC;
	Fri, 16 Oct 2026 13:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5vhoVQrqgiY; Fri, 16 Oct 2026 13:13:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 710E461314
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156391;
	b=O8IFWE2OV3Wz7Lu4KW/fP1Ut6ap+nb8WkuZFUTSFePoe7Ylr6m5ihkwVuAB/7oa3OIYD
	 Zi1YNCmQuxVOPeX8VJdhFkKI8jQ3cyVZDPdZdQRCT8vYRw1H0St1Ha1fFBDg7DoWaLJ0B
	 r+J0v/+XMTkIETPEsZaC6DLuD79L/Bpj3ZThtvqKlkLZPDhyT7WVZq+8/Fm63JZ+kqHaI
	 rxm3foSYR+hrVCeNzEfrf3FvuLijQDQ3oH2VSvvVYPa+NMJo9WDsVng8fBsVcw9tq+bSt
	 95os+waQr4BNjB6nSUCCGfmZkBMd+ynsM4iiKKJfAhH+hnEjAXyjFnZ8rlR7op8C0WQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=FlgUbk1tt/Mb3jXUmD3lRVfKMA8qNyTo929/D4N3ypo=;
	b=oHUh44l1Vpq9o5o7VFSl7bUqtZVp1rNqYHmBAcyH8qjc++A45RxGw6seLdT97xFZPutB
	 c37RejErTLjy7eFzCHTQwczD1iETx8rW/GdKAKn59BQ+8tEd9toQxETTq3HZhwN3Ipiaq
	 E5j37r2wt4KnEusYCdC5JN3IaIhwBtaWLQq4v76ZmCOWvPa8KocXDDRTmJQSmIk+Ekqwx
	 MftZQ4F7P33DYEheoUZVYxIux3/F8vN4Dfm+AsaLaOvYGjdgRYdTmg3J0TLhJ3T2uZvxA
	 DQMHcpsqLw7debh6Ys6+oQImrlXL0JFi8f2vAVJ1xfvTRptivlQ8BvhyLKQA1pCIWpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156391;
	bh=FlgUbk1tt/Mb3jXUmD3lRVfKMA8qNyTo929/D4N3ypo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C1d2Q4irnxDvQqHPmnrT8SWgrZoozawAwDTeQ7xF5g5ATg54P2w1z/8mfhOX2+JRM
	 jX1dPbdsHjnuxjL55v5lKwXfEXdy0Lj9Tw0zgJ7E14X6naP9UdcJERjB3YGDsMGdbH
	 hX5lx9Ha1rtzVBR3uNktcdwqnV+IoRnpK8SzifWFf3diXc4WS4uDvmPOPTxO9r0NCN
	 6UZR+2O8Ya1w0jIkNGwB+/vG9CVUdloQsXUGc8+oFrcX9JhlVwHA29Pc+CwnjCXMtC
	 thkNqNW5jxmI10Ip//Lf7tu29qj4O9GqhAZt3w3iUk00KypHQjNjh2yNA4Ksrk+fI8
	 I/SmlsVuEerUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710E461314;
	Fri, 16 Oct 2026 13:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F21351C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F3D60AC3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXNetaG5eONO for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6612160EF8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=aQROFy6yQQovR+KgNxtHXDSPb1CR+MjhzJ/8LjOjlm1NQvm+6ONI4tNot2+zdZBzZzl4
 UCgwP3aGIsbPoqWyyUKwD++kGoUkBb0EqA591SqdybOjtJGGii5tLA6YH1l6A2uw1/mAD
 fNY1rbO4xRtFZsfk8Lew6Ea1mW+C1ajtL2/oUPjs7LHPd/CLneO5hOkSlv8sBenaIJXCr
 Ke3fZeTOS006welyCKGsvbqs9jG8ogg0jL8gMOmQ6ADOzbz6GzzZXP89Vx/Cl9yNMYb05
 YVKKQZUtaMY1NAXIeVaRj361nLXIv7txgqDQ2ubwymX4VYm+SP84T48mr9BYgPNizCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yyp2LM3X2m3ZY6Oly1D9/QPRZsi/OWihS/h818/fXtg=;
 b=qMbFSfAz20/fT1+0MiGbJHs3h/1Nq3KUKPX/CA1vVIsp20uG/h/sVQwG2uJth90CPQlq
 +yaxYjI3mJ0pgVu/S/JYQRmgYGwi12aD8G7dcBwmHR0FgFKzJ2geFmsZpsllg5+VaO44f
 c5rDCx4OJ3OVUqouPc2VXaJSAbAjiFsO4cO0aIJ25uyRW6sGM+MizlI92j7JXUKOZiRuF
 oorS6JztVvXkQsKFkKtp7me9xlt1wJAhCM9uuOXQTTdz53tv9F/8/4bXwEv1vP9elPUU4
 7+/AT632XgGgaWD2b0ptND0Y1ZgB9USZkogCXWzonz1bEY6U3r7U5wBk5nuIj3xnwzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6612160EF8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55702960D7; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:32 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 43bcd4d4de65e66816c45f8dba796bba94e043cc
X-Git-Newrev: fde871cb3ad199a297f7b274388c514e28d5d97a
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.55702960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/m4: add CPE
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
Content-Type: multipart/mixed; boundary="===============2973098139556045097=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2973098139556045097==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fde871cb3ad199a297f7b274388c514e28d5d97a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:gnu:m4:1.4.21:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2008-1687

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7fa4b3c8b4eb62fb0e997cb3cde1d43756719d5c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/m4/m4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d498754b35..da739a5f0c 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,5 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
+M4_CPE_ID_VENDOR = gnu
 
 $(eval $(host-autotools-package))

--===============2973098139556045097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2973098139556045097==--
