Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD70DCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F75860E2D;
	Fri, 16 Oct 2026 13:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmXIQTg2qXDr; Fri, 16 Oct 2026 13:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7539A61089
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156269;
	b=c+otG7AYhBYO+5c3fPSLDDI9CqVI79YQA922Ec3NErUT5Bp4fAB86lJeryRWAK1whnFg
	 Zzsya4eKDOCh3nmLKKRkXZ+iBWdgboIKxabfSK1ud0WFfqMMAOR8AaheAbbM2ItDXWdQh
	 O3nCMpqDjCYJCYBYfxoDtgX6e1QuVUg0EqhXuixiuwATOMKQzgTV0serU+Tyy1wsKTxhd
	 61L8Qm8D9LHf+LKv+n5rTr2F6RrcmzQwV8oT5GA+IKKlDyO5mVWrSTqiwWtrpzvA0PyrG
	 eIgoCautKHf+sxEja5m2biF70UR2+qcx/jyyMw+8Ii4JTzZi3BhgquKeVGQwHfC+xIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wxriBG0YFlizfJUoNuXQSKyqsuEgvyGEqHJ57bJ4MLo=;
	b=RpPW+aUJjn+aa+Pu7sYJl3FNK3sIUNWNGRXRk6J0/LDynEmNv2fBScJLDxaB8G1RE73d
	 2GgAFsyNuGcTAWHLZXm+YXgK3VOMRb7HvwdxU5sw2G6llVPAm7VphsV1+lmYf95KQz6ag
	 8gReW4W3349T32fZs+JgTA1e4zj3IF9orhUKPZpyUsOxotz4+WpDr1Yl1UOfcExWPEg6K
	 eDmJTVYafxdaXfgfz6dRe1ZXMTMVR7hTp9Pl79ck+83c3lm8NyWBjHs03/oI2MILtX38d
	 dSRtS3KRuigQCNTwIxy7mkGe5+csuNJcuicIWkMK8kXJW6KReQXD1PMW85/gMMSlKHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156269;
	bh=wxriBG0YFlizfJUoNuXQSKyqsuEgvyGEqHJ57bJ4MLo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S9gMDgjdK7PJtHV0I3O3B/rPE5nm4hJ9jskXDGWHOBWaXuvZVoLPOqffq2kHZr4Ob
	 ccQig6np8a7YTHWWA6JyUTPBOcmoNl9DMCBx/OEQRrY6nfMnluMviagNOChjfANTdz
	 G5FGPDITkaN+Y4Ujxc1ncB12ImQgYp9E4HlzheZ41B+KYCPC8lw0tXsVrvncAmLlDR
	 JJOKOG+SiLA/EYeDyveJAI+VIM9sHlIQSVmfb9C9M0/ALaCGVsg3GFUCP669HD1DWF
	 hffr9a6HEgDA1S1Pw7SUYJ1HuV3fW7CYMgJkyiC9ltGZPuXokyqfnf0JobdUmngtvU
	 eIHfJeiaJJfIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7539A61089;
	Fri, 16 Oct 2026 13:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B226C255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3EE480772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n19WMGCePo-x for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F17681518
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=HB1s5AtlY8+GY9UW6K3w1AGQY1aJ1CWH5EZbRe8/RckSZZlGUXRZEShLsg9g+XM/Ou+4
 6hgTM9/24ikzI7dSjaspRiegOyy6l1Ip8FMHA3uAh30H3rMlEd5ySDHkqnQILanqLEgo+
 QJLi/yre778fxhj6cDJNoSRNzBJy6BhVZ9iQkTF7T7HtWKbjb27EoPyMPSYYZ8gpkvhR4
 xLy+Phv8vrpXqljlQS9bZVIGVlqWeBT1Ou1tM4nA5BqK9zeb+RE9v87knKb+lqSaLWVeV
 quDIuIkuJgQLsFzFzDl12DYa3Pg8G0KF6Mf2p/6U8KXw0FdGfK3I0ot3F0faeWeHmfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h1F/pagFiB2ndd+Z0co1MaQbyMoKER0ZN7UR6sn+8oo=;
 b=cUORIzx+V7m4GWW6XoIcPxRlh3LwWNw7eh7RFldtXF3zvzpgE2Six7BeuWzIKyXZoXlo
 hmOtqkGVkjWqmQxkcLTo/YUAIiFrprYYQ4fBttN229zbmOsWnfJPgtQSmBv+wQJ/QE6tm
 uljIfXYTd34etXA+3dF/p91kVt3mdrK60gClmftT+mdHO1LF0MYNJTuflSmtNsDC1MH0g
 MQm92ea30WJXgzb1YQVdKQLwiwaXIQnraJf5AScieN3tvGLT7GGYrSYVbsnWrNBjgrSe+
 kNJfm1CfpObfTps7yrgMOz5vZvSRy5IErtuTPZypSBawl3LLNxcKsSaQFXZT4mVhIDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F17681518
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F572960D8; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f80c0fe450b62a4c20a35bc002bf78ea7386efb5
X-Git-Newrev: 226c694387e777d3559949870be6426cc27ca3f3
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.4F572960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netsnmp: remove
 trailing space in 0001 patch CVE trailer
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
Content-Type: multipart/mixed; boundary="===============6576588923411432163=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6576588923411432163==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/226c694387e777d3559949870be6426cc27ca3f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The 'CVE: CVE-2022-44792' trailer of the 0001 patch ends with a space,
so check-package does not recognize it and reports:

  package/netsnmp/netsnmp.mk: patch file '0001-snmp_agent-disallow-SET-with-NULL-varbind.patch' 'CVE:' tag(s) 'CVE-2022-44793' does not match the ignored identifier(s) 'CVE-2022-44792, CVE-2022-44793'

Remove the trailing space.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
index 00e6d2e21c..316577d7f4 100644
--- a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
+++ b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
@@ -4,7 +4,7 @@ Date: Fri, 25 Nov 2022 08:41:24 -0800
 Subject: [PATCH] snmp_agent: disallow SET with NULL varbind
 
 Upstream: https://github.com/net-snmp/net-snmp/commit/4589352dac3ae111c7621298cf231742209efd9b
-CVE: CVE-2022-44792 
+CVE: CVE-2022-44792
 CVE: CVE-2022-44793
 [Thomas: this commit was merged as part of
 https://github.com/net-snmp/net-snmp/pull/490/commits, which fixes

--===============6576588923411432163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6576588923411432163==--
