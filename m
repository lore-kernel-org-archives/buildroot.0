Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95912C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FCB60613;
	Sun,  6 Sep 2026 09:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP9NwQEAPiiv; Sun,  6 Sep 2026 09:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 547C260609
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686669;
	b=qoiDEp0MNeH4a8zBfoWP9+GSvxwDvHBugeLimPOQ62LG4sNj62uxoeSnij2zLOILXKuv
	 N6q4U8BoEPGI3C5kB3Uh7jPI/ob2nAM0nI8kWJZXQ5TagAaEjdKDz6JPHvTnhc5Ptb6Nm
	 tKWCFQPj4zUb5QqHCoN92cPnOgFwxlV1q/dc7p7WRRG5WvVocE4rmxBYTk3A+9g5xCVbb
	 ihk0WKjPfV2lK8X/PLmDghwuZHfcdQSdP4aMtEqXxod2zjaJSqDgYTedvzlRIjBS+7zNn
	 XePZd3YcyaSthoFh3oZQdEo5qJZ/LEGtZbK/7HkUCQ0PSxbmLNUiBhZ5U4i8j1JAMpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686669;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oUaQE+yZEgK+8R8De8lxEjywmRUYW3jchRfK3uGB8II=;
	b=PM14e00N/vHwprx+yMyhsNJR1RmgyRiP/GVfFXLAd96qFf7lpXE5w8B3CXi1TO5LLb4D
	 54U813Jg/xPetJ++Ie+sU7Xzww6K3GDLNDDMgchk19Arghe5dH083whSY4YiB5vq8hK4T
	 ZvIabgF/ySH1Omc1oObDr9rkYVbzRGvovF+qVY99gSilGlEKqOogdEBXF4ozbluLrBj0V
	 SIGQ1bZds8bi+V6jfCO1zGlKYjbeXLrGYl4/WtQTrwiAVuD/7VDrGCkkg/CMAdvGOflgU
	 B7XXhK5bvkQENt4TWYUCejG6m2/Q1tYc6P/Q2BXXDy5W0T5R88HULPEK/5hUx/thFYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686669;
	bh=oUaQE+yZEgK+8R8De8lxEjywmRUYW3jchRfK3uGB8II=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WMHpFhH5TeNBxLFwg1VdXrs70PTaboCNcQ55ZDTgvkMhgb354aLoHR1KJXohQaFy8
	 v4BNTqDTVt90CsO+n6wkATVxNb8rl9w2ZfXnNtCRkdiEzjnfnytDo74kzAEfw478hC
	 dLTvutMD680k4TfmPaVaIWkoIbxwaVrFo+4aNzydIxda6arYazJcN/a9cyD9shnjYg
	 PheL6wp7wBrnfhcBaujdIyU7Ll1+dP7vIE+HZixAiVmlA5D5enCHgELtNZahaKNJh9
	 GmFxuYnmDcYaG9UaB/qhY2CfdKHsnfZ1SA/eTdjvLthSMz1psPQYpgKQhBRoXy2mnb
	 oxPqgCfXSimlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547C260609;
	Sun,  6 Sep 2026 09:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 883E0118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79D0B4060E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ws1ImUAlGsGQ for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6B84F4061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686666;
 b=oNNfGUrxAyk3/7s9mlcSHcx69QIBJ+HW7X6kDkmhHX/S9GT3TttZzJW4oW5iSWQcoud1
 SjPWYEQGOJ7K1wpUG5osmPXBqD6la6mLf0A8Z6SWxQZqMSeYD+1qsOaFBrAmqSBJc6w/d
 PftFo430pY0sRhE9OUdp2gxbT4nI5osAYNrXviISHbZqEtXDGqUF7uofkK2E/NAYW2Lp8
 Usb+1e7sixg0L3mL7Sc8udobiZRw9Fh4bFr6AcbJlldCr92YcO5SPShfdbmqgCnmlIFiU
 tT7XrSJ7H2SYMPUaIUMlFOYb/J6Yip0t7EoBmHdSozbxlvlgUNxMI7iZY/SGDZppWSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686666;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=V7ASiIBeD0aszPLfRDh17H3314S2mJlMvibRiM3ZX5E=;
 b=e4rMN1CCtahg+PEvY0m6w6dLUY1wzMaoKgMO5kL2ju0S1bAPYymtYpheDQHZvEAabw7h
 FxjoaxB38EO9k5WibiALHGoJymUfVPKhbIYdFbCNUaY2VVaYHVvIYwLj84fwKXb6dvZS+
 koUA52dAbU+BzVQqmDzQ6S+PjN0GXHvuGOqW59xYLNGeiFt4H3QKptDWus15TAUEnHLwQ
 zZ5TB9/KL3UCZOF+EbmK49nF0/WBndpg4nvIgoQ/m9ixwBmy2Tc5LGmK+m48meq0MGFZH
 IHk/cq/76V7/U8118nI3SNVvG5WTqxd0GhVALxCpd6scUOYMCnFjF4dWKtACGAHfY9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B84F4061F
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D909952C6; Sun,  6 Sep 2026 09:23:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 11:23:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a242e9e7ae40d8f3ecf27b76e0cee69eef78c36
X-Git-Newrev: d2b7199dea314353b7cdf417ba8625d7c201ece7
X-Patchwork-Hint: ignore
Message-Id: <20260906092325.0D909952C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5knx: fix license hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2b7199dea314353b7cdf417ba8625d7c201ece7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot 262a7f6d2f406ed21b2379bb3c4a6c8f6fa0edd7 added the package but
forgot to provide the hash for LICENSE.GPL3-EXCEPT, instead a hash for
a non-existing file was added to qt5knx.hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt5/qt5knx/qt5knx.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 750e4770c0..2600a739bc 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -3,4 +3,4 @@ sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
