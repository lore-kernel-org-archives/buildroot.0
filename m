From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 29 Sep 2020 08:28:07 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH 1/2] package/gdb: fix build
 of gdbserver-only on the ARC gdb version
In-Reply-To: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
References: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
Message-ID: <BN8PR12MB333074A0E66A061DCDA03620A1320@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
 
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Monday, September 28, 2020 11:11 PM
> To: Buildroot List <buildroot@buildroot.org>
> Cc: Romain Naour <romain.naour@gmail.com>; Yann E. MORIN <yann.morin.1998@free.fr>; ARC Maintainers <arc-buildroot@synopsys.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: [arc-buildroot] [PATCH 1/2] package/gdb: fix build of gdbserver-only on the ARC gdb version
>  
> The GDB version used on ARC is based on a recent gdb code base, post
> gdb 9.2. This recent gdb code base, which pre-figures what will be in
> gdb 10, has a significant change: gdbserver is not longer in
> gdb/gdbserver, but at the top-level, and the mechanism to build
> gdbserver only has changed. Due to this change, a build of ARC GDB for
> gdbserver only fails with:
> 
> /bin/bash: line 0: cd: /opt/output/build/gdb-arc-2020.03-release-gdb/gdb/gdbserver: No such file or directory
> 
> This commit adjusts gdb.mk to support four cases:
> 
>  - "old" gdb, gdbserver only
>  - "old" gdb, with the gdb debugger (and optionally gdbserver as well)
>  - "new" gdb, gdbserver only
>  - "new" gdb, with the gdb debugger (and optionally gdbserver as well)
> 
> A boolean GDB_GDBSERVER_TOPLEVEL is introduced to differentiate
> between the old and new gdb, it is set to "y" for gdb versions that
> have the gdbserver code at the top-level. For now, only the ARC
> version sets it, but in the future, upstream gdb version 10 will also
> have to set it.
> 
> Here is the behavior, for each case:
> 
>  (1) "old" gdb, gdbserver only
> 
>      We set GDB_SUBDIR to gdb/gdbserver, so only the configure script
>      in this folder gets called.
> 
>      --enable-gdbserver --disable-gdb are passed in CONF_OPTS.
> 
>  (2) "old" gdb, with the gdb debugger (and optionally gdbserver as well)
> 
>      We set GDB_SUBDIR to build/, an empty directory which allows to
>      do an out of tree build, which is mandatory for a full gdb build
>      since gdb 9.x.
> 
>      --enable-gdb is passed in CONF_OPTS as well as --enable-gdbserver
>      or --disable-gdbserver depending on whether gdbserver is enabled
>      as well.
> 
>  (3) "new" gdb, gdbserver only
> 
>      We set GDB_SUBDIR to build/, an empty directory which allows to
>      do an out of tree build, which is mandatory for a full gdb build
>      since gdb 9.x.
> 
>      --enable-gdbserver --disable-gdb are passed in CONF_OPTS.
> 
>  (4) "new" gdb, with the gdb debugger (and optionally gdbserver as well)
> 
>      We set GDB_SUBDIR to build/, an empty directory which allows to
>      do an out of tree build, which is mandatory for a full gdb build
>      since gdb 9.x.
> 
>      --enable-gdb is passed in CONF_OPTS as well as --enable-gdbserver
>      or --disable-gdbserver depending on whether gdbserver is enabled
>      as well.
> 
> In addition to these changes, some related changes are done as well:
> 
>  - We re-enable building both gdb and gdbserver on ARC, as it works
>    again.
> 
>  - We only pass --with-curses when curses is really provided, i.e when
>    the full debugger is being built.
> 

Thanks for taking care of that long-standing issue!

Tested-by: Alexey Brodkin <abrodkin@synopsys.com>

-Alexey
