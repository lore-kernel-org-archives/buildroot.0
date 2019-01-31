From: Gerhard Heift <gerhard@heift.name>
Date: Thu, 31 Jan 2019 13:59:28 +0100
Subject: [Buildroot] [PATCH] store debug information in
 $HOST_DIR/lib/debug
In-Reply-To: <CAAXf6LV8bLx0Fc_HviELwbwAAR6bLeGi+kdRTc_QRJvq9k5B-g@mail.gmail.com>
References: <20190123131539.24699-1-Gerhard@Heift.Name>
 <CAAXf6LV8bLx0Fc_HviELwbwAAR6bLeGi+kdRTc_QRJvq9k5B-g@mail.gmail.com>
Message-ID: <CACeaM8-HzGuX9sr_X8VsPY3azmUHHrCZV6cVVyheWwWsXfDB6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 30. Jan. 2019 um 21:29 Uhr schrieb Thomas De Schampheleire
<patrickdepinguin@gmail.com>:
>
> El mi?., 23 ene. 2019 a las 14:22, Gerhard Heift
> (<gerhard@heift.name>) escribi?:
> >
> > Before striping the binaries in $TARGET_DIR, the debug information is saved to
> > $HOST_DIR/lib/debug using the following command as described in [1]:
> >
> >   $ objcopy --only-keep-debug --compress-debug-sections $file
> >
> > This allows remote debugging as described in section 8.12.2 with striped
> > binaries in the final image. Therefore the build ID is included during the build
> > process, if debug information is enabled via BR2_ENABLE_DEBUG.
> >
> > [1] https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html
> >
> > Signed-off-by: Gerhard Heift <Gerhard@Heift.Name>
> > ---
> >  Makefile                   |  6 ++---
> >  package/Makefile.in        | 12 ++++++---
> >  support/scripts/copy-debug | 52 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 63 insertions(+), 7 deletions(-)
> >  create mode 100755 support/scripts/copy-debug
> >
>
> If I understand this correctly then the sysroot you'd specify in gdb
> would be this new directory output/host/lib/debug, right?
> Previously this gdb sysroot was set as output/staging, see
> toolchain/helpers.mk. I believe that path should be adapted in your
> patch.
>
> It's unclear to me why you selected 'output/host/lib/debug' as path:
> this is not about host stuff but target stuff. Moreover, it's also not
> only about 'lib' but also binaries.

I just started the cross debugger as mentioned in [1] with
  $ host/bin/<tuple>-gdb -x staging/usr/share/buildroot/gdbinit
target/usr/bin/ls
and let gdb show me, where it searchs for the debug symbols with (see [2]):
  (gdb) show debug-file-directory
which outputs the following:

  > The directory where separate debug symbols are searched for is
"$HOST_DIR/lib/debug".

This is the reason, why I selected this path. I don't need to change
anything else beside adding the build-id and copying the symbols to
this path with the provided wrapper.

If you want to store the debug information in another location, either
the gdbinit generation has to be adjusted in toolchain/helpers.mk to
contain something like
  set debug-file-directory $DEBUGDIR
or the directory has to be provided to the configuration script of gdb
in packages/gdb/gdb.mk like this
  HOST_GDB_CONF_OPTS += --with-separate-debug-dir=$DEBUGDIR

The default directory is derived from the prefix and libdir [3], where
in this case prefix=$HOST_DIR and libdir=$prefix/lib and therefore
DEBUGDIR=$HOST_DIR/lib/debug
which is the directory I used with this patch.

If another location is disered, I am happy to provied an extended
patch, either by extending the gdbinit generation or by adding the
configuration option for gdb.

If I understand the directory hierarchy correct, then the debug
symbols should be located under
DEBUGDIR=$STAGING_DIR/usr/lib/debug
Is this correct?

> Do you have some numbers regarding size impact on the buildroot
> directory as a whole for a typical build?

I just did a test with my personal build and it looks like the
build-id, which is added to identify the debugging symbols, increses
each binary or library by 56 to 60 bytes.

> Best regards,
> Thomas

Best regards,
  Gerhard

[1] https://buildroot.org/downloads/manual/manual.html#_using_literal_gdb_literal_in_buildroot
[2] https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html
[3] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=gdb/configure.ac;h=d4133ea71e2207c459cab0cadf51a810fe200141;hb=f99d9b9f436dce02aa06839395c67d400b2a0de0#l120
