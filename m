Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF09BCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78DE2612A6;
	Fri, 16 Oct 2026 13:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPQtQJ8CzJRZ; Fri, 16 Oct 2026 13:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EB994612D3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156379;
	b=apRY+IWlt79oBx4GDoe6f31f0NdiSa1EAj8mtMGOa6aUAXo8l/ha14m76PIMU1xwp53i
	 D+dn7BdP16CwVo4ZPQJxpKYD8niW7vvxaEhFDILc5NbnczWjzSYnG0tjhwVI+yIknNHn6
	 Rc8WUO8LE24fRY05ZnQFq25Rnb5QCpae/5vVyx83/BzZ3ljZGVTa1D3jtzMe+WvB57tr3
	 GwdSujyea2Xd3FXhYlnmKGsWCy808ENVJ1LpUIp/rsRJZWb3vxZjBUEmdm84WMK8FMGDq
	 Jqo22EubiwwkUhWH2JOlIJVBhiPAg9PME54wDn2+lc3VF1AGYuGOd8+meMfwlKqbQzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156379;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SZQN3rfYbABIsNuzzTEwR5Co7nsk5oFWTkv+kXoAzss=;
	b=RTPFEA/IWj8S3qVM+j6n189OqUVrMo/flTzPjPPlY090ZPhfLdJPAubO1/ntBW8ChOFv
	 hdHXpy2SNt4RUIQ0tKkq6/Q8XLdxEYmQxBhMOW20+Wq0QG5Yxl2XTjKMmEocsXaPx95cj
	 0GvcmgAeE+q3uJUtxwssKVIJON5AxTapKmFSaHkGJg+OJeYYPEgBwUdywmJBmwajoa6c0
	 x7QaUgWvNMicCvtMOsPdBpLtWbMe42kW8M59XrQ+aseDXHnCUuVdrhzAVb74NTuIUWHZp
	 QxxibiX3kAlVWyaBq/3OQ/vwOBIwuf6czwECyXI/vQ9A7QEqz8XRwfSgU3tXEzDOhtQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156379;
	bh=SZQN3rfYbABIsNuzzTEwR5Co7nsk5oFWTkv+kXoAzss=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iTF4unhVuVX16/sQYjS1OVBYnTnxfqkVQ6ySOftBnh0Vuc7cIV3DZbLpE223hOzyQ
	 aauuKexVw+7kQhml+paFNjTUL12QaKaakgObNj7lQGjqY0hcgfpg/ldmCh5MDqhlpw
	 OBnnbGvdnzNRa8v7y9q2/RDFsbnJ1SrcwhdUhA0moJiHnB3GXGfcc+Hw+0SkUX/6/F
	 XUWFk/QLXvYqqz3SAGT7XxAYS6SZNO+IAod2k8sDTcEK9T5ttphHmNXF+PkOQNfhr4
	 TVxhfcBnMzTr0o67DjcZLi5S6CRtLp/zuETuD98gaRLp+4hAAVRSFYLAD+5OLDWcGk
	 tG9Xn+PLPEDLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB994612D3;
	Fri, 16 Oct 2026 13:12:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B70769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C1060B43
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWNUE2JrwP3N for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D58B160F36
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=P/Zkz8l+rIXyJFfyII5kglW853R4By48iwWGQaIbTAiQXEudzCdO7bdKOd5IdqZP1YD0
 0b0yFeys0xHDdv5nooMNmP1vzziLhYO+BcOi86p7DDwGgZAH29uDvplbJ+NoAtczDv4CQ
 qDnQW9zIi9aP00Sz98NMlrDJm+PJMYiH5yLX5MmNAZ30Dbp6OSeqzqskhdix/j/4Ub8CN
 hpCH6vTd+wPpM4DWKGTO2ABO4P5LtL5nWFi1R4gGKisaMz25dj8jKwpPq8kdq9z1Bo0OK
 3/MTWhNWbnpzLK9z6+YK2neRAKC5Hhtuf32ZjplErDBAtYyGZMf6qbAWxtIFr3dGmoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i0mxfIeIzNQpKhJQOZYf60PoDJaFcnvC3Du9QJ4DsTg=;
 b=EzDOGCf877RlF9rJ0aLilTcDJO6f2rpfqext1v8fMXNrzYUZqn0Tq9bLySI/HoM70tAs
 pi+/FGk1DMLAYBFdjt1gkYz3P+ZP854vFITDCTt+bTjvq9jvI4svcHZ/qa2aLb+j+QPqV
 88Lq2Jo1CTbQNg96W3PDiU93l4MrVkmGha16RybkUwGOOQfwcsU1xAwLfZ2rP2GUswa1E
 aQgv+GVWvcQf5FtkNbjX/oU87Xhh+0UyZmWHcwCY+TESCEDd95fDiA4d4pU5SaO92SXRI
 NwHcpvPR8GUU9nzLZ0MvBRVg0ZTGYyyd6c4ajNlcCYGadIF5k9pQuuX+gs0cexkof8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58B160F36
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C56BE960D7; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:36:08 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c82b49c285c1c58908d8d608485186dfb2efc0b0
X-Git-Newrev: d4da32b15c5f59daba74bdf04bd8815dcdc6e0c2
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.C56BE960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-generic.mk:
 drop PKGDIR variable for patch step
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4682406230009588677=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4682406230009588677==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4da32b15c5f59daba74bdf04bd8815dcdc6e0c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This was added in commit 604d261fb0 ("infra: remove variable
FOO_DIR_PREFIX") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_PKGDIR, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c668c42e2bfff3d71a39d340350ff0d28bd82d2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f8ffaa21c7..c69bc96237 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)

--===============4682406230009588677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4682406230009588677==--
