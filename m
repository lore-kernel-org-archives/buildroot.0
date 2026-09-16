Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37565C88E5C
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3F64040C;
	Wed, 16 Sep 2026 12:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2nEuE1L4DEe; Wed, 16 Sep 2026 12:52:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F27434043F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789563175;
	b=XdtHVMDT/2045QywB22RPa5ZRAyOypNxqlwKGa6F9i/gwrcu+lc8HLifKm4Ci8iAlA8M
	 wACPbSwBFDzazukyYG1Mo64qsxUF5LfUdLI3zt7CwW2uZFzDQLI3Q984uyeOKyWk4i02J
	 +GXzaj9GZtUEAL5HkqbNDy6H7xvaEuPZ/DNhMMZwpj3BxnEByS2iS3w/9bWJocHD0X+Sy
	 TGgY/5J5aXSjZa6MW5G3ZyEUDZGvqgLF+LqRQ3DWIlmc0UQzMgMkdev6uxICFmCKPyJjv
	 mnkzQbiFfUvmzyLJKoVsMJAM4Gu11Jh4q8aTizFrsM7qcLdYy3qbSu2pkZECRf+bJeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789563175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WtD9o7YPAWf7jvXJ9hsBZrJqjGhY0161Bd8MqqPID8c=;
	b=hB/IhShEwQS7K8eI8/sdfyEKB66BMhv1/zYR651zgv6VjB+qOzfJbY2U23SJpRZiE6Or
	 FZVHSCxjLeedKhNREMj69kmQ+nL3w/7iEr3fheuphkDGwqrSb1G0P+KfY/MFaD+CUJeXK
	 3hq8BWyW0I3ggl7ZOy+Ki2eMV4g47nxXi/J2TopamIpCtc7vL3QGqhECwNRG4ddF0fcLU
	 WmyaiaW6wF2oTQ6o+T0TXJlrpuIR1byOvs9ihj3P2QXdPtqggA6/pQPwLu3ITrRnRQ/x5
	 5mxWy6Xa4C9rUpqQCwkkUTV2UhfsfzJuWPPPuEjGgo+PVqxqcUMYBBJ33bw1HYw6eug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789563175;
	bh=WtD9o7YPAWf7jvXJ9hsBZrJqjGhY0161Bd8MqqPID8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kz1v4z3l/mo3lBx1HqkJ2b67PEwIo7lrzUV4OxCYRz1lNTAgXpx8epD9CbXTGwUkv
	 KyZosBKDg7ti81OkstmxIKkD3lbnCMi2r5b3JKW0ylOnjZaSO8VphzP7lAhJcpTiQH
	 g92pAzpcN/KaJNH1QOvzm/tbM0xXcjuUpwkjoDtDekx8dakYS91eTZEuGWwrlJXVms
	 RdwYRdgqozttWT78AFDlUF6+qd8yOc3EAERD+G0hpViMP91xoi9Ar6m8rMRKIUwIEV
	 oiimKKGiudAltoIRXa3cffHArS0IspGpffRBNHd1sD0c4IyHEx3qXemxYdrLWJcxSP
	 RwE+5h1LgGWkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F27434043F;
	Wed, 16 Sep 2026 12:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D8E24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B69C34043F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSIwP7YUz5_q for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:52:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6EF414040C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789563172;
 b=VGZuGjQoJsTKFGzjtO7LcFuQiGJoXbtXBPjms+EWcMkrTSBl30sfud6jfjOCqBYCah3V
 FHWJ7knZHOiOTTeF35dWDGk8wkYV8PiDsQu8aP6YvokA21dSnNCLLPfUouxXSUOQ5qjVS
 n0ZDUqCtQYF5FlTg08ezQVky3yPpYuh8fsQeIJoPfZ+z8T386AAXND5QLHWPYO+Gi6WbT
 Wi4b3SyoDTU5fQl1RCHEtb1NvAhTxmivktsey060wRp/vXJDiS3WXVpxItN/zLz/n2hTi
 SZbjG6UV7pV6zQZ+cSO/3dDEceST+WRw0EkBuHYq7mWN+rgeFoodO2sM+ReHcY3XrSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789563172;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Ebktul0JKZSo2miiEjK+itdu07avkpkOKagXsrft+eA=;
 b=tTsEW4Vujol1VVl/ZSEZ+bJek4h+UC/WC+O4zT+kVDaA/blR32F8n2Krulj0KptG/+GO
 q/kWTmLuW/U2fEbCXE+utU3DXG1BYIUrTQoGZcUUwpMjQ9+1SgxZc9EQInhgE6TfAJ/gQ
 TJsqMr1OBExZa5elTx2AMF6AYDVnS3rbHsjnQtRkJsaAB5/hjNHfwBWvCX1A6BqAXx7aK
 EGmt6SRRu5NtbInY+0GdBTIJ+6nQcqbUffla0KPSMJamYgKLNt5cEYBrl5qwgl0iCPDDc
 l+7+xDY+pr33FYG2NdJ4FAuu+H+oYj2ObZQwWzTSXNS5BgPSlaQKr4l7OIrTSLe4NKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mApTmHjr; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EF414040C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY6Cb-1xJIPK3uFJ-00R9v9; Wed, 16
 Sep 2026 14:52:48 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 14:52:31 +0200
Message-ID: <20260916125236.2759304-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:PBhmls3T7nirbObIDHSYc+G0MG35OJPhgeXTDjcKsWDYZqxftQq
 q9Ya4Sz9zKezyQufiHfLmzNyZ2KLTgGp4lx+hCEeDwZ48JotGqxrtZVWU9Gb1aP5DtJ9cCg
 VUvh7W5k8kj+Vmym5QLpHvMsQQ3pULjLrIZxsseIrPZfIlbNB8F49blbxaLZAZcJBsfSffE
 sW+D6iZIQzl/fIToWQzOg==
UI-OutboundReport: notjunk:1;M01:P0:hPKqzZhk4tE=;wKDlPc6SZX7FSGjGtWFedEoBGUM
 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
Subject: [Buildroot] [PATCH 0/5] Fix missing "select
 BR2_PACKAGE_HOST_UTIL_LINUX"
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>, Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While working on host-systemd to enable building systemd-measure [1],
I noticed a bunch of other host packages also depend on
host-util-linux without selecting it. The fix for host-systemd is part
of the systemd-measure series (but could be applied before the other
2 patches), this series fixes those other packages (as long as they have
a Config.in.host file).

Best regards,
Fiona

[1] https://patchwork.buildroot.org/project/buildroot/list/?series=717

Fiona Klute (othermo GmbH) (5):
  package/btrfs-progs: select BR2_PACKAGE_HOST_UTIL_LINUX for host
    package
  package/lttng-babeltrace: select BR2_PACKAGE_HOST_UTIL_LINUX for host
    package
  package/mtd: select BR2_PACKAGE_HOST_UTIL_LINUX for host package
  package/parted: select BR2_PACKAGE_HOST_UTIL_LINUX for host package
  package/xfsprogs: select BR2_PACKAGE_HOST_UTIL_LINUX for host package

 package/btrfs-progs/Config.in.host      | 1 +
 package/lttng-babeltrace/Config.in.host | 1 +
 package/mtd/Config.in.host              | 1 +
 package/parted/Config.in.host           | 1 +
 package/xfsprogs/Config.in.host         | 1 +
 5 files changed, 5 insertions(+)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
