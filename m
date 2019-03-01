From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Mar 2019 18:18:03 +0100
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <20190301145043.GA20576@lwo1-lhp-f71841>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228182159.02a8a6c4@windsurf>
 <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
 <CAMw6YJL9ciuU=tScsbV3rqH1KFd+OaPn6jN+DrUDqTdLizqQCA@mail.gmail.com>
 <20190222212912.727ff0c2@windsurf>
 <20190225011003.g7j35hly5bpf2bys@vkochan-ThinkPad-T470p>
 <20190225090543.1e93d3a6@windsurf.home>
 <20190301145043.GA20576@lwo1-lhp-f71841>
Message-ID: <20190301171803.GD2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadym, All,

On 2019-03-01 16:50 +0200, Vadym Kochan spake thusly:
> On Mon, Feb 25, 2019 at 09:05:43AM +0100, Thomas Petazzoni wrote:
> > On Mon, 25 Feb 2019 03:10:03 +0200
> > Vadim Kochan <vadim4j@gmail.com> wrote:
> > 
> > > I think that in case of per-packages parallel build the logs became
> > > messy and meaningless so I send a patch which allows to do per-package
> > > logging too:
> > > 
> > > 	https://patchwork.ozlabs.org/patch/1047549/
> > > 
> > > this is a POC so it just shows the idea.
> > The problem of logging was discussed quite a lot back when I started to
> > work on per-package directories. I think we investigated overriding the
> > SHELL variable, but couldn't find an approach that worked properly, but
> > maybe the approach was different than yours, I need to get back to the
> > original discussion.
> > 
> > Back then, what we concluded is that people could use the "make
> > --output-sync=target" option, or "make -Otarget" in short. This option
> > buffers the output of make on a per-target basis, and displays this
> > output at once when the target has completed. The advantage is that the
> > output is no longer garbled, but the drawback is that you don't see
> > "live" what is happening: if a package takes 20 minutes to build,
> > during 20 minutes you see nothing, and at the end of the 20 minutes,
> > you get in one go the full build output of that package.
> 
> I updated the patch:
> 
>     https://patchwork.ozlabs.org/patch/1047620/
> 
> where I added per-package-and-per-step logging, I think it is possible
> to merge them info one log file, but per-step approach allows to easy
> update logs for perticular step.
> 
> But I 'd like to clarify if actually such approach make sense ?

As Thomas said, we already have had some discussion about the logging,
and we also investigated using a shell wrapper, and a PoC similar to
yours was even attempted.

However, we eventually concluded that this was not going to work
reliably, so we decided against at that time. I could not find that
conclusion in the devdays meeting reports, so I guess it's burried
somewhere in the mailing list. I'll try to unearth those later in the
evening or the week-end...

The first issue I can readily remember, was that the SHELL variable is
passed down to all children, and some of them may re-use it to run
commands, and the wrapper would make those fail. I don't have the
details, though, as I said I'll try to dig them from the archives...

But overall, I agree with Thomas, that people that still want nice logs
call 'make -Otarget'.

> Also how do you think about to add (using the approach from the patch)
> prepending logs with a package name prefix (in bold) (not necessary for
> parellel building but enabled by config option):
> 
>     [${pkg_name}] $log_line
> 
> after it may be possible to print the percentage of installed packages
> like:
> 
>     [${percent}][${pkg_name}] $log_line
> 
> ofcourse all this is just for providing to user at runtime the info
> which package is building and how many packages (in percentages) are
> done. So, may be it looks useless, but I feel it would be nice to have.

Sorry, but I think this is really getting too far.

We already have a simple make wrapper, utils/brmake, which filters the
build log and redirects all to a file, and just prints the '>>>' lines
to stdout. I think this is as far as we should go with Buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
