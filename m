From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 May 2017 10:16:02 +0200
Subject: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to
 check several candidates
In-Reply-To: <514021890.21766442.1494026344834.JavaMail.zimbra@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
 <1494016231-50639-2-git-send-email-casantos@datacom.ind.br>
 <20170505210703.GA3001@scaer>
 <829990645.21765498.1494023686203.JavaMail.zimbra@datacom.ind.br>
 <514021890.21766442.1494026344834.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170506081602.GA2934@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-05 20:19 -0300, Carlos Santos spake thusly:
> > From: "Carlos Santos" <casantos@datacom.ind.br>
> > To: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: buildroot at buildroot.org
> > Sent: Friday, May 5, 2017 7:34:46 PM
> > Subject: Re: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to check several candidates
> 
> >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> To: "Carlos Santos" <casantos@datacom.ind.br>
> >> Cc: buildroot at buildroot.org
> >> Sent: Friday, May 5, 2017 6:07:03 PM
> >> Subject: Re: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to check
> >> several candidates
> >>> --- a/support/dependencies/check-host-cmake.sh
> >>> +++ b/support/dependencies/check-host-cmake.sh
> >>> @@ -1,39 +1,41 @@
> >>>  #!/bin/sh
> >>>  
> >>> -candidate="${1}"
> >>> -version_min="${2}"
> >>> +eval 'version_min="${'${#}'}"'
> >> 
> >> It took me a moment to understand what this was doing (and I am known
> >> for being a shell fanboy!).
> >> 
> >> Just revert the order options are passed: version first, then
> >> candidates. This will allow you to get rid of this weird construct.
> >> 
> >>    version_min="${1}"
> >>    shift # Keep only candidates
> > 
> > I did it that way because all invocations of the "suitable-host-package"
> > macro pass the candidate name as the first argument to the script but I
> > must admit that the script lost some readability.
> 
> Also, doing it as you suggest requires modifying check-host-cmake.mk
> in the same patch to change the argument order, which I'd prefer to
> avoid.

Well, yes you'd have to do that, and I think it is totally aceptable
that you change the order of arguments.

And not all checkers already behave the same anyway. The asciidoc one
just ignores its first argument and is passed none; the lzip one only
takes a candidate and no version; ditto the tar one or the xzcat one. So
in fact, the cmake one is the only one to expect a version on its
command line.

So yes, re-ordering the arguments is totally acceptable, and, as I
wrote, make for a simpler code.

Regards,
Yann E. MORIN.

> -- 
> Carlos Santos (Casantos) - DATACOM, P&D
> ?The greatest triumph that modern PR can offer is the transcendent 
> success of having your words and actions judged by your reputation, 
> rather than the other way about.? ? Christopher Hitchens

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
