Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBD5C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FE180D96;
	Sun, 13 Sep 2026 08:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um745NUcFz3M; Sun, 13 Sep 2026 08:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C673E80E48
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789289151;
	b=VAMFFUZdEahOO/z1D7bBPKEGFeHrWn6VIYygNFIQWA/3+UDOJxVckv9FaMUXES1rSF6i
	 8oVVVAAK6mLSHZJOdOB0+M+4apvw+vaLMVgctjJUMcVtc1B6bq0po+o2by20JcazlUEWA
	 F4XALXTZDZOkbdUX3gDg96qT3XoFth8FkYX4yb8meIDyscm9iHUt2UEFBBp2mQ9a6wUaV
	 07eLgAuuEJxT5efY78+hmgVPAp5Hmg4oS52N1cgzASXjA8hkkcA9C9W1gxjwYKR4D/YQp
	 /VoYrzlS0CcpoEkPXbPgcDoQJ7yH+1ft+prtJZsOZFP6FvTr+Bho9rE54eMaTNrzLJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789289151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=44qjMjrm8fDnLl/rOxwX+8ryW0JTV6YuWT1rswvYDdc=;
	b=Dqm4/5Rz6rO8YlgJXkg/vOQ8HDowE7gX0EkfpJ5tuzupUbKS9SkEp4zJXx3dn6Mi7Dl+
	 496qGP12R8S3fy5SHAtrrvHVzYzHZ77y2h6BxlMkEiCoQIFuTdZPl0+DRSgYPY2XJlxCm
	 V3b6DUcsrNN0xZBVkwCZDTX6M4tV8TXmxgRwONwOG9W/MDIqUQeB16KyAh8+VSulf4DQo
	 koFKYZLI11OaLr+/ZLbC7v162LrKGy/01kx3AWrslLASqbsChGZ8oprrq+q1t6FdHD+Jq
	 rLdgzmacJs4XYFWlj7ZP94N2LdND42yS4wdKTlo8ZSG/+V5zZ1xz038Cs4MMtbCcLtA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789289151;
	bh=44qjMjrm8fDnLl/rOxwX+8ryW0JTV6YuWT1rswvYDdc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m4SUSKz7SSbwzexs0kyl0lhLJq+jz0m3W8TowFTeLpm2XG4xRaOOaomZNb/TuBRyC
	 KXbv6XtMUuzga0CAKfMow5yv92CstUT2E+EDmFW65KOqTwEVB+25lq/4G3x7xdgUVr
	 yPRlclAE+OnJ1mOeyZ+xkO6i69dF6mo3KvvwIhurLJf4teUJm+N6pYgwcaP8xw368f
	 QGgF3QHHXOLaYeMbod9wjmmL4bhlwSlCBRzk87gK1N1iZ/utZuEs05SEXNrvmJqfVW
	 wevgonGPg8UrGLaDIW2a4GhEDc4N61w3gHRAOp+/2uz1Ee0UQvOVickp67TEItBakf
	 G4tULmSD10NRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C673E80E48;
	Sun, 13 Sep 2026 08:45:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C83223F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 434BF40049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVzVUzibQzaa for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 821B1400BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789289148;
 b=iDFSQSO/fo7Z60dGMVZB+Av17mXQn8atADwqpF8+lj5SpIaFqpARG85GIxN9361h10a+
 wfDNDPrIKn5jPMxmcVsaUUQ3ufvuVm5gO6sF37GRn14GDS8fHkgR0wo4yEs0BWJrz6J1M
 KAyZ6Y9bF0ixS9gIX5smASUuqeFH9gGZuj+di4U1+mZCZ8LBsOhERdy2VKbMcf9UpSkQ1
 ZzUux0qQgMvXSMB9aBGodNNNZBUrlDGiNThWqEEeRS1gr3m+VgNrPOHUe+ROWR1pwaLuu
 4jLbUnCHBei1AUjOnurpoFiSadf3pzQhG4BlSntbbp9z+C2NAexDDK5MeYfe9LZJV0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789289148;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=meeya25qvxKQ7QTcGl/Th4mp0MC7xL8e9+a/dfNtwSU=;
 b=kvu/nFr3fThChpPkmlmreUJsFzdxur0lenD9l+yfxFIW9ARzlBxyVQfsgVNVmnM4df0l
 /wZ9PQ7tpJEgtaQTkSBAC6B1sODCjQ9RF6pFiwAe6IUwrQuP0+M1R+Qo1Da7nEDb5M+HY
 iHGpTkfQUDa34O1AOdMckXEQ7ttIbx5y13K36zEWg7HWbw41ft/VV27c+qPqQKMPhajxS
 Yizu2I/Dd749bQxaOUTlDytZRDTqBH360fItZ8V9htbb5lWn87X+6LRhiYmPQdFUJVb0o
 n6+QK9G0A771COrdDo+v+t+w6dmINLejpz3ozmABEQiskCXTukzmvlx4ceprXT8B2Vg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 821B1400BA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9456695B1F; Sun, 13 Sep 2026 08:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 548904619c6498edc3a522d2a20dbb4179a206c0
X-Git-Newrev: 74dab034953e4546b63c9c280428e59fb144488b
X-Patchwork-Hint: ignore
Message-Id: <20260913084443.9456695B1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio-reflection: add
 missing BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74dab034953e4546b63c9c280428e59fb144488b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION selects
BR2_PACKAGE_PYTHON_PROTOBUF, but forgot to replicate "depends on
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS".

Fixes: 3217fedcb8c8006809c1a3d214c97597677a07fd ("package/python-grpcio-reflection: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio-reflection/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index a0ca35c286..1e35c82a9d 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
