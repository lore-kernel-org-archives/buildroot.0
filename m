Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F11CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14291408A1;
	Sat, 10 Oct 2026 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0f_iDKpoSwds; Sat, 10 Oct 2026 16:36:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3629D40887
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650203;
	b=nBgspkR1hw42gJeVbPaxKOAsY0IK6YpKGY2NIhyN30m3E6p0ho63t4QJEYq3NYwp5i46
	 AtOBh+WfIpeqRwYpe6yXXmLm+kvgdaQH7ab84VzZ+GXNLHBqIPCe2KUCrTmUip4l3RPvj
	 FPXqGARZUcLvQ42GeqO7U0728Q0lqTx39zKV4ncuVeLe0oS402T88hHA2vZBsfj+GEj5A
	 fqK3duTkE32q/0ZRgCDCAGUpCnnQPgFJSD5NzargeGBVf+rfBsKJmrVvCh1W4SGllfXl4
	 9uEzOYC9uxSRRGmuSch8VLAWCCz0JnEvSRVi4OKZIzlEkWywVFOZXHgUBZQY3PAM/aA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pJSl2XYJKKoZvuEoGV4sXUO1AKGNRBQNob4q0RhVJTU=;
	b=MhBAUzF/8brxDEDBqNxTHfTLwR0JpzAFbNgxulr1lCB59kL2HNdmGzI6SqvsKOxoxyXB
	 +KgUM/B9MA5PCmxMp4Jlj91RWzAoDvf+I8y1Cx6mZzrDl15CJRuL4zyCVDesmy0QkjjrB
	 gFWK+ubPLNTo08YbrKrWKScWvepFQgw169/eo3qPegyQEwwd06rLfgoreXIz/rH6031pQ
	 sRR4iOV6Jy/MrC/RxgZejv23858PcnlwSSc+JGgq0Pn/o8oV9vee6rxx+yoecRqLilXsU
	 ZWO7Ywv1FhKa8/IPcjG1dBL2UNOi9YHfHuxXNAsDK0k2uMBT4LcgI+Zte9FbDnB1diQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650203;
	bh=pJSl2XYJKKoZvuEoGV4sXUO1AKGNRBQNob4q0RhVJTU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aVit2Ep1uzSvg2pCBiJ8rCsHus24jid4YeFcOyY/4UuO470yQpmAJTun/aWu/lnKJ
	 WOqNnFBVIKbf9Qz+145Xazp/2vF9jWUDmz54AgbX6XDleIu3eQ71IARPd36pu0UYe0
	 Um/LVg7fCeTB5BhKA1k8C+fJkHYrhPXgmExBBWl02dUmB6JrY8f/mo1rVMHP4gfKe1
	 9krhV/duvsfd0Bx4ocqIjuy3/JfQOxXf9i4tH8vTB6aZzYb3fkwQAY2AQV9hN6PHOW
	 QqQpqZt8eZqwnNO8h1Pd06PVPpe7fOOLKzYPWRpErI8of3nyLDces5SmBkhdQm+9hx
	 OKZwtEpa88uKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3629D40887;
	Sat, 10 Oct 2026 16:36:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0493156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA084005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SqYxR3Qug3m for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:36:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 44C1640004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650198;
 b=ivFEN25lEF3ZgzwRG9b6ArP4LXm0K4ySj+ck9RbSJQ6l8Xs+eGv0QHNyeapE0+EIB4is
 rZRRBzz5/tVk7l3/cVWKRsqnp2p23lttK8KKJrBi8xc81MnOYTFBc8TG9jqvEmwzTnKN4
 Brs60zMlaVe6Rw7zyPIDGyzEGzEobiTy5ROhVmzJ0iJ/40QVgNm7lNosHUT29n4qZV3jX
 cZRhOmU57hCkKoAMBQFWewEzcxk8uvGgmmj+nZPrLbx+0PLdLFLPKN3Bq7ahVE0+/hEZv
 3YhtBEdiRAJCOJxsxs0cH2ra3EDx+cky5DXj0prrb8SqPYqMaqSteMrswN8lFN81+7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650198;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8G4Hob4Qg2+Db34qhISTEBvgaNzqwxtVX6kLsYeSFgE=;
 b=kmTVuEeUXGOYT5iZ/+LsC8bgeFqa3aQ/Gymr9sNMvca7lcPHbXCz6TtrUdqHNflq2k09
 e8he2qmsD0sllRvumoTmOY7uLsfITgxTmkBo1ldGuSzpf2lsMKMliYLFSCxbmrUAivHHy
 ZW6nSgVTMfe0pVgy+F6OJcZgEaLJlvSgKWtlCd+ASqKfv5NXaCFk0lzeSdCNpbECnPDV7
 XBhTwZASGMQph9Y+ESTh0gfWkEYStnGhm3JGNP4Muazec0Qw962YlLx7o+ZHJmvkHPCDZ
 nC3qTAC8EUfHjeA0/U+1JD6FZeUj/CkszGOY0ckAXWMC9td82FM+dpLPWWRZH/wIb6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44C1640004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9CD091DCF; Sat, 10 Oct 2026 16:35:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:35:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98ba8f3951ecf7b968a7d3a6f65ec14acc51b568
X-Git-Newrev: 9054c08eb6e9c1a5f3247b91e9cbd73153a1c490
X-Patchwork-Hint: ignore
Message-Id: <20261010163519.E9CD091DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2/Config.in: remove empty line to
 fix check-package error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9054c08eb6e9c1a5f3247b91e9cbd73153a1c490
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] introduced the check-package error:

   boot/edk2/Config.in:19: line contains trailing whitespace

This commit fixes the issue by removing those extra spaces.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ea0f27d64f84894f53170bec827aeff4370104fe

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/edk2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 7d170fde3b..92dbb34a06 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -16,7 +16,7 @@ config BR2_TARGET_EDK2
 	  development environment for the UEFI and PI specifications.
 	  Select this to build EDK II (and OVMF) to be able to boot
 	  Buildroot in QEMU (UEFI mode).
-	  
+
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
