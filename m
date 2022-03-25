Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2D5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 19:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0A88415D;
	Fri, 25 Mar 2022 19:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2M2posFMTGO; Fri, 25 Mar 2022 19:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D9658415A;
	Fri, 25 Mar 2022 19:09:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D87B91BF310
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 19:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B82F54049E
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 19:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ph9zsBNlURDl for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 19:09:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7132140022
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648235376;
 bh=a5KlrCqRnuiKZInpYNagb5FLhjuDtod5rcMtC+2I2aY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Z0czXLyKjX0SREJilqqWwTZLr9XJ46QSRAfYo/631aZYzVFTJ+Dkc5k8ra6MA+CGC
 Vp0sXQLz3K66cv8wRniiYsbJ4t30AgKw/qf0RLx3IVUjVla9Zy8C4KQNXuKa+hJEth
 zNNYRV51UTCLH6qy+gsKW/Wspu3jNRBCMqLnj73M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.179]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N49hB-1oGL331AFV-01023w; Fri, 25 Mar 2022 20:09:36 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 20:09:34 +0100
Message-Id: <20220325190934.24982-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:6XiqcrLJNK4lB+HSsICnLSfrqEKH23DNg3i7SfrzmnBA4xVb+rn
 OIF2J76vWZUK4UStSEfCcnfggk4EsyC93x1IL1jPMe4JZpIBbnlI0BxPAoaF7KS5sxUfuJK
 D/EzY2pWAYQRDB6fXQ8xwkWbRnUjI6fHbfoXToC3motCOz0TZGEx3yA3RtdQCpwfCs3JgTy
 P3r3/oaHvpaH3cNTr8puw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MYlbIXsDESk=:b5Q+a9dfYsXK1/EqX53OEH
 hOd1T3ldffRt8NmHr6dz7guEsNo9xVqrROC5GwAaosGcoa79D/ASgUgrL3ywU/JhL4xLZ7XdD
 ZxsK/mQa3EUOOrUFN32Rr5tFBYZh09IPqOsuXwgcpv9W4auDbL4QPT0FmzF9gJgJKsIWVl03G
 RLwbFiPxTQrUIFqdnvTnNlBGDPQ4NtOxSEP0ivSk0FGX81u6iet059bTtgRe7ukpg8UQD+z7h
 5RnvuG3ZGhWUjA26JFd9BsmRuQefjEmFeQZqssY0VdA+NICnGl7B/wpSrCiut5q+KScbNRCeG
 ae6y5HE5JnEE03QeykYr4ixJlOFVVhscGKVWZMlcTDu0hvg/wjvT+oRt1cPx9UZEze5RHY51V
 liQ1uDYnd0vC2JzcCxNO//WlGpiXSgVWb/NL1H0nshpvUXuVL4kA16gIxZcJfRiKloBK5NGnj
 qH6VIciIDoqBLuUl5HdMaYgMeDuakTc/6wcI4fgxJOlizW+oT2MbXzaNdNbW8sZ2OXT1yZJof
 in3lauDGhUBAcqYYNgkM52QlY5PnckLkvhonp7OA7+RQCKFfI3VWNrcncE4mx/n8SKwzs4/wc
 56HOr10r+IalKahbF0jqBs8vFNJ6GYtXJT8zrjYS3vGTZpH9ie7OknG7VueaT2kYHMOxbIxIo
 MtjxycNlCFvRcu4KPn4zYGtI/xbBPJnwIly9nh+Vk4gcKYf8f6v0O8uoZcR7jyJLu2ahuecOd
 rKx8OctaxjXwgBcRfl41CEuPJaouTsNMcGZkLTiq/FfReKM0K90A2Rspq+QeejIO+JjiTdnNU
 awm3llAvq3uKWnBr0+4ONaw1O9HomlYV3E21li/K+gI92wlqLK5bCLkPEtY8m0s9EVt8qptWq
 FIsDU/WM7c+9/ga4t06OJyLAGwDDmaDr7TAKv8fikeYeAgdr1Jral1YTDoK5ied0aoC6Bu5kV
 zmASdS+TYwAUovBOdZZpVckND+fWx53Z3fgFJ4noPgjICC0UtFZS8VMYXgYHdVlw9cjWO9of2
 NPn/81FXtVY94uvhFw/X3gBrXLgO0gZI6vIHszCX218nGh1f/gPa9LFvYbffvn6OZKgZdYHdt
 etSdHb+djTn/BA=
Subject: [Buildroot] [PATCH v1] package/wireshark: fix compile with ccache
 enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dan Ambrosio <dambrosio@outrider.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- use HOSTCC_NOCCACHE (instead of HOSTCC) for LEMON_C_COMPILER

Fixes:
  [...] /usr/bin/cmake [...] -DLEMON_C_COMPILER=.../host/bin/ccache /usr/bin/gcc [...]
  [...]
  [  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
  .../host/bin/ccache: invalid option -- 'D'

Reported-by: Dan Ambrosio <dambrosio@outrider.ai>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a5ca4b1f73..1a549f7037 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
 	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF \
-	-DLEMON_C_COMPILER=$(HOSTCC)
+	-DLEMON_C_COMPILER=$(HOSTCC_NOCCACHE)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
