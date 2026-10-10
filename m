Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDCECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C6960AED;
	Sat, 10 Oct 2026 09:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQwahV3RQP7B; Sat, 10 Oct 2026 09:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4D0360AAF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624775;
	b=dEeiP87uAsI5q+cucUDNxMm+QZWqcNoB2hmdxJKOkHfd2elsOmt5Xuad799p9eBTR80A
	 i5NhRMZFPeYn/pwthsX+f7lSeHBqopUzQRy1F9VFJHC0LbGw5L4f3w3nt2VU86uRLXZtE
	 KFpbrISPJoqYUFvsGZoe4DCxy0wc96ut63cBkuG8fJJA6B3tD5K2367tST+hOlBzyW0RE
	 TvX1Fdmhd7yqafbYWpO2gcaJbTtHcXJOf0/9NTrvUFwBP7EHX2XdVDJkVWHjffUEQHowq
	 KQi5og+Ujl8zoUdNmlXTcMeXUO0hVrdwiLnWvZj5Xrd1Qg6NNz0OcN8nytYbkwK+Rjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GUviXeX1EpNaW/MIAyZytlwWTN9vTpi1dRE1quqBtGw=;
	b=RCNae/M5j6i15BTYTue4creH0whD+nNmvw5usB86seoAfwMNJolUCfXLwGkaECv3VngT
	 l4TjXK/gq+mDsn6sZ3JiZbFrN2LGI0Z451bI7TSJK+JjGL6Cy3P3VSCgqIt1scx+HkqBS
	 fao+yuUIWGbTfjZKB99Cyjq+7LNq+hLfI8jTcQNse5acTsSFNFuzbZhUaxc/bfmJPACwc
	 XvQlRuOjjLsDdF0ENg8KZO+z7G5uxDQfwWTjRnfJ+lOQCjLzKRQWY6d7xk+oPBZbDh6FE
	 tDJZ9jg7wV/qI+9qWbsLj5Wz1N02vhccJv29nEESqjmlWof5HxOg+L31j+HnOkttytg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624775;
	bh=GUviXeX1EpNaW/MIAyZytlwWTN9vTpi1dRE1quqBtGw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f7AhrUQ1TR6VQZD2XBNQQ8VvEox7vldAZnVGdFVqxW8wtthZXpz7Ub1fmuw48W9ZF
	 5UoCiY+Byazn3iursRSiHgo9Qgmb+GVc/z/qax39/cDuarXaoWf6/ffxrSuYV9F2zb
	 2xvS0okezhDfM83Kg7EFx9/eCyxYPm92s5fQRWuW0yh86Fe/DFTUBKUX8MwginYIge
	 /2Fi3l1+V6qGfFHQWhY6dRvMb0hn1+gXfHuPr8HKIqYkMoVk2RCJpOxBLTTe1RCIYp
	 +2uBvgmD3/frNGEIAYtk7a8j1j9pZ4ATAOXeexdIMPxieMhpXwhkAxamPu5rc4epYO
	 egaW4zxTQ1hmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D0360AAF;
	Sat, 10 Oct 2026 09:32:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B383D75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A508C400F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EjIh2KfcaxC for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4323640004
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624773;
 b=ZlYcqTCR1Njbqj4QxUDSsG+jcsPG/89KYtdlXDYAx9nHSFk15TEJGv+5tCyZSi4lb1ne
 wwfuLc23i6cJtcb5Q7xPzUB+sdcnYR0CJtFYfpIXxbeEEUQuvjZwKBumqixn3jb7TVcGv
 a/4OTg8tZYXkVnUoO/QE3iSE15uUkCAULaSBsuDqwvXtN98O7ubKOKCPD//M9XVN8j6ja
 sArmbquPzQ1B7BlIhBhB5l+p8A+LQ7nupXbdegLs9DCpa2ycAmHyxnd8MQU15oAwOideX
 PJAMwAIuQKvV7SB8NO1bX3AlwocEprQlK4I7itG3IqI9jbsVw/HimWj34TPz6JGeAXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624773;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n4PSniFqGcMBjBk0j7WjS1VSVS9jGrlfzn+OZ1gog94=;
 b=YTpcPgf2WzLj7tNZLIJ3KSM9fxEc3Z8g0ZmcynxrKB+b3UO5bfk9MSMNFWbLVQcZfDm6
 gRw6IdGxiPh3ByLZpl6QAmozqFaesWwzFonyBgfO+FXfKBUKoEv7AAPtEbRwOOcnGJiwe
 MXpjFQYcGOXVx5RY7nPveHaCPPj1LfnRUZfD/xhqJsQvhKg+Ry7N1MvfnqoUKXIsxwR7f
 XPQ+6au8vzhX+jQsvWbDSssiDwLnKlkYPnP2cdgUX/Fr2YSYMFrOEpYRuB4AoZx/bT2BH
 MEUccNQNQ9txc3HlQXvC/oImg291BPRGwwP/4eBfsh9Sffn6emt4zpI7qq57hX5usXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LO6uMi9N; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LO6uMi9N
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4323640004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791624768;
 bh=n4PSniFqGcMBjBk0j7WjS1VSVS9jGrlfzn+OZ1gog94=;
 h=From:To:Subject:Date:From;
 b=LO6uMi9N6hpWjU1nMTayJNhopF/au4SfqQzBLZj6F58F3Lbmchk7xFsbBML3UhFcr
 qQDN32QOMppg4QmPkUQX2lk+/b9In6CfjFQMN3VSnuZ9rAqgnRJ/rV5n+knUOI/zB8
 92F87afNye6YfsjIxwguVhSYVrFICIfC6ZYFsceWBwSg2BoI5zBaBPADLlCc5Rg8xN
 00OXpoZ43PV6GzpGZCC44fJ2fVEQSB535cRQzuQ/PXk656Mszc3FhuBWBJ7gJuQy+s
 5TzrKSSmo0rXG/GOyQax/bEUzU/pOE4iKIQQW0Mv33JZPcUBhlnAUezgUNTMX7tGey
 y/AJrFUgf35lQ==
