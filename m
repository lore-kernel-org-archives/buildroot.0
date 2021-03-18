From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Mar 2021 22:32:22 +0100
Subject: [Buildroot] [PATCH 2/2] support/download: print command used
 for download
In-Reply-To: <20210318210133.GK3443324@scaer>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
 <20210115150047.6895-2-patrickdepinguin@gmail.com>
 <20210316222938.GI3443324@scaer> <20210318210133.GK3443324@scaer>
Message-ID: <CAAXf6LUom6Q6wvzDvxr4RDdzMoBY5kcmq4TbWiy=xWq1JibBaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

El jue, 18 mar 2021 a las 22:01, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2021-03-16 23:29 +0100, Yann E. MORIN spake thusly:
> > On 2021-01-15 16:00 +0100, Thomas De Schampheleire spake thusly:
> > > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > >
> > > Even though that most download commands actually print some output, like
> > > progress indication or other messages, the actual command used is not. This
> > > makes it hard to analyze a build log when you are not fully familiar with
> > > the typical output of said log.
> > >
> > > Update the download helpers to do just that, respecting any quiet/verbose
> > > flag so that a silent make (make -s) does not get more verbose.
>
> Note that this breaks the git downloads, as reported by Matthias:
>     https://bugs.busybox.net/show_bug.cgi?id=13631
>
> It most probably also breaks the svn downloads too. So I know you are
> primarily using Hg at your place, but clearly the git and svn backends
> were not tested, and I overlooked the impact of that change when
> applying. :-/

oops :-o
I indeed tested hg, wget, and scp downloads, but not git/svn. The
change seemed so trivial (*famous last words).

>
> However, I don't see an easy way out.
>
> My first idea was to test whether stdout was a terminal or not, e.g.:
>
>     if [ -z "${quiet}" -a -t 1 ]; then
>         printf ...
>     fi
>
> So that the command would not be printed when called in a subshell like
> is used to get the date:
>     date="$( _git ... )"
>
> But that means the commands would not be printed for people that log the
> output, like so:
>
>     $ make 2 >&1|tee build.log
> or with:
>     $ ./utils/brmake
>
> either being probably a well-established use-case (I use that almost
> exclusively...)
>
> Another idea I had was to force quiet in such case:
>
>     date="$( quiet=-q _git ... )"
>
> But I find it pretty ugly, because it just papers over the problem...

The problem only appears when the output of the _git/_svn command is
actually used by something. There are currently three places:
- git helper, to calculate the date
- git helper, in submodule support (for module_dir in $(_git submodule ...)
- svn helper, to calculate the date

As the problem is caused by adding additional output in something
where the output is parsed, a solution would be to send the 'printf'
output to stderr iso stdout.
Conceptually, it may not really be expected, in case people split
error output to a special file.
But I'm quite sure that in a full build, there is already a lot of
output there so adding a few lines may not really hurt that much.

Another solution is indeed to use a custom _git/_svn for the above
three cases. Actually you want a '__quiet_git', but the need to handle
spaces in args correctly makes it more complex, if one does not want
to duplicate code. One would need something like:
_git() {
    printf
    _quiet_git() "$@"
}
_quiet_git() {
    <actual command>
}
but aside from the fact I'm unsure if this works correctly for the
argument passing (including support for spaces), the fact that the
printf and the actual command are duplicating the command now in two
_different_ functions, is pretty fragile.

A simpler version of this is what you already suggested but disliked,
hacking the 'quiet' variable for this purpose.
Or alternatively, if you like that better, add another variable, a
'boolean' perhaps, to steer this quietness.

And finally, the other approach is to revert this change for git and
svn, but leave it enabled for the other helpers which just have
'normal' usage.

Of the above, what are your thoughts?

Thanks,
Thomas
