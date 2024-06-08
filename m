Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93D7C27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B2D404FE;
	Sat,  8 Jun 2024 16:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYXNjSCKwp8y; Sat,  8 Jun 2024 16:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28FEC40237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FEC40237;
	Sat,  8 Jun 2024 16:49:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7515A1BF414
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62FAD81D2D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dneFByCga8t4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:49:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BF55817A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF55817A2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BF55817A2
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:49:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B626C20002;
 Sat,  8 Jun 2024 16:49:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzFl-0026EK-0T;
 Sat, 08 Jun 2024 18:49:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier <brandon.maier@collins.com>
References: <20240528150910.75324-1-brandon.maier@collins.com>
 <87zfs9qe4p.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 18:49:17 +0200
In-Reply-To: <87zfs9qe4p.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 29 May 2024 09:19:18 +0200")
Message-ID: <87bk4bz8fm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] utils/add-custom-hashes: symlink
 linux-headers to linux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Brandon" == Brandon Maier <brandon.maier@collins.com> writes:
 >> Most boards use BR2_KERNEL_HEADERS_AS_KERNEL with their custom kernels.
 >> So when creating their custom hash files, the linux-headers.hash is the
 >> same as linux.hash. In this case we symlink linux-headers to linux to
 >> make maintenance easier. Update the add-custom-hashes tool to explicitly
 >> handle this case.

 > Nice!

 >> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
 >> ---
 >> utils/add-custom-hashes | 8 ++++++++
 >> 1 file changed, 8 insertions(+)

 >> diff --git a/utils/add-custom-hashes b/utils/add-custom-hashes
 >> index 20e48d8ef3..9bea39883a 100755
 >> --- a/utils/add-custom-hashes
 >> +++ b/utils/add-custom-hashes
 >> @@ -97,6 +97,14 @@ for file in $BR_NO_CHECK_HASH_FOR; do
 >> done
 >> done
 
 >> +# Symlink linux-headers to linux

 > .. if identical

 >> +linux_hash="$BR2_GLOBAL_PATCH_DIR/linux/linux.hash"
 >> +linux_headers_hash="$BR2_GLOBAL_PATCH_DIR/linux-headers/linux-headers.hash"
 >> +if [ -e "$linux_hash" ] && [ -e "$linux_headers_hash" ] \
 >> +    && diff -q "$linux_hash" "$linux_headers_hash" >/dev/null; then

 > Rather than using diff -q > /dev/null, it IMHO makes more sense to use
 > cmp -s like we do elsewhere.

 > Committed with that changed, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
