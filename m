From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Jul 2013 20:35:05 +0200
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
 post-build and post-image scripts
In-Reply-To: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
References: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130709183505.GB3543@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2013-07-09 20:06 +0200, Yann E. MORIN spake thusly:
> It can be useful to have different configuration use the same post-build
> and/or post-image scripts as they share a common infrastructure, but yet
> have minor differentiation.
> 
> This option allows passing zero or more additional arguments to each
> post-build or post-image script.
> 
> The same set of extra arguments are passed to all scripts, it is not
> possible to pass different arguments to each script.

I've already suggested moving the current _POST_BUILD_SCRIPT and
_POST_IMAGE_SCRIPT options to Legacy, and introduce two new options that
would accept a single script with arguments.

This was refused (and rightfully) as that would greatly impact users
depending on the current behaviour, and some alternate solution were
proposed:
  - have a single script that would behave differently on how it sould
    be called, and have different symlinks pointing to that script;
  - have a script for each configuration, that 'sources' a functions
    file and call the required functions

After playing a bit with both solutions, it turned out to be not
entirely manageable, especially when the inrastructure put in place by
the functions changes, since all scripts must be changed accordingly.

So, I'm back with this yet-alternate solution, that passes a set of
extra args to the scripts, so it becomes possible to have a single (or
more!) script which can decide what to do, based on its arguments.

In my case, the arguments are a description file of the target:
  - the steps to execute post-build
  - the partitioning scheme(s) of the storage device(s)

Since it is using a description file, and the post scripts only read
that file for deciding what to do, a change in the functions API has no
impact on the main script.

Granted, a change in the description format will require all description
files to be updated, but that is *not* expected to happen too often.

Besides, this new solution is fully backward-compatible, so does not
break existing workflows.

Ready to hear^Wread comments! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
