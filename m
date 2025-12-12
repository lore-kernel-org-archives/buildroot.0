Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AE6D4337F
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC5F3811C8;
	Fri, 12 Dec 2025 08:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSXfHy7O1rRM; Fri, 12 Dec 2025 08:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8938680F7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526676;
	bh=+c+YsWEjlWzwSiHuQRbR4cNvj9d+8MSg1ckTCVvT/Xs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fNIaYIc7EjOLnbgnl8bFZTaRQGB+FiWvTem+jggzTfMf0PwdTxnDfXdvik1XV7aBq
	 YSnyskv+LV/UC2c5A5FuegFPbGb4R9Fm+fkSYqDgKtrGaVVPkwsFJjkDgvHuEd6F6f
	 AzLFFEw/+MPvkF++5lztIr0Yg87zUlZ4Iqfik85xqvn+LdXrCUqc6+UDpiPq+YYtn7
	 Btw+Kp6UTH1lYSYUt2Dp1nh2KKQnv69vQYKeFZ2VIJkXICp7kxRI+AlCBu31Ra2ULr
	 EoipsXjrL4kso1CnQTzSIp7ddbrxFGCSqBKEsMw3Wx7rRv7DZNhpObOK/gA98qkXkh
	 TuQaXe0ZufocQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8938680F7E;
	Fri, 12 Dec 2025 08:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B8F2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED7F80F37
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPWFt6dn5RwF for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 08:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC7A80F11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAC7A80F11
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:04:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6B0C86C83; Fri, 12 Dec 2025 08:04:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 09:01:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 148cd0c3c1901f4c071cd5b30e40b22162986c97
X-Git-Newrev: f59bf34164de2bd3573f758844282a85ffb3cf3c
X-Patchwork-Hint: ignore
Message-Id: <20251212080434.A6B0C86C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies: improve error message
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f59bf34164de2bd3573f758844282a85ffb3cf3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"Fix you PATH" not only has a typo, but isn't very clear. Turn it into
"Fix your PATH environment variable".

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/151
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 2843e3c5d5..9c2aeaf23f 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -41,7 +41,7 @@ case ":${PATH:-unset}:" in
 (*" "*|*"${TAB}"*|*"${NL}"*)
 	printf "\n"
 	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
-	printf "This doesn't work. Fix you PATH.\n"
+	printf "This doesn't work. Fix your PATH environment variable.\n"
 	exit 1
 	;;
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
