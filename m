Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB0CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902A280DD7;
	Tue,  6 Oct 2026 16:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39wMcj0DiC_U; Tue,  6 Oct 2026 16:30:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 920B680DAC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304248;
	b=ZxCiFW+cJAgQ1EFKVai6/p38/4DFDLiQ69b5bcq7MhTiUyK/MRmNbK2Y2iwt3T1QHVma
	 Ul07DDplORVsXBUvsWMJRdEo4qY5YQiRUK1fucSF3JEmiew1KKWUuaHDT+eXP1314FYE9
	 UxakVFK85a4bgYp1QmQpev3pD+ARggLF838pdPXMo3k2AYgDIBve0N+MyP8nAMbGx3lem
	 KTbezhrHRxKokQpqNr44cTRMt+Wa+FgY4C2qfjq0oOzhXESTcL1i3f9ozavIyNSq4bId9
	 Ql38Xup3WKrgLvm9SEwYxEIj5SALG/I5Zw7qdMATG5iZqrrJsc/uEQdGEkf5NsT/Ozw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XkxMQIGChmJrQMrDdi1/lwq2/ZcvK2e2h+3LQxMsbe4=;
	b=nQihzRBcZP8MCfysYUwkD0qawCGm9oFtGvOE1pWhpEZELzOxej6NThrvj6TbCGV7AtCB
	 rbK5sXgXHFoIP6Q8XI702fB+i2VB/xXBdLn4jRBhbbk5gLeigeycsAmranrVyLxQmRnrN
	 PscAt0pgcIzud8/hciN8wPYzHlyqagEsz6kJOkNGsXn0O/+0ueUwRTQ17YdGqfYjLjch+
	 MPAC/VlQcfF6DJifP8+0o+u07G8CmTJ9GRToLtC8OhQJVrjtT6Rc00tETMhoukSRL3XwX
	 nNSB6MoU5MIbxWp9NpBB1s+hl5XH2Rb6mMPDDXTmQ9Z/TIfOKaKOphS1fLywXaF+oSQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304248;
	bh=XkxMQIGChmJrQMrDdi1/lwq2/ZcvK2e2h+3LQxMsbe4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LgybR7sIywjO85qrmXvDc9Bb2rPRHGJFoOqAthq0PlMGcjXnOwnFf8MJ95wV9n5o2
	 jqBnJONeq0Cr5VC7eFDqGgpYkiU5wwzyFEaJ+QQ+hO/TDjvGY1NiEK5OPkMUzsLopN
	 cyuxFVdZLINv3U0dsr1WFR6+cZijDbaos9jBkEHcXIKRlB/HpGNZqn0Km0/ZDpl4Qs
	 PGC6/p8DHAdYP3uoJK9tDrn3qLHERwbh5l5wKoqUESxEm9f5zk9UNgNIK0W/RS6GDe
	 cVyBelWRkoZowhOE0sfMnfhTcdNvIlzaCnBDzUA8fdKrruDotzxxyMyhwncjTIYUlr
	 epuR7ZfEeMjHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920B680DAC;
	Tue,  6 Oct 2026 16:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7036FA12
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CE5C4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9bCsIPrhX-z for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 87136402AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=HxkSJV+mZiTeG4/BEMDLnFJGS0T8zNpi3w063hRkv8gYwQN3LFCRavmZ5N3J5qEVT1Yl
 I2R9Q7xFYmsgq7VzBCXSSn8VE6cvDnfBFf0/814bBwEOpDfDK13WzNBL6594XkDc5etjt
 CFMex+UfoDcABESmNkHhZbTx7vKvLq25sv8sRC7EMP25edoLeU31rk0QtFbv92KJCfdF8
 RozxAnM55mnmcRTS1bzhj+u6DS503/iT16NScIVd6ymjwZjmWcuIBE/7L8ppPWNCQ5MWu
 IBLcn1fJlMIaDLnTxcPXu5qU860+1vOR8+6s+dw198h5fyh4WeLzpESm5AQImqKKW7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uw/u7pAX2y4OY3hIYJCmBbE6jGYigYqrMq6rlx3tiAE=;
 b=NEsieoJYcA2mfQ8e3ZoLVn3E8Lv5Xm0oHkMBTaDv501lc8ehsCTGdMWUq5NUMZENsqdV
 rkfXAsEXeOnI8P0DKQG/byjPjIz4eCCJackO5ejLeCTaUDegNNA3z+srZ9PHgmMGsRBSD
 lbHLTGLhPe3F258p8IHvgNcboXTAgTh84Rgfcu/HphAiqwKzvAu54vI7sTugl/pHY5VVu
 fWrHmQj6F7wKnega4KPfO/GbyyA4biWYLRR2+T/A7OAYoYtFrfgM0P77l7y9H8VLm2jxz
 Bba8takJfkvAkHIXNmLR8yeDnUUZMG/QTFnTdXAMT9Vmn1u0u1beaVvwjgLgdB6kwyw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87136402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E0A68DA11; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:53:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c630855cd93e518c472455f0f8c9d433e6a58ab7
X-Git-Newrev: 52b21e8eb43a14cee06cc77de83af6d88e91fa14
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.3E0A68DA11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytz: bump to version 2026.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52b21e8eb43a14cee06cc77de83af6d88e91fa14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e39ce4cdc5..f26bbd767e 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  cdf22c8015c77214dc4bdfddff39a1b5  pytz-2026.4.tar.gz
-sha256  464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63  pytz-2026.4.tar.gz
+md5  f6fcc93492495d83d7bea567fdb1eab9  pytz-2026.5.tar.gz
+sha256  fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86  pytz-2026.5.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 85fe1d30ec..4513fb6b73 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2026.4
+PYTHON_PYTZ_VERSION = 2026.5
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/b0/ed/fa23d28713004418bbf2407127f80f385bfb0bf4e677bef02c25c27b00ee
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/14/21/d83d6ef28c4c912c4bb4d1dcf591f7b8c6bde87b9c66f9f454677314e16d
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
