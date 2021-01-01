From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2021 11:01:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang-jiffy: needs -fPIC
In-Reply-To: <CAPi7W80-5tr3My7i44W_i0ZLsgF8exY6PNGTiE6ra9iVEr3anQ@mail.gmail.com>
References: <20201224101440.3427472-1-fontaine.fabrice@gmail.com>
 <20201228225325.4f973ae1@windsurf.home>
 <CAPi7W81Un5M_bA7_EqbZeFPdiKKP7+v1pjzheAa-FKGVHvu3ng@mail.gmail.com>
 <20201229104342.1eaa49a3@windsurf.home>
 <CAPi7W80-5tr3My7i44W_i0ZLsgF8exY6PNGTiE6ra9iVEr3anQ@mail.gmail.com>
Message-ID: <20210101100153.GI2902@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Thomas, All,

On 2020-12-29 11:14 +0100, Fabrice Fontaine spake thusly:
> Le mar. 29 d?c. 2020 ? 10:43, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > On Tue, 29 Dec 2020 10:39:27 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> > > This build failure is raised because of the -flto flag which is added
> > > since version 1.0.0 and
> > > https://github.com/davisp/jiffy/commit/feaf10f2d50e454f55a9d6b20c289031b0980503
> > > It seems that -flto can't be used without -fPIC.
> >
> > This seems super odd. I'm not sure what would be the relationship
> > between LTO and PIC...
> Indeed but the build failure is fixed if I remove -flto from CFLAGS.
> I'll try to understand why ...

The thing with LTO, is that all files should (but in practice: must) be
compiled with the same set of options; from the gcc man page:

    It is recommended that you compile all the files participating in
    the same link with the same options and also specify those options
    at link time.

and later:

    There are some code generation flags preserved by GCC when generating
    bytecodes, as they need to be used during the final link. Currently,
    the following options and their settings are taken from the first
    object file that explicitly specifies them: -fPIC, [...]

So, if one file is compiled with -fPIC, then this is recorded in the .o
for that file, which gcc notices later when doing the link, and thus all
files must be -fPIC.

This can be a file compiled by the package itself, or it may come from
an external (staging) static library.

Regards,
Yann E. MORIN.

> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
