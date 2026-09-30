Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400DBCA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DBA60DE4;
	Thu,  1 Oct 2026 14:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDczVobdq5kJ; Thu,  1 Oct 2026 14:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2BA3C60D89
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864609;
	b=en7mMj6vIcciR4UM4jWFDJgyjFX7S8iA+oSvT823tCikmZ+bw/DUQow9wT4MnpdUMjcO
	 sbrjwCCOfy2sN4Aq1eGFdDWW/IIlrFihRYiiFuC9kwSkvb80/1NoxUNd6k+kLuGU5fc7h
	 WnXg6y+i5i2+oFSCpuceYKLShi//oCzl3b0GwUvgHY8bsi3aqShdHVXGj2Q7kfCre/3S3
	 i9Pntsvzsz3XsDKrAc5xBKRIqVP1Tc3n00YC07WbSQ0ffxzSA11kFKCAN3O7elaaacNOE
	 PYPsNnXb6w18vnZkiPMWv0FR2LJe817H/YL6A4ffQHtkcPexSq7x54sP1Ycaioy5pSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864609;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ogxkxgYOtg2CrGV6W09Lttm4O8YElzvyUGIxPBm8h7E=;
	b=X2UpnWTdDD/ftlYD+ptxSouIcX0GzJAC3djHdl5gUJST//hi/PCiX7btV884QCTD/kY6
	 dymgRPXpa8IkNoUkORE4HP+508ujQd59TJ4X4ElmhLThFcXhACB+AZ9RoXzeKQmO+MQrA
	 YmX1VKIzZs1Pn9OCi6f/EkXWwyCqVnqhwsyJlqJgh+bQ3q0JvtyheE7mo7515CNXbbpr/
	 uokbGEUhI16goQUTkSOtLX1GGWQYBjZ6oIG/mGPZaFtRqfMt1VBvQtkJWMpFQz160jpqY
	 p4H1AkyZ6U4ZZFjQiayNo9CF20borgFLdazsTCV61JxkKv5P/FViYBPu8tPE+AHlUaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864609;
	bh=ogxkxgYOtg2CrGV6W09Lttm4O8YElzvyUGIxPBm8h7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h2xHd4knHS+go11uSO118z/wcN3LQbvOlYZZ6QIueBY9Hsox9TbIBcuzOH+CoNjjG
	 pVLLAucFlM/XSZpJi3mCXD/7UMJjtfITxH1xRYDsVQ+U0UX/Mci66AsOiInSDXYj6B
	 TAcFc+Y5rYFfXr1GBQvdSR8PN6l8RVNqoUdl+SMzG1CH1PshfgDV3bxMfQr7LAPO6x
	 S7mQ49u/s+omIDU5aup4mD5moplmmLAr3YtlNvytLZKIhaW+OxWzw96Hgq7/u9t4Q2
	 GdTWfMY0w4c59bE99zAgRCpxITMKWHhNnMYygL6l3Q5248jpY/yUMNXOHdOLr3DU7J
	 0zcQ13ykWYeYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA3C60D89;
	Thu,  1 Oct 2026 14:23:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEAAD1FE8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB16760863
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 254cyrIgLZch for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F353D606CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=DA1m4dYbjQCzo+RVsvOYGTIMO4E4/MHiH5W7V72ryAr7R1U2jnwIIq87/Hc6T2DhtO72
 /K5S7vK02yEHJD5Jlt7Pv7Tt1yJPN+PbzNxZU6NtaUodKI4wVJJWVI4gKfkjpfl1ZJ8RY
 tDu6Qj6lxSVmUixv03uHk8qMjckB9JGcR9QcK0mMSLoCtETEerzezKvLtHYBlPE9+J13W
 /nP5SK1DUu/7EEeZ2FZPpO/h3ZQvzeWlAf77MRzhE9LaJt8siPHrl3VAtsbd8ZUVdLL/c
 INkEHahSpgZSZZEAeCl+azAno6nOgQg6mhe9xp2xJ5A0v8vVVUYpexD0st+VD90EE9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8KC/oC28nVJiH+5ri9yEp09iyWYeLYeEsYRBCarNKwU=;
 b=UfUvEP9xu7oVipQq/Iu64jDoEiEL7viNWpknbRmvzeKd0w4DBdRrm+cXpYu5uJZRRhzP
 iahDqhfqaZdePzN07xF9bcb5mntZ4GXhrqyX1HTzXKZI8MCDGKPKDgieHqJzoT8HjEORx
 oMiUQQY1FIuagZzEjy/3XnUIPWvaEaMKkRnByfyLeFrHV7EVfDxrXXQiNdf77lx2q5dQY
 3gpV+Jl3zgJdY5uvcGnMES0IeZRMYKwpBnWt2D35sBav5claYrJx3T/GhcjE6yxa78FGY
 RFKkAvL5fhNbgaCQfgxDFHYnAFQvgXHEq7xzX/jamoXwzKkFDeeVzuBjj+EJ3EnfvXg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F353D606CA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B2B59843E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:39 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6a4a0b32f09d3df1c9085027f3ed9ab81d33024d
X-Git-Newrev: a080b40e2fef723ae84fa602ffa7cdd2499d966a
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.3B2B59843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mrouted: fix
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
Content-Type: multipart/mixed; boundary="===============3836688354466499485=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3836688354466499485==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a080b40e2fef723ae84fa602ffa7cdd2499d966a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============3836688354466499485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3836688354466499485==--
