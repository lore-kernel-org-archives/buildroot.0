Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDCCC2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 17:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EA8081A30;
	Tue, 25 Jun 2024 17:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpCnSzcUWssn; Tue, 25 Jun 2024 17:41:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D0681ABB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D0681ABB;
	Tue, 25 Jun 2024 17:41:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D94961BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6A5A610A7
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qrR3oYxr6G9 for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 17:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 866B66109A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 866B66109A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 866B66109A
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 17:41:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B798013F8B9;
 Tue, 25 Jun 2024 19:41:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 19:41:03 +0200
Date: Tue, 25 Jun 2024 19:41:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <ZnsBL-WV01aq_E5s@landeda>
References: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719337266;
 bh=VTAvyvZ3KhUXGCICb/+bQpqk++C7oxk/LX+AsSaXEA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E1bUa4XzFTPC8fdkOrK0EO3XtPq8QOeYD84iVpj7BN1UvP8OfMQgAAvavJaXizpA8
 3jMg5TCtAnNINd3bS+CzvXhB3PTNwSXhZGJwXiP0a4V74qrfSwO55y1LmzTPlWt0O/
 JLmcjz2LoKCACOunTSCV7Y3uvkbTzUfhElgkmmmGu9DRtJlP32NoiDL9j+RRVEkN7L
 diin7vrJQVCoBQuxZ7wvv/24nIOccJGvID9dRhqE0Hb+oGNgKG1dMSbo5JFCS6JkVy
 jj1runijtp4z/2fPMJBRZtGjRetNCshJqrgvEt6BMSUCT8vW6Lmgk3/z6gIsp72ue9
 +DR7Z69v2enbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E1bUa4Xz
Subject: Re: [Buildroot] [PATCH] package/slang: fix patch fuzz
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 2024-06-25 13:46 +0200, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
> maximum fuzz factor to 0), we no longer accept fuzz in patches. Before
> 8f88a644ed7d was applied, alot of patches were fixed in preparatory
> commits, but slang was missed (although the patch has been present since
> 2017.
> 
> Fix the fuzz:
>   - leading TABs in Makefile commands
>   - fix context
> 
> Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/slang/0001-slsh-libs.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/slang/0001-slsh-libs.patch b/package/slang/0001-slsh-libs.patch
> index fad16d1b2f..100399e818 100644
> --- a/package/slang/0001-slsh-libs.patch
> +++ b/package/slang/0001-slsh-libs.patch
> @@ -12,10 +12,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  +++ b/slsh/Makefile.in
>  @@ -92,7 +92,7 @@
>   $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
> -    $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
> + 	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
>   $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
>  -	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
>  +	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
>   $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile
> -    cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
> + 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
>   $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h Makefile
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
