From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Jun 2015 22:21:18 +0200
Subject: [Buildroot] [PATCH 1/1] system: make sh symlink match original
 busybox symlink path
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B067710BE@hed-dc01.hed.local>
References: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E6F@hed-dc01.hed.local>
 <20150616163146.GA5730@free.fr>
 <64CA5C49A43E314D9F7DAE05370E2F7B067710BE@hed-dc01.hed.local>
Message-ID: <20150616202118.GA3643@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

[Please, wrap your lines at ~72 chars wide, it is easier to read...]

On 2015-06-16 12:31 -0500, Matthew Starr spake thusly:
> > -----Original Message-----
> > From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com]
> > Matthew, All,
> > 
> > On 2015-06-16 10:41 -0500, Matthew Starr spake thusly:
> > > The symlink created by buildroot for /bin/sh when busybox is used is
> > > the full path to /bin/busybox and does not match the symlink created
> > > by busybox for /bin/sh, which is just busybox.  When handling files on
> > > the host system this will point to the host system's busybox if
> > > present and not the target busybox.
> > 
> > I fail to see the problem that would cause. We have quite a few other
> > absolute symlinks. Do we want to fix all of them?
> 
> This is an absolute symlink that will affect everyone who may want to
> perform a checksum of the system or possibly perform other actions on
> files for the target while on the host system.  I have yet to encounter
> other symlinks that have this issue,

/etc/mtab is an absolute symlink to /proc/mounts for example. This one
comes from our skeletton, but I haven't looked if other packages are not
installing absolute symlinks either.

> not to say there aren't any, but
> this one is an important one.
> > 
> > Note: yes, I thinf I know what your problenm is, that is checksuming-or-such
> > the content of each file. I believe this is wrong, because that would miss the
> > information that this is actually a *symlink*, and would not detect the fact
> > that is is replacec with an actual file (and hence takes more place on the
> > device than is expected).
> 
> Yes, doing a checksum on the host and comparing to the installed target
> is the functionality I am using to ensure a correct install.

And I still believe it is *wrong* to checksum the content of the files
pointed to by a symlink, because it that case, you are missing an
important information that it *has* to be a symlink (e.g. in case the
tarball is extracted on a filesystem that does not understand symlinks.

But Oh, well, that's not my problem! ;-)

> > I would find it much smarter that:
> >   - files get their content checksumed
> >   - symlinks get their target path checksumed, not the content of the
> >     target file (or dir). I.e. symlinks should not be dereferenced.
> 
> I agree this would be a smarter approach, but I have yet to see a simple
> utility to do this.

    cd /path/to/target/
    find . -type f -exec sha1sum {} + >/pat/to/file-list.sha1
    find . -type l -exec |while read l; do 
        printf "%s\t%s\n" "${l}" "$(readlink "${l}")";
    done >/pat/to/symlink-list.readlink

> Additionally this was not an issue in previous versions of buildroot
> before BR2_SYSTEM_BIN_SH was created in 2014.11. In the previous
> version the /bin/sh symlink was just busybox.

I still fail to see that as a problem. ;-) However, that is a change in
behaviour, so OK.

> > >  	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
> > >  	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
> > >  	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
> > 
> > If you contend that /bin/sh being an absolute symlink is an issue, then surely
> > the other shells should be treated the same, i.e. they should be madde
> > relative symlinks.
> 
> I have looked at several different Linux distributions and they all seem
> to use relative paths for the /bin/sh symlink. Based on this then the
> /bin/sh symlink to bash, dash, and zsh should also be updated to be
> relative.

Well, relative or absolute really does not matter. But for consiistency,
we must do the same for all shells. (IMHO)

> > All that matters in the end is that the symlink is correct *on the target".  I'm
> > not sure this change is interesting without a good reason; and I don't think
> > you 10.192.168.1gave a good-enough reason; saying "the symlink is different

He! Did I paste an IP adress in there? ;-)

> > than what busybox installs" is not a valid reason IMHO.
> 
> Dealing with symlinks when you are not on the installed system or in a
> chroot environment  is made more difficult by the use of absolute symlinks.
> If managing symlinks on the host is required, then just having it correct
> on the target is not enough.

Again, I fail to see that as a problem. If your tooling is deffective in
that it does not understand what a relative symlink is, fix your tooling.

But OK, if you respin with all shells switched to using realtive
symlink, and keep the if-clause aligned, I'll ack the patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
