From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Feb 2021 19:28:01 +0100
Subject: [Buildroot] [PATCH] support/download/svn: fix date format for
 archive creation
In-Reply-To: <4cba7ba3-06c7-b45b-81c8-4746bcee2bcf@mind.be>
References: <20210219212154.27107-1-vfazio@xes-inc.com>
 <20210220095148.GI2276@scaer>
 <4cba7ba3-06c7-b45b-81c8-4746bcee2bcf@mind.be>
Message-ID: <20210222182801.GD2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-02-22 11:58 +0100, Arnout Vandecappelle spake thusly:
> On 20/02/2021 10:51, Yann E. MORIN wrote:
> > On 2021-02-19 15:21 -0600, Vincent Fazio spake thusly:
> >> Now the returned date is massaged to drop the sub-seconds.
[--SNIP--]
> A much simpler solution is
> date="$( date -d "${date}" -u +%Y-%m-%dT%T%:z )"
> which is fully portable over any POSIX-compliant version of date.

%:z is not POSIX, it's a GNU extension. However, we do not care about
computing the timezone: it's forcibly +00:00 becasue we do request -u.

Also, %T is OK, but to keep in line with the %Y-%m-%d part, I've
switched to %H:%M:%S.

Eventually, I've settled for: 

> > But I wonder whether this should be svn-specific, or whether we should
> > move it into the generic herlper mk_tar_gz()... Arnout, thoughts?
>  I would expect any sane VCS to be able to show the last change date in ISO 8601
> format - I'd hope that SVN is the exception rather than the rule...

Actually, sub-second precision *is* allowed by ISO8601. ISO8601 even
allows fractional parts after the last time element, eg.: 14:30,5 to
represent 14 hours, 30.5 minutes (i.e. 30min and 30s). The precision of
the fractional part is even left unspecified, with parties agreeing in
advance (or autodetectig, I'd guess):

    https://en.wikipedia.org/wiki/ISO_8601#Times

So, svn *is* ISO8601-compliant.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >>  # Generate the archive.
> >>  # We did a 'svn export' above, so it's not a working copy (there is no .svn
> >>  # directory or file to ignore).
> >> -- 
> >> 2.30.0
> >>
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
