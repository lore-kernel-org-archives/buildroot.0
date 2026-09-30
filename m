Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE53CCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B6260D66;
	Thu,  1 Oct 2026 14:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQzzHL3AXd8i; Thu,  1 Oct 2026 14:22:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4EC1960D64
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864569;
	b=SEsk3Ck7onsWLbT+aPTCpBh7fUdkbfqjwlbbDywvZIt41HyCp8MPsBypCpz2ao45gQSH
	 TZHT2u4+miKqdTEZdLs40btsh1IEKLZtfIcY0Nn9q5+W7tXcnVT124VV/i7S7wMAZbl2p
	 q+Nz4RKydwe19ryxFpeQBndd781sKgquOY7Ga4+HJ3uepsVzwi0MzbyqDr5zZaXYmdZlO
	 KcWgCbGeSut3LwGwviBPzlB7d/LCQLi+6uDe2Fbk5iXCXBSQCtokS859Mf9gCRGndPQCz
	 79aZdH6MSQMcBhBGcXv8nsWF4tn2uo+kbnEdNr7QWSddAtN0yGEXW7d7+xX016Gs+mw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6eg2RLRf0ytEyYF1Hp8gdP6HI+Zoav1PHFFOejIjeUw=;
	b=WcaeMDesK1apPZ/A0ILuN6qPe9b8HXYx6kBPTAZW8cYztJTdYBlC1+HzLQVbtEd/N8u+
	 tU/se55G4aZvg+askZArwEedKm6h5FBDIf0CuXVghqOB2o2R2DxC7i/TtwhpOFDEwADp3
	 wSP7VWc6+zKXYWdDffh+lHIqFoX00XZ7vppWlN8V3W03ppJfgUkCwASSSImjVASSIkRyA
	 31RbxKkiTdWasxuYbQFor52J+YyiPCKTslNWq/rFRSfTmjCgoefpjrSP3OS3vCDBr+75B
	 NMODsz6+kd803xzNriBnAJ/QibErhTSYdV5h3sT5AwywsSjXsex0JPsr7OS+VUGjp7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864569;
	bh=6eg2RLRf0ytEyYF1Hp8gdP6HI+Zoav1PHFFOejIjeUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OxNe2ln9wJ0DxxmwBYz4sDuEg4RvWzOYnwTrEKDurDVboTPTvwXAoZLFkLZ4hMNo9
	 UMrxCGLbTsrwo3ypMh1/hnemy9NeEsO5lD95HZzbZMfXowHtnNe7qwLa7IZJ+I+M6+
	 eCWdPWHLUpv0bI3zLXAJtSnTP0VuiSc7dvgIsiDg4iT1YnVoEQOVquBpB5BmAewxWM
	 g0Q26cCVjpQ+poiOy94yFy9uHm5MsUUN8CNaipvz7v9CzH/ot5+kgHhmqLOt/xu8aD
	 M6FdVeILtyngdAyIqs9o3QxcLbUVl8lapuWmu2K/I1ktns17fN+SlXsUa5U2Tbx2FM
	 UVRbExA583vbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC1960D64;
	Thu,  1 Oct 2026 14:22:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8077263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9AB240528
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czRWhjL1xdNz for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8063940098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=G2lFYFcg8ORtC3vUQB5I+KXzmTj5QBXwFhCn+PYOSUXkQ8ZwVR/NY36DbJTF9oKpNx+u
 XQFv2Js8VPYO6BD+zQqJVWTSnkms2nF/XgzAmi6LXolTZOgE4tNBlz1fZVlbVR0JEEe4p
 IRK2tSleEWuTY0rL10GXZ2vEdeV7q+1cWEqCY2Cn+eUazdKYCxuzf8qd5VXaxZfpR40xS
 2lx+AtH65MNx25EiNLESqCrub8mM4lu1sozcPL3TDFOR7oErxPjyzhcnSSMOy/Wl8xuzn
 k0HARNrYRLupSnbUZygrhGd9K0jPp+rzShKF9r65qZteOYOF776LMw3aLTGleUDMqjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HSGB/KRp35bhugFVOycVOgNprzGMErSyz9ca6GKskno=;
 b=Ul7mwMvEDcyu024xhywgEGfLRluYL9gigaebSGCuu0I0+6oeplxu73ucFgajdpHlGaHD
 uazwlbuP4OfOOpE6X3MlSmS/7O+SYKSf1U+9u5ArE9weZLRnNs2cIm8UUNOVGvLy2jWsc
 C41t+uAFl6Q2fzvj6W9UHO8v3qjGCgm9ynaA10a1kvaKzxyonTTMPP1uEBQ0QHTdJUi0I
 0Dl06QNMVBq2F9jB10uQAoyxeUnuthdOk4uMboPLy3eKU3JjxfIpigiQnSA6L3Q3r5Cao
 OrxwjEyURqKAcPlXH7o/XdKxqOj0XXTUxIH26GyH4XgjioRnN0Gv6YRPt2WnNVUvRHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8063940098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C56679843E; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e0dd5372bd55d3bcda425386a32c45ec4083c88e
X-Git-Newrev: 01b162ff939da94cb83f49c548d8f81be73e8957
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.C56679843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mrouted: fix
 invalid daemon path in S41mrouted
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
Content-Type: multipart/mixed; boundary="===============6717557982520789718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6717557982520789718==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01b162ff939da94cb83f49c548d8f81be73e8957
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

S41mrouted hard-coded /sbin/mrouted, but mrouted has always installed
to /usr/sbin/mrouted. This went unnoticed with BR2_ROOTFS_MERGED_USR=y,
but the daemon fails to start without it.

Also drop the script's executable bit to match other sysv init
scripts that do not set it.

Introduced in c25115daf2b2761a2f0f411790c6d24b460c7999
(package/mrouted: add sysv init script).

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d8f408b1f16d067d2e676f3db91e7b337aebe160)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mrouted/S41mrouted | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mrouted/S41mrouted b/package/mrouted/S41mrouted
old mode 100755
new mode 100644
index 7dca258255..d653425719
--- a/package/mrouted/S41mrouted
+++ b/package/mrouted/S41mrouted
@@ -11,7 +11,7 @@ MROUTED_ARGS="-w 30"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $MROUTED_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then

--===============6717557982520789718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6717557982520789718==--
