From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Sep 2017 14:49:25 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: detect external glibc in
	symlinked /lib
In-Reply-To: <20170903142517.088907a8@windsurf.lan>
References: <20170903120835.16190-1-camh@xdna.net>
 <20170903141738.20c0d621@windsurf.lan>
 <CABa6e=pwRghNUx+WHY_AH22_Wh8mtvR54x8ApqH3Y11732mhng@mail.gmail.com>
 <20170903142517.088907a8@windsurf.lan>
Message-ID: <20170903124925.GA2786@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-09-03 14:25 +0200, Thomas Petazzoni spake thusly:
> On Sun, 3 Sep 2017 22:22:24 +1000, Cam Hutchison wrote:
> > > > When building a toolchain with buildroot and a merged /usr, /lib is
> > > > a symlink to usr/lib. This is copied from the target to the staging
> > > > directory, and then to the sysroot, and the ultimate location of the
> > > > required files is in /usr/lib in the sysroot.  
[--SNIP--]
> In fact, I would first like to understand what you meant :)
> 
> Maybe what you meant is that: when the Buildroot toolchain is built
> with a merged /usr, lib is a symlink to usr/lib in the staging
> directory. Therefore, the resulting toolchain has such a symlink in its
> sysroot, and such a symlink is present in the staging directory when
> the toolchain is re-used as an external toolchain. The consequence is
> that the dynamic linker is not located in /lib, but in /usr/lib, even
> though it is accessible from /lib from a symlink.

This is exactly the problem that Cam is trying to solve here.

Cam created a toolchain with Buildroot and a merged /usr. He then
re-uses that as an external toolchain.

Cam, what about the fiollowing:

    toolchain: detect external glibc in merged /usr

    When using an external toolchain that was built with Buildroot and a
    merged /usr., the dynamic linker is actually in /usr/lib.

    But the check_glibc macro only limits the depth it is looking for
    the dynamic linker, anf misses it when it is in /usr/lib because it
    is too deep.

    WE could fix that in two ways: increase the depth in which we look
    for it, or follow symlinks. We choose the second solution.

    Signed-off-by: you
    Cc: Thomas P.
    Cc: Thomas DS.
    Cc: Me

What do you all think about this? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
