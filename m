From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Feb 2014 22:48:52 +0100
Subject: [Buildroot] [PATCH] package/ti-gfx: do not forcefully remove
 source dir on extract
In-Reply-To: <530E5DAE.8030609@mind.be>
References: <1393440003-29380-1-git-send-email-yann.morin.1998@free.fr>
 <530E5DAE.8030609@mind.be>
Message-ID: <20140226214852.GB16780@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-02-26 22:33 +0100, Arnout Vandecappelle spake thusly:
> On 26/02/14 19:40, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > ti-gfx uses custom extract commands, which first and foremost removes
> > the source dir unconditionally.
> > 
> > Thee side-effect of this is that make will re-extract, re-patch and
> > probably re-build ti-gfx at each run.
> 
>  There actually was a reason for this - I think the extract fails if you
> re-run it. Have you tried
> 
> make ti-gfx-extract; make ti-gfx-extract

I shall try that right away... Nope, works!

I eventually understood what was going on. Basically, when you run:

    make ti-gfx-extract

under the hood, it's as you did:

    make ti-gfx-source
    make ti-gfx-extract

But -source creates a stamp file. Then -extract would remove the
directory, thus removing the stamp file.

10 When you run make again, the stamp file for the download is missing, so
make tries to download it again (invisible, since we already have the
archive), creates the stamp file, and extract again, which removes the
stamp file.
20 GOTO 10.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
