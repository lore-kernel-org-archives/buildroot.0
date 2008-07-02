From: hartleys <hartleys@visionengravers.com>
Date: Tue, 1 Jul 2008 20:13:26 -0400
Subject: [Buildroot] Readline build error
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909297509@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

During the build of readline I get the following error:

/usr/local/arm/4.1.1-920t/bin/arm-linux-gcc -Os
-I/home/bigguiness/buildroot/build_arm/staging_dir/include
-I/home/bigguiness/buildroot/build_arm/staging_dir/usr/include
-I/usr/local/arm/4.1.1-920t/arm-linux/include -shared
-Wl,-soname,libreadline.so.5.2 -L./lib/termcap -Wl,-rpath,/usr/lib
-Wl,-soname,`basename libreadline.so.5.2 .2` -o libreadline.so.5.2
readline.so vi_mode.so funmap.so keymaps.so parens.so search.so rltty.so
complete.so bind.so isearch.so display.so signals.so util.so kill.so
undo.so macro.so input.so callback.so terminal.so text.so nls.so misc.so
xmalloc.so history.so histexpand.so histfile.so histsearch.so shell.so
mbutil.so tilde.so compat.so -lncurses
/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1/../../../../arm
-linux-uclibc/bin/ld: cannot find -lncurses
collect2: ld returned 1 exit status
make[2]: *** [libreadline.so.5.2] Error 1
make[2]: Leaving directory
`/home/bigguiness/buildroot/build_arm/readline-5.2/shlib'
make[1]: [shared] Error 2 (ignored)
make[1]: Leaving directory
`/home/bigguiness/buildroot/build_arm/readline-5.2'

Previous to that the ncurses build completed with no problems and
$(STAGING_DIR)/lib contains the library files.

It appears the final link does not have the LDFLAGS set correctly to
find -lncurses.

I had a similar problem with grep not finding -lintl and got around it
with the following patch to grep.mk:

@@ -29,6 +29,7 @@
        (cd $(GNUGREP_DIR); rm -rf config.cache; \
                $(TARGET_CONFIGURE_OPTS) \
                $(TARGET_CONFIGURE_ARGS) \
+               LDFLAGS="$(TARGET_LDFLAGS) -lintl" \
                ./configure \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \

But this seems "wrong" to me.

Any idea where I might have something configured wrong?

Thanks,
Hartley
