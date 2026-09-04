Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88019C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CAD60BE1;
	Fri,  4 Sep 2026 12:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn0kJ1Vor5HW; Fri,  4 Sep 2026 12:16:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00F1260BC2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524207;
	b=Hk+dM/7ptFw3bYTjlfcOlKm3NHwFUvucoJ/CRUuMNVL/cBNLOruWjZQrV4XtmNXt9d3/
	 BnrrGxN2EOfazhL4IVKgpg/JCwbjNpF0W1oMJ+0yRGT/NiYvIE/53RA9tec1ysaqBnYgu
	 iVSBC9oOi/PoujfHVp00yY5AuJYXkTHSQ4ld0IIsxKmMP4+nzan2PYqT/bY7adhNHe0QV
	 b4GaHVrc8ki95v7e10Ebkyg/b9Px7w7zCHoJS/8shploP0yVqxEjqkOfKsd0JrUKfdQKu
	 F4SwKTVJHyA/iwGfnMxRu8fMfxE82AS1npDCGn6w99MxTqdfuT1OVuF1kOTj3uyiEsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J+e3P8lB1fMd0FW26LDX80je5gVxA785ps7gqrTLZqA=;
	b=JgUA79zMlxgKd9iVl9EfHw7WkvnKixHsFnevYxUNDBDk0QuTAMvKnlD93JtbknVCvg8E
	 PgVu1t3Hdb0Qz3zXnU4A+FWotwQtG8j1pXO5jGgdepfqjTyod55riWPiZ/7/t5ETP+iPq
	 vx0dxV371z6cacuuJ5OyodwFh/RxBExKrhp+SZvsI1wyicEAzAT+rWJ0axnZgGfyUEbhT
	 17T7F/U/YdKcF5xra3RSoZCvxHjvpWiX4F2YoCJeY/2F327tmi6iXRyjN+zNHvfp8jgCr
	 KuC+cON3Cl6l0DhJCs/01MXsiIKWEiA4DJnwwqoJWIz+eAX5zllrazeZ08HZC3WwqFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524207;
	bh=J+e3P8lB1fMd0FW26LDX80je5gVxA785ps7gqrTLZqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gok0j+L+zc5sGiHdbQiUHWiutRgsK+/yXrgmj4WZ/e91N2hjq1kE45f4fetZdWhO5
	 SGVsoj6vzZ5hoqHISoVz7RkUQM4fVJE9Ds++lsKBheTNk5oQVel4f6HUtbqOtr60k1
	 0Bx3qyIJC+dnvWhsNp0sL4S6T45N6GvK4dMOpYlWFFAlVRPRkKloxw7WZHDVUlIugi
	 gLFpegtQCOh+3/mdKdRB7YMOdluuc6Ow4sEds2btpb703dBQQno93FbV2XdUAjIbcR
	 r14mSlvk0wGiVwG2+7+tHYAU8KjezAPX554lt8Q7BGXz7oHDRWVfCAZgh/mT4WFAaQ
	 8sgDa47hVC6Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F1260BC2;
	Fri,  4 Sep 2026 12:16:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AA6C200E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470E240B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBOfJDjBAD2X for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 936E840B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524203;
 b=S2PB3O42KXdgn1npMGOLyAgn8IG2NA58Z5Z9KbG37fGZDD9NE6wIH7NXg+7pQEfkX7Dy
 o9n/i4FjA8XkgZKVkHUsWTBLSL2onKRhL4XYow6QaZvN5UV8EcdOL7l3Rc4U24Svkup6B
 DzpYF+TLuEGbLyU7NaWxNSki8IddvyAUteomFL18MUe86R0wiba9oYtNQtYVoxkF3fpA7
 JYeLanwTAYgMw+ga9WY4+18gHTwtWmvakvpTDTwrhfL+sHyDXIfKJIIydqICaCdq5foDL
 rVgz2QJ9v9dFabZa9A5SkJiyItx8pIExsuMCNOPOVXscITFrAJWXnlKmPPGmwb12Jlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=69pTyEfUN1DW/zNBMlKh5j4S3lRYS5nVzwKbyfDnckg=;
 b=JmUIGO5UcXelJ4p49EttMHNu0tHHEtgbrJBJ3M+jceTGPeAzSlFNXbj64lh5V7GzC9bx
 BdUYbpE8GgWszt5v2IR/VoObFhShnxQDW60Cs+TxWTIziEeivqxJ1agTS1U3+au5PHQiU
 HmWooz4TmMyYmYqIdwChePl5Acq/jpSNGDOddW8XcUhaMWYBRcc22QTVIn5uigTgykNcM
 CgonRH9nkPrmMOkS2J3IY6PRifPy/XPgVCegUXZg+D2rWk5EA/b+rXJCs/R38P3H5dkbn
 FrG4BIlOQOMhqsykshYOH9FFRJmdr8e6WVKczu/JtyKR09ga0P8OB1ZWjDrHETkob+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 936E840B2E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:16:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25E5794AAF; Fri,  4 Sep 2026 12:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 14:06:32 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 611ddaa9ce6f4e3993aca544bd107b13e753e664
X-Git-Newrev: 6f8312c820c88f5ea01368e9c1153571bf88ec2c
X-Patchwork-Hint: ignore
Message-Id: <20260904121543.25E5794AAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/vim: fix hash for
 README.txt
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f8312c820c88f5ea01368e9c1153571bf88ec2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit 297f6f1921960c1735bca34b5a80138e2a8261f4 updated vim.
However README.txt (used as part of the license hash check) has been updated
upstream in [1], without any corresponding hash change in Buildroot, leading
to build failure.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/189

NB: This also affects 2025.02.x & 2026.05.x, so this patch
    should be applied there too.

[1] https://github.com/vim/vim/commit/e7e21018fc0b60c153c8e668f696d95e574cc5a4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit cb18f3a74a49a62119857ce1ab712ff4528a1d3d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 57aa3dd49d..ec3e92aaa0 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -2,4 +2,4 @@
 
 sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
+sha256  1e9afcb6b83c11af081b6ff7873861895819c7bacfc8d2ea53972a532c622868  README.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
