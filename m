From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 19:08:04 +0100
Subject: [Buildroot] [PATCH 2/2 v8] pkg-download: silence downloads if
	make is silent
In-Reply-To: <CAHkwnC_Ut0qO82jtch03bY8WYxPzfoeycO9NuvYYtO-OKRd=DQ@mail.gmail.com>
References: <cover.1420130984.git.yann.morin.1998@free.fr>
 <70490271dbf1774e87cc5dab1a5e907105afeb62.1420130984.git.yann.morin.1998@free.fr>
 <CAHkwnC_Ut0qO82jtch03bY8WYxPzfoeycO9NuvYYtO-OKRd=DQ@mail.gmail.com>
Message-ID: <20150101180804.GF4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-01-01 18:54 +0100, Fabio Porcedda spake thusly:
> On Thu, Jan 1, 2015 at 5:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: Fabio Porcedda <fabio.porcedda@gmail.com>
> >
> > If it is a silent build (make -s -> QUIET=-q) silence all downloads, as
> > well as the check-hash. Only stdout is redirected, stderr is still
> > visible, for errors and warning.
> 
> Hi Yann,
> nice idea, i tried this patch but even if it works for check-hash and
> svn it does not works for the git backend (e.g. libubox) and the wget
> bakend (try it without the QUIET flags in the WGET variable).
> 
> I don't understand the reason for this behavior.
> Do you have an idea for this strange behavior?

Ok, that's because git always sends its report status to stderr:

    --quiet, -q
        Operate quietly. Progress is not reported to the standard
        error stream. [...]

So, we need to pass -q to git. Sigh, fscking borked behaviour... stderr
is for failures, not normal reporting... :-(

OK, so we need to pass -q to some backends.

However, what I did not like in your original patch was the fact that
some backends were singled out in the wrapper script. We do not want
that, we want the wrapper to be backend-agnostic (that's the whole point
of having a wrapper and backends).

I'll rework that, then...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
