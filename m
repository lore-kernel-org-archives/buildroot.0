Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8D7CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B7D610BA;
	Fri, 16 Oct 2026 13:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66OC4bhPb5Zr; Fri, 16 Oct 2026 13:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 092B6610C2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156303;
	b=EXjZ5rETOgvAqId7crsGb9gpJoFrrTvD3JtBg2Fsi1KZlpY1KKDIZEV+uxkW5Pug8yPQ
	 kLHSnCbGzTJyzgnkeb8y8UaMa/q71pyOL6+PO3pe8n43pvtlX3ZBEgL6NAYbdN0DSFUOR
	 3YA4rpCpkklFrpyVVX/OMl3D0ytv/oAsKcA+ONfEQiM66xXBATBn75tG9ACGxEzlDZEC1
	 EyPqKYJ+w/xdCEJKa1oCmc0/lLzVm5RBUuox6qjqBBzq2qL8zpV0YuSmQsYhi2pqN01yS
	 OeXnzvGiKjmSZ3thx9FTY7XX/ISfzfVpWsGwl8P4L8pcPlYipkTzktl0BnB8A2MqVDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VZjHwJF+N6A+hpxyJhw4/PW+0Q0fmzhHEgfhKM2x12E=;
	b=Ss1TU3CYNkKeI+Zt8eRet7zSg3S8g1fu18HrpG5ozJASsPaPZA7OXxLb90eR+4kg+QlH
	 HOnDrN/QUPE84IFHgP8iD1x/noks+a21hpoKYgfq3dbu+1xwmJL+qo3n7g9NzpGSYIt0H
	 Vu0ntKB77YKwifDdrJdAGkaBC/Ovxc+kgjHH1ZM57ceXs5keMax8MWAPZsUUvj3JOIXSj
	 3b4ivE7AHXtfYQGH1ALahXqi76NjzPv/Y9j9/fjidN5NbV1sZ/CMW6XXH/OTfx6XdiNUi
	 gMRmPUyC2GuusuGYtmg1Km3lUP0z2JlSROlGz3SXAw/90cVjtPfQ027uuc+l+2ZSuiQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156303;
	bh=VZjHwJF+N6A+hpxyJhw4/PW+0Q0fmzhHEgfhKM2x12E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sBhd3CZepcu4uFee9o7C7Q/ONB+MqqAgakGe3atjVaHT/JIiqNOy6Oau0ahpc3hlH
	 jw5DEKoth95tf07ihNdqMFU0sXwlVB8s/dDx12TPG6gDnftK79Ur66ibRUczEEsJCq
	 f+zgN6iP28FB7DWL8Ty0OnXaYhO2WP9sC59SfA6dt4rIz7SYfewPnXNfb2JK8EEayq
	 kkJ1SomqBeNhj8adZxKHGV+XmxZshd5cpQW5+nnQVRbRpepbuwPmY5MFuqJljMv7hT
	 8Qi+Ni6F98JFaYVEf8m591m0CbmZGEerKme/jRwHMp7bj0/1TBgtSErTmXcIz42L3D
	 dTfXy5OUUlYNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 092B6610C2;
	Fri, 16 Oct 2026 13:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A196105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2012840474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PXpMqMuh2P1 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6FAE740042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=mqNpf0x2deL2M6Q3HzbU4Kjg4vIvPv9vMgBnvN2SBc002oWLSZ/xDpBFnTTCapZ3H4UY
 iRam1+hXn/bRSojYdzW9dgJ5c3kP4bFqvCl3v7F93J/gnGKzTdf04zKWG5olq5cUsej+v
 abhgPjFnYLBMyFl+BMTMNR0dvi6+3V2fPMbqCzMFnLObTzPqqRE6ABxcsqUnSfwfGtSEs
 nhB5CEJsnFT3AnJ/LSjSjGG7+89bKY5zTNwIGdr3R2fOZgiBdjs+Q3HbXAoEVCSY8YYqL
 Qul+k5Plb1yJ6sOnrMp3zFZB99h30lxM8xBX3tTo5u4FUbo95zxtt/9f+1ANNn8hYnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F+FvdMOFqYyFb+/t78YbP7kBrNAqEWPFxjGD0swcPAA=;
 b=pXtivMIylRqWZunBYeSyfDWg/TLygxHHQRfnjyyIVfoVlw7PH4iyLYjFVXdPO16Kquz3
 8FR2Eav0qw4gdBbIge1A4MbZ/9ailWb0aSoVCmqg+ZxlLa9nWQEXsyaU2PlJGiO7JhPNZ
 auh8/+fydO20NyFx0DxhmTPsbPm8LGqhJ/f+E9po9SJcMYpR3hHbpjztWc8g4486cAriX
 XivWKdCQfNke9uG/FocSceZ8zDWFPjbUx1dbjMnXuPIGe6QcaOwJxtxU6CSqxb3V1N7zc
 Hh0SbhLW6VjFae0YTGxN4EHxG5j2f+JM1FDR3RmoC1Bmd4Iy1YKd6bNV8NF8zrCE2Yg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FAE740042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FDD18D3BF; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:06 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d2e9e37a39befa3f04abe50329251c469c43ff1b
X-Git-Newrev: 26723c2fd1198d2dd9e370a80a63709b6a6295c5
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.5FDD18D3BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 add "id" property to resolves
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
Content-Type: multipart/mixed; boundary="===============7042686357093221455=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7042686357093221455==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26723c2fd1198d2dd9e370a80a63709b6a6295c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The CycloneDX spec defines the "components.pedigree.patches.resolves"
object [1] as supporting both a "name" & "id" property.

The definition provided for the "id" property is the following [2]:

> The identifier of the issue assigned by the source of the issue

And for the "name" property [3]:

> The name of the issue

The "resolves" object was introduced in commit [4] and only used the
"name" property to link to the vulnerability it resolves.

In example [5] provided on the CycloneDX website, both the "name" & "id"
properties are set in the security example.

In the vulnerability context, and more precisely the CVEs, the "name"
and the "id" are the same and thus the value can be duplicated across
the two properties.

This commit replicates the behavior documented in [5] to improve
compatibility with tools.

[1] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves
[2] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_id
[3] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_name
[4] 9415529923 utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
[5] https://cyclonedx.org/use-cases/pedigree/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 074e650219f98357fe051f82e9fbfe007851a865)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 45f9682da6..098f62bf2c 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -233,6 +233,7 @@ def cyclonedx_patches(patch_list: list[str]):
                     "resolves": [
                         {
                             "type": "security",
+                            "id": cve,
                             "name": cve
                         } for cve in cves
                     ]

--===============7042686357093221455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7042686357093221455==--
