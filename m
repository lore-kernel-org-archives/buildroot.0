Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E3CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E9880D8C;
	Tue,  6 Oct 2026 16:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T0xdvzf542E; Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BF6FB80DEB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304256;
	b=rK0cQE884yaw4z1XTxTyHP6wZekJlDlu5GkfcC9pELXVF3b96MXs5lTGOACwBrS/R+RF
	 bOHeozkrDey+jKEE1I92u/sIlr/nv7oy2zg9cOPn2EqbOF0pJVhnkb+99X+CIk0/Gi/Qz
	 hX9cBlqIyFim/lqDmw5xy18jAIHeCY34Lbcd/YTHFPnypqPdXh0SWuEtxvQdjfk1pLfhS
	 B+Fd9TPn5a0s3ljwtIdTcY3kVG2eQESkVmO67vXTOGP/3wUBY/K0d0w0ujh8oRbiA725G
	 QIFKnnbazv8Q+ePFCKyJMtHPI0YMirpqIVT1KA9ELPDrhijHz4+GzwBaIU1JtV39K7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DB9mnjjeGoONiTqx2iCxhflhaBnFtJbho4KSGupEORg=;
	b=XeaO25+N2tPEYG9bfp1U7YB1fzTM/0I/KLeiwBMNujak8ce8Dm1jeaK9W+PDDmV4F9fJ
	 L6Vccxgp+0kyqgqiRxOXmLormN1+UpOHsnRyeZGHxmflExfMHYYG84+ptb9zg9kS/je3/
	 vjqBnZL3ndL5f8mxAMMPg/XhIgHS6exEsh/yfHKhz0VXduCA5wjGJFr9VDEOaYBCKnwSv
	 omKuTFtkVDbH/oFWZzDnlg8yymyQBgTaapUNg+aJ7NcRQ4gn7Gu1m0W0qT6dQ3WjObewJ
	 M4BSBKTkvz8tLN2L9qxvY5I+lKHLCaxlsHk4O1Nfr/EvFB2Kk2BJBqPyQKAc+5GeGaQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304256;
	bh=DB9mnjjeGoONiTqx2iCxhflhaBnFtJbho4KSGupEORg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fKi0JJzoD2yGQFrQXmHrbNt4Vbaelq3NcP+DLWT3GIRN1/AEsn8iwL9S/Wz3vZE9w
	 f+RzAMyOnphP4ptQ2YbyzdsNKLkCoqiYD+ThvGsAGz7PXcbzYY9OjozS2TQoaj2ZM5
	 A1WhMWIvWnLBlzKxKOU0KR9rPj3TV0PmCXEjJMa0DIcVqdbaGZg4997SUCEj7JA7qQ
	 vjvrk6eiSYVxYyV1eaTOYbGkUqlaSFLHX2ZbcDB0/YEjiHgPia5hv4uaGQ7sGd2bFm
	 2fdN+v9aM9Wq17ssU/iZzdnhX0a9y14JNaobyweHNeBJ5e4sjp8MlFTWqW7MLDHixs
	 XHydi7SP+1LSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF6FB80DEB;
	Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE696317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3093606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJDbWl-N4KZ5 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 92821605A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=GWl47MDOhF8UsCOdZF7i9gNfIKgC9ZAY5l8yNUMI3zyNa5/GllTA0Uh+YSXm0xV6RFJc
 8gyz97zhAXH1wmF7iwvppXuUBMK9s9S8yDyD5KsM+hhrCqBv7kklN9rFPQhwMfGay2fIm
 q9oCSzfpXBhSL2S/lrpmA5KvxsfWsz4lJCsBhaxeuPYRXzHZ9ZOJyA2gYdpnVIi7H+bVP
 gGQU328PIRJmjfdvIz2V9uLHsU4q28XsGcgAN+GF/zluwUVMEOfd9dYbLHvAp0+nb46ln
 AJakHjcrPJVrOm3meICNzd2aojTtQRSGZEhUIWjPnB8Vvo4pqi7OCgIOW2cPADUAUbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cTYvXOktGXL3o9fDsAqjLdE4z3VRje48GR+pwbyEs+A=;
 b=p0PCtP9Rpt8w6rVQrGApV3/I/doKt+1QoV19/uz5D6BFh67d6GOeLRQwaeqeMepWgbKN
 ENOnpbnLRzlpkGjgK/ZKwewwdJI0xu+A6W+ob4ZS2/RF/S9Bi4HnhwdJlHSMqeQiYSueZ
 kjq9oSm4gVjZIVj5Kylv0TNM1A+lL8w6Ps7xPq5FcHu9aipd8QC3GrIJTokFWjSaDVAzZ
 0GITv+Ph0HwstnOnzKD/8XUrbtow9PBjB7X7RFI5P8ip9BKZJTXTuNeIWBnzOr0R5uVgE
 ZFDT6ssCDzLkdzLXDOVgbSuAalGj1sa64Tc8qu9KLNSHLSfL6cYHG6jIt+hVSfFbyew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92821605A7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46CB88DA14; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:54:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52b21e8eb43a14cee06cc77de83af6d88e91fa14
X-Git-Newrev: fd8d89880b61d27bee2a428414346db086ebb99e
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.46CB88DA14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rpds-py: bump to version
 2026.9.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd8d89880b61d27bee2a428414346db086ebb99e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 6da82fab0f..bd0a4a5a59 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  0bcddb46502750f8e9547ab666db13115d798364b6a21a59c6474a3fa157a522  python-rpds-py-2026.6.3-cargo6.tar.gz
+sha256  bb88a386e7cdb8bf46d4433c829d20c98117365104ba2a1c6705fbade2d2c6d3  python-rpds-py-2026.9.1-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 40a0080a00..8ef766c961 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 2026.6.3
+PYTHON_RPDS_PY_VERSION = 2026.9.1
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/aa/2a/9618a122aeb2a169a28b03889a2995fe297588964333d4a7d67bdf46e147
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/42/68/3bd46b8a5e01d3c2ebdf9c5e9497912e3fe0cde02bac21a7130ca866e403
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