X-KAS-Sym: v3:f51bdf72230551df:OPhuf0dE1Lcqdff9JEFlf315CWOGmOjBnWNXZ81ldTFUu
 vAQI9wjmwgGALzM6lvPjCrU4yiYQARTBGZqHO41jG29GVlieFqD/GVnj3xlzKWFOSWbBjwSBvf5
 qINfWsVIayCsIDfq7KWTHyhFKpByTRZ6DMWnnWkg5Bn52u+8aJ+CQJEHSw9FelmMiuaalZT76Da
 w9GwktL8bBQjkKBvjBRlHafTXJ+S2q0eXerV0utd42kFk6WAwaSYt41JdKzZ2hPHsQPYdxKIy/G
 MejZ67nQ7yR4HFtXb/PVuFFU0WOSHuCDsQDL/YWI/Kn5W8gTNqs66EZv+C/EBdK/+G3J0wyA==:
 O3XGD6RUEZhloOck8B84UL3iNWk2NJrW0WzHtwjnh1FZ7jw58BG96nBTb9OoD76OX+vR4wFbC8j
 K5St5thfhhqTo332U2b02MmaC+ohP80fvE7ySeINu51LZ/aP9//mqKvpfVjNzIlf63OLkMTxwlo
 Q/ckW3n6J5D1Xkyo8lqSVgu5Up7wqmctUukSL+vW2FuFl6zMFJStIqjTkqQg227tu3kzZeKWWzZ
 rm8yfKPimTefSVC4G6HzDCm1/g6Nu6nG1IkuDsmbIG7Iflgzw1KFs71H3h3PxGokFesDaOVXTRO
 EVXXQwFGRabBXdmTXzoHiu53PLqb4Awn3xTNME4i0/dwgV/NcLJwcNAapWalAv4t7/xk9tQ/YQd
 eV7sCXN9PB5/fRIZwAJzTChXFPxKLM/hJxM+DO8WRwI4NAaCJKUFcz6pzrww3pR7PdMbfViB0uj
 8+m8iYY8pS0KNSNg7ZkigUE9JOm5uutJrVj5z+gXxiLamtof3VozuP3OH/D6DmbyqVi4tpNyOX3
 QeA+Y34Ivg7vd3xguRXCun0HgfjAsLYZMdASQbWgGQl06zpWYK4QvLem+fPy53hBNjMXxEF8eoR
 ycrJ
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 078F7A4C538B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 11:32:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58894)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFTRf-000000007lL-2iYC
 for buildroot@buildroot.org; Sat, 10 Oct 2026 09:32:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:32:47 +0200
Message-ID: <20261010093247.3650651-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.54.0
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

https://sqlite.org/releaselog/3_54_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3101c8646a4848e315f28aa34f278abce1debd66

 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 3844da4792..25ac602fd7 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c  sqlite-autoconf-3530400.tar.gz
+sha256  134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed  sqlite-autoconf-3540000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5d0fdf4791..df22314091 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.4
-SQLITE_TAR_VERSION = 3530400
+SQLITE_VERSION = 3.54.0
+SQLITE_TAR_VERSION = 3540000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
