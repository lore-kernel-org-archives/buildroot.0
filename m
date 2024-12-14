Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD7E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 10:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C0F56069A;
	Sat, 14 Dec 2024 10:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FR5Ayc4DWE9V; Sat, 14 Dec 2024 10:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B0860715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23B0860715;
	Sat, 14 Dec 2024 10:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2EC6CD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 10:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4560606DF
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsIyQQl49J_1 for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 10:52:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 451786069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451786069A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 451786069A
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 10:52:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70DA51C0002;
 Sat, 14 Dec 2024 10:52:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tMPkf-00BRQD-2E;
 Sat, 14 Dec 2024 11:52:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
References: <20241105202039.2556992-1-ju.o@free.fr>
Date: Sat, 14 Dec 2024 11:52:01 +0100
In-Reply-To: <20241105202039.2556992-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 5 Nov 2024 21:20:39 +0100")
Message-ID: <87r06atu3y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py: add
 qemu version in run log
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > In some specific situations, there is subtle bugs which depends on a
 > specific Qemu emulator version and the code it runs.

 > For example, EDK2 on Aarch64 could work with specific versions of Qemu,
 > EDK2 and ATF. See commit cc0823c2d "boot/edk2: bump to version
 > edk2-stable202405" [1].

 > Also, some Qemu bugs made the guest OS crash. See for example commit
 > 9534b9c00 "package/qemu: fix qemu 9.x issue for AArch32 Secure
 > PL1&0" [2].

 > Commit 0d4177598 "support/testing/infra/emulator.py: add build host
 > dir to qemu search path" added the ability for a runtime test to
 > select host-qemu in order to use it. It is also possible for a user
 > to use the "utils/run-tests" script on its host system providing its
 > own version of Qemu. The Buildroot CI can also use its Qemu version
 > included in the reference Docker image.

 > This means the Qemu emulator for running a runtime test can be from
 > several sources:
 > - Buildroot Docker reference image,
 > - Buildroot host-qemu package version,
 > - Developer host OS qemu version.

 > Those versions can also change in time.

 > In order to help debugging of those subtle emulator bugs, this commit
 > adds a recording of the actual Qemu version used to run a test.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/cc0823c2d14321b91b94801834050331f5ea28e1
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/9534b9c00c23cfd69a4e122c26fca9d3da93d329
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
