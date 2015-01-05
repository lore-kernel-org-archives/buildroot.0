From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Jan 2015 18:40:55 +0100
Subject: [Buildroot] [PATCH] support/download: further silence the git
 helper
In-Reply-To: <CAHkwnC9Ri41gSQ5Oh+Y=XCRcvGbC0S1MSGY5W-AOpg8qLaCM+g@mail.gmail.com>
References: <1420395014-8961-1-git-send-email-yann.morin.1998@free.fr>
 <CAHkwnC9Ri41gSQ5Oh+Y=XCRcvGbC0S1MSGY5W-AOpg8qLaCM+g@mail.gmail.com>
Message-ID: <20150105174054.GA5077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-01-05 12:35 +0100, Fabio Porcedda spake thusly:
> On Sun, Jan 4, 2015 at 7:10 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > We expresely call printf in the git helper, calls which were not
> > addresed in the previous silent-build patchset.
> >
> > Just redirect stdout to oblivion when being silent.
> >
> > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  support/download/git | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/support/download/git b/support/download/git
> > index 7f1801f..73cbc0f 100755
> > --- a/support/download/git
> > +++ b/support/download/git
> > @@ -14,7 +14,7 @@ set -e
> >  verbose=-v
> >  while getopts :q OPT; do
> >      case "${OPT}" in
> > -    q)  verbose=-q;;
> > +    q)  verbose=-q; exec >/dev/null;;
> 
> As general rule It's best to use "&&" instead of ";" so any error can
> be caught,

That is really not necessary, because the backend scripts are all
'set -e', so they exit on the first error that occurs.

Besides, even if they were not 'set -e', then the '&&' construct would
not catch the error at all, and the script would continue without
redirecting.

Furthermore, in that case, we're doing two things:
  - set a variable
  - redirect stdout to /dev/null

If either were to fail, you would have a hell of a bigger problem:
  - unable to set a variable: big problem in the shell
  - not able to redirect: /dev/null does not exist, or you do not have
    the rights to write to it.

In either case, this would be a really, *really* big problem, which I
doubt we should care about. ;-)

> otherwise is:
> Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
