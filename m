Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A1C6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 19:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F11C4170E;
	Tue, 21 Mar 2023 19:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F11C4170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rxnf8gd7bXcd; Tue, 21 Mar 2023 19:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEF1414EE;
	Tue, 21 Mar 2023 19:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FEF1414EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20F131BF3E3
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0557400F2
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0557400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9q_fXtUVEvMb for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 19:25:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F60840CC9
 for <buildroot@uclibc.org>; Tue, 21 Mar 2023 19:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F60840CC9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1DA7F8756D; Tue, 21 Mar 2023 19:25:12 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 21 Mar 2023 19:25:11 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ps.report@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15456-163-cs9dHnnFBv@https.bugs.busybox.net/>
In-Reply-To: <bug-15456-163@https.bugs.busybox.net/>
References: <bug-15456-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15456] No more login on Raspberry Pi 3 since
 2023.02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15456

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
The systemd default locale is 'C.UTF-8' (since 252, see [1] and
/etc/locale.conf  on the board):

    $ echo $LANG
    C.UTF-8

From build/readline-8.2/nls.c:

    126 char *
    127 _rl_init_locale (void)
    128 {
    129   char *ret, *lspec;
    130
    131   /* Set the LC_CTYPE locale category from environment variables. */
    132   lspec = _rl_get_locale_var ("LC_CTYPE");
    133   /* Since _rl_get_locale_var queries the right environment variables,
    134      we query the current locale settings with setlocale(), and, if
    135      that doesn't return anything, we set lspec to the empty string to
    136      force the subsequent call to setlocale() to define the `native'
    137      environment. */
    138 #if defined (HAVE_SETLOCALE)
    139   if (lspec == 0 || *lspec == 0)
    140     lspec = setlocale (LC_CTYPE, (char *)NULL);
    141   if (lspec == 0)
    142     lspec = "";
    143   ret = setlocale (LC_CTYPE, lspec);    /* ok, since it does not change
locale */
    144 #else
    145   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
    146 #endif
    147
    148   _rl_utf8locale = (ret && *ret) ? utf8locale (ret) : 0;
    149
    150   _rl_current_locale = savestring (ret);
    151   return ret;
    152 }

The call to '_rl_get_locale_var()' returns 'C.UTF-8' (line 132) but the
call to 'setlocale(LC_CTYPE, 'C.UTF-8')' returns 0 (line 143) which
leads to the segmentation fault in the call to 'savestring(0)' (line 150).

Setting the following in the buildroot config file fixes the problem for me:

    BR2_ENABLE_LOCALE_WHITELIST="C"
    BR2_GENERATE_LOCALE="C"

[1] https://github.com/systemd/systemd/blob/main/NEWS

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
