Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B7C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 06:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EF5B40360;
	Mon,  7 Nov 2022 06:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EF5B40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4NXAgtCaluh; Mon,  7 Nov 2022 06:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 420644023D;
	Mon,  7 Nov 2022 06:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 420644023D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75D4C1BF2C0
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 06:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 511C84023D
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 06:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 511C84023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cATGVIr2gWrY for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 06:38:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5DDD400C4
Received: from serv15.avernis.de (15-133.avernis.de
 [IPv6:2a01:4f8:151:30a2::cafe])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5DDD400C4
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 06:38:46 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 50358BDE3664
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 07:38:43 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 06:38:43 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot <buildroot@buildroot.org>
Message-ID: <a68289a542b9c7e28e8486e4b8b58070@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] RFC: package/boost: build failure
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear all,

package/boost currently fails to build for certain architectures (64bit 
w/ 128bit integer processing), resulting in the following build failure 
[1]:

/home/autobuild/autobuild/instance-4/output-1/host/mips64-buildroot-linux-gnu/sysroot/usr/include/boost/intrusive/hashtable.hpp: 
In static member function 'static std::size_t 
boost::intrusive::prime_list_holder<Dummy>::position(std::size_t, 
std::size_t)':
/home/autobuild/autobuild/instance-4/output-1/host/mips64-buildroot-linux-gnu/sysroot/usr/include/boost/intrusive/hashtable.hpp:222:69: 
error: 'sizes' was not declared in this scope; did you mean 'size'?
   222 |          return fastmod_u32(hash, inv_sizes32[size_index], 
uint32_t(sizes[size_index]));
       |                                                                  
    ^~~~~
       |                                                                  
    size

The development branch of boost/intrusive contains a fix for this 
failure which, unfortunately, is rather longish [2]. Easy extraction of 
the relevant part of the patch is not possible, due to massive changes 
to the whole code.

I can think of three options to deal with this issue:

   (1) Use the commit [2] as is, even if it changes more than the failing 
code
   (2) Create a custom diff for prime_list_holder::position()
   (3) Live with the failure until boost 1.81 is released

Incidence rate of (3) is low; numbers (1) and (2) both deviate from the 
Buildroot preferred approach, so my question would be: how to proceed 
here?

Kind regards,
Andreas

[1] 
http://autobuild.buildroot.net/results/6cb/6cbc0672f3c5046405793d8cdc8f961d2ffb1d3e
[2] 
https://github.com/boostorg/intrusive/commit/825aedad557b7e3bb27614335b6ced16887103de
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
