From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 19:16:27 +0200
Subject: [Buildroot] Silencing the build
In-Reply-To: <CAHkwnC-vKfLhiFF2cYcwrLHFJA0ojCL+X2okeSqODsg_gQw3fQ@mail.gmail.com>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
 <20140715212814.1dfcce43@free-electrons.com>
 <CAHkwnC_1+=SR88eS3hHDOFMvzFFF_dE5LuRdKhKfi9pFm1RL4Q@mail.gmail.com>
 <20140717203152.2e18fb9b@free-electrons.com>
 <20140717202941.GE3737@free.fr>
 <CAHkwnC_eQxDKH=V+2U+pOMZj50y4oE2B_p_G+CAk8ZFG3jSsOw@mail.gmail.com>
 <20140718201537.GC3630@free.fr>
 <CAHkwnC-vKfLhiFF2cYcwrLHFJA0ojCL+X2okeSqODsg_gQw3fQ@mail.gmail.com>
Message-ID: <20140721171627.GB3874@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-07-21 18:25 +0200, Fabio Porcedda spake thusly:
> On Fri, Jul 18, 2014 at 10:15 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Well, I still believe the build should be verbose by default, otherwise
> > we would miss a lot of important information on bug reports. The problem
> > is where to store the build.log in case of a silent build, so the user
> > can provide it.
> 
> I don't know a way to store the full log (stdout & stderr) and view a
> filtered version of stdout & the unfiltered stderr, maybe you have an
> idea?

    brmake() {
        # This is a bash function, pipefail is not POSIX
        set -o pipefail
        make "${@}" 2>&1 \
        |tee build.log   \
        |sed -r -e '/^.{4}>>>[[:space:]]+(.*).{5}$/!d; s//\1/;'
    }

> > I think the best we can do is document a simple solution (like my little
> > function above, for example).
> 
> Yes, i think it's a good idea.
> 
> I personally prefer using a line like this:
>  make | grep --color=never ">>> "
> to be able to distinguish more easily stdoud messages from stderr messages.

Yes, why not. That's a bit trickier to handle, but no undoable. It would
need playing tricks with redirection and duplicating filedescriptors...

> Nevertheless, I still would like that this patch will be applied because:
> - using "make -s" is still simpler that using some "make | sed
> ........", many tools have a quiet flag for this reason.
> - is a work already done.
> - does not change the usual behavior.
> - it's just adds 12 line of code .

I'll have another look at it...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
