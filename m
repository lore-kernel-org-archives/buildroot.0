From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2014 23:35:44 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-infra: git helper creates an empty
 archive if PKG_VERSION is a missing hash
In-Reply-To: <52D6440F.3020309@mind.be>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
 <52D5A17B.8010703@mind.be> <20140114232126.GK3328@free.fr>
 <52D6440F.3020309@mind.be>
Message-ID: <20140117223544.GD3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-15 09:17 +0100, Arnout Vandecappelle spake thusly:
> On 15/01/14 00:21, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2014-01-14 21:43 +0100, Arnout Vandecappelle spake thusly:
> >>On 13/01/14 00:44, Yann E. MORIN wrote:
> >>>From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >[--SNIP--]
> >>>-${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
> >>>-|gzip -c >"${output}"
> >>>+res=1
> >>>+if ${GIT} rev-list -n 1 "${cset}" >/dev/null 2>&1; then
> >>
> >>  When we've done a shallow clone, this check is redundant because we have
> >>cloned exactly this ref.
> >>
> >>  So instead, I'd do the check in the full clone condition, with an explicit
> >>exit.
> >
> >I see. But it complexifies the script.
> >
> >And doing the check a second time ensures we did not download garbage
> >
> >Heck, there's even a race condition, since we check the remote, then
> >clone it, and the ref may have vanished (granted, very unlikely, but
> >yet...). :-p
> 
>  True. I yield to your wisdom.

Sorry, that race-condition was not meant to be taken in the first degree.
Of course, the chances it happens are so thin we can easily ignore it.

However, I tried massaging the script so that we do the check only once,
and I can't find an easy way, except duplicating the check before
calling git archive.

I've added a comment saying so in the script.

Thank you for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
