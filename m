From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 23 Nov 2010 23:02:19 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day,
	29th October 2010
In-Reply-To: <20101123221417.0d6867c6@surf>
References: <20101123221417.0d6867c6@surf>
Message-ID: <201011232302.19225.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 23 November 2010 22:14:17 Thomas Petazzoni wrote:
> A Buildroot Developer Day took place last month, on Friday 29th
> October, right after the Embedded Linux Conference Europe.
[--SNIP--]
> This is a personal report from Thomas Petazzoni. It hasn't been 
> reviewed by the other participants, so they are kindly invited to
> share their thoughts and corrections.

Thank you Thomas, it's all good from my PoV.

[--SNIp--]
> Crosstool-NG integration
> ========================
> 
> There was a quick summary of the Crosstool-NG integration done by Yann
> E. Morin. Peter was generally satisfied with this initial integration,
> but wanted to see the IPv6/RPC/locale/etc. options propagated to
> Crosstool-NG configure/build process. Yann agreed that this is lacking
> from the current integration, but he plans to work on this on the
> future. It shouldn't raise any major design issue.

Basically, I have issues (none that can't be fixed or worked around)
because of the way options a recurrently handled in Buildroot and
crosstool-NG.

For example, Buildroot has options for IPv6 and wide-chars that are used
to tweak uClibc's configuration.

In crosstool-NG, there is an option for wide-chars, and it is pushed down
to uClibc's config. But for IPv6, it is the responsibility of the user to
pass a properly prepared .config file.

(Of course, IPv6 and wchar are not the only options, they are here only
to illustrate the issue).

So there are to possibilities:
1) add those options to crosstool-NG
2) have dedicated code in Buildroot to munge crosstool-NG's uClibc's .config
   (yes, the .config for uClibc used by crosstool-NG)

Of course, 1) would be the best way, but may not happen soon enough.
OTOH, 2) makes the code a little bit uggly in Buildroot (but that is
manageable) and we will be able to resort to 1) when it is implemented.

Well, I plan to push a few patches by the end of the WE that will
implement a few of the major options.

> Peter's goal is to gradually replace the Buildroot internal process to
> build toolchains by Crosstool-NG. He currently imagines a one-year
> timeframe before phasing out the Buildroot internal process.

I believe this is a little bit optimistic. What I would say is that in
a year time, we can switch the _default_ to being to use crosstool-NG,
but still have the internal mechanism as a backup. Then, I think that
another 6 months will be needed before we can decide to get rid of the
internal mechanism altogether.

Do not forget that for now, crosstool-NG does not support the same set
of architectures Buildroot does. Also, Buildroot has per-arch patchsets
which is (for now at least) a no-no in crosstool-NG.

[--SNIP--]
> Conclusion
> ==========
> 
> This Developer Day has been very productive in terms of discussion,
> and for some complicated topics, we know have a better understanding
> on what should be implemented and how it should be implemented. The
> participants were all very satisfied of the day spent discussing
> Buildroot future.

And we add good ${BEVERAGE[@]} and ${LUNCH} in a pretty nice ${PLACE}.

> The next Buildroot Developer Day will happen on Monday, 7th February
> 2011 in Brussels, Belgium. This is just after the FOSDEM conference
> (http://www.fosdem.org). Interested participants are invited to
> contact Peter Korsgaard and Thomas Petazzoni.

Hehe. FOSDEM `11 is coming fast... I'll sure be there!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
