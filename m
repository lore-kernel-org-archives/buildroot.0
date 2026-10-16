Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6D5CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CAFD60B48;
	Fri, 16 Oct 2026 13:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKj7E3w6wxAm; Fri, 16 Oct 2026 13:09:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C5B460EAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156177;
	b=Kc3V76xStqpPm024S1U8jBULWTga6A0kic8OvhyUtTOcUnjvoNd7ZAOSTF8zi0YQiR3J
	 u03jw9gjK798fiGVYYIgaKODPLlu+mU9pdN7bizQi8Yw2ixZff76nZuHgHryQ8IDp7Lyk
	 dzXO1R0dJJZNrugG308pp8VKNXhn013o/lU1A4dUe9XbAl8Jm2P63qHtTfC+7H3S/j2t/
	 ihQmG2F17MXBXsP616l28ayB+zko1L/v+Ek25UfLKXBe3b+bFJpRetPavLo+YuRN1YcG9
	 XIDtrjRynn7X8GkM/eItHjharuO6DYHgzwANnJbG3UEb5sDrhObouoaChCr+vengw/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Ph6pfFPdAXQANyV4lTbFIVrzzF9nnevkUbNPcz+soRU=;
	b=fAmn3IrNvc7hxrAsqJlxjA1BhLBujGuUy2vI7GX/5podp1Jtpbu8w4O6SVUG9j+EexG+
	 e0UXDPaLrpnabet3OBEmITnrPN2T+dUxIXdWrT2oo1VfWG3d3iuV/huHqNYYn54JStbKa
	 9wBXlitfcWS549G/RAcMO9zTdkW+1s3pihNOdrXzWbN09RLWnb7g09FIbGQNp/tvHS88s
	 4auA92q5hB2XK9fTlDmqk0XJVhdbaAJZYW7MHNIqMXkWn7+gUlVt4PgmU/A81pU8uUEpK
	 nFNWL3u2Ecwp9+OdCGTgYqtcyznPsf0Fw9/yafQ/NRp4wK/laukhR34b/N82n3ZHJQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156177;
	bh=Ph6pfFPdAXQANyV4lTbFIVrzzF9nnevkUbNPcz+soRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gncE7+m35JFbwIEIwBlcXCWM/d+n2KvYmNkuQ+wZmSTPAsGGyoTXKEOi5VdeMSnl2
	 3Y+Pm2UyEnNoC8b/G8OrF5NNodeBrQvLgO3R2oNAgPzMZZvtNe8CASu89o9vhnwQYp
	 YxMEOHPYb1pPk4iTo5+RL1CO711hNOcyasP2jI4utQ9Xh594AWxtqicBygBxp+cKHf
	 NJtYpZGIKdaLFPAP5K/2iZ5MJIL6wqev8oWQs5+mpjgh3NnLbB3pQLTb4yCxSuWEm4
	 cfJFC3jsiW3If9/rm2fUHx8YoAkxo1cPeqwsdL4xqQaNK5q22p5NHdpvsItT3BWzzP
	 aTQ7JXcYgb2ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C5B460EAC;
	Fri, 16 Oct 2026 13:09:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D87E1F6F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF97409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aavgDxERMO4O for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7DA86409F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=HVQVQ1a+7jLps8zgytUeOEQo3Mv4cDIQraOhy69Of6gsnWE5i16V9GUHRWXq9r9YqsJX
 hW1/z0LO6ohO3Te3MhXTn7O+eqd0YDua99lRTJAndokXnlyZq7DiBUXYv/F+9M+u0tAiH
 10n183XK2H2A5fp6ntKkK45NewIkgUfuX5+Nwj+ljGiF5gwL6rrN96WA7IHEdWijbaq4s
 7Ruq5+ajMQIrI7eiPrskFzQF2MNvJwHka5advxyyi2TE2qk2XBiEMmCCxxaacgNnoysL7
 ECA/6CzOrz9N9U4H2VaY2XtC/gLcR/7dRY/Erg7x7IWCq16j3QCBj6hXlR8uuJ/IQZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ar66gP4WQEh1fD2//tzANTAAlC5iAv01iBSxkFdwGx8=;
 b=tAJFliCTLP57CWMveuCtmCOCcGx3kK30NFF29hPHoqQVnBaPXpi+CmGjQYLGIeJlfSU9
 knpymTrQc+ZOHy/+4yjHFEoA6CudWhI/RXG4nABnSW6g8v+os750gaCfDUafOHMHiLx02
 0Pjb/h15RhV49CO86MnchxHEAFzwwe58LtvQFMFptrSA+M7te/sSw/8fzSZuuKkAn4y/K
 vz7WmUEnjBXF4fco7CeZR1vXEGalyrbAI12DAe2am7u7MD0RSK5l9F8lSLjIaZKzbkQht
 N/GymSn6rX/15E2tPULtQK2ybwYvVuyFqwH2m3FDuTI7cnCPIDbhhWI1Tcwi/bqWFhA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA86409F8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EA67960D9; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bf3f755c1d2c651ef53a295bb50949ab0c2e1644
X-Git-Newrev: aa65cab492c0e1e25b0ba62818c14bae1b0b4dfe
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.6EA67960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1627134068522883929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1627134068522883929==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa65cab492c0e1e25b0ba62818c14bae1b0b4dfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============1627134068522883929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1627134068522883929==--
