From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Nov 2015 23:30:50 +0100
Subject: [Buildroot] [PATCH] support/dependencies: ensure we have 'file'
 on the host
In-Reply-To: <5658E868.5090006@mind.be>
References: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
 <5658C8C7.4080104@mind.be> <20151127230443.GD4144@free.fr>
 <5658E868.5090006@mind.be>
Message-ID: <20151128223049.GE3816@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-28 00:34 +0100, Arnout Vandecappelle spake thusly:
> On 28-11-15 00:04, Yann E. MORIN wrote:
> > On 2015-11-27 22:19 +0100, Arnout Vandecappelle spake thusly:
> >> On 27-11-15 21:02, Yann E. MORIN wrote:
> >>> When 'file' is missing on the host, libtool fails miserably. Packages
> >>> that use libtool will suddenly FTBFS, with cryptic error messages, like
> >>> missing libraries on the linker invocation.
[--SNIP--]
> >>  bandwidthd doesn't even have a libtool...
> >>
> >>  Could you give a concrete example of where libtool uses file?
> > 
> > Damn... It seems I confused the netsnmp and the bandwidthd cases.
> > 
> > If you look at netsnmp, they have all this blurb about file being
> > required for libtool otherwise it breaks, in configure.d/config_os_progs
> > And indeed, my minimalistic chroot does not have file installed.
> 
>  Well, I ran
> 
> strace -f -e trace=execve make netsnmp

OK, so I have some more info on this. Not yet completely clear-cut, but
here it goes...

Target: mips64el
Libraries: shared only
Toolchain: http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2015.11-rc1-71-g90d1299.tar.bz2

The failing package is still bandwidthd, with messages like:

    /home/buildroot/autobuild/reproduce/O/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/libpng16.a(pngrutil.o):
    In function `.L78':
    pngrutil.c:(.text+0x55c): undefined reference to `inflate'
    pngrutil.c:(.text+0x56c): undefined reference to `inflate'

So, what strikes me odd here, is that it is trying to link to the static
variant of libpng. And indeed, the shared variant is not installed.

And it does not try to link with -lz, which is a dependency of libpng,
not badnwidthd, so it is expected. In shared case, libz would be pulled
because it is a NEEDED of libpng.  (See not [0], too)

Weird, considering that static are disabled, and we are supposed to only
build shared libs.

OK, let's see why libpng does not install a shared library:

    checking whether the /home/buildroot/autobuild/reproduce/O/host/usr/bin/mips64el-linux-gcc linker
    (/home/buildroot/autobuild/reproduce/O/host/usr/bin/mips64el-linux-ld -m elf) supports shared libraries...
    /home/buildroot/autobuild/reproduce/O/host/usr/bin/mips64el-linux-ld: unrecognised emulation mode: elf
    Supported emulations: elf32ltsmipn32 elf32btsmipn32 elf32ltsmip
    elf32btsmip elf64ltsmip elf64btsmip
    no

Uh-oh... Weird.

Ah, what's a few line above, then?

    ./configure: line 6838: /usr/bin/file: No such file or directory
    ./configure: line 6846: /usr/bin/file: No such file or directory
    ./configure: line 6854: /usr/bin/file: No such file or directory

Haha... So, where do these come from?

Looking at the output of ./configure, and at configure.ac, the 'file'
errors are right between:
     AC_PROG_MAKE_SET
and
    AC_MSG_CHECKING([that AWK works])

And guess what's in there? Hint: I already spoke about it...

    LT_INIT([win32-dll])
    LT_PREREQ([2.4.2])

Ah... libtool... But then, what's really failing, that libtool requires
'file' for?

    case $host in
    [...]
    mips64*-*linux*)
    [...]
    (eval $ac_compile) 2>&5
    [...]
        case `/usr/bin/file conftest.$ac_objext` in
          *32-bit*)
            emul="${emul}32"
            ;;
          *64-bit*)
            emul="${emul}64"
            ;;
        esac

(the two other failures are similar)

So, libtool injects code that checks the output of a compilation to see
what type of file was generated. And of course, it fails miserably...


So, the failing package, bandwidthd, is not the culprit. It is jut the
trigger. The real failure is earlier in the dependency chain. Damn...

I hope this is enough information to warant the commit log that libtool
is foobared when 'file' is not present? Yes, I can add some more details
now, but I will certainly not duplicate all that message in the commit
log.


[0] Now I wonder if we would have a similar build failure in a real
static-only scenario... Afterall, libpng install a .la file with -lz in
there... But of course, in our failing test, that .la file is not used,
because we're not even supposed to attempt a static link, but a shared
link.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
