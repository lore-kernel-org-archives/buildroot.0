From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 12:28:07 +0100
Subject: [Buildroot] [RFC 00/11] common init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <20150322112807.GA4724@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2015-03-21 20:26 +0200, Alex Suykov spake thusly:
> This series is intended to clean up buildroot init system somewhat,
> removing the need for extensive sysv and systemd handling code
> in every package that installs init bits, and allowing alternative
> init systems to be implemented with reasonable amount of effort.
> 
> Overview of the changes:
> 
> * drop per-package sysv and systemd files, introduce common format
>   used to generate files for both of them, use a script to do
>   the conversion from common format to sysv or systemd.

I have not delve too deep in the implementation (because, Python! ;-) ),
but from the examples, it seems it would still be possible to start more
than one "daemon" for a service, like is done by samba, right?

> * remove sysv and systemd installation code from package .mk files,
>   let pkg-generic handle it.
> 
> * remove sysv-specific files from skeleton, and sysv-specific hacks
>   from system/system.mk. Use a dedicated script to write inittab,
>   handling global conditionals (root rw/ro, serial getty and so on)
> 
> * remove user definitions from package .mk files, and mkdirs from
>   per-package sysv initscript, use per-package .users and .files
>   instead in a way similar to .hash files.

How do you handle conditional creation of users/groups? Let's take a
supposed package that can install a server and/or a client (like a SQL
related package, for example). The server (sqld) needs a specific
user+group, but the client (sql-cli) does not. Currently, this is easily
done by emclosing the user defintion between a 'if server' block.

> Expected benefits:
> 
> * (almost) all packages get both sysv and systemd files at the same
>   time and without the need to support them separately.
> 
> * init-related changes can be introduced without patching
>   all 70+ individual packages that install startup files.
> 
> * new init systems can be introduced with only minor effort,
>   including lightweight ones with controlled (foreground) daemons.
> 
> This series includes the infrastructure changes, and a couple of
> package patches to show how it looks like. Complete set of package
> patches uploaded here: https://github.com/arsv/br/

It would be much nicer if you were to push your branch there, rather
than a set of patches. Having a branch would mean we could fetch from
it.

> This series is for reviewing, not for merging.

One thing that is wrong throughout the series, is that you hard-code the
path to "outoput/" and this breaks out-of-tree builds [0]. You should use
$(BASE_DIR) instead.

[0] http://buildroot.net/downloads/manual/manual.html#_building_out_of_tree

Also, I think this series is changing a lot of different things at the
same time. For example, there is infra changes to handle:
  - init script,
  - users/groups,
  - skeleton /etc/ stuff

This series should be split in simpler sub-series, or at least into much
simpler patches. For example, patch 4/11 that adds help entries to init
systems could probably sent first (after a bit of rewording to remove
references to the new init infra), because it is a valuable addition,
and it does not really depend on the new infra.

Otherwise, I have a feeling this is pushing things a bit too far. I'm
usually very happy with "abstraction" and I more than once have pushed
for such changes. However, in this area, I'm a bit sceptic as to whether
we should introduce our own "initscript" format (the '.run' files).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
