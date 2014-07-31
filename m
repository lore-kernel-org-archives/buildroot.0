From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 19:07:50 +0200
Subject: [Buildroot] [PATCH V7 1/1] google-breakpad: Integration into
 Makefile and Config.in
In-Reply-To: <53DA088F.3020608@gmail.com>
References: <1406124545-17915-1-git-send-email-pascal.huerst@gmail.com>
 <1406124545-17915-2-git-send-email-pascal.huerst@gmail.com>
 <20140729230335.GD5846@free.fr> <53DA088F.3020608@gmail.com>
Message-ID: <20140731170750.GA3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2014-07-31 11:12 +0200, Pascal Huerst spake thusly:
> On 30.07.2014 01:03, Yann E. MORIN wrote:
> > On 2014-07-23 16:09 +0200, Pascal Huerst spake thusly:
> > For example, there is no host package for google breakpad, so it does
> > not work for me as I do not have googlebreakpad install on my host.
> 
> I thought it has, since in google-breakpad.mk it says:
> 
> 26 $(eval $(host-autotools-package))
> 
> and in my current version I have at least:
> 
> output/host/usr/bin/minidump-2-core
> output/host/usr/bin/minidump_dump
> output/host/usr/bin/minidump_stackwalk
> output/host/usr/bin/minidump_upload
> 
> I only need minidump_stackwalk, to process minidumps. So that looked ok
> to me.

I do not have those files. Here's what I did:

    make defconfig
    make menuconfig
        -> use an external toolchain, to avoid the build time
        -> enable google-breakpad in Build options
        -> add /bin/busybox to be 'breakpadised'
        -> save and exit
    make
    [--SNIP--]
    >>>   Finalizing target directory
    PATH="/home/ymorin/dev/buildroot/O/host/bin:/home/ymorin/dev/buildroot/
    O/host/sbin:/home/ymorin/dev/buildroot/O/host/usr/bin:/home/ymorin/dev/
    buildroot/O/host/usr/sbin:/home/ymorin/bin:/home/ymorin/bin:/opt/mutt-s
    idebar/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    :/usr/games:/usr/local/games" BR2_DL_DIR=/home/ymorin/src BUILD_DIR=/ho
    me/ymorin/dev/buildroot/O/build package/google-breakpad/gen-syms.sh /ho
    me/ymorin/dev/buildroot/O/host/usr/i686-buildroot-linux-gnu/sysroot /ho
    me/ymorin/dev/buildroot/O/target /bin/busybox
    Error dumping symbols for: '/home/ymorin/dev/buildroot/O/target//bin/bu
    sybox'
    make[1]: *** [target-finalize] Error 1

Looking in host/usr/bin, I do not have the minidump executables.

That's because nothing depends on host-google-breakpad, so it is not
built.

I'll fix that before I respin a fixed patch.

> > Also, I now know why you need this eval in the script. I do not like it,
> > so I'll try to come up with an alternative solution. Still, I have one
> > question: do you expect that one would enter shell wildcards in the list
> > of files to "breakpadize"?
> 
> Originally I wanted to be able to use wildcards and took the stripping
> mechanism (BR2_STRIP_EXCLUDE_FILES) as an example, but people didn't
> like it, so I adapted it. But actually I would say it's better to be
> able to use wildcards.

I (still) have some comments on your script. I'll see what I can come up
with to fix that. I'll respin a new version later tonight.

> We are not using breakpad in production yet, but are integrating and
> maybe we'll find out later, that wildcards are useless, but for now, I
> would say, why not...
> 
> I also found out that `make install` does not install the headers and
> *.pc files. I'm in contact with the folks from breakpad to get this
> fixed. But this means that a version boost will also be needed as soon
> as that patch is upstream.

Bumping a package is not a problem! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
