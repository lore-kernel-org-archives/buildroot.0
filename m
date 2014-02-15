From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Feb 2014 12:44:18 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
 portability)
In-Reply-To: <52E7543D.9010103@mind.be>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
 <52E7543D.9010103@mind.be>
Message-ID: <20140215114418.GA5291@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Jumping back into this old thread, after it was referenced by Maxime in
his XBMC series...

On 2014-01-28 07:54 +0100, Arnout Vandecappelle spake thusly:
> On 27/01/14 10:19, Samuel Martin wrote:
> >"command -v" seems not playing very well with aliases:
> >
> >$ command -v make
> >alias make='~/.config/ctafconf/bin/colorwarper make'
> >$ which make
> >/usr/bin/make
> 
>  I don't think your .profile gets executed when running a shell script, so
> the alias will not be set. Bash does use BASH_ENV to specify a startup
> script, so perhaps we should unexport that.

Here is a little test I did:

    $ cat Makefile
    all:
        echo "'$${buz}'"
        foo

    $ cat /tmp/foo.env
    buz="BUZ"
    echo BAR
    alias foo='echo FOO'

    $ BASH_ENV=/tmp/foo.env ENV=/tmp/foo.env make
    echo "'${buz}'"
    ''
    foo
    make: foo: Command not found
    make: *** [all] Error 127

So, it looks like neither BASH_ENV nor ENV are parsed (ENV is for when
bash is invoked in POSIX mode).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
