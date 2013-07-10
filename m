From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jul 2013 18:17:28 +0200
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
 post-build and post-image scripts
In-Reply-To: <20130710091628.1d01d59c@skate>
References: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
 <20130709183505.GB3543@free.fr> <20130710091628.1d01d59c@skate>
Message-ID: <20130710161728.GA3297@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-10 09:16 +0200, Thomas Petazzoni spake thusly:
> On Tue, 9 Jul 2013 20:35:05 +0200, Yann E. MORIN wrote:
> > This was refused (and rightfully) as that would greatly impact users
> > depending on the current behaviour, and some alternate solution were
> > proposed:
> >   - have a single script that would behave differently on how it sould
> >     be called, and have different symlinks pointing to that script;
> >   - have a script for each configuration, that 'sources' a functions
> >     file and call the required functions
> > 
> > After playing a bit with both solutions, it turned out to be not
> > entirely manageable, especially when the inrastructure put in place by
> > the functions changes, since all scripts must be changed accordingly.
> 
> I am not quite sure to understand why the symlink solution doesn't work
> in your case. Could you elaborate on that?

The basic idea behind usig a symlink is that:
  - there is a single script with all the infrastructure
  - the script decides what to do based on ${0}

The script I'm using has no board-specific parts, only a handfull
generic functions, and parses a board-specific file that describes what
to do.

So instead of a single file (the board description for that project), I
need two: the symlink which will never change, and the board file.

Since the symlink will never change, it is just lying there for no
reason.

For a few boards/projects, using a symlink can be enough, but as I will
eventually be managing a few dozens, or even more, boards/projects, I'd
end up with as many symlinks that serve no purpose except working around
a limitation in Buildroot, limitation which can be easily raised in a
backward-compatible way.

Being able to pass a argument to the script means I have a single file
to manage per board/project, and not carry this useless symlink.

> Regarding the patch itself, I'd say why not. I'm just wondering if it
> wouldn't be better to have separate arguments for both scripts. Not
> sure.

That was my original idea, too, but as an afterthought I decided not to,
since the argument(s) passed will probably be something like the board
and the project name (eg. ( rpi/tvheadend ) or ( rpi, tvheadend )), and
that would be common to the postbuild/image scripts.

But I have no strong opinion on this. Copy-pasting between each option
will be easy enough! ;-) I can upgrade the infra to separate both if Peter
and you want it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
