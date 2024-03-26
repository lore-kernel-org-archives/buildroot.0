Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2BBC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 15:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E2B4059B;
	Tue, 26 Mar 2024 15:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYMnNbf6AvBR; Tue, 26 Mar 2024 15:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C7F40600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C7F40600;
	Tue, 26 Mar 2024 15:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 529041BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 15:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4063360AEA
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 15:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ft7KZeeEvn_E for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 15:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BA1860AE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA1860AE8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BA1860AE8
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 15:01:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1C8820014;
 Tue, 26 Mar 2024 15:01:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rp8J2-009EoZ-3C;
 Tue, 26 Mar 2024 16:01:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, arnout@mind.be
References: <20240322174941.475669-1-fontaine.fabrice@gmail.com>
 <87sf0eg2xp.fsf@48ers.dk>
Date: Tue, 26 Mar 2024 16:01:40 +0100
In-Reply-To: <87sf0eg2xp.fsf@48ers.dk> (Peter Korsgaard's message of "Mon, 25
 Mar 2024 08:56:18 +0100")
Message-ID: <87frwd9gvf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: disable tests
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Disable tests to avoid the following build failure with amdgpu and gcc 5
 >> if cunit is built before libdrm:

 >> In file included from ../tests/amdgpu/shader_test_util.c:10:0:
 >> ../tests/amdgpu/shader_code.h:113:2: error: initializer element is not constant
 >> ps_##_ps##_shader_patchinfo_code_size_gfx##_n, \
 >> ^

 >> tests can be disabled since
 >> https://gitlab.freedesktop.org/mesa/drm/-/commit/46d1e99a5d291b22d86ac52710b079491beedff8

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/612aad1fa642993da36bbec6c16c9020ac283e34

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

Hmm, I think I was too fast here. The libdrm tests also include the
handy utilities like modetest and modeprint, so it is not great to
unconditionally disable them.

Maybe we should add a suboption for it? It is too late for 2024.02.1,
but I will revert the change for 2023.02.x and 2023.11.x so I can get
those released (and EOL'ed).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
