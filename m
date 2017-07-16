From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 17:08:59 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <CAGt4E5txWySKpD0npytd=8yujrcQRQNQXwgYQzGCLdy9hyLTLw@mail.gmail.com>
Message-ID: <20170716150859.GD30047@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, Arnout, All,

Your position on Markus' (non-)issue?

Do we keep the code as-is, or do we "fix" it so that it is not
ambiguous?

I've checked, and make uses strcmp(3) internally, and strcmp() does not
use locales at all; it just compares chars.

Regards,
Yann E. MORIN.

On 2017-07-13 16:59 -0700, Markus Mayer spake thusly:
> On 13 July 2017 at 14:45, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Markus, All,
> >
> > On 2017-07-13 13:16 -0700, Markus Mayer spake thusly:
> > [--SNIP--]
> >> I think I may need some help. I started implementing the suggested
> >> solution, but I have run into some unexpected problems.
> >>
> >> Specifically, if I move the linux-tool-*.mk files into their own
> >> sub-directory, all linux-tools related targets disappear. It won't
> >> build any linux-tools during a regular run of 'make' and it will
> >> actually say "No rule..." when explicitly asked to build linux-tools:
> >>
> >> $ make linux-tools
> >> umask 0022 && make -C /home/mmayer/Development/buildroot
> >> O=/home/mmayer/Development/output/arm64/. linux-tools
> >> make[1]: *** No rule to make target 'linux-tools'.  Stop.
> >> Makefile:16: recipe for target '_all' failed
> >> make: *** [_all] Error 2
> >>
> >> Here's what I have done:
> >>
> >> (mmayer at lbrmn-mmayer) ~/Development/buildroot$ l package/linux-tools/
> >> total 84
> >> drwxrwxr-x    3 mmayer mmayer  4096 Jul 13 11:38 .
> >> drwxrwxr-x 1843 mmayer mmayer 65536 Jul 10 12:28 ..
> >> -rw-rw-r--    1 mmayer mmayer  2577 Jul 10 11:02 Config.in
> >> -rw-rw-r--    1 mmayer mmayer  2049 Jul 13 11:20 linux-tools.mk
> >> drwxrwxr-x    2 mmayer mmayer  4096 Jul 13 11:20 tools
> >
> > OK, I will attempt a wild gues here... Rename the 'tools' directory to
> > 'linux-tools' and try again.
> 
> Your guess was spot-on. That was exactly it.
> 
> [...]
> 
> > We have a similar situation in linux/linux.mk, see line 425 where we
> > have an explanation about this:
> >
> >   423 # Include all our extensions.
> >   424 #
> >   425 # Note: our package infrastructure uses the full-path of the last-scanned
> >   426 # Makefile to determine what package we're currently defining, using the
> >   427 # last directory component in the path. As such, including other Makefile,
> >   428 # like below, before we call one of the *-package macro is usally not
> >   429 # working.
> >   430 # However, since the files we include here are in the same directory as
> >   431 # the current Makefile, we are OK. But this is a hard requirement: files
> >   432 # included here *must* be in the same directory!
> >   433 include $(sort $(wildcard linux/linux-ext-*.mk))
> >
> > So I would argue against the sub-directory, but in favour of renaming
> > the files.
> >
> > Except that is not necessary, is it? IIRC, you confirmed that this was
> > in fact not a problem, right?
> 
> Yes, it is not a problem for linux-tool-tmon.mk. I originally thought it was.
> 
> > So, rather than try to fix a problem that does not exist, using fragile
> > heuristics, I would recommend we keep the status-quo.
> 
> It was my understanding that the alphabetical sorting of linux-tools
> has been considered to be not really all that desirable and that a
> "once and for all" solution that does away with this requirement would
> be welcomed. That's why I looked into these changes.
> 
> I'll leave the decision to the maintainers as to whether this should
> be changed (either using a sub-directory or an file extension other
> than .mk) or if it is preferable to keep the alphabetical sorting. My
> personal take is that relying on alphabetical sorting is more fragile
> than the alternate solution, but it is up to you guys.
> 
> Thanks,
> -Markus

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
