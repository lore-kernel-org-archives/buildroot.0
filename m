Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0F9CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F64360D9B;
	Thu,  1 Oct 2026 14:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLwdIO-NFi6k; Thu,  1 Oct 2026 14:23:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D7E7860DA9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864593;
	b=ee/yRQazuSS8y/9WT+odfLfmyUEq17FSaf1rbIo7Y6p+ppa/RRt1y/CSTUFo5EtEU0Mk
	 sJVjYVE4hKgVKhoe9xgNHvUaIucRqEHA56+obLpj1pnlDgWe+Y3hRvST3/5lshSJ+YyQE
	 Wi566hsuWk2dqdDEBWbuYyGMk7ExSEjiyJLPfyTboyEQMyPjTXL4gV0bGm03bBhlfdIhZ
	 rPzNuiWt9flpMkkgGQk7tgM4OKuGXjTGR/5DdbBRr3+SyrLm5adI6V2YJodijjVUFctc7
	 b2z6YGfhR1kNTI9GnsOJLfoAaFAjxJW4gvUdGFJAKhUGbPEike8XAvg2qxZiqBL+2Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=FaR5taUz7zYEGt2geVxzssHLEL/BrYUvG0ww7Rispzk=;
	b=a0v3qZpxpV3Xh/DqC2nj3fw5wanlcAsg+U6zO5t2QnkOOlInbIQ2y22x/V5M5cFQS+Vt
	 opNFcnVZGdVlNruKwq1LeAm+8uQyZJiNOf6UFXXiGNb27x4+ivU8qIyRsWxWTcaJ87PAe
	 xB4zwEt5c4t7TRNIcmsaF8ccH66QPDDSJsj3/2Y2u9xCRBVN+3+HF2cNkMW0DAKssR/vf
	 0i/CxBmFM604GWUzjbIavOItCt6bjbzHxZlFIcjRPPTQBkD0QNWLhDH02NV+uMfeWS5NX
	 R/ksxsR5MPPDd0QYAEKvd6Hqe+v9HQ3d3TGAT5oL/GKM+5XBZZapdo1tCoTd4a5UgWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864592;
	bh=FaR5taUz7zYEGt2geVxzssHLEL/BrYUvG0ww7Rispzk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z4N+dZdqZQFOHeb6if/XPHtlosNoNJPCqiBC7cOhgwLiXwEZ1Pry/C5JvVbOMzMBC
	 KI/xEijRUd2cFL/LLBMj1TrQq4SPIT6eVYLSZCF3FgAde8NAPZ8WrUtBgGcvoab4Ze
	 P7uB467IJALHYcodOqeXNESlYTBDCLbGpKee+nVPcqdIDBhZsYh0m3iFy5MYIo1l8d
	 ilSzhys3FWRoUgdq08S4CNWgC8tAzJ8rCgbEegR5TYxUSYFwpkG2wSsWM6bFI+iGbr
	 VKmqJPM6cEfI+2+sMp2X1csGA5q/Gjz52IbnK/f5IX+JpVCdiQnaPcCvwyFLc+t2P/
	 TYQvghQGWpjQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E7860DA9;
	Thu,  1 Oct 2026 14:23:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83703D22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6916A80E0F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw3h6Se59g9v for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A99E80EE3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864561;
 b=I4ah/UBgh8/rXQEciBXDfovfHEiUVpls0nAt513qRYKsUQplDDU/9ns7BP4E7E7/dvSB
 4gHAE+3BkZFYIwaH2uZKg+BZsBH1l6/xjPOCv7ivME+NWpi1HFIDlq5ounxfp0mo1wUpl
 NBOtWxoYGMmlbZDGS28KfiDZX6Aizr5ZVkaN/U5ohFsDTkWdZPOhL8acr8t2GfZldxQ4D
 JkPoGD13wBziYhMzF+6i90spj+Wa4d5BMwWEfKRk5lTPRohoT4aFXaYKF55fbVCXsUXuP
 APO/u5kpXA499Ts4c2/7YfFF/HpF/Okt/H0U2Q/3s43lGvMOUaMsWzCNIF71+/FFMtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864561;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6QX3Y1orQR1P6TvmsLzQgDQ22ZeJJxDtj7R/IOifKYI=;
 b=CR3WAHcbXyF4bA4yTudttlTqKjtT84GL1khWYHAz/dQSOM14nUsFKnlgMJE/Bp6oEONf
 ZGrLrUWNHWV90ms9swVH6dqtNhxJYxpYP3bJ98glJB8IhbAJlWghGPtp4D/lCC3c9dSBy
 nnwjW3TmtDD7kMV4JOFEe9mNEQGu8MfDNkNkkH1rL5eN3bSgD6E5MtiLojqxMyGMr4yGv
 BcLL9mZyzieDazze7xIwSzGTo2l5Sn8J/PNbpSF6x3j3VtvK+AjkrSsnTZA9FKk1bqJIW
 Pj/hS+orOSjwyszi/UhVuWw4DYHXbgKTRKNm+7CJmkAKCSDBS0EJyyHC8qGlvz/8j+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A99E80EE3
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F7CB9843E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 70870db0f0b8eda2358faba7771895c540eb523c
X-Git-Newrev: 3296b7ee48713ca32901c23fed9620f5ab3ba7e7
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.3F7CB9843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark: bump
 to v4.4.16
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
Content-Type: multipart/mixed; boundary="===============2857861272885149733=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2857861272885149733==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3296b7ee48713ca32901c23fed9620f5ab3ba7e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.16.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e3db9d23349d63177a1f9b70c6fef477e44a29f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 037f2f509a..2c15d4f0f4 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.15.txt
-sha1  dd591df261c7866e7eaac3f015c904ab21d9d51d  wireshark-4.4.15.tar.xz
-sha256  05e884da8d91929bd1fb6a91c26836d69145ecd439b97c2d82698388de221570  wireshark-4.4.15.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.16.txt
+sha1  1424ea22b4959f94eb85c1fc3c510f281766144e  wireshark-4.4.16.tar.xz
+sha256  0bda0e34a4c5da72ea9009134d733783d08189c07462198e53a4f533fd1201fd  wireshark-4.4.16.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1ded080906..ab393b8a48 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.15
+WIRESHARK_VERSION = 4.4.16
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============2857861272885149733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2857861272885149733==--
