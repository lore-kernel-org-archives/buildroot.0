Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA41C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8FC980ED3;
	Sat, 12 Sep 2026 07:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D13Ap_GqGo2S; Sat, 12 Sep 2026 07:40:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D77DA80ECC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198835;
	b=m3uc+OdnBe6F2b6dXOs/omKCnLCmyHNg2IAk/W8OAmlE9eNH6n3Wvf9oEz+hFULFGevB
	 yDeXdoBcWe7QLJvqwKyHS0fem8c7yAXPS/yOuSeAtKC1nS12cqi1lzAwjwKQ/7OTGx4DT
	 1zOkGnGvJyXMKgk45KpQFlhmHX0cJpd9ofCTPBxPkYL8Qs2mfbC0cHsX4Q0ijk6PKJF9A
	 xDoc7DCePe68VLYO6+LVYlwNbHvmVvHDe2OTl4T5/JehjwCHyIQnAiLlvaFNsC0MHov3P
	 lmX5osBV9K5wqnQoK2Bn66XqraR2/na6m5wSuKQaObqEAEhY5fsNh7H17PheEbLJeTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198835;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=8nZK8ID9QKtlssg6pze7j/T88So09JrJfcN5SpKp6mY=;
	b=OJ7sP1l3V/tgCUdsQljiXY/v4NniBbXz1cRB7h1jOUhd6Zz5L6mw5LYN/S9HCMsn3Y/H
	 YXVro8PaAiL1lAz7whWqu0mc+P19Pc0mvuuDvuICv6pnmKEyyMy8LOnAEOe0P2Qk+cDlD
	 cfVPmpKOoypUm37pdBnN8sJSHe6G3m+L0Ax00g+C3FN1s6RAkZhckw2qF2S5Nbs1yjepe
	 tVXMIO9YUGBHIrvSjp5bnU1w6MNYOMAExHwLLV+wDjFvULluEx4Nad9iN0Gb7s3wUK8v+
	 z7F2y1C8/Oi8M+hwrKhq8uR69ZOkROE587dM3CEhAmar9VINPL0r8nFKUu+3yJX68zw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198834;
	bh=8nZK8ID9QKtlssg6pze7j/T88So09JrJfcN5SpKp6mY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FiXAkG9Q8rlYPb44M7MHVJwpp4r0ZrTvT75+nYfr1uwhLejqSyik8eqiUKJxiTOqE
	 g+M6TiMgrGabaFlk0jZ9RtkMZ4TYvrWf39VqCqD/P6v4SqFrtxa6i/cYhzxmxbph5I
	 jw+PyOyrqGXA5Gjuw/rE1ZOw4hoOo/PrEO17ESO7hOAJnEH5pDWtr3TcN5a+VUmEGF
	 jGlDmTpsEN3Fy+BZEu1uw14+WhV9PRZU57iDa4Lrn2OALjKyeNk/EPvYHslsiJUTpk
	 +LZknbK9U95B6cl4a1T2lNfbtSxVnubDRXs436WXPmAEpe6to8AacnVgJOmCKRs9Wv
	 o/A3TBWodC9kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77DA80ECC;
	Sat, 12 Sep 2026 07:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 023337AB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC52F60617
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_8gfWv39L4I for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32B0D60601
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198830;
 b=JMBWxu3hK15+epdWuXkTEbrOVhWJaT9/oEp/rUGaQdiehLC4rpED9DxRgioGmKCINgU1
 szsGWG7Kj4UV0u1xGlnQChW57l3DIL+/WWBGXgZwNbAlYHrpiB6xBAM2DXvf+WeBjdhZa
 oGYC1ulsAp9uMEXPYcO/WQW85i79Lt5yKJOUW38s0yJHopvESDAuakB34oqEHtGdVbKwH
 sqBI/Rj18hf7q+VplEMjUPmIj/Ot8Ud68RUHFlHBzWl/C4JY5YMEozRhmqwNgshD/QXBb
 RuLS5WYnGt+B0t3uYoCGksu+FYn323onxzve6U0eOVh3cfz2bhRbwwd6BB7lkR9MLVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198830;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bKhwYy8e/XQMnPy/yXMU6pY3opL/b/9RlX72G5peHxQ=;
 b=Y/uJmNzJp3ZBWXL+nFOhXuc40PqXIDBjyasP7frK8dDyyVuPOaT1qHTitYgl2SnvvJBM
 yB5nW2bb/sPthkLrp9Ibs6I1c1g0BW0nKyKbuO7qpNkJSjJl+L9aFqYLbI06knJxz30Ct
 FUKVwSgNfQ7LYq8gAD/o6HdPM/Li4w8gdO6ok/lwSsHr3jVp2stA/MXTDG2f0MLNPRwDG
 B6xq/7tWoUbXQK0/60dFGRqtGoqfN/hq7iXZ6XH8Q7QZgpV1i/1YwTvm9wFnNx6UasDXo
 OC1KPR9H2RY9Zwed8IgGZafOdh32eHHwpQri9SGe0mBW+PZ00eJZeWizVqLY86nuYfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32B0D60601
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C85DE8C981; Sat, 12 Sep 2026 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 09:37:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcb0643274b69c7ec1875bc19b05157d4aa4f127
X-Git-Newrev: 5c9fbf7efe606d9c34533871d925fc0d16364e7a
X-Patchwork-Hint: ignore
Message-Id: <20260912073925.C85DE8C981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: renumber patches
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c9fbf7efe606d9c34533871d925fc0d16364e7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 99bfbef093f41f20dff305dea83c7763c8b34a1b removed patch
0002 but forgot to renumber the remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ch => 0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} | 0
 ...ch => 0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
similarity index 100%
rename from package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
rename to package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
similarity index 100%
rename from package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
rename to package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
