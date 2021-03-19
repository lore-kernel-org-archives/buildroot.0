From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Mar 2021 07:19:48 +0100
Subject: [Buildroot] [PATCH 2/2] support/download: print command used
 for download
In-Reply-To: <CAAXf6LUom6Q6wvzDvxr4RDdzMoBY5kcmq4TbWiy=xWq1JibBaw@mail.gmail.com>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
 <20210115150047.6895-2-patrickdepinguin@gmail.com>
 <20210316222938.GI3443324@scaer> <20210318210133.GK3443324@scaer>
 <CAAXf6LUom6Q6wvzDvxr4RDdzMoBY5kcmq4TbWiy=xWq1JibBaw@mail.gmail.com>
Message-ID: <20210319061948.GM3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-03-18 22:32 +0100, Thomas De Schampheleire spake thusly:
> El jue, 18 mar 2021 a las 22:01, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> >
> > Thomas, All,
> >
> > On 2021-03-16 23:29 +0100, Yann E. MORIN spake thusly:
> > > On 2021-01-15 16:00 +0100, Thomas De Schampheleire spake thusly:
> > > > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > > >
> > > > Even though that most download commands actually print some output, like
> > > > progress indication or other messages, the actual command used is not. This
> > > > makes it hard to analyze a build log when you are not fully familiar with
> > > > the typical output of said log.
> > > >
> > > > Update the download helpers to do just that, respecting any quiet/verbose
> > > > flag so that a silent make (make -s) does not get more verbose.
> >
> > Note that this breaks the git downloads, as reported by Matthias:
> >     https://bugs.busybox.net/show_bug.cgi?id=13631
> oops :-o
> I indeed tested hg, wget, and scp downloads, but not git/svn. The
> change seemed so trivial (*famous last words).

Heheh... ;-)

> As the problem is caused by adding additional output in something
> where the output is parsed, a solution would be to send the 'printf'
> output to stderr iso stdout.

I don't think this would be so nice, no...

[--SNIP--]
> Another solution is indeed to use a custom _git/_svn for the above
> three cases. Actually you want a '__quiet_git', but the need to handle
> spaces in args correctly makes it more complex, if one does not want
> to duplicate code. One would need something like:
> _git() {
>     printf
>     _quiet_git() "$@"
> }
> _quiet_git() {
>     <actual command>
> }
> but aside from the fact I'm unsure if this works correctly for the
> argument passing (including support for spaces), the fact that the
> printf and the actual command are duplicating the command now in two
> _different_ functions, is pretty fragile.

But I like it better than all the alternatives, so I'm sold on it. Send
a patch! ;-)

Now the quesiton: do we want to apply this to all helpers, so that they
are homogeneous, or do we do that only for git and svn?

My gut feeling is that we should do it for all, because it is relatively
trivial to do, and then we have all backends using the same constructs,
so they are easier to reason about.

Thanks for the prompt feedback!

Regards,
Yann E. MORIN.

> A simpler version of this is what you already suggested but disliked,
> hacking the 'quiet' variable for this purpose.
> Or alternatively, if you like that better, add another variable, a
> 'boolean' perhaps, to steer this quietness.
> 
> And finally, the other approach is to revert this change for git and
> svn, but leave it enabled for the other helpers which just have
> 'normal' usage.
> 
> Of the above, what are your thoughts?
> 
> Thanks,
> Thomas
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
