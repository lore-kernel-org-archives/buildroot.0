From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 18:21:48 +0100
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <609383214.9983962.1486911337173.JavaMail.zimbra@datacom.ind.br>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
 <20170212141425.GE11105@free.fr>
 <609383214.9983962.1486911337173.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170212172148.GG11105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-02-12 12:55 -0200, Carlos Santos spake thusly:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: buildroot at buildroot.org, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, arnout at mind.be,
> > gustavo at zacarias.com.ar
> > Sent: Sunday, February 12, 2017 12:14:25 PM
> > Subject: Re: [PATCH v2] infra/ccache: avoid color diagnostics with GCC older than v4.9
> 
> > Carlos, All,
> > 
> > On 2017-02-12 09:33 -0200, Carlos Santos spake thusly:
> >> Ensure that the GCC_COLORS environment variable is empty when calling
> >> ccache. When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to
> >> GCC but this flag requires GCC v4.9 or later. Older versions complain
> >> about the unrecognized command line option.
> > 
> > So, while fixing my own patch about the issue [0], I noticed that I was
> > not even able to make it fail in the first place...
> > 
> > I'm using this defconfig, which uses a gcc-4.7:
> > 
> >    BR2_x86_i686=y
> >    BR2_CCACHE=y
> >    BR2_TOOLCHAIN_EXTERNAL=y
> > 
> > and Thomas reported he was also unable to reproduce the failure with:
> > 
> >    BR2_sh=y
> >    BR2_sh4a=y
> >    BR2_CCACHE=y
> >    BR2_TOOLCHAIN_EXTERNAL=y
> >    BR2_INIT_NONE=y
> >    BR2_SYSTEM_BIN_SH_NONE=y
> >    # BR2_PACKAGE_BUSYBOX is not set
> >    BR2_PACKAGE_DEVMEM2=y
> >    # BR2_TARGET_ROOTFS_TAR is not set
> > 
> > which also uses gcc-4.7.
> > 
> > Can you provide a reliable way to reproduce the issue, please?
> 
> What does "echo $GCC_COLORS" say? And remember that you must not
> redirect the output to a file or pipe.

The GCC_COLORS are the default as dopcumented in the man page for gcc-5.

    $ cat defconfig
    BR2_x86_i686=y
    BR2_CCACHE=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_LIBCEC=y
    $ export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
    $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
    $ make busybox libcec

And the build does not fail... :-/

So I did a few other tentative:

    $ rm -rf ~/.buildroot-ccache/*/
    $ echo log_file = /home/ymorin/meh >> ~/.buildroot-ccache/ccache.conf
    $ touch meh.c
    $ ./host/usr/bin/i686-pc-linux-gnu-gcc -c -o meh.o meh.c
    $ ~/meh
    [2017-02-12T18:19:31.365731 7668 ] === CCACHE 3.3.3 STARTED =========================================
    [2017-02-12T18:19:31.365731 7668 ] Config: (environment) base_dir = /home/ymorin/dev/buildroot/O
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) cache_dir = /home/ymorin/.buildroot-ccache
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) cache_dir_levels = 2
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) compiler = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) compiler_check = mtime
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) compression = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) compression_level = 6
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) cpp_extension = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) direct_mode = true
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) disable = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) extra_files_to_hash = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) hard_link = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) hash_dir = true
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) ignore_headers_in_manifest = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) keep_comments_cpp = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) limit_multiple = 0.8
    [2017-02-12T18:19:31.365731 7668 ] Config: (/home/ymorin/.buildroot-ccache/ccache.conf) log_file = /home/ymorin/meh
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) max_files = 0
    [2017-02-12T18:19:31.365731 7668 ] Config: (/home/ymorin/.buildroot-ccache/ccache.conf) max_size = 5.0G
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) path = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) prefix_command = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) prefix_command_cpp = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) read_only = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) read_only_direct = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) recache = false
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) run_second_cpp = true
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) sloppiness = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) stats = true
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) temporary_dir = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) umask = 
    [2017-02-12T18:19:31.365731 7668 ] Config: (default) unify = false
    [2017-02-12T18:19:31.365999 7668 ] Command line: /home/ymorin/dev/buildroot/O/host/usr/bin/ccache /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/i686-pc-linux-gnu-gcc --sysroot /home/ymorin/dev/buildroot/O/host/usr/i686-buildroot-linux-gnu/sysroot -march=i686 -c -o meh.o meh.c
    [2017-02-12T18:19:31.366080 7668 ] Hostname: gourin
    [2017-02-12T18:19:31.366157 7668 ] Working directory: /home/ymorin/dev/buildroot/O
    [2017-02-12T18:19:31.366280 7668 ] Automatically enabling colors
    [2017-02-12T18:19:31.366312 7668 ] Source file: meh.c
    [2017-02-12T18:19:31.366331 7668 ] Object file: meh.o
    [2017-02-12T18:19:31.366367 7668 ] Trying direct lookup
    [2017-02-12T18:19:31.366441 7668 ] Looking for object file hash in /home/ymorin/.buildroot-ccache/e/2/095355fd431a7dfa30fcd2c18aa6c7-359.manifest
    [2017-02-12T18:19:31.366468 7668 ] No such manifest file
    [2017-02-12T18:19:31.366486 7668 ] Did not find object file hash in manifest
    [2017-02-12T18:19:31.366695 7668 ] Running preprocessor
    [2017-02-12T18:19:31.366720 7668 ] Executing /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/i686-pc-linux-gnu-gcc --sysroot host/usr/i686-buildroot-linux-gnu/sysroot -march=i686 -fdiagnostics-color -E meh.c
    [2017-02-12T18:19:31.368786 7668 ] Preprocessor gave exit status 1
    [2017-02-12T18:19:31.368834 7668 ] Failed; falling back to running the real compiler
    [2017-02-12T18:19:31.368847 7668 ] Executing /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/i686-pc-linux-gnu-gcc --sysroot /home/ymorin/dev/buildroot/O/host/usr/i686-buildroot-linux-gnu/sysroot -march=i686 -c -o meh.o meh.c
    [2017-02-12T18:19:31.368943 7668 ] lockfile_acquire: symlink /home/ymorin/.buildroot-ccache/c/stats.lock: No such file or directory
    [2017-02-12T18:19:31.369031 7668 ] Acquired lock /home/ymorin/.buildroot-ccache/c/stats.lock
    [2017-02-12T18:19:31.369147 7668 ] Releasing lock /home/ymorin/.buildroot-ccache/c/stats.lock
    [2017-02-12T18:19:31.369163 7668 ] Unlink /home/ymorin/.buildroot-ccache/c/stats.lock
    [2017-02-12T18:19:31.369189 7668 ] Result: preprocessor error

Hope you can make something out of this.

BTW, I never trusted ccache; it only ever brought me more headaches on
which I spent more time than it ever saved me...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
