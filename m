From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jul 2016 16:04:01 +0200
Subject: [Buildroot] [PATCH v2 1/6] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <20160724160048.39770315@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
 <20160715204729.GH3692@free.fr>
 <20160724160048.39770315@free-electrons.com>
Message-ID: <20160724140401.GA5866@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2016-07-24 16:00 +0200, Thomas Petazzoni spake thusly:
> On Fri, 15 Jul 2016 22:47:29 +0200, Yann E. MORIN wrote:
> 
> > > ---  
> > [--SNIP--]
> > > diff --git a/support/download/bzr b/support/download/bzr
> > > index e18b01f..9443e03 100755
> > > --- a/support/download/bzr
> > > +++ b/support/download/bzr
> > > @@ -25,6 +25,7 @@ output="${1}"
> > >  repo="${2}"
> > >  rev="${3}"
> > >  basename="${4}"
> > > +dl_opts="${5}"  
> > 
> > So we expect the additional options to be pased as a single string?
> > Why not use something like:
> > 
> >     shift 4 # Get rid of our options
> > 
> > and then:
> > 
> >     _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
> >         ${timestamp_opt} - "'${repo}'" -r "'${rev}'" \
> >         ${timestamp_opt} - "${@}" "'${repo}'" -r "'${rev}'" \
> > 
> > Ditto for all backends, of course.
> > 
> > Note: I wrote the above after writing the comment below; that construct
> > above would fix the concerns I expressed below.
> > 
> > (I'm hard to follow, am I not? My brain is really tortuous... ;-] )
> 
> Below, you're concerned that "${dl_opts}" will lead to a problem as it
> will be an empty "" if no options are passed. But you suggest to use
> "${@}" instead, still with "". How does that fix the particular problem
> you mentioned below?

Because "${@}" expands to nothing if there is no paramter.

http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18

@
    Expands to the positional parameters, starting from one. When the
    expansion occurs within double-quotes, and where field splitting (see
    Field Splitting) is performed, each positional parameter shall expand
    as a separate field [...]. If there are no positional parameters, the
    expansion of '@' shall generate zero fields, even when '@' is
    double-quoted.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
