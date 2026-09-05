Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CF3C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 15:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E2240B21;
	Sat,  5 Sep 2026 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H685eung6sEf; Sat,  5 Sep 2026 15:36:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6037140B0A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788622617;
	b=e5B8S3Yd5V5OemvrTU8028uC9X+uAYjcn0/BwVajKP+GwDHjRO6AOa4vTDjKl/0X+crs
	 Gx7LMjeKqcuaaEbpkarpXTG9o+37BdUfW6xSecL/MZiR+9jc1cvC1QPfBA6EYwEvnsYfe
	 5K3LoFoNBtGIhCzfcd24N4OZZ09DKAyl6BXJgvKRcjTBgKFoGgPBEw+ppuxz7lyOfDnqQ
	 UyAhmYj/jAJDCzgzqawOtTGQHMBLKXbYKVmQBASEJKiE7BQ5nA+nWcE+f3DFwOVOBG8SH
	 J0DUKtlBo8DQ/Nc3IezLa9kN7v4zqtOyFHwgriRgFLcQ8Dcf5Ci+IkgoDnWrF1U2BHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788622617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lwrip2QtB/2pzkGABhapr+skukFtd8YO2UDt4O27Tgs=;
	b=Smnnj+3WUe98CDpUH4m/TL6CCanzihUtzTLrmW/FJwv8sAMACm3/e29nMSjj5So0xU7B
	 AIJ8u/JJjoTcJ2NC86cInscxKZtjdlB2SYeAkTZqkYJjpX+nHfJPpO1b2Asei0usHByIx
	 zp6uPj9OkmVl0SNfOoZyuXK2va/zLfO4TnfNadkXyOLH2S7K4WzX0QfW8g6HbgmZet4Sa
	 Zkq3CcZ8aaOTW3riwBdnQs4FFuKiEw+SOGm1t/dF1FQdzD6yF9KXjv77+apcP9qPYoO05
	 sxahbi3zvX4p3j18oJq/ldLmHGFosqC1xnqm2Ljr61Ae6IPJR4HXbiWyoqYnQ+T3LEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788622617;
	bh=Lwrip2QtB/2pzkGABhapr+skukFtd8YO2UDt4O27Tgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QtGjv+TJPdCz4JCXM6WUvLBvIUuiwhuoDq3BYnqkAUZx9FzcJXVdB2pSdncnNc8Nf
	 0s6Eq3u5VW5aHcAxZiVH2Tsc4ZUqFkxToNUCm0gaOPTXFw0QErAg5u1VaaLa9D8cE2
	 lrgSGvEeASMO5QzDNQeS01kAuAy7wB3q48BbhbPM/7nkYI5BKVWLfGM5Y2ujmg3vYG
	 CdyXlTbRpMCh+KCTIvZsuuCOS+mqcbM12PWQM9e++LKq/H6Mk3Pwzv++Sdd2D79C4v
	 y1VhTFEW4rHVD3WAphwl9nDs6wSIoDHThVdLqe0pPSHzd4duqfLJ7+v9vBkRf62D8l
	 r7ZdJnnUFAIng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6037140B0A;
	Sat,  5 Sep 2026 15:36:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5169D279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37BD1400B8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIw789s0LiWo for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 15:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0CB7E40051
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788622614;
 b=C1qdrVXQoQ/CCUJVinDKZe8XmmDjhyYGCuQc+clxyUnfl+Vxc2aVb6qoy3ew3wbRspHN
 mf0aCSl2ggJ88kEjFXmga08GLG3cI9HS2f6HYOGaIcuyrkqRkC6ipkuhMFkHvEi74695y
 C8K/T6KXz+08vugWulRzBO9aaxqC/EYmCPHpH1Y5unYbomyci0fMT18LFnBm/K6zXMyn2
 e+px9erTQ2GjnKN7zsi3x66Wzs5vN7/Ho5KbuQiTaD41iQ5eUuh0a77BsS+xotOjIDN1Q
 d9roZfH8L3+GUYnH8q1tx7bHbOExuwjCi7GuDeNkoejdc0cKA1z6ZT3u88nctATvccA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788622614;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zD6y6WrnO8AeZrjEGFW7r7kBfCvP7fGmNSCYV2F+0eQ=;
 b=KOE32m3Hy8HTzugSJLf+wpuLJjSrHmAoET2U2Pw/4WR7f9NyGZlSSGrWXDjp3e9xxQCL
 p6EOr2xKBD0eDFpgdPcsI2sE/lW2BVEZq2GE5TIvNEMGvRrVHvNl2whvxgtK+AeMZvXTD
 ceOfzicI5EEWb2QemtR89U3LhVb3KNpakKJ4Bcq+2H6eRtd5znKy+0xxFhbtu2okdu93j
 5Q4AUvTcbae5K35Wojz0nNujXF2Tmk7FhI7c/nbjr2GaQdekKr8SWtgqyNXy6D1ZMwjf9
 bkVPTnq9FAW6iJFtc5aYTkDlRbbInSZOpR1SMjFjI/xOIA3pcwlos9DMgpgg3i5NHtA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB7E40051
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEA2294E22; Sat,  5 Sep 2026 15:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 17:13:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6910dbda290fbfed0c2ee7e41571b292c19f6228
X-Git-Newrev: 7b611fbd80d8858f056f62a71fdc16da8cd05e69
X-Patchwork-Hint: ignore
Message-Id: <20260905153552.EEA2294E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump version to 2.5.22
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b611fbd80d8858f056f62a71fdc16da8cd05e69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000509.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index a53f46c67a..deb7a0da17 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  51fae4f4d902787624eb7047f6d3e7c263ad7690  gnupg-2.5.21.tar.bz2
-sha256  e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352  gnupg-2.5.21.tar.bz2
+sha1  4921a199ae868c8dd0478352d2d93bb470489e23  gnupg-2.5.22.tar.bz2
+sha256  96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e  gnupg-2.5.22.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 05acd4811d..5b8b30e702 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.21
+GNUPG2_VERSION = 2.5.22
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
