Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64213D743D2
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 20:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C3D60AA0;
	Wed, 20 Nov 2024 20:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8R4nFCrH1pN; Wed, 20 Nov 2024 20:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 784A860AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784A860AC0;
	Wed, 20 Nov 2024 20:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3234970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3B6E4031D
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id api3aXLzfauu for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 20:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BE4240303
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE4240303
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BE4240303
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:46:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B320E0003;
 Wed, 20 Nov 2024 20:46:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDrb0-001CJq-1Y;
 Wed, 20 Nov 2024 21:46:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20240904114903.4020-1-tianyuanhao3@163.com>
 <20241029225211.2e908cfe@windsurf>
Date: Wed, 20 Nov 2024 21:46:42 +0100
In-Reply-To: <20241029225211.2e908cfe@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 29 Oct 2024 22:52:11 +0100")
Message-ID: <8734jlvdjh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ntp: add a patch to fix crashes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed,  4 Sep 2024 04:49:03 -0700
 > TIAN Yuanhao <tianyuanhao3@163.com> wrote:

 >> This patch fixes a regression [1] introduced in ntpd 4.2.8p18 [2].
 >> 
 >> ntpd[200]: Listen normally on 3 lo [::1]:123
 >> ntpd[200]: bind(20) AF_INET6 [fe80::bf3d:254d:dee0:d345%3]:123 flags 0x811 failed: Cannot assign requested address
 >> ntpd[200]: unable to create socket on enp0s3 (4) for [fe80::bf3d:254d:dee0:d345%3]:123
 >> ntpd[192]: daemon control: got EOF
 >> ntpd[192]: daemon child died with signal 11
 >> systemd[1]: ntpd.service: Control process exited, code=exited, status=70/SOFTWARE
 >> systemd[1]: ntpd.service: Failed with result 'exit-code'.
 >> systemd[1]: Failed to start Network Time Service.
 >> 
 >> If the IPv6 link-local interface was not ready for binding on the first
 >> attempt, ntpd would segfault in update_interfaces(). The segfault would
 >> only occur when ntpd was started as part of the boot sequence. Most
 >> - but not all - boots were affected. Evidently it could happen that the
 >> timing of ntpd's start up was delayed enough that the IPv6 link-local
 >> interface was ready for the bind() call when it was first issued by
 >> open_socket() via create_interface().
 >> 
 >> [1]: https://bugs.ntp.org/show_bug.cgi?id=3928
 >> [2]: https://bugs.ntp.org/show_bug.cgi?id=3913
 >> 
 >> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
 >> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> ...-Fix-crash-when-binding-IPv6-address.patch | 33 +++++++++++++++++++
 >> 1 file changed, 33 insertions(+)
 >> create mode 100644 package/ntp/0003-Fix-crash-when-binding-IPv6-address.patch

 > Applied to master after adding more details in the patch commit
 > message, especially an Upstream: tag. Thanks!

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
