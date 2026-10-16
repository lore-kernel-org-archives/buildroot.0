Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7432CCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DBCD60B83;
	Fri, 16 Oct 2026 13:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqcJTZc1llXB; Fri, 16 Oct 2026 13:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 992E760B89
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156141;
	b=XoRIdgXc0FV1hvOyCIkUWNtXQ2c6765PpO192u4zvYQgMgvfVgRqV5YXjk48u1n1XvfF
	 Y9opf1KswVQHhY3Csw5gVOXGegRTepZU0MvbnGI74KANJipth98We9JinLh37TB7dJHCb
	 9Aq1HFSFL8Pka056KYe7RQ8txtN7bxn9bGYOCUhLDm+j76fXBQYkIFbcSotF3DuKbCp72
	 HFSMLhDKmOLIlfa59rs8Y4nWhGC/cpEoaZ/x0XJkXy5I+gEiExvMLNSAhPIzi05tbuSQF
	 lpxXtoUfxO/qGxzR/9C83QvlwcqDIizqMen25L/GE5rFdVzofv65mFG5j8I3i5hYxJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=FpWACX3JzsgHlGocM6rM0HwaAI6JZ+blCneOyR0QzPM=;
	b=S67Cdyzbx3kb7+b2pZXsDQU3afzbx3UxhPBxGS2/sfBI0E/ustOFaZMm6C7di9PuMaMu
	 WLI4gHn8lrsi5nzGWBL7YDjku8+A9TcMEP213TOHAtm+QFAXYMMvd8KqhxDA02hL+cMFC
	 SZ49n0pqtapVs/fEDblmtff+W91SA9YoytFqwl8AML3HfK4GSroxv8CaObMmpPCqu1ahR
	 d7k6z9GQskDZh8us7p6PNrKWsiaIt5xsFMVNG3KksY9JIqNw5g2YCwLmpDhFKLgBQidnt
	 XYvgVnL6CrpDbSUV7FlriRWO+Xitcvd+cTr5znWSUlRb8D1ALlVsuEh6R1Xb1of/aOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156141;
	bh=FpWACX3JzsgHlGocM6rM0HwaAI6JZ+blCneOyR0QzPM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lqQrMvCiv/77ukTKq69QbB7NGEjhfubvHVxsbExkcpeugdmuBZYGGXA8ZIsfrGySx
	 SusKWA4n5AnAl82fnuLiLpnpMmhUwG5d2m5Y/Mjxd1+MRyidJIgA0X3wj43lmhop5t
	 O+nJAI70fIakWb6x2HJNW0X8rYOmrnoiUy/J8Id/8JL1UfpQHlQsxg9eRTazqhuo54
	 aPhOv8WwygMjGVAIGtU+2YETq/KY//kyoxJgyV7c/qNHZPPF+z+Yb2LU++zG7X5FtN
	 S9bb9oXCL8d5NoNoptLlpbiT3VvXseIQXIha0FHy4iYmTxVCmk2f87pZUCFb1Nxdm1
	 cMd5RY7K0fCAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992E760B89;
	Fri, 16 Oct 2026 13:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3ADF255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8F040A0E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S02gY7IlkFQO for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 590BE409FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=j/OFTVEMOBrneLDBzF0Bko6BWo6FBAO1zl/Gp+rxcNDe3UGlfao5DnQPjxTI8bytw2Nf
 2sqYo6A5t2uOQ1arhwq02iI77CX3VXHQm02Wbxj8pfoui4vepzIEk7TyF6eigr/bmlkm7
 8uI/YoiKJYwgvFavvBYTTyI6SKcIF5CPcn3QF4G8eK4XQ5QYY8ksyE8RYeugDQ+WkW+v9
 b0wnz9Mv3RbXon5X5W/uFk/ZNO4ZFBLNkG97hj5fAM41+J4TGc15k8B6hWBJXNHNgmHL5
 VOuxewdT4fgS1W0ZqwIDyWguqDWO510qpvA/ZjBjmx+RGjrxa4VHx2OHfkNdyPFBOOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wDGnM4bQCs7QcmTkgHmkjK2dFCmDRc7f/TwgLsrv4wQ=;
 b=nHWY9qt6QyctfoMSBo1ctrT67J7hg/mL96uJvxvFBhpptjXY7CNFpTPrINPIbMU9qcvG
 0IKKUG34RmB7JHkcVIHrrtkyatrEea/C63dcnMYjmIW/F1Z0I6CWICKJJGLSExKeffTdE
 gnGM22Wk/4SE/aAO4WnmHzc478XL+MsUtGaKblaJFEWrUmVC3dgXGjtwb0wdVzcLE1ChH
 R4hvqkELgHyr052pm+B5xfiIPNI2yes+Yb0ZpfKcxu3+cPzVhNOO9tsxymeOpRUy+lwpG
 oops6LyCQw6zuZjowpb7W6AZoUAO9ga3iYU0c/q26Bpx15IC6Xafo7VSGj43RxoQeeg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 590BE409FE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A301960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2422be4c570978719d36f279361462642255ad10
X-Git-Newrev: 1ee99ee72a05fead83adfad3a9fd369240176bb9
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.4A301960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-headers:
 pass --no-print-directory
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
Content-Type: multipart/mixed; boundary="===============8898219922616446930=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8898219922616446930==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ee99ee72a05fead83adfad3a9fd369240176bb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since commit 5fc10e76fa2a9 in linux v6.5-rc1, the kernel does a
recursive make call to add the --no-print-directory flag if it is not
set.

Buildroot sets MAKEOVERRIDES empty, which causes none of the
command-line overrides to be propagated to sub-makes. This only goes one
level deep, so it is not a problem. However, if the user sets
MAKEOVERRIDES in their environment, the environment _does_ get
propagated down to sub-makes. Therefore, the recursive call from within
the kernel will not get any of the command-line overrides we give it.
As a result, INSTALL_HDR_PATH will not get passed down to the kernel's
sub-make, thereby breaking the installation to staging.

Note that if Buildroot itself does a sub-make call (e.g. because O= is
set, or umask is different), --no-print-directory is already added so
the issue doesn't occur.

Set --no-print-directory explicitly, which avoids the kernel's sub-make
call, which preserves INSTALL_HDR_PATH. It is only really needed for the
staging install, since the local install in _CONFIGURE_CMDS just sets it
to the default value. For consistency though, set it there as well.

Setting --no-print-directory when it is not needed doesn't hurt.

Signed-off-by: Francesco Mancino <francesco.mancino@tutus.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 77faecb13afa7255bb04a6260201fd535e88887c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-headers/linux-headers.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 15724090ce..ed37410ea6 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -135,6 +135,7 @@ LINUX_HEADERS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 define LINUX_HEADERS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -146,6 +147,7 @@ endef
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \

--===============8898219922616446930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8898219922616446930==--
