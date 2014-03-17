From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Mar 2014 22:36:19 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a
	dependency
In-Reply-To: <87k3bs5xc3.fsf@dell.be.48ers.dk>
References: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
 <87k3bs5xc3.fsf@dell.be.48ers.dk>
Message-ID: <20140317213619.GB3393@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-03-17 22:28 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > The way we are checking for bash is to look if "$SHELL --version"
>  > will return a string containing "^GNU bash".
> 
>  > In case the system shell is dash (eg. /bin/sh -> /bin/dash), but
>  > the user's login shell is bash, dash will not override the SHELL
>  > variable:
> 
>  >     $ echo $SHELL
>  >     /bin/bash
>  >     $ /bin/dash
>  >     $$ echo $SHELL
>  >     /bin/bash
> 
>  > The same happens when called as the interpreter for a shell script:
> 
>  >     $ cat foo.sh
>  >     #!/bin/dash
>  >     echo $SHELL
> 
>  >     $ echo $SHELL
>  >     /bin/bash
>  >     $ ./foo.sh
>  >     /bin/bash
> 
>  > So, calling "$SHELL --version" will still return "^GNU bash" no matter
>  > what shell is actually running.
> 
>  > Since quite a lot of #!/bin/sh scripts are in fact bash scripts, we
>  > really want to ensure that /bin/sh is bash.
> 
> Is that really still an issue? I just checked a few of the machines I
> often do buildroot builds on and they all have /bin/sh == dash.

Some configure-y scripts will run with /bin/sh, but have bashisms in them.

It was reported on IRC by Andrew that switching the system shell from
dash to bash fixed an issue (Andrew, was that with libxml2?).

>  > -# Check bash
>  > -if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
>  > +# Check bash is the system shell
>  > +if ! /bin/sh --version 2>&1 | grep -q '^GNU bash'; then
> 
> FYI, dash doesn't even understand a --version argument:

Yes, but it surely does not return something matching "^GNU bash" which
is all we care about.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
