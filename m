Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F7CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512FE606B3;
	Tue, 13 Oct 2026 21:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7buS8F1kMZDm; Tue, 13 Oct 2026 21:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E63860881
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791926818;
	b=edpEhItENzzXW53HjcyvBFQ1+RNVXSCO2o9vLwTjSz2JMdO4NDiRzCwOKDbZXRQ52dgq
	 apyPv8mDOH9fyInsVzr4wQENkuFXOkI6IjgLDv77jLIpoTbnQLxU85h1QLbTRIkEFpaBF
	 o7edHlR+AclSvelan1zFk39sXOErENjSfuzHUoRjTI54aWbY3SFwyNkMYGgSVvdeVaXlB
	 pArLywo0re4XI76F4Tn48+sN2xE8yYDkmVF0AR0cexHEpC87nKOe5ZokmDFbZp7n3/sOG
	 ZEWP96IQ0XEhYeICb5iXyqNYXMHc5DSc5i9tXCmkHsZgZvx2TeRfRqRGeGW2IG+rAPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791926818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AG7MbGp5RWivCAzdKisQfQtRkH674kWOh5hzyhScU4U=;
	b=DuupBiCGOH6TWAjiG8oPmrH0bxDiDmDXi6rWld13RYo9OY+rrubvLqwuJGI7z6gf1/0I
	 l5H+VYbyzpGWg7Dv3ld4jSu/OfjVMHOP8PPVjaoJ5gOsynp6UcMv8zUrIwm5CleZGJPAZ
	 Yo6cBBBtg7RzD4DFbUBTuuSuvfkPabj5llWf1pA2XEdqPmptTGlyujHi7Am/vTo629HZw
	 98DWg1dYHe7KGz4AeaWH/TjxUFWl20XBAvqAaXHgN8XFSibk+IjcMzGcX8xqTfGKK4FO4
	 5lAGumQxobC3yIvU+TmF06fhtLVqOeXxW3u6ESpM88mGaG1KyHulBuINCW46V6MA6Cw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791926818;
	bh=AG7MbGp5RWivCAzdKisQfQtRkH674kWOh5hzyhScU4U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kcz4fvPKCV5nefwidN5kM118lDToZKkzP+/e8uZzuPlPZmmaYhKiPrYOwjipkj/yM
	 NXs01CW1QAPw2ZXIJQAMTddZ9cGrtMs2I9o6u8/H8wx0GEBH5qO+d5xa7skB5pgxch
	 uG40HiDj2wKhjitbbJufxrMynRjbSPq4afisWyhK9J0pdFnITx2h86H46zK1IvOoNx
	 WZ1rwpl/XyasRsBGb5RX9edstbVfnbCYWnV32rgsv4ZO9R8GiFI3RlORbjnaG4nR4G
	 jMW55BPjImWZyedXfpbNM9OJpGhrsx6flrQYccayFzYvk4sz5InolTjOAY0GvXgriv
	 fazvPrQVdNjew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E63860881;
	Tue, 13 Oct 2026 21:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 932611DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D2580993
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dfjc8H9UOpd for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C5EC080972
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791926814;
 b=G4Kx7VnaWkl6CH8MSYusejVFxWaXZmlOl7eXyl40mlt35cAv48cLua6WUmp+fDJifUXE
 ROXSo3sCHYcGJdkjECXPW2C9+2K7DgoLy9XtvxCc/qKT+1OfX2iXOvdstMFZTKt/gfJQs
 cvDqJ/kal7FPqxg5LgtrnN/Egj2aucSQA5Kn9Ure2AVE0jnR/dJgs0JLxqqMLIoDLfnaF
 sSaImvhr/FuBmF89rmdvma18uL+QowjTrMLwrECyA/UW7uWQC5rTfW9w7JkKNTNwMfwdw
 Y9xRKy68EkAzlM1+hYJtpHIbs+d+f5JzDq6JUsVcl3QgnLs3GFmt2g5wgnXzTqUU6lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791926814;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WILYVHXPo21xRtuv8AVMuuDd929sVdgctkPnlbeEcH0=;
 b=Eb1wKn7r9Xh4VGz5F/9j8At2hW5wJ3tWSYbX8OgILUeCKG3KNhuxn3uSbNkLPyDnCxxK
 tZBJbMOJT//ZtVPmceRtrMnQSPqdGP97sOtfm1eStGznO3o/1LD1aZ9f6yQTIm6imt3YW
 wz7rj4wBZiLpFipQ+YYkOGLwK38qAa1qCcB4Y8m4TmTQ6e3pPHV6vAEs8NXChXUIiX83p
 4CKhpQHUgyzkdDeeVHm1FCMxr6mk6PvvNkm5RcvL9zM8lxDsRkkZheSUBfW/mQF3l8oYw
 H+iAYXnR5qrelFGdIjC9dWMhqd0FwULqpsdCmxTbxjIgLVY2yptMglVH9eJb+acanjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EC080972
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:26:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D336A95B7D; Tue, 13 Oct 2026 21:25:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:26:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce34b0b208fc189268778483dede95d0b3109ee9
X-Git-Newrev: 139f19b5bc63fe59e4da97fd16014aadd89a30dc
X-Patchwork-Hint: ignore
Message-Id: <20261013212534.D336A95B7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-core: bump to
 version 2.50.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/139f19b5bc63fe59e4da97fd16014aadd89a30dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is the version required by pydantic 2.14.1.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 3c164a3dbf..e06724f3f8 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  cdb7b581d5d92bb77c831b50d39cdd561b45649056e0ee0f67ea0c56cc33c831  python-pydantic-core-2.46.5-cargo6.tar.gz
+sha256  c248df928b1546c10413c88dffe1aa31d44759b7c8a9239c0cfcf125fddd8fe5  python-pydantic-core-2.50.1-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 0b5631f0f7..4d22df466c 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.46.5
+PYTHON_PYDANTIC_CORE_VERSION = 2.50.1
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/af/f9/8a06bea35ef8daf588f707784c973a7046e0034c8d8cfb08828eeffb8b75
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a6/24/af4ec4be49fbc810f35b0bdcacc3d433b56bbfa469fd3bfd4ae116cd9bf1
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
