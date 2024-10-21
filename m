Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B57ED15DB6
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 15:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6994560729;
	Mon, 21 Oct 2024 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0OV-ZriyDE1; Mon, 21 Oct 2024 15:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B62606DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B62606DC;
	Mon, 21 Oct 2024 15:59:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9F9071F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 15:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A44FD4024F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 15:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVWCHRD3lxYJ for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 15:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.52;
 helo=sender4-of-o52.zoho.com; envelope-from=aaron@bubbl-tek.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 965644024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 965644024E
Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com
 [136.143.188.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 965644024E
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 15:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729526356; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=efeKWL54AH+jTz529s32LCh9/BDa71VYw31DJ6lVn3U26x/hWFKLT5z4YcTDrqDUDL5EODH31sEkrB22t8AWd8YvUCNbSyFSnYRZi3DLnaHKqBLyJpqE/l4FWKci0u6eLJz+XwpxRrHtpO1HAAeKzQDZH+pH48FkLdEBGdONbAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729526356;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9nbbXCfUSq4vz2K2wCE+OPottRiZ9F+oEqarvipha+M=; 
 b=EoSAls9W7BrqaO4OKAsXSfG0OFBQ9w2Sd+cXZRBWcLQLniHqumB8xuTwhMp8tNrXLkKJ9p8SZVWZpwmVtRMlqHK/b2Ap8W7EuTRyaToBLBZQDaZ8/6i4x6iIfjzL2MH39BwwPXTne8t5r3QqvRo+KAXLhu/nUH08Yel9e0DSl2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=bubbl-tek.com;
 spf=pass  smtp.mailfrom=aaron@bubbl-tek.com;
 dmarc=pass header.from=<aaron@bubbl-tek.com>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1729526353282534.1391236818712;
 Mon, 21 Oct 2024 08:59:13 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:59:13 -0500
From: Aaron Sierra <aaron@bubbl-tek.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Vincent Fazio" <vfazio@xes-inc.com>, "Andy Yan" <andyshrk@163.com>,
 "buildroot" <buildroot@buildroot.org>, "Andy Yan" <andyshrk@gmail.com>
Message-ID: <192afcdcd6d.1213d420c999874.906482760730917485@bubbl-tek.com>
In-Reply-To: <ZxJL9O0KM7WP7b-d@smile.fi.intel.com>
References: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <Zw_FDy5XWpeQ78sG@smile.fi.intel.com>
 <1929b27b55e.1242e8abc627480.7414881916261699452@bubbl-tek.com>
 <ZxJL9O0KM7WP7b-d@smile.fi.intel.com>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1729526356; 
 s=zmail; d=bubbl-tek.com; i=aaron@bubbl-tek.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9nbbXCfUSq4vz2K2wCE+OPottRiZ9F+oEqarvipha+M=;
 b=ZPpoyzLpog6WhuFQY2ya4Gbif5ff3YjGr3IcO2jp9vfpZpx9H6n/mZpeZT3ew8zk
 M6YzZ4pnJeHWGTUIynFdfa0DADWnVpwC5J03RjeWcBQ9JnvhJ8dPl9/uvVmXHu71b5T
 kgP7ExR+gST/TmULuh7VrTHikW8kvC32QU5+xUB8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bubbl-tek.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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

Hi Andy,

 >  On Fri, 18 Oct 2024 06:52:20 -0500 Andy Shevchenko  wrote:
 > > On Thu, Oct 17, 2024 at 10:45:23AM -0500, Aaron Sierra wrote: 
 > > > On Mon, Oct 14, 2024 at 05:55:46PM +0000, Vincent Fazio wrote: 

[ snip iotools.mk symlink population reference from Vincent ]

 > > For the benefit of the uninitiated, iotools operates similarly to Busybox, 
 > > expressing behavior either by: 
 > >     1. taking the command name from argv[0] (i.e. symlinks named for internal commands) 
 > >        * This is the mechanism encouraged by the project's make install (i.e. 
 > >          iotools --make-links) 
 > >     2. taking the command name from argv[1] (i.e. iotools [[command] [arguments]]) 
 >  
 > There is a little nuance between two. When the Busybox is the *main( 
 > shell/coreutils/util-linux/etc provider it must populate the links, many of 
 > them (naming wise) are standardized by POSIX. In full opposition to the iotools 
 > with unpredictable consequences of the potential name clashing (esp. those that 
 > are called or/xor/and/etc.). 
 >  
 > > I proposed populating the symlinks in the target filesystem to ensure the 
 > > subcommands are ready-to-use for people already familiar with the tool. It sounds 
 > > like you're advocating for #2 ("iotools_fallback") to be the primary mode of 
 > > operation for Buildroot users. 
 >  
 > Yes, I highly suggest not to go this way. 
 >  
 > > Can you point to documentation that Buildroot users can use to _know_ that the 
 > > second mode of operation is available and encouraged? I do not see any in the 
 > > help output or in the project README. Here is the current help output: 
 > > 
 > > $ ./iotools --help 
 > > usage: ./iotools COMMAND 
 > >   COMMANDS: 
 > >     --make-links 
 > >     --clean-links 
 > >     --list-cmds 
 > >     -v --version 
 >  
 > Is it full output? Because to me it shows two screens of the listed commands. 
 > I do not see an issue here. 

That is the complete help output built from the v1.7 tag (751c76605f37).

 > > For the sake of usability, I think it's important to either improve utility and/or 
 > > project documentation or reconsider your stated position on symlink population. 
 >  
 > I am against populating the links. 

So, you are willing to improve project documentation then?

 > > Feel free to ask for help with either direction you choose. 

Be on the lookout for contributions to your repository that address my remaining concerns.

-Aaron
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
