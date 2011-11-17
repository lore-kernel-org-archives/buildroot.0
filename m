From: Konrad Eisele <konrad@gaisler.com>
Date: Thu, 17 Nov 2011 15:18:09 +0100
Subject: [Buildroot] [PATCH 2/2] Example of how to define a subtree using
	kconfig tag "subsource": package/busybox/busybox-1.19.x.in is
	a flattend version of busybox-1.19.3's kconfig scripts
	(all-in-one). package/busybox/Config.in adds this Kconfig as
	a subtree to the main configuration tree: subsource
	"package/busybox/busybox-1.19.x.in" "package/busybox/"
	"package/busybox/busybox-1.19.x.config" "Busybox 1.19.x
	configuration" BUSYBOX_ CONFIG_
	package/busybox/busybox-1.19.x.config is used as the .config
	for this subtree. config BR2_BUSYBOX_VERSION_1_19_X has to be
	selected for the subtree to show up.
In-Reply-To: <1321539489-19737-1-git-send-email-konrad@gaisler.com>
References: <1321539489-19737-1-git-send-email-konrad@gaisler.com>
Message-ID: <1321539489-19737-3-git-send-email-konrad@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/busybox/Config.in         |   11 +
 package/busybox/busybox-1.19.x.in | 8003 +++++++++++++++++++++++++++++++++++++
 2 files changed, 8014 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.19.x.in

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 4176020..a97d3dd 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -36,6 +36,7 @@ choice
 
 endchoice
 
+
 config BR2_BUSYBOX_VERSION
 	string
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
@@ -71,3 +72,13 @@ if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
        default y
 endif
+
+if BR2_BUSYBOX_VERSION_1_19_X
+
+menu "Busybox 1.19.x configuration"
+
+subsource "package/busybox/busybox-1.19.x.in" "package/busybox/" "package/busybox/busybox-1.19.x.config" "Busybox 1.19.x configuration"  BUSYBOX_ CONFIG_
+
+endmenu
+
+endif
diff --git a/package/busybox/busybox-1.19.x.in b/package/busybox/busybox-1.19.x.in
new file mode 100644
index 0000000..024ed92
--- /dev/null
+++ b/package/busybox/busybox-1.19.x.in
@@ -0,0 +1,8003 @@
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+mainmenu "BusyBox Configuration"
+
+config HAVE_DOT_CONFIG
+	bool
+	default y
+
+menu "Busybox Settings"
+
+menu "General Configuration"
+
+config DESKTOP
+	bool "Enable options for full-blown desktop systems"
+	default y
+	help
+	  Enable options and features which are not essential.
+	  Select this only if you plan to use busybox on full-blown
+	  desktop machine with common Linux distro, not on an embedded box.
+
+config EXTRA_COMPAT
+	bool "Provide compatible behavior for rare corner cases (bigger code)"
+	default n
+	help
+	  This option makes grep, sed etc handle rare corner cases
+	  (embedded NUL bytes and such). This makes code bigger and uses
+	  some GNU extensions in libc. You probably only need this option
+	  if you plan to run busybox on desktop.
+
+config INCLUDE_SUSv2
+	bool "Enable obsolete features removed before SUSv3"
+	default y
+	help
+	  This option will enable backwards compatibility with SuSv2,
+	  specifically, old-style numeric options ('command -1 <file>')
+	  will be supported in head, tail, and fold. (Note: should
+	  affect renice too.)
+
+config USE_PORTABLE_CODE
+	bool "Avoid using GCC-specific code constructs"
+	default n
+	help
+	  Use this option if you are trying to compile busybox with
+	  compiler other than gcc.
+	  If you do use gcc, this option may needlessly increase code size.
+
+config PLATFORM_LINUX
+	bool "Enable Linux-specific applets and features"
+	default y
+	help
+	  For the most part, busybox requires only POSIX compatibility
+	  from the target system, but some applets and features use
+	  Linux-specific interfaces.
+
+	  Answering 'N' here will disable such applets and hide the
+	  corresponding configuration options.
+
+choice
+	prompt "Buffer allocation policy"
+	default FEATURE_BUFFERS_USE_MALLOC
+	help
+	  There are 3 ways BusyBox can handle buffer allocations:
+	  - Use malloc. This costs code size for the call to xmalloc.
+	  - Put them on stack. For some very small machines with limited stack
+	    space, this can be deadly. For most folks, this works just fine.
+	  - Put them in BSS. This works beautifully for computers with a real
+	    MMU (and OS support), but wastes runtime RAM for uCLinux. This
+	    behavior was the only one available for BusyBox versions 0.48 and
+	    earlier.
+
+config FEATURE_BUFFERS_USE_MALLOC
+	bool "Allocate with Malloc"
+
+config FEATURE_BUFFERS_GO_ON_STACK
+	bool "Allocate on the Stack"
+
+config FEATURE_BUFFERS_GO_IN_BSS
+	bool "Allocate in the .bss section"
+
+endchoice
+
+config SHOW_USAGE
+	bool "Show terse applet usage messages"
+	default y
+	help
+	  All BusyBox applets will show help messages when invoked with
+	  wrong arguments. You can turn off printing these terse usage
+	  messages if you say no here.
+	  This will save you up to 7k.
+
+config FEATURE_VERBOSE_USAGE
+	bool "Show verbose applet usage messages"
+	default y
+	depends on SHOW_USAGE
+	help
+	  All BusyBox applets will show more verbose help messages when
+	  busybox is invoked with --help. This will add a lot of text to the
+	  busybox binary. In the default configuration, this will add about
+	  13k, but it can add much more depending on your configuration.
+
+config FEATURE_COMPRESS_USAGE
+	bool "Store applet usage messages in compressed form"
+	default y
+	depends on SHOW_USAGE
+	help
+	  Store usage messages in compressed form, uncompress them on-the-fly
+	  when <applet> --help is called.
+
+	  If you have a really tiny busybox with few applets enabled (and
+	  bunzip2 isn't one of them), the overhead of the decompressor might
+	  be noticeable. Also, if you run executables directly from ROM
+	  and have very little memory, this might not be a win. Otherwise,
+	  you probably want this.
+
+config FEATURE_INSTALLER
+	bool "Support --install [-s] to install applet links at runtime"
+	default y
+	help
+	  Enable 'busybox --install [-s]' support. This will allow you to use
+	  busybox at runtime to create hard links or symlinks for all the
+	  applets that are compiled into busybox.
+
+config INSTALL_NO_USR
+	bool "Don't use /usr"
+	default n
+	help
+	  Disable use of /usr. busybox --install and "make install"
+	  will install applets only to /bin and /sbin,
+	  never to /usr/bin or /usr/sbin.
+
+config LOCALE_SUPPORT
+	bool "Enable locale support (system needs locale for this to work)"
+	default n
+	help
+	  Enable this if your system has locale support and you would like
+	  busybox to support locale settings.
+
+config UNICODE_SUPPORT
+	bool "Support Unicode"
+	default y
+	help
+	  This makes various applets aware that one byte is not
+	  one character on screen.
+
+	  Busybox aims to eventually work correctly with Unicode displays.
+	  Any older encodings are not guaranteed to work.
+	  Probably by the time when busybox will be fully Unicode-clean,
+	  other encodings will be mainly of historic interest.
+
+config UNICODE_USING_LOCALE
+	bool "Use libc routines for Unicode (else uses internal ones)"
+	default n
+	depends on UNICODE_SUPPORT && LOCALE_SUPPORT
+	help
+	  With this option on, Unicode support is implemented using libc
+	  routines. Otherwise, internal implementation is used.
+	  Internal implementation is smaller.
+
+config FEATURE_CHECK_UNICODE_IN_ENV
+	bool "Check $LANG environment variable"
+	default n
+	depends on UNICODE_SUPPORT && !UNICODE_USING_LOCALE
+	help
+	  With this option on, Unicode support is activated
+	  only if LANG variable has the value of the form "xxxx.utf8"
+
+	  Otherwise, Unicode support will be always enabled and active.
+
+config SUBST_WCHAR
+	int "Character code to substitute unprintable characters with"
+	depends on UNICODE_SUPPORT
+	default 63
+	help
+	  Typical values are 63 for '?' (works with any output device),
+	  30 for ASCII substitute control code,
+	  65533 (0xfffd) for Unicode replacement character.
+
+config LAST_SUPPORTED_WCHAR
+	int "Range of supported Unicode characters"
+	depends on UNICODE_SUPPORT
+	default 767
+	help
+	  Any character with Unicode value bigger than this is assumed
+	  to be non-printable on output device. Many applets replace
+	  such chars with substitution character.
+
+	  The idea is that many valid printable Unicode chars are
+	  nevertheless are not displayed correctly. Think about
+	  combining charachers, double-wide hieroglyphs, obscure
+	  characters in dozens of ancient scripts...
+	  Many terminals, terminal emulators, xterms etc will fail
+	  to handle them correctly. Choose the smallest value
+	  which suits your needs.
+
+	  Typical values are:
+	  126 - ASCII only
+	  767 (0x2ff) - there are no combining chars in [0..767] range
+			(the range includes Latin 1, Latin Ext. A and B),
+			code is ~700 bytes smaller for this case.
+	  4351 (0x10ff) - there are no double-wide chars in [0..4351] range,
+			code is ~300 bytes smaller for this case.
+	  12799 (0x31ff) - nearly all non-ideographic characters are
+			available in [0..12799] range, including
+			East Asian scripts like katakana, hiragana, hangul,
+			bopomofo...
+	  0 - off, any valid printable Unicode character will be printed.
+
+config UNICODE_COMBINING_WCHARS
+	bool "Allow zero-width Unicode characters on output"
+	default n
+	depends on UNICODE_SUPPORT
+	help
+	  With this option off, any Unicode char with width of 0
+	  is substituted on output.
+
+config UNICODE_WIDE_WCHARS
+	bool "Allow wide Unicode characters on output"
+	default n
+	depends on UNICODE_SUPPORT
+	help
+	  With this option off, any Unicode char with width > 1
+	  is substituted on output.
+
+config UNICODE_BIDI_SUPPORT
+	bool "Bidirectional character-aware line input"
+	default n
+	depends on UNICODE_SUPPORT && !UNICODE_USING_LOCALE
+	help
+	  With this option on, right-to-left Unicode characters
+	  are treated differently on input (e.g. cursor movement).
+
+config UNICODE_NEUTRAL_TABLE
+	bool "In bidi input, support non-ASCII neutral chars too"
+	default n
+	depends on UNICODE_BIDI_SUPPORT
+	help
+	  In most cases it's enough to treat only ASCII non-letters
+	  (i.e. punctuation, numbers and space) as characters
+	  with neutral directionality.
+	  With this option on, more extensive (and bigger) table
+	  of neutral chars will be used.
+
+config UNICODE_PRESERVE_BROKEN
+	bool "Make it possible to enter sequences of chars which are not Unicode"
+	default n
+	depends on UNICODE_SUPPORT
+	help
+	  With this option on, on line-editing input (such as used by shells)
+	  invalid UTF-8 bytes are not substituted with the selected
+	  substitution character.
+	  For example, this means that entering 'l', 's', ' ', 0xff, [Enter]
+	  at shell prompt will list file named 0xff (single char name
+	  with char value 255), not file named '?'.
+
+config LONG_OPTS
+	bool "Support for --long-options"
+	default y
+	help
+	  Enable this if you want busybox applets to use the gnu --long-option
+	  style, in addition to single character -a -b -c style options.
+
+config FEATURE_DEVPTS
+	bool "Use the devpts filesystem for Unix98 PTYs"
+	default y
+	help
+	  Enable if you want BusyBox to use Unix98 PTY support. If enabled,
+	  busybox will use /dev/ptmx for the master side of the pseudoterminal
+	  and /dev/pts/<number> for the slave side. Otherwise, BSD style
+	  /dev/ttyp<number> will be used. To use this option, you should have
+	  devpts mounted.
+
+config FEATURE_CLEAN_UP
+	bool "Clean up all memory before exiting (usually not needed)"
+	default n
+	help
+	  As a size optimization, busybox normally exits without explicitly
+	  freeing dynamically allocated memory or closing files. This saves
+	  space since the OS will clean up for us, but it can confuse debuggers
+	  like valgrind, which report tons of memory and resource leaks.
+
+	  Don't enable this unless you have a really good reason to clean
+	  things up manually.
+
+config FEATURE_UTMP
+	bool "Support utmp file"
+	default y
+	help
+	  The file /var/run/utmp is used to track who is currently logged in.
+	  With this option on, certain applets (getty, login, telnetd etc)
+	  will create and delete entries there.
+	  "who" applet requires this option.
+
+config FEATURE_WTMP
+	bool "Support wtmp file"
+	default y
+	depends on FEATURE_UTMP
+	help
+	  The file /var/run/wtmp is used to track when users have logged into
+	  and logged out of the system.
+	  With this option on, certain applets (getty, login, telnetd etc)
+	  will append new entries there.
+	  "last" applet requires this option.
+
+config FEATURE_PIDFILE
+	bool "Support writing pidfiles"
+	default y
+	help
+	  This option makes some applets (e.g. crond, syslogd, inetd) write
+	  a pidfile in /var/run. Some applications rely on them.
+
+config FEATURE_SUID
+	bool "Support for SUID/SGID handling"
+	default y
+	help
+	  With this option you can install the busybox binary belonging
+	  to root with the suid bit set, enabling some applets to perform
+	  root-level operations even when run by ordinary users
+	  (for example, mounting of user mounts in fstab needs this).
+
+	  Busybox will automatically drop priviledges for applets
+	  that don't need root access.
+
+	  If you are really paranoid and don't want to do this, build two
+	  busybox binaries with different applets in them (and the appropriate
+	  symlinks pointing to each binary), and only set the suid bit on the
+	  one that needs it.
+
+	  The applets which require root rights (need suid bit or
+	  to be run by root) and will refuse to execute otherwise:
+	  crontab, login, passwd, su, vlock, wall.
+
+	  The applets which will use root rights if they have them
+	  (via suid bit, or because run by root), but would try to work
+	  without root right nevertheless:
+	  findfs, ping[6], traceroute[6], mount.
+
+	  Note that if you DONT select this option, but DO make busybox
+	  suid root, ALL applets will run under root, which is a huge
+	  security hole (think "cp /some/file /etc/passwd").
+
+config FEATURE_SUID_CONFIG
+	bool "Runtime SUID/SGID configuration via /etc/busybox.conf"
+	default y
+	depends on FEATURE_SUID
+	help
+	  Allow the SUID / SGID state of an applet to be determined at runtime
+	  by checking /etc/busybox.conf. (This is sort of a poor man's sudo.)
+	  The format of this file is as follows:
+
+	  APPLET = [Ssx-][Ssx-][x-] [USER.GROUP]
+
+	  s: USER or GROUP is allowed to execute APPLET.
+	     APPLET will run under USER or GROUP
+	     (reagardless of who's running it).
+	  S: USER or GROUP is NOT allowed to execute APPLET.
+	     APPLET will run under USER or GROUP.
+	     This option is not very sensical.
+	  x: USER/GROUP/others are allowed to execute APPLET.
+	     No UID/GID change will be done when it is run.
+	  -: USER/GROUP/others are not allowed to execute APPLET.
+
+	  An example might help:
+
+	  [SUID]
+	  su = ssx root.0 # applet su can be run by anyone and runs with
+	                  # euid=0/egid=0
+	  su = ssx        # exactly the same
+
+	  mount = sx- root.disk # applet mount can be run by root and members
+	                        # of group disk (but not anyone else)
+	                        # and runs with euid=0 (egid is not changed)
+
+	  cp = --- # disable applet cp for everyone
+
+	  The file has to be owned by user root, group root and has to be
+	  writeable only by root:
+	        (chown 0.0 /etc/busybox.conf; chmod 600 /etc/busybox.conf)
+	  The busybox executable has to be owned by user root, group
+	  root and has to be setuid root for this to work:
+	        (chown 0.0 /bin/busybox; chmod 4755 /bin/busybox)
+
+	  Robert 'sandman' Griebl has more information here:
+	  <url: http://www.softforge.de/bb/suid.html >.
+
+config FEATURE_SUID_CONFIG_QUIET
+	bool "Suppress warning message if /etc/busybox.conf is not readable"
+	default y
+	depends on FEATURE_SUID_CONFIG
+	help
+	  /etc/busybox.conf should be readable by the user needing the SUID,
+	  check this option to avoid users to be notified about missing
+	  permissions.
+
+config SELINUX
+	bool "Support NSA Security Enhanced Linux"
+	default n
+	select PLATFORM_LINUX
+	help
+	  Enable support for SELinux in applets ls, ps, and id. Also provide
+	  the option of compiling in SELinux applets.
+
+	  If you do not have a complete SELinux userland installed, this stuff
+	  will not compile. Go visit
+		http://www.nsa.gov/selinux/index.html
+	  to download the necessary stuff to allow busybox to compile with
+	  this option enabled. Specifially, libselinux 1.28 or better is
+	  directly required by busybox. If the installation is located in a
+	  non-standard directory, provide it by invoking make as follows:
+		CFLAGS=-I<libselinux-include-path> \
+		LDFLAGS=-L<libselinux-lib-path> \
+		make
+
+	  Most people will leave this set to 'N'.
+
+config FEATURE_PREFER_APPLETS
+	bool "exec prefers applets"
+	default n
+	help
+	  This is an experimental option which directs applets about to
+	  call 'exec' to try and find an applicable busybox applet before
+	  searching the PATH. This is typically done by exec'ing
+	  /proc/self/exe.
+	  This may affect shell, find -exec, xargs and similar applets.
+	  They will use applets even if /bin/<applet> -> busybox link
+	  is missing (or is not a link to busybox). However, this causes
+	  problems in chroot jails without mounted /proc and with ps/top
+	  (command name can be shown as 'exe' for applets started this way).
+
+config BUSYBOX_EXEC_PATH
+	string "Path to BusyBox executable"
+	default "/proc/self/exe"
+	help
+	  When Busybox applets need to run other busybox applets, BusyBox
+	  sometimes needs to exec() itself. When the /proc filesystem is
+	  mounted, /proc/self/exe always points to the currently running
+	  executable. If you haven't got /proc, set this to wherever you
+	  want to run BusyBox from.
+
+# These are auto-selected by other options
+
+config FEATURE_SYSLOG
+	bool #No description makes it a hidden option
+	default n
+	#help
+	#  This option is auto-selected when you select any applet which may
+	#  send its output to syslog. You do not need to select it manually.
+
+config FEATURE_HAVE_RPC
+	bool #No description makes it a hidden option
+	default n
+	#help
+	#  This is automatically selected if any of enabled applets need it.
+	#  You do not need to select it manually.
+
+endmenu
+
+menu 'Build Options'
+
+config STATIC
+	bool "Build BusyBox as a static binary (no shared libs)"
+	default n
+	help
+	  If you want to build a static BusyBox binary, which does not
+	  use or require any shared libraries, then enable this option.
+	  This can cause BusyBox to be considerably larger, so you should
+	  leave this option false unless you have a good reason (i.e.
+	  your target platform does not support shared libraries, or
+	  you are building an initrd which doesn't need anything but
+	  BusyBox, etc).
+
+	  Most people will leave this set to 'N'.
+
+config PIE
+	bool "Build BusyBox as a position independent executable"
+	default n
+	depends on !STATIC
+	help
+	  Hardened code option. PIE binaries are loaded at a different
+	  address at each invocation. This has some overhead,
+	  particularly on x86-32 which is short on registers.
+
+	  Most people will leave this set to 'N'.
+
+config NOMMU
+	bool "Force NOMMU build"
+	default n
+	help
+	  Busybox tries to detect whether architecture it is being
+	  built against supports MMU or not. If this detection fails,
+	  or if you want to build NOMMU version of busybox for testing,
+	  you may force NOMMU build here.
+
+	  Most people will leave this set to 'N'.
+
+# PIE can be made to work with BUILD_LIBBUSYBOX, but currently
+# build system does not support that
+config BUILD_LIBBUSYBOX
+	bool "Build shared libbusybox"
+	default n
+	depends on !FEATURE_PREFER_APPLETS && !PIE && !STATIC
+	help
+	  Build a shared library libbusybox.so.N.N.N which contains all
+	  busybox code.
+
+	  This feature allows every applet to be built as a tiny
+	  separate executable. Enabling it for "one big busybox binary"
+	  approach serves no purpose and increases code size.
+	  You should almost certainly say "no" to this.
+
+### config FEATURE_FULL_LIBBUSYBOX
+###	bool "Feature-complete libbusybox"
+###	default n if !FEATURE_SHARED_BUSYBOX
+###	depends on BUILD_LIBBUSYBOX
+###	help
+###	  Build a libbusybox with the complete feature-set, disregarding
+###	  the actually selected config.
+###
+###	  Normally, libbusybox will only contain the features which are
+###	  used by busybox itself. If you plan to write a separate
+###	  standalone application which uses libbusybox say 'Y'.
+###
+###	  Note: libbusybox is GPL, not LGPL, and exports no stable API that
+###	  might act as a copyright barrier. We can and will modify the
+###	  exported function set between releases (even minor version number
+###	  changes), and happily break out-of-tree features.
+###
+###	  Say 'N' if in doubt.
+
+config FEATURE_INDIVIDUAL
+	bool "Produce a binary for each applet, linked against libbusybox"
+	default y
+	depends on BUILD_LIBBUSYBOX
+	help
+	  If your CPU architecture doesn't allow for sharing text/rodata
+	  sections of running binaries, but allows for runtime dynamic
+	  libraries, this option will allow you to reduce memory footprint
+	  when you have many different applets running at once.
+
+	  If your CPU architecture allows for sharing text/rodata,
+	  having single binary is more optimal.
+
+	  Each applet will be a tiny program, dynamically linked
+	  against libbusybox.so.N.N.N.
+
+	  You need to have a working dynamic linker.
+
+config FEATURE_SHARED_BUSYBOX
+	bool "Produce additional busybox binary linked against libbusybox"
+	default y
+	depends on BUILD_LIBBUSYBOX
+	help
+	  Build busybox, dynamically linked against libbusybox.so.N.N.N.
+
+	  You need to have a working dynamic linker.
+
+### config BUILD_AT_ONCE
+###	bool "Compile all sources at once"
+###	default n
+###	help
+###	  Normally each source-file is compiled with one invocation of
+###	  the compiler.
+###	  If you set this option, all sources are compiled at once.
+###	  This gives the compiler more opportunities to optimize which can
+###	  result in smaller and/or faster binaries.
+###
+###	  Setting this option will consume alot of memory, e.g. if you
+###	  enable all applets with all features, gcc uses more than 300MB
+###	  RAM during compilation of busybox.
+###
+###	  This option is most likely only beneficial for newer compilers
+###	  such as gcc-4.1 and above.
+###
+###	  Say 'N' unless you know what you are doing.
+
+config LFS
+	bool "Build with Large File Support (for accessing files > 2 GB)"
+	default y
+	help
+	  If you want to build BusyBox with large file support, then enable
+	  this option. This will have no effect if your kernel or your C
+	  library lacks large file support for large files. Some of the
+	  programs that can benefit from large file support include dd, gzip,
+	  cp, mount, tar, and many others. If you want to access files larger
+	  than 2 Gigabytes, enable this option. Otherwise, leave it set to 'N'.
+
+config CROSS_COMPILER_PREFIX
+	string "Cross Compiler prefix"
+	default ""
+	help
+	  If you want to build BusyBox with a cross compiler, then you
+	  will need to set this to the cross-compiler prefix, for example,
+	  "i386-uclibc-".
+
+	  Note that CROSS_COMPILE environment variable or
+	  "make CROSS_COMPILE=xxx ..." will override this selection.
+
+	  Native builds leave this empty.
+
+config EXTRA_CFLAGS
+	string "Additional CFLAGS"
+	default ""
+	help
+	  Additional CFLAGS to pass to the compiler verbatim.
+
+endmenu
+
+menu 'Debugging Options'
+
+config DEBUG
+	bool "Build BusyBox with extra Debugging symbols"
+	default n
+	help
+	  Say Y here if you wish to examine BusyBox internals while applets are
+	  running. This increases the size of the binary considerably, and
+	  should only be used when doing development. If you are doing
+	  development and want to debug BusyBox, answer Y.
+
+	  Most people should answer N.
+
+config DEBUG_PESSIMIZE
+	bool "Disable compiler optimizations"
+	default n
+	depends on DEBUG
+	help
+	  The compiler's optimization of source code can eliminate and reorder
+	  code, resulting in an executable that's hard to understand when
+	  stepping through it with a debugger. This switches it off, resulting
+	  in a much bigger executable that more closely matches the source
+	  code.
+
+config WERROR
+	bool "Abort compilation on any warning"
+	default n
+	help
+	  Selecting this will add -Werror to gcc command line.
+
+	  Most people should answer N.
+
+choice
+	prompt "Additional debugging library"
+	default NO_DEBUG_LIB
+	help
+	  Using an additional debugging library will make BusyBox become
+	  considerable larger and will cause it to run more slowly. You
+	  should always leave this option disabled for production use.
+
+	  dmalloc support:
+	  ----------------
+	  This enables compiling with dmalloc ( http://dmalloc.com/ )
+	  which is an excellent public domain mem leak and malloc problem
+	  detector. To enable dmalloc, before running busybox you will
+	  want to properly set your environment, for example:
+	    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+	  The 'debug=' value is generated using the following command
+	    dmalloc -p log-stats -p log-non-free -p log-bad-space \
+	       -p log-elapsed-time -p check-fence -p check-heap \
+	       -p check-lists -p check-blank -p check-funcs -p realloc-copy \
+	       -p allow-free-null
+
+	  Electric-fence support:
+	  -----------------------
+	  This enables compiling with Electric-fence support. Electric
+	  fence is another very useful malloc debugging library which uses
+	  your computer's virtual memory hardware to detect illegal memory
+	  accesses. This support will make BusyBox be considerable larger
+	  and run slower, so you should leave this option disabled unless
+	  you are hunting a hard to find memory problem.
+
+
+config NO_DEBUG_LIB
+	bool "None"
+
+config DMALLOC
+	bool "Dmalloc"
+
+config EFENCE
+	bool "Electric-fence"
+
+endchoice
+
+endmenu
+
+menu 'Installation Options ("make install" behavior)'
+
+choice
+	prompt "What kind of applet links to install"
+	default INSTALL_APPLET_SYMLINKS
+	help
+	  Choose what kind of links to applets are created by "make install".
+
+config INSTALL_APPLET_SYMLINKS
+	bool "as soft-links"
+	help
+	  Install applets as soft-links to the busybox binary. This needs some
+	  free inodes on the filesystem, but might help with filesystem
+	  generators that can't cope with hard-links.
+
+config INSTALL_APPLET_HARDLINKS
+	bool "as hard-links"
+	help
+	  Install applets as hard-links to the busybox binary. This might
+	  count on a filesystem with few inodes.
+
+config INSTALL_APPLET_SCRIPT_WRAPPERS
+	bool "as script wrappers"
+	help
+	  Install applets as script wrappers that call the busybox binary.
+
+config INSTALL_APPLET_DONT
+	bool "not installed"
+	help
+	  Do not install applet links. Useful when you plan to use
+	  busybox --install for installing links, or plan to use
+	  a standalone shell and thus don't need applet links.
+
+endchoice
+
+choice
+	prompt "/bin/sh applet link"
+	default INSTALL_SH_APPLET_SYMLINK
+	depends on INSTALL_APPLET_SCRIPT_WRAPPERS
+	help
+	  Choose how you install /bin/sh applet link.
+
+config INSTALL_SH_APPLET_SYMLINK
+	bool "as soft-link"
+	help
+	  Install /bin/sh applet as soft-link to the busybox binary.
+
+config INSTALL_SH_APPLET_HARDLINK
+	bool "as hard-link"
+	help
+	  Install /bin/sh applet as hard-link to the busybox binary.
+
+config INSTALL_SH_APPLET_SCRIPT_WRAPPER
+	bool "as script wrapper"
+	help
+	  Install /bin/sh applet as script wrapper that calls
+	  the busybox binary.
+
+endchoice
+
+config PREFIX
+	string "BusyBox installation prefix"
+	default "./_install"
+	help
+	  Define your directory to install BusyBox files/subdirs in.
+
+endmenu
+
+# -> source libbb/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Busybox Library Tuning"
+
+config FEATURE_SYSTEMD
+	bool "Enable systemd support"
+	default y
+	help
+	  If you plan to use busybox daemons on a system where daemons
+	  are controlled by systemd, enable this option.
+	  If you don't use systemd, it is still safe to enable it,
+	  but the downside is increased code size.
+config FEATURE_RTMINMAX
+	bool "Support RTMIN[+n] and RTMAX[-n] signal names"
+	default y
+	help
+	  Support RTMIN[+n] and RTMAX[-n] signal names
+	  in kill, killall etc. This costs ~250 bytes.
+
+config PASSWORD_MINLEN
+	int "Minimum password length"
+	default 6
+	range 5 32
+	help
+	  Minimum allowable password length.
+
+config MD5_SIZE_VS_SPEED
+	int "MD5: Trade bytes for speed (0:fast, 3:slow)"
+	default 2
+	range 0 3
+	help
+	  Trade binary size versus speed for the md5sum algorithm.
+	  Approximate values running uClibc and hashing
+	  linux-2.4.4.tar.bz2 were:
+	                    user times (sec)  text size (386)
+	  0 (fastest)         1.1                6144
+	  1                   1.4                5392
+	  2                   3.0                5088
+	  3 (smallest)        5.1                4912
+
+config FEATURE_FAST_TOP
+	bool "Faster /proc scanning code (+100 bytes)"
+	default y
+	help
+	  This option makes top (and ps) ~20% faster (or 20% less CPU hungry),
+	  but code size is slightly bigger.
+
+config FEATURE_ETC_NETWORKS
+	bool "Support for /etc/networks"
+	default n
+	help
+	  Enable support for network names in /etc/networks. This is
+	  a rarely used feature which allows you to use names
+	  instead of IP/mask pairs in route command.
+
+config FEATURE_USE_TERMIOS
+	bool "Use termios to manipulate the screen"
+	default y
+	depends on MORE || TOP || POWERTOP
+	help
+	  This option allows utilities such as 'more' and 'top' to determine
+	  the size of the screen. If you leave this disabled, your utilities
+	  that display things on the screen will be especially primitive and
+	  will be unable to determine the current screen size, and will be
+	  unable to move the cursor.
+
+config FEATURE_EDITING
+	bool "Command line editing"
+	default y
+	help
+	  Enable line editing (mainly for shell command line).
+
+config FEATURE_EDITING_MAX_LEN
+	int "Maximum length of input"
+	range 128 8192
+	default 1024
+	depends on FEATURE_EDITING
+	help
+	  Line editing code uses on-stack buffers for storage.
+	  You may want to decrease this parameter if your target machine
+	  benefits from smaller stack usage.
+
+config FEATURE_EDITING_VI
+	bool "vi-style line editing commands"
+	default n
+	depends on FEATURE_EDITING
+	help
+	  Enable vi-style line editing. In shells, this mode can be
+	  turned on and off with "set -o vi" and "set +o vi".
+
+config FEATURE_EDITING_HISTORY
+	int "History size"
+	# Don't allow way too big values here, code uses fixed "char *history[N]" struct member
+	range 0 9999
+	default 255
+	depends on FEATURE_EDITING
+	help
+	  Specify command history size (0 - disable).
+
+config FEATURE_EDITING_SAVEHISTORY
+	bool "History saving"
+	default y
+	depends on FEATURE_EDITING
+	help
+	  Enable history saving in shells.
+
+config FEATURE_REVERSE_SEARCH
+	bool "Reverse history search"
+	default y
+	depends on FEATURE_EDITING_SAVEHISTORY
+	help
+	  Enable readline-like Ctrl-R combination for reverse history search.
+	  Increases code by about 0.5k.
+
+config FEATURE_TAB_COMPLETION
+	bool "Tab completion"
+	default y
+	depends on FEATURE_EDITING
+	help
+	  Enable tab completion.
+
+config FEATURE_USERNAME_COMPLETION
+	bool "Username completion"
+	default n
+	depends on FEATURE_TAB_COMPLETION
+	help
+	  Enable username completion.
+
+config FEATURE_EDITING_FANCY_PROMPT
+	bool "Fancy shell prompts"
+	default y
+	depends on FEATURE_EDITING
+	help
+	  Setting this option allows for prompts to use things like \w and
+	  \$ and escape codes.
+
+config FEATURE_EDITING_ASK_TERMINAL
+	bool "Query cursor position from terminal"
+	default n
+	depends on FEATURE_EDITING
+	help
+	  Allow usage of "ESC [ 6 n" sequence. Terminal answers back with
+	  current cursor position. This information is used to make line
+	  editing more robust in some cases.
+	  If you are not sure whether your terminals respond to this code
+	  correctly, or want to save on code size (about 400 bytes),
+	  then do not turn this option on.
+
+config FEATURE_NON_POSIX_CP
+	bool "Non-POSIX, but safer, copying to special nodes"
+	default y
+	help
+	  With this option, "cp file symlink" will delete symlink
+	  and create a regular file. This does not conform to POSIX,
+	  but prevents a symlink attack.
+	  Similarly, "cp file device" will not send file's data
+	  to the device. (To do that, use "cat file >device")
+
+config FEATURE_VERBOSE_CP_MESSAGE
+	bool "Give more precise messages when copy fails (cp, mv etc)"
+	default n
+	help
+	  Error messages with this feature enabled:
+	    $ cp file /does_not_exist/file
+	    cp: cannot create '/does_not_exist/file': Path does not exist
+	    $ cp file /vmlinuz/file
+	    cp: cannot stat '/vmlinuz/file': Path has non-directory component
+	  If this feature is not enabled, they will be, respectively:
+	    cp: cannot create '/does_not_exist/file': No such file or directory
+	    cp: cannot stat '/vmlinuz/file': Not a directory
+	  This will cost you ~60 bytes.
+
+config FEATURE_COPYBUF_KB
+	int "Copy buffer size, in kilobytes"
+	range 1 1024
+	default 4
+	help
+	  Size of buffer used by cp, mv, install, wget etc.
+	  Buffers which are 4 kb or less will be allocated on stack.
+	  Bigger buffers will be allocated with mmap, with fallback to 4 kb
+	  stack buffer if mmap fails.
+
+config FEATURE_SKIP_ROOTFS
+	bool "Skip rootfs in mount table"
+	default y
+	help
+	  Ignore rootfs entry in mount table.
+
+	  In Linux, kernel has a special filesystem, rootfs, which is initially
+	  mounted on /. It contains initramfs data, if kernel is configured
+	  to have one. Usually, another file system is mounted over / early
+	  in boot process, and therefore most tools which manipulate
+	  mount table, such as df, will skip rootfs entry.
+
+	  However, some systems do not mount anything on /.
+	  If you need to configure busybox for one of these systems,
+	  you may find useful to turn this option off to make df show
+	  initramfs statistic.
+
+	  Otherwise, choose Y.
+
+config MONOTONIC_SYSCALL
+	bool "Use clock_gettime(CLOCK_MONOTONIC) syscall"
+	default n
+	select PLATFORM_LINUX
+	help
+	  Use clock_gettime(CLOCK_MONOTONIC) syscall for measuring
+	  time intervals (time, ping, traceroute etc need this).
+	  Probably requires Linux 2.6+. If not selected, gettimeofday
+	  will be used instead (which gives wrong results if date/time
+	  is reset).
+
+config IOCTL_HEX2STR_ERROR
+	bool "Use ioctl names rather than hex values in error messages"
+	default y
+	help
+	  Use ioctl names rather than hex values in error messages
+	  (e.g. VT_DISALLOCATE rather than 0x5608). If disabled this
+	  saves about 1400 bytes.
+
+config FEATURE_HWIB
+	bool "Support infiniband HW"
+	default y
+	help
+	  Support for printing infiniband addresses in
+	  network applets.
+
+endmenu
+
+endmenu
+
+comment "Applets"
+
+# -> source archival/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Archival Utilities"
+
+
+
+config FEATURE_SEAMLESS_XZ
+	bool "Make tar, rpm, modprobe etc understand .xz data"
+	default y
+	help
+	  Make tar, rpm, modprobe etc understand .xz data.
+
+config FEATURE_SEAMLESS_LZMA
+	bool "Make tar, rpm, modprobe etc understand .lzma data"
+	default y
+	help
+	  Make tar, rpm, modprobe etc understand .lzma data.
+
+config FEATURE_SEAMLESS_BZ2
+	bool "Make tar, rpm, modprobe etc understand .bz2 data"
+	default y
+	help
+	  Make tar, rpm, modprobe etc understand .bz2 data.
+
+config FEATURE_SEAMLESS_GZ
+	bool "Make tar, rpm, modprobe etc understand .gz data"
+	default y
+	help
+	  Make tar, rpm, modprobe etc understand .gz data.
+
+config FEATURE_SEAMLESS_Z
+	bool "Make tar and gunzip understand .Z data"
+	default n
+	help
+	  Make tar and gunzip understand .Z data.
+
+config AR
+	bool "ar"
+	default n  # needs to be improved to be able to replace binutils ar
+	help
+	  ar is an archival utility program used to create, modify, and
+	  extract contents from archives. An archive is a single file holding
+	  a collection of other files in a structure that makes it possible to
+	  retrieve the original individual files (called archive members).
+	  The original files' contents, mode (permissions), timestamp, owner,
+	  and group are preserved in the archive, and can be restored on
+	  extraction.
+
+	  The stored filename is limited to 15 characters. (for more information
+	  see long filename support).
+	  ar has 60 bytes of overheads for every stored file.
+
+	  This implementation of ar can extract archives, it cannot create or
+	  modify them.
+	  On an x86 system, the ar applet adds about 1K.
+
+	  Unless you have a specific application which requires ar, you should
+	  probably say N here.
+
+config FEATURE_AR_LONG_FILENAMES
+	bool "Support for long filenames (not needed for debs)"
+	default y
+	depends on AR
+	help
+	  By default the ar format can only store the first 15 characters
+	  of the filename, this option removes that limitation.
+	  It supports the GNU ar long filename method which moves multiple long
+	  filenames into a the data section of a new ar entry.
+
+config FEATURE_AR_CREATE
+	bool "Support archive creation"
+	default y
+	depends on AR
+	help
+	  This enables archive creation (-c and -r) with busybox ar.
+
+config BUNZIP2
+	bool "bunzip2"
+	default y
+	help
+	  bunzip2 is a compression utility using the Burrows-Wheeler block
+	  sorting text compression algorithm, and Huffman coding. Compression
+	  is generally considerably better than that achieved by more
+	  conventional LZ77/LZ78-based compressors, and approaches the
+	  performance of the PPM family of statistical compressors.
+
+	  Unless you have a specific application which requires bunzip2, you
+	  should probably say N here.
+
+config BZIP2
+	bool "bzip2"
+	default y
+	help
+	  bzip2 is a compression utility using the Burrows-Wheeler block
+	  sorting text compression algorithm, and Huffman coding. Compression
+	  is generally considerably better than that achieved by more
+	  conventional LZ77/LZ78-based compressors, and approaches the
+	  performance of the PPM family of statistical compressors.
+
+	  Unless you have a specific application which requires bzip2, you
+	  should probably say N here.
+
+config CPIO
+	bool "cpio"
+	default y
+	help
+	  cpio is an archival utility program used to create, modify, and
+	  extract contents from archives.
+	  cpio has 110 bytes of overheads for every stored file.
+
+	  This implementation of cpio can extract cpio archives created in the
+	  "newc" or "crc" format, it cannot create or modify them.
+
+	  Unless you have a specific application which requires cpio, you
+	  should probably say N here.
+
+config FEATURE_CPIO_O
+	bool "Support for archive creation"
+	default y
+	depends on CPIO
+	help
+	  This implementation of cpio can create cpio archives in the "newc"
+	  format only.
+
+config FEATURE_CPIO_P
+	bool "Support for passthrough mode"
+	default y
+	depends on FEATURE_CPIO_O
+	help
+	  Passthrough mode. Rarely used.
+
+config DPKG
+	bool "dpkg"
+	default n
+	select FEATURE_SEAMLESS_GZ
+	help
+	  dpkg is a medium-level tool to install, build, remove and manage
+	  Debian packages.
+
+	  This implementation of dpkg has a number of limitations,
+	  you should use the official dpkg if possible.
+
+config DPKG_DEB
+	bool "dpkg_deb"
+	default n
+	select FEATURE_SEAMLESS_GZ
+	help
+	  dpkg-deb unpacks and provides information about Debian archives.
+
+	  This implementation of dpkg-deb cannot pack archives.
+
+	  Unless you have a specific application which requires dpkg-deb,
+	  say N here.
+
+config FEATURE_DPKG_DEB_EXTRACT_ONLY
+	bool "Extract only (-x)"
+	default n
+	depends on DPKG_DEB
+	help
+	  This reduces dpkg-deb to the equivalent of
+	  "ar -p <deb> data.tar.gz | tar -zx". However it saves space as none
+	  of the extra dpkg-deb, ar or tar options are needed, they are linked
+	  to internally.
+
+config GUNZIP
+	bool "gunzip"
+	default y
+	help
+	  gunzip is used to decompress archives created by gzip.
+	  You can use the `-t' option to test the integrity of
+	  an archive, without decompressing it.
+
+config GZIP
+	bool "gzip"
+	default y
+	help
+	  gzip is used to compress files.
+	  It's probably the most widely used UNIX compression program.
+
+config FEATURE_GZIP_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on GZIP && LONG_OPTS
+	help
+	  Enable use of long options, increases size by about 106 Bytes
+
+config LZOP
+	bool "lzop"
+	default y
+	help
+	  Lzop compression/decompresion.
+
+config LZOP_COMPR_HIGH
+	bool "lzop compression levels 7,8,9 (not very useful)"
+	default n
+	depends on LZOP
+	help
+	  High levels (7,8,9) of lzop compression. These levels
+	  are actually slower than gzip at equivalent compression ratios
+	  and take up 3.2K of code.
+
+config RPM2CPIO
+	bool "rpm2cpio"
+	default y
+	help
+	  Converts a RPM file into a CPIO archive.
+
+config RPM
+	bool "rpm"
+	default y
+	help
+	  Mini RPM applet - queries and extracts RPM packages.
+
+config TAR
+	bool "tar"
+	default y
+	help
+	  tar is an archiving program. It's commonly used with gzip to
+	  create compressed archives. It's probably the most widely used
+	  UNIX archive program.
+
+config FEATURE_TAR_CREATE
+	bool "Enable archive creation"
+	default y
+	depends on TAR
+	help
+	  If you enable this option you'll be able to create
+	  tar archives using the `-c' option.
+
+config FEATURE_TAR_AUTODETECT
+	bool "Autodetect compressed tarballs"
+	default y
+	depends on TAR && (FEATURE_SEAMLESS_Z || FEATURE_SEAMLESS_GZ || FEATURE_SEAMLESS_BZ2 || FEATURE_SEAMLESS_LZMA || FEATURE_SEAMLESS_XZ)
+	help
+	  With this option tar can automatically detect compressed
+	  tarballs. Currently it works only on files (not pipes etc).
+
+config FEATURE_TAR_FROM
+	bool "Enable -X (exclude from) and -T (include from) options)"
+	default y
+	depends on TAR
+	help
+	  If you enable this option you'll be able to specify
+	  a list of files to include or exclude from an archive.
+
+config FEATURE_TAR_OLDGNU_COMPATIBILITY
+	bool "Support for old tar header format"
+	default y
+	depends on TAR || DPKG
+	help
+	  This option is required to unpack archives created in
+	  the old GNU format; help to kill this old format by
+	  repacking your ancient archives with the new format.
+
+config FEATURE_TAR_OLDSUN_COMPATIBILITY
+	bool "Enable untarring of tarballs with checksums produced by buggy Sun tar"
+	default y
+	depends on TAR || DPKG
+	help
+	  This option is required to unpack archives created by some old
+	  version of Sun's tar (it was calculating checksum using signed
+	  arithmetic). It is said to be fixed in newer Sun tar, but "old"
+	  tarballs still exist.
+
+config FEATURE_TAR_GNU_EXTENSIONS
+	bool "Support for GNU tar extensions (long filenames)"
+	default y
+	depends on TAR || DPKG
+	help
+	  With this option busybox supports GNU long filenames and
+	  linknames.
+
+config FEATURE_TAR_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on TAR && LONG_OPTS
+	help
+	  Enable use of long options, increases size by about 400 Bytes
+
+config FEATURE_TAR_TO_COMMAND
+	bool "Support for writing to an external program"
+	default y
+	depends on TAR && FEATURE_TAR_LONG_OPTIONS
+	help
+	  If you enable this option you'll be able to instruct tar to send
+	  the contents of each extracted file to the standard input of an
+	  external program.
+
+config FEATURE_TAR_UNAME_GNAME
+	bool "Enable use of user and group names"
+	default y
+	depends on TAR
+	help
+	  Enables use of user and group names in tar. This affects contents
+	  listings (-t) and preserving permissions when unpacking (-p).
+	  +200 bytes.
+
+config FEATURE_TAR_NOPRESERVE_TIME
+	bool "Enable -m (do not preserve time) option"
+	default y
+	depends on TAR
+	help
+	  With this option busybox supports GNU tar -m
+	  (do not preserve time) option.
+
+config FEATURE_TAR_SELINUX
+	bool "Support for extracting SELinux labels"
+	default n
+	depends on TAR && SELINUX
+	help
+	  With this option busybox supports restoring SELinux labels
+	  when extracting files from tar archives.
+
+config UNCOMPRESS
+	bool "uncompress"
+	default n
+	help
+	  uncompress is used to decompress archives created by compress.
+	  Not much used anymore, replaced by gzip/gunzip.
+
+config UNLZMA
+	bool "unlzma"
+	default y
+	help
+	  unlzma is a compression utility using the Lempel-Ziv-Markov chain
+	  compression algorithm, and range coding. Compression
+	  is generally considerably better than that achieved by the bzip2
+	  compressors.
+
+	  The BusyBox unlzma applet is limited to de-compression only.
+	  On an x86 system, this applet adds about 4K.
+
+	  Unless you have a specific application which requires unlzma, you
+	  should probably say N here.
+
+config FEATURE_LZMA_FAST
+	bool "Optimize unlzma for speed"
+	default y
+	depends on UNLZMA
+	help
+	  This option reduces decompression time by about 25% at the cost of
+	  a 1K bigger binary.
+
+config LZMA
+	bool "Provide lzma alias which supports only unpacking"
+	default y
+	depends on UNLZMA
+	help
+	  Enable this option if you want commands like "lzma -d" to work.
+	  IOW: you'll get lzma applet, but it will always require -d option.
+
+config UNXZ
+	bool "unxz"
+	default y
+	help
+	  unxz is a unlzma successor.
+
+config XZ
+	bool "Provide xz alias which supports only unpacking"
+	default y
+	depends on UNXZ
+	help
+	  Enable this option if you want commands like "xz -d" to work.
+	  IOW: you'll get xz applet, but it will always require -d option.
+
+config UNZIP
+	bool "unzip"
+	default y
+	help
+	  unzip will list or extract files from a ZIP archive,
+	  commonly found on DOS/WIN systems. The default behavior
+	  (with no options) is to extract the archive into the
+	  current directory. Use the `-d' option to extract to a
+	  directory of your choice.
+
+endmenu
+# -> source coreutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Coreutils"
+
+config BASENAME
+	bool "basename"
+	default y
+	help
+	  basename is used to strip the directory and suffix from filenames,
+	  leaving just the filename itself. Enable this option if you wish
+	  to enable the 'basename' utility.
+config CAT
+	bool "cat"
+	default y
+	help
+	  cat is used to concatenate files and print them to the standard
+	  output. Enable this option if you wish to enable the 'cat' utility.
+config DATE
+	bool "date"
+	default y
+	help
+	  date is used to set the system date or display the
+	  current time in the given format.
+
+config FEATURE_DATE_ISOFMT
+	bool "Enable ISO date format output (-I)"
+	default y
+	depends on DATE
+	help
+	  Enable option (-I) to output an ISO-8601 compliant
+	  date/time string.
+
+# defaults to "no": stat's nanosecond field is a bit non-portable
+config FEATURE_DATE_NANO
+	bool "Support %[num]N nanosecond format specifier"
+	default n
+	depends on DATE  # syscall(__NR_clock_gettime)
+	select PLATFORM_LINUX
+	help
+	  Support %[num]N format specifier. Adds ~250 bytes of code.
+
+config FEATURE_DATE_COMPAT
+	bool "Support weird 'date MMDDhhmm[[YY]YY][.ss]' format"
+	default y
+	depends on DATE
+	help
+	  System time can be set by 'date -s DATE' and simply 'date DATE',
+	  but formats of DATE string are different. 'date DATE' accepts
+	  a rather weird MMDDhhmm[[YY]YY][.ss] format with completely
+	  unnatural placement of year between minutes and seconds.
+	  date -s (and other commands like touch -d) use more sensible
+	  formats (for one, ISO format YYYY-MM-DD hh:mm:ss.ssssss).
+
+	  With this option off, 'date DATE' is 'date -s DATE' support
+	  the same format. With it on, 'date DATE' additionally supports
+	  MMDDhhmm[[YY]YY][.ss] format.
+config ID
+	bool "id"
+	default y
+	help
+	  id displays the current user and group ID names.
+config GROUPS
+	bool "groups"
+	default y
+	help
+	  Print the group names associated with current user id.
+config TEST
+	bool "test"
+	default y
+	help
+	  test is used to check file types and compare values,
+	  returning an appropriate exit code. The bash shell
+	  has test built in, ash can build it in optionally.
+
+config FEATURE_TEST_64
+	bool "Extend test to 64 bit"
+	default y
+	depends on TEST || ASH_BUILTIN_TEST || HUSH
+	help
+	  Enable 64-bit support in test.
+config TOUCH
+	bool "touch"
+	default y
+	help
+	  touch is used to create or change the access and/or
+	  modification timestamp of specified files.
+config TR
+	bool "tr"
+	default y
+	help
+	  tr is used to squeeze, and/or delete characters from standard
+	  input, writing to standard output.
+
+config FEATURE_TR_CLASSES
+	bool "Enable character classes (such as [:upper:])"
+	default y
+	depends on TR
+	help
+	  Enable character classes, enabling commands such as:
+	  tr [:upper:] [:lower:] to convert input into lowercase.
+
+config FEATURE_TR_EQUIV
+	bool "Enable equivalence classes"
+	default y
+	depends on TR
+	help
+	  Enable equivalence classes, which essentially add the enclosed
+	  character to the current set. For instance, tr [=a=] xyz would
+	  replace all instances of 'a' with 'xyz'. This option is mainly
+	  useful for cases when no other way of expressing a character
+	  is possible.
+config BASE64
+	bool "base64"
+	default y
+	help
+	  Base64 encode and decode
+config WHO
+      bool "who"
+      default y
+      depends on FEATURE_UTMP
+      help
+        who is used to show who is logged on.
+config USERS
+      bool "users"
+      default y
+      depends on FEATURE_UTMP
+      help
+        Print users currently logged on.
+
+config CAL
+	bool "cal"
+	default y
+	help
+	  cal is used to display a monthly calender.
+
+config CATV
+	bool "catv"
+	default y
+	help
+	  Display nonprinting characters as escape sequences (like some
+	  implementations' cat -v option).
+
+config CHGRP
+	bool "chgrp"
+	default y
+	help
+	  chgrp is used to change the group ownership of files.
+
+config CHMOD
+	bool "chmod"
+	default y
+	help
+	  chmod is used to change the access permission of files.
+
+config CHOWN
+	bool "chown"
+	default y
+	help
+	  chown is used to change the user and/or group ownership
+	  of files.
+
+config FEATURE_CHOWN_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on CHOWN && LONG_OPTS
+	help
+	  Enable use of long options
+
+config CHROOT
+	bool "chroot"
+	default y
+	help
+	  chroot is used to change the root directory and run a command.
+	  The default command is `/bin/sh'.
+
+config CKSUM
+	bool "cksum"
+	default y
+	help
+	  cksum is used to calculate the CRC32 checksum of a file.
+
+config COMM
+	bool "comm"
+	default y
+	help
+	  comm is used to compare two files line by line and return
+	  a three-column output.
+
+config CP
+	bool "cp"
+	default y
+	help
+	  cp is used to copy files and directories.
+
+config FEATURE_CP_LONG_OPTIONS
+	bool "Enable long options for cp"
+	default y
+	depends on CP && LONG_OPTS
+	help
+	  Enable long options for cp.
+	  Also add support for --parents option.
+
+config CUT
+	bool "cut"
+	default y
+	help
+	  cut is used to print selected parts of lines from
+	  each file to stdout.
+
+config DD
+	bool "dd"
+	default y
+	help
+	  dd copies a file (from standard input to standard output,
+	  by default) using specific input and output blocksizes,
+	  while optionally performing conversions on it.
+
+config FEATURE_DD_SIGNAL_HANDLING
+	bool "Enable DD signal handling for status reporting"
+	default y
+	depends on DD
+	help
+	  Sending a SIGUSR1 signal to a running `dd' process makes it
+	  print to standard error the number of records read and written
+	  so far, then to resume copying.
+
+	  $ dd if=/dev/zero of=/dev/null&
+	  $ pid=$! kill -USR1 $pid; sleep 1; kill $pid
+	  10899206+0 records in
+	  10899206+0 records out
+
+config FEATURE_DD_THIRD_STATUS_LINE
+	bool "Enable the third status line upon signal"
+	default y
+	depends on DD && FEATURE_DD_SIGNAL_HANDLING
+	help
+	  Displays a coreutils-like third status line with transferred bytes,
+	  elapsed time and speed.
+
+config FEATURE_DD_IBS_OBS
+	bool "Enable ibs, obs and conv options"
+	default y
+	depends on DD
+	help
+	  Enables support for writing a certain number of bytes in and out,
+	  at a time, and performing conversions on the data stream.
+
+config DF
+	bool "df"
+	default y
+	help
+	  df reports the amount of disk space used and available
+	  on filesystems.
+
+config FEATURE_DF_FANCY
+	bool "Enable -a, -i, -B"
+	default y
+	depends on DF
+	help
+	  This option enables -a, -i and -B.
+
+	    -a Show all filesystems
+	    -i Inodes
+	    -B <SIZE> Blocksize
+
+config DIRNAME
+	bool "dirname"
+	default y
+	help
+	  dirname is used to strip a non-directory suffix from
+	  a file name.
+
+config DOS2UNIX
+	bool "dos2unix/unix2dos"
+	default y
+	help
+	  dos2unix is used to convert a text file from DOS format to
+	  UNIX format, and vice versa.
+
+config UNIX2DOS
+	bool
+	default y
+	depends on DOS2UNIX
+	help
+	  unix2dos is used to convert a text file from UNIX format to
+	  DOS format, and vice versa.
+
+config DU
+	bool "du (default blocksize of 512 bytes)"
+	default y
+	help
+	  du is used to report the amount of disk space used
+	  for specified files.
+
+config FEATURE_DU_DEFAULT_BLOCKSIZE_1K
+	bool "Use a default blocksize of 1024 bytes (1K)"
+	default y
+	depends on DU
+	help
+	  Use a blocksize of (1K) instead of the default 512b.
+
+config ECHO
+	bool "echo (basic SuSv3 version taking no options)"
+	default y
+	help
+	  echo is used to print a specified string to stdout.
+
+# this entry also appears in shell/Config.in, next to the echo builtin
+config FEATURE_FANCY_ECHO
+	bool "Enable echo options (-n and -e)"
+	default y
+	depends on ECHO || ASH_BUILTIN_ECHO || HUSH
+	help
+	  This adds options (-n and -e) to echo.
+
+config ENV
+	bool "env"
+	default y
+	help
+	  env is used to set an environment variable and run
+	  a command; without options it displays the current
+	  environment.
+
+config FEATURE_ENV_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on ENV && LONG_OPTS
+	help
+	  Support long options for the env applet.
+
+config EXPAND
+	bool "expand"
+	default y
+	help
+	  By default, convert all tabs to spaces.
+
+config FEATURE_EXPAND_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on EXPAND && LONG_OPTS
+	help
+	  Support long options for the expand applet.
+
+config EXPR
+	bool "expr"
+	default y
+	help
+	  expr is used to calculate numbers and print the result
+	  to standard output.
+
+config EXPR_MATH_SUPPORT_64
+	bool "Extend Posix numbers support to 64 bit"
+	default y
+	depends on EXPR
+	help
+	  Enable 64-bit math support in the expr applet. This will make
+	  the applet slightly larger, but will allow computation with very
+	  large numbers.
+
+config FALSE
+	bool "false"
+	default y
+	help
+	  false returns an exit code of FALSE (1).
+
+config FOLD
+	bool "fold"
+	default y
+	help
+	  Wrap text to fit a specific width.
+
+config FSYNC
+	bool "fsync"
+	default y
+	help
+	  fsync is used to flush file-related cached blocks to disk.
+
+config HEAD
+	bool "head"
+	default y
+	help
+	  head is used to print the first specified number of lines
+	  from files.
+
+config FEATURE_FANCY_HEAD
+	bool "Enable head options (-c, -q, and -v)"
+	default y
+	depends on HEAD
+	help
+	  This enables the head options (-c, -q, and -v).
+
+config HOSTID
+	bool "hostid"
+	default y
+	help
+	  hostid prints the numeric identifier (in hexadecimal) for
+	  the current host.
+
+config INSTALL
+	bool "install"
+	default y
+	help
+	  Copy files and set attributes.
+
+config FEATURE_INSTALL_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on INSTALL && LONG_OPTS
+	help
+	  Support long options for the install applet.
+
+####config LENGTH
+####	bool "length"
+####	default y
+####	help
+####	  length is used to print out the length of a specified string.
+
+config LN
+	bool "ln"
+	default y
+	help
+	  ln is used to create hard or soft links between files.
+
+config LOGNAME
+	bool "logname"
+	default y
+	help
+	  logname is used to print the current user's login name.
+
+config LS
+	bool "ls"
+	default y
+	help
+	  ls is used to list the contents of directories.
+
+config FEATURE_LS_FILETYPES
+	bool "Enable filetyping options (-p and -F)"
+	default y
+	depends on LS
+	help
+	  Enable the ls options (-p and -F).
+
+config FEATURE_LS_FOLLOWLINKS
+	bool "Enable symlinks dereferencing (-L)"
+	default y
+	depends on LS
+	help
+	  Enable the ls option (-L).
+
+config FEATURE_LS_RECURSIVE
+	bool "Enable recursion (-R)"
+	default y
+	depends on LS
+	help
+	  Enable the ls option (-R).
+
+config FEATURE_LS_SORTFILES
+	bool "Sort the file names"
+	default y
+	depends on LS
+	help
+	  Allow ls to sort file names alphabetically.
+
+config FEATURE_LS_TIMESTAMPS
+	bool "Show file timestamps"
+	default y
+	depends on LS
+	help
+	  Allow ls to display timestamps for files.
+
+config FEATURE_LS_USERNAME
+	bool "Show username/groupnames"
+	default y
+	depends on LS
+	help
+	  Allow ls to display username/groupname for files.
+
+config FEATURE_LS_COLOR
+	bool "Allow use of color to identify file types"
+	default y
+	depends on LS && LONG_OPTS
+	help
+	  This enables the --color option to ls.
+
+config FEATURE_LS_COLOR_IS_DEFAULT
+	bool "Produce colored ls output by default"
+	default y
+	depends on FEATURE_LS_COLOR
+	help
+	  Saying yes here will turn coloring on by default,
+	  even if no "--color" option is given to the ls command.
+	  This is not recommended, since the colors are not
+	  configurable, and the output may not be legible on
+	  many output screens.
+
+config MD5SUM
+	bool "md5sum"
+	default y
+	help
+	  md5sum is used to print or check MD5 checksums.
+
+config MKDIR
+	bool "mkdir"
+	default y
+	help
+	  mkdir is used to create directories with the specified names.
+
+config FEATURE_MKDIR_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on MKDIR && LONG_OPTS
+	help
+	  Support long options for the mkdir applet.
+
+config MKFIFO
+	bool "mkfifo"
+	default y
+	help
+	  mkfifo is used to create FIFOs (named pipes).
+	  The `mknod' program can also create FIFOs.
+
+config MKNOD
+	bool "mknod"
+	default y
+	help
+	  mknod is used to create FIFOs or block/character special
+	  files with the specified names.
+
+config MV
+	bool "mv"
+	default y
+	help
+	  mv is used to move or rename files or directories.
+
+config FEATURE_MV_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on MV && LONG_OPTS
+	help
+	  Support long options for the mv applet.
+
+config NICE
+	bool "nice"
+	default y
+	help
+	  nice runs a program with modified scheduling priority.
+
+config NOHUP
+	bool "nohup"
+	default y
+	help
+	  run a command immune to hangups, with output to a non-tty.
+
+config OD
+	bool "od"
+	default y
+	help
+	  od is used to dump binary files in octal and other formats.
+
+config PRINTENV
+	bool "printenv"
+	default y
+	help
+	  printenv is used to print all or part of environment.
+
+config PRINTF
+	bool "printf"
+	default y
+	help
+	  printf is used to format and print specified strings.
+	  It's similar to `echo' except it has more options.
+
+config PWD
+	bool "pwd"
+	default y
+	help
+	  pwd is used to print the current directory.
+
+config READLINK
+	bool "readlink"
+	default y
+	help
+	  This program reads a symbolic link and returns the name
+	  of the file it points to
+
+config FEATURE_READLINK_FOLLOW
+	bool "Enable canonicalization by following all symlinks (-f)"
+	default y
+	depends on READLINK
+	help
+	  Enable the readlink option (-f).
+
+config REALPATH
+	bool "realpath"
+	default y
+	help
+	  Return the canonicalized absolute pathname.
+	  This isn't provided by GNU shellutils, but where else does it belong.
+
+config RM
+	bool "rm"
+	default y
+	help
+	  rm is used to remove files or directories.
+
+config RMDIR
+	bool "rmdir"
+	default y
+	help
+	  rmdir is used to remove empty directories.
+
+config FEATURE_RMDIR_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on RMDIR && LONG_OPTS
+	help
+	  Support long options for the rmdir applet, including
+	  --ignore-fail-on-non-empty for compatibility with GNU rmdir.
+
+config SEQ
+	bool "seq"
+	default y
+	help
+	  print a sequence of numbers
+
+config SHA1SUM
+	bool "sha1sum"
+	default y
+	help
+	  Compute and check SHA1 message digest
+
+config SHA256SUM
+	bool "sha256sum"
+	default y
+	help
+	  Compute and check SHA256 message digest
+
+config SHA512SUM
+	bool "sha512sum"
+	default y
+	help
+	  Compute and check SHA512 message digest
+
+config SLEEP
+	bool "sleep"
+	default y
+	help
+	  sleep is used to pause for a specified number of seconds.
+	  It comes in 3 versions:
+	  - small: takes one integer parameter
+	  - fancy: takes multiple integer arguments with suffixes:
+	    sleep 1d 2h 3m 15s
+	  - fancy with fractional numbers:
+	    sleep 2.3s 4.5h sleeps for 16202.3 seconds
+	  Last one is "the most compatible" with coreutils sleep,
+	  but it adds around 1k of code.
+
+config FEATURE_FANCY_SLEEP
+	bool "Enable multiple arguments and s/m/h/d suffixes"
+	default y
+	depends on SLEEP
+	help
+	  Allow sleep to pause for specified minutes, hours, and days.
+
+config FEATURE_FLOAT_SLEEP
+	bool "Enable fractional arguments"
+	default y
+	depends on FEATURE_FANCY_SLEEP
+	help
+	  Allow for fractional numeric parameters.
+
+config SORT
+	bool "sort"
+	default y
+	help
+	  sort is used to sort lines of text in specified files.
+
+config FEATURE_SORT_BIG
+	bool "Full SuSv3 compliant sort (support -ktcsbdfiozgM)"
+	default y
+	depends on SORT
+	help
+	  Without this, sort only supports -r, -u, and an integer version
+	  of -n. Selecting this adds sort keys, floating point support, and
+	  more. This adds a little over 3k to a nonstatic build on x86.
+
+	  The SuSv3 sort standard is available at:
+	  http://www.opengroup.org/onlinepubs/007904975/utilities/sort.html
+
+config SPLIT
+	bool "split"
+	default y
+	help
+	  split a file into pieces.
+
+config FEATURE_SPLIT_FANCY
+	bool "Fancy extensions"
+	default y
+	depends on SPLIT
+	help
+	  Add support for features not required by SUSv3.
+	  Supports additional suffixes 'b' for 512 bytes,
+	  'g' for 1GiB for the -b option.
+
+config STAT
+	bool "stat"
+	default y
+	select PLATFORM_LINUX # statfs()
+	help
+	  display file or filesystem status.
+
+config FEATURE_STAT_FORMAT
+	bool "Enable custom formats (-c)"
+	default y
+	depends on STAT
+	help
+	  Without this, stat will not support the '-c format' option where
+	  users can pass a custom format string for output. This adds about
+	  7k to a nonstatic build on amd64.
+
+config STTY
+	bool "stty"
+	default y
+	help
+	  stty is used to change and print terminal line settings.
+
+config SUM
+	bool "sum"
+	default y
+	help
+	  checksum and count the blocks in a file
+
+config SYNC
+	bool "sync"
+	default y
+	help
+	  sync is used to flush filesystem buffers.
+
+config TAC
+	bool "tac"
+	default y
+	help
+	  tac is used to concatenate and print files in reverse.
+
+config TAIL
+	bool "tail"
+	default y
+	help
+	  tail is used to print the last specified number of lines
+	  from files.
+
+config FEATURE_FANCY_TAIL
+	bool "Enable extra tail options (-q, -s, -v, and -F)"
+	default y
+	depends on TAIL
+	help
+	  The options (-q, -s, and -v) are provided by GNU tail, but
+	  are not specific in the SUSv3 standard.
+
+	    -q      Never output headers giving file names
+	    -s SEC  Wait SEC seconds between reads with -f
+	    -v      Always output headers giving file names
+
+config TEE
+	bool "tee"
+	default y
+	help
+	  tee is used to read from standard input and write
+	  to standard output and files.
+
+config FEATURE_TEE_USE_BLOCK_IO
+	bool "Enable block I/O (larger/faster) instead of byte I/O"
+	default y
+	depends on TEE
+	help
+	  Enable this option for a faster tee, at expense of size.
+
+config TRUE
+	bool "true"
+	default y
+	help
+	  true returns an exit code of TRUE (0).
+
+config TTY
+	bool "tty"
+	default y
+	help
+	  tty is used to print the name of the current terminal to
+	  standard output.
+
+config UNAME
+	bool "uname"
+	default y
+	help
+	  uname is used to print system information.
+
+config UNEXPAND
+	bool "unexpand"
+	default y
+	help
+	  By default, convert only leading sequences of blanks to tabs.
+
+config FEATURE_UNEXPAND_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on UNEXPAND && LONG_OPTS
+	help
+	  Support long options for the unexpand applet.
+
+config UNIQ
+	bool "uniq"
+	default y
+	help
+	  uniq is used to remove duplicate lines from a sorted file.
+
+config USLEEP
+	bool "usleep"
+	default y
+	help
+	  usleep is used to pause for a specified number of microseconds.
+
+config UUDECODE
+	bool "uudecode"
+	default y
+	help
+	  uudecode is used to decode a uuencoded file.
+
+config UUENCODE
+	bool "uuencode"
+	default y
+	help
+	  uuencode is used to uuencode a file.
+
+config WC
+	bool "wc"
+	default y
+	help
+	  wc is used to print the number of bytes, words, and lines,
+	  in specified files.
+
+config FEATURE_WC_LARGE
+	bool "Support very large files in wc"
+	default y
+	depends on WC
+	help
+	  Use "unsigned long long" in wc for counter variables.
+
+config WHOAMI
+	bool "whoami"
+	default y
+	help
+	  whoami is used to print the username of the current
+	  user id (same as id -un).
+
+config YES
+	bool "yes"
+	default y
+	help
+	  yes is used to repeatedly output a specific string, or
+	  the default string `y'.
+
+comment "Common options for cp and mv"
+	depends on CP || MV
+
+config FEATURE_PRESERVE_HARDLINKS
+	bool "Preserve hard links"
+	default y
+	depends on CP || MV
+	help
+	  Allow cp and mv to preserve hard links.
+
+comment "Common options for ls, more and telnet"
+	depends on LS || MORE || TELNET
+
+config FEATURE_AUTOWIDTH
+	bool "Calculate terminal & column widths"
+	default y
+	depends on LS || MORE || TELNET
+	help
+	  This option allows utilities such as 'ls', 'more' and 'telnet'
+	  to determine the width of the screen, which can allow them to
+	  display additional text or avoid wrapping text onto the next line.
+	  If you leave this disabled, your utilities will be especially
+	  primitive and will be unable to determine the current screen width.
+
+comment "Common options for df, du, ls"
+	depends on DF || DU || LS
+
+config FEATURE_HUMAN_READABLE
+	bool "Support for human readable output (example 13k, 23M, 235G)"
+	default y
+	depends on DF || DU || LS
+	help
+	  Allow df, du, and ls to have human readable output.
+
+comment "Common options for md5sum, sha1sum, sha256sum, sha512sum"
+	depends on MD5SUM || SHA1SUM || SHA256SUM || SHA512SUM
+
+config FEATURE_MD5_SHA1_SUM_CHECK
+	bool "Enable -c, -s and -w options"
+	default y
+	depends on MD5SUM || SHA1SUM || SHA256SUM || SHA512SUM
+	help
+	  Enabling the -c options allows files to be checked
+	  against pre-calculated hash values.
+
+	  -s and -w are useful options when verifying checksums.
+
+endmenu
+# -> source console-tools/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Console Utilities"
+
+
+
+config CHVT
+	bool "chvt"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program is used to change to another terminal.
+	  Example: chvt 4 (change to terminal /dev/tty4)
+
+config FGCONSOLE
+	bool "fgconsole"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program prints active (foreground) console number.
+
+config CLEAR
+	bool "clear"
+	default y
+	help
+	  This program clears the terminal screen.
+
+config DEALLOCVT
+	bool "deallocvt"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program deallocates unused virtual consoles.
+
+config DUMPKMAP
+	bool "dumpkmap"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program dumps the kernel's keyboard translation table to
+	  stdout, in binary format. You can then use loadkmap to load it.
+
+config KBD_MODE
+	bool "kbd_mode"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program reports and sets keyboard mode.
+
+config LOADFONT
+	bool "loadfont"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program loads a console font from standard input.
+
+config LOADKMAP
+	bool "loadkmap"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program loads a keyboard translation table from
+	  standard input.
+
+config OPENVT
+	bool "openvt"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program is used to start a command on an unused
+	  virtual terminal.
+
+config RESET
+	bool "reset"
+	default y
+	help
+	  This program is used to reset the terminal screen, if it
+	  gets messed up.
+
+config RESIZE
+	bool "resize"
+	default y
+	help
+	  This program is used to (re)set the width and height of your current
+	  terminal.
+
+config FEATURE_RESIZE_PRINT
+	bool "Print environment variables"
+	default y
+	depends on RESIZE
+	help
+	  Prints the newly set size (number of columns and rows) of
+	  the terminal.
+	  E.g.:
+	  COLUMNS=80;LINES=44;export COLUMNS LINES;
+
+config SETCONSOLE
+	bool "setconsole"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program redirects the system console to another device,
+	  like the current tty while logged in via telnet.
+
+config FEATURE_SETCONSOLE_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on SETCONSOLE && LONG_OPTS
+	help
+	  Support long options for the setconsole applet.
+
+config SETFONT
+	bool "setfont"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Allows to load console screen map. Useful for i18n.
+
+config FEATURE_SETFONT_TEXTUAL_MAP
+	bool "Support reading textual screen maps"
+	default y
+	depends on SETFONT
+	help
+	  Support reading textual screen maps.
+
+config DEFAULT_SETFONT_DIR
+	string "Default directory for console-tools files"
+	default ""
+	depends on SETFONT
+	help
+	  Directory to use if setfont's params are simple filenames
+	  (not /path/to/file or ./file). Default is "" (no default directory).
+
+config SETKEYCODES
+	bool "setkeycodes"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program loads entries into the kernel's scancode-to-keycode
+	  map, allowing unusual keyboards to generate usable keycodes.
+
+config SETLOGCONS
+	bool "setlogcons"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This program redirects the output console of kernel messages.
+
+config SHOWKEY
+	bool "showkey"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Shows keys pressed.
+
+comment "Common options for loadfont and setfont"
+	depends on LOADFONT || SETFONT
+
+config FEATURE_LOADFONT_PSF2
+	bool "Support for PSF2 console fonts"
+	default y
+	depends on LOADFONT || SETFONT
+	help
+	  Support PSF2 console fonts.
+
+config FEATURE_LOADFONT_RAW
+	bool "Support for old (raw) console fonts"
+	default y
+	depends on LOADFONT || SETFONT
+	help
+	  Support old (raw) console fonts.
+
+endmenu
+# -> source debianutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Debian Utilities"
+
+
+
+config MKTEMP
+	bool "mktemp"
+	default y
+	help
+	  mktemp is used to create unique temporary files
+
+config PIPE_PROGRESS
+	bool "pipe_progress"
+	default y
+	help
+	  Display a dot to indicate pipe activity.
+
+config RUN_PARTS
+	bool "run-parts"
+	default y
+	help
+	  run-parts is a utility designed to run all the scripts in a directory.
+
+	  It is useful to set up a directory like cron.daily, where you need to
+	  execute all the scripts in that directory.
+
+	  In this implementation of run-parts some features (such as report
+	  mode) are not implemented.
+
+	  Unless you know that run-parts is used in some of your scripts
+	  you can safely say N here.
+
+config FEATURE_RUN_PARTS_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on RUN_PARTS && LONG_OPTS
+	help
+	  Support long options for the run-parts applet.
+
+config FEATURE_RUN_PARTS_FANCY
+	bool "Support additional arguments"
+	default y
+	depends on RUN_PARTS
+	help
+	  Support additional options:
+	  -l --list print the names of the all matching files (not
+	            limited to executables), but don't actually run them.
+
+config START_STOP_DAEMON
+	bool "start-stop-daemon"
+	default y
+	help
+	  start-stop-daemon is used to control the creation and
+	  termination of system-level processes, usually the ones
+	  started during the startup of the system.
+
+config FEATURE_START_STOP_DAEMON_FANCY
+	bool "Support additional arguments"
+	default y
+	depends on START_STOP_DAEMON
+	help
+	  Support additional arguments.
+	  -o|--oknodo ignored since we exit with 0 anyway
+	  -v|--verbose
+	  -N|--nicelevel N
+
+config FEATURE_START_STOP_DAEMON_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on START_STOP_DAEMON && LONG_OPTS
+	help
+	  Support long options for the start-stop-daemon applet.
+
+config WHICH
+	bool "which"
+	default y
+	help
+	  which is used to find programs in your PATH and
+	  print out their pathnames.
+
+endmenu
+# -> source editors/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Editors"
+
+config PATCH
+	bool "patch"
+	default y
+	help
+	  Apply a unified diff formatted patch.
+config VI
+	bool "vi"
+	default y
+	help
+	  'vi' is a text editor. More specifically, it is the One True
+	  text editor <grin>. It does, however, have a rather steep
+	  learning curve. If you are not already comfortable with 'vi'
+	  you may wish to use something else.
+
+config FEATURE_VI_MAX_LEN
+	int "Maximum screen width in vi"
+	range 256 16384
+	default 4096
+	depends on VI
+	help
+	  Contrary to what you may think, this is not eating much.
+	  Make it smaller than 4k only if you are very limited on memory.
+
+config FEATURE_VI_8BIT
+	bool "Allow vi to display 8-bit chars (otherwise shows dots)"
+	default n
+	depends on VI
+	help
+	  If your terminal can display characters with high bit set,
+	  you may want to enable this. Note: vi is not Unicode-capable.
+	  If your terminal combines several 8-bit bytes into one character
+	  (as in Unicode mode), this will not work properly.
+
+config FEATURE_VI_COLON
+	bool "Enable \":\" colon commands (no \"ex\" mode)"
+	default y
+	depends on VI
+	help
+	  Enable a limited set of colon commands for vi. This does not
+	  provide an "ex" mode.
+
+config FEATURE_VI_YANKMARK
+	bool "Enable yank/put commands and mark cmds"
+	default y
+	depends on VI
+	help
+	  This will enable you to use yank and put, as well as mark in
+	  busybox vi.
+
+config FEATURE_VI_SEARCH
+	bool "Enable search and replace cmds"
+	default y
+	depends on VI
+	help
+	  Select this if you wish to be able to do search and replace in
+	  busybox vi.
+
+config FEATURE_VI_REGEX_SEARCH
+	bool "Enable regex in search and replace"
+	default n   # Uses GNU regex, which may be unavailable. FIXME
+	depends on FEATURE_VI_SEARCH
+	help
+	  Use extended regex search.
+
+config FEATURE_VI_USE_SIGNALS
+	bool "Catch signals"
+	default y
+	depends on VI
+	help
+	  Selecting this option will make busybox vi signal aware. This will
+	  make busybox vi support SIGWINCH to deal with Window Changes, catch
+	  Ctrl-Z and Ctrl-C and alarms.
+
+config FEATURE_VI_DOT_CMD
+	bool "Remember previous cmd and \".\" cmd"
+	default y
+	depends on VI
+	help
+	  Make busybox vi remember the last command and be able to repeat it.
+
+config FEATURE_VI_READONLY
+	bool "Enable -R option and \"view\" mode"
+	default y
+	depends on VI
+	help
+	  Enable the read-only command line option, which allows the user to
+	  open a file in read-only mode.
+
+config FEATURE_VI_SETOPTS
+	bool "Enable set-able options, ai ic showmatch"
+	default y
+	depends on VI
+	help
+	  Enable the editor to set some (ai, ic, showmatch) options.
+
+config FEATURE_VI_SET
+	bool "Support for :set"
+	default y
+	depends on VI
+	help
+	  Support for ":set".
+
+config FEATURE_VI_WIN_RESIZE
+	bool "Handle window resize"
+	default y
+	depends on VI
+	help
+	  Make busybox vi behave nicely with terminals that get resized.
+
+config FEATURE_VI_ASK_TERMINAL
+	bool "Use 'tell me cursor position' ESC sequence to measure window"
+	default y
+	depends on VI
+	help
+	  If terminal size can't be retrieved and $LINES/$COLUMNS are not set,
+	  this option makes vi perform a last-ditch effort to find it:
+	  position cursor to 999,999 and ask terminal to report real
+	  cursor position using "ESC [ 6 n" escape sequence, then read stdin.
+
+	  This is not clean but helps a lot on serial lines and such.
+
+config FEATURE_VI_OPTIMIZE_CURSOR
+	bool "Optimize cursor movement"
+	default y
+	depends on VI
+	help
+	  This will make the cursor movement faster, but requires more memory
+	  and it makes the applet a tiny bit larger.
+
+config AWK
+	bool "awk"
+	default y
+	help
+	  Awk is used as a pattern scanning and processing language. This is
+	  the BusyBox implementation of that programming language.
+
+config FEATURE_AWK_LIBM
+	bool "Enable math functions (requires libm)"
+	default y
+	depends on AWK
+	help
+	  Enable math functions of the Awk programming language.
+	  NOTE: This will require libm to be present for linking.
+
+config CMP
+	bool "cmp"
+	default y
+	help
+	  cmp is used to compare two files and returns the result
+	  to standard output.
+
+config DIFF
+	bool "diff"
+	default y
+	help
+	  diff compares two files or directories and outputs the
+	  differences between them in a form that can be given to
+	  the patch command.
+
+config FEATURE_DIFF_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on DIFF && LONG_OPTS
+	help
+	  Enable use of long options.
+
+config FEATURE_DIFF_DIR
+	bool "Enable directory support"
+	default y
+	depends on DIFF
+	help
+	  This option enables support for directory and subdirectory
+	  comparison.
+
+config ED
+	bool "ed"
+	default y
+	help
+	  The original 1970's Unix text editor, from the days of teletypes.
+	  Small, simple, evil. Part of SUSv3. If you're not already using
+	  this, you don't need it.
+
+config SED
+	bool "sed"
+	default y
+	help
+	  sed is used to perform text transformations on a file
+	  or input from a pipeline.
+
+config FEATURE_ALLOW_EXEC
+	bool "Allow vi and awk to execute shell commands"
+	default y
+	depends on VI || AWK
+	help
+	  Enables vi and awk features which allows user to execute
+	  shell commands (using system() C call).
+
+endmenu
+# -> source findutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Finding Utilities"
+
+config FIND
+	bool "find"
+	default y
+	help
+	  find is used to search your system to find specified files.
+
+config FEATURE_FIND_PRINT0
+	bool "Enable -print0: NUL-terminated output"
+	default y
+	depends on FIND
+	help
+	  Causes output names to be separated by a NUL character
+	  rather than a newline. This allows names that contain
+	  newlines and other whitespace to be more easily
+	  interpreted by other programs.
+
+config FEATURE_FIND_MTIME
+	bool "Enable -mtime: modified time matching"
+	default y
+	depends on FIND
+	help
+	  Allow searching based on the modification time of
+	  files, in days.
+
+config FEATURE_FIND_MMIN
+	bool "Enable -mmin: modified time matching by minutes"
+	default y
+	depends on FIND
+	help
+	  Allow searching based on the modification time of
+	  files, in minutes.
+
+config FEATURE_FIND_PERM
+	bool "Enable -perm: permissions matching"
+	default y
+	depends on FIND
+	help
+	  Enable searching based on file permissions.
+
+config FEATURE_FIND_TYPE
+	bool "Enable -type: file type matching (file/dir/link/...)"
+	default y
+	depends on FIND
+	help
+	  Enable searching based on file type (file,
+	  directory, socket, device, etc.).
+
+config FEATURE_FIND_XDEV
+	bool "Enable -xdev: 'stay in filesystem'"
+	default y
+	depends on FIND
+	help
+	  This option allows find to restrict searches to a single filesystem.
+
+config FEATURE_FIND_MAXDEPTH
+	bool "Enable -mindepth N and -maxdepth N"
+	default y
+	depends on FIND
+	help
+	  This option enables -mindepth N and -maxdepth N option.
+
+config FEATURE_FIND_NEWER
+	bool "Enable -newer: compare file modification times"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -newer' option for finding any files which have
+	  modification time that is more recent than the specified FILE.
+
+config FEATURE_FIND_INUM
+	bool "Enable -inum: inode number matching"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -inum' option for searching by inode number.
+
+config FEATURE_FIND_EXEC
+	bool "Enable -exec: execute commands"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -exec' option for executing commands based upon
+	  the files matched.
+
+config FEATURE_FIND_USER
+	bool "Enable -user: username/uid matching"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -user' option for searching by username or uid.
+
+config FEATURE_FIND_GROUP
+	bool "Enable -group: group/gid matching"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -group' option for searching by group name or gid.
+
+config FEATURE_FIND_NOT
+	bool "Enable the 'not' (!) operator"
+	default y
+	depends on FIND
+	help
+	  Support the '!' operator to invert the test results.
+	  If 'Enable full-blown desktop' is enabled, then will also support
+	  the non-POSIX notation '-not'.
+
+config FEATURE_FIND_DEPTH
+	bool "Enable -depth"
+	default y
+	depends on FIND
+	help
+	  Process each directory's contents before the directory itself.
+
+config FEATURE_FIND_PAREN
+	bool "Enable parens in options"
+	default y
+	depends on FIND
+	help
+	  Enable usage of parens '(' to specify logical order of arguments.
+
+config FEATURE_FIND_SIZE
+	bool "Enable -size: file size matching"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -size' option for searching by file size.
+
+config FEATURE_FIND_PRUNE
+	bool "Enable -prune: exclude subdirectories"
+	default y
+	depends on FIND
+	help
+	  If the file is a directory, dont descend into it. Useful for
+	  exclusion .svn and CVS directories.
+
+config FEATURE_FIND_DELETE
+	bool "Enable -delete: delete files/dirs"
+	default y
+	depends on FIND && FEATURE_FIND_DEPTH
+	help
+	  Support the 'find -delete' option for deleting files and directories.
+	  WARNING: This option can do much harm if used wrong. Busybox will not
+	  try to protect the user from doing stupid things. Use with care.
+
+config FEATURE_FIND_PATH
+	bool "Enable -path: match pathname with shell pattern"
+	default y
+	depends on FIND
+	help
+	  The -path option matches whole pathname instead of just filename.
+
+config FEATURE_FIND_REGEX
+	bool "Enable -regex: match pathname with regex"
+	default y
+	depends on FIND
+	help
+	  The -regex option matches whole pathname against regular expression.
+
+config FEATURE_FIND_CONTEXT
+	bool "Enable -context: security context matching"
+	default n
+	depends on FIND && SELINUX
+	help
+	  Support the 'find -context' option for matching security context.
+
+config FEATURE_FIND_LINKS
+	bool "Enable -links: link count matching"
+	default y
+	depends on FIND
+	help
+	  Support the 'find -links' option for matching number of links.
+config GREP
+	bool "grep"
+	default y
+	help
+	  grep is used to search files for a specified pattern.
+
+config FEATURE_GREP_EGREP_ALIAS
+	bool "Enable extended regular expressions (egrep & grep -E)"
+	default y
+	depends on GREP
+	help
+	  Enabled support for extended regular expressions. Extended
+	  regular expressions allow for alternation (foo|bar), grouping,
+	  and various repetition operators.
+
+config FEATURE_GREP_FGREP_ALIAS
+	bool "Alias fgrep to grep -F"
+	default y
+	depends on GREP
+	help
+	  fgrep sees the search pattern as a normal string rather than
+	  regular expressions.
+	  grep -F always works, this just creates the fgrep alias.
+
+config FEATURE_GREP_CONTEXT
+	bool "Enable before and after context flags (-A, -B and -C)"
+	default y
+	depends on GREP
+	help
+	  Print the specified number of leading (-B) and/or trailing (-A)
+	  context surrounding our matching lines.
+	  Print the specified number of context lines (-C).
+config XARGS
+	bool "xargs"
+	default y
+	help
+	  xargs is used to execute a specified command for
+	  every item from standard input.
+
+config FEATURE_XARGS_SUPPORT_CONFIRMATION
+	bool "Enable -p: prompt and confirmation"
+	default y
+	depends on XARGS
+	help
+	  Support -p: prompt the user whether to run each command
+	  line and read a line from the terminal.
+
+config FEATURE_XARGS_SUPPORT_QUOTES
+	bool "Enable single and double quotes and backslash"
+	default y
+	depends on XARGS
+	help
+	  Support quoting in the input.
+
+config FEATURE_XARGS_SUPPORT_TERMOPT
+	bool "Enable -x: exit if -s or -n is exceeded"
+	default y
+	depends on XARGS
+	help
+	  Support -x: exit if the command size (see the -s or -n option)
+	  is exceeded.
+
+config FEATURE_XARGS_SUPPORT_ZERO_TERM
+	bool "Enable -0: NUL-terminated input"
+	default y
+	depends on XARGS
+	help
+	  Support -0: input items are terminated by a NUL character
+	  instead of whitespace, and the quotes and backslash
+	  are not special.
+
+endmenu
+# -> source init/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Init Utilities"
+
+config BOOTCHARTD
+	bool "bootchartd"
+	default y
+	help
+	  bootchartd is commonly used to profile the boot process
+	  for the purpose of speeding it up. In this case, it is started
+	  by the kernel as the init process. This is configured by adding
+	  the init=/sbin/bootchartd option to the kernel command line.
+
+	  It can also be used to monitor the resource usage of a specific
+	  application or the running system in general. In this case,
+	  bootchartd is started interactively by running bootchartd start
+	  and stopped using bootchartd stop.
+
+config FEATURE_BOOTCHARTD_BLOATED_HEADER
+	bool "Compatible, bloated header"
+	default y
+	depends on BOOTCHARTD
+	help
+	  Create extended header file compatible with "big" bootchartd.
+	  "Big" bootchartd is a shell script and it dumps some
+	  "convenient" info int the header, such as:
+	    title = Boot chart for `hostname` (`date`)
+	    system.uname = `uname -srvm`
+	    system.release = `cat /etc/DISTRO-release`
+	    system.cpu = `grep '^model name' /proc/cpuinfo | head -1` ($cpucount)
+	    system.kernel.options = `cat /proc/cmdline`
+	  This data is not mandatory for bootchart graph generation,
+	  and is considered bloat. Nevertheless, this option
+	  makes bootchartd applet to dump a subset of it.
+
+config FEATURE_BOOTCHARTD_CONFIG_FILE
+	bool "Support bootchartd.conf"
+	default y
+	depends on BOOTCHARTD
+	help
+	  Enable reading and parsing of $PWD/bootchartd.conf
+	  and /etc/bootchartd.conf files.
+config HALT
+	bool "poweroff, halt, and reboot"
+	default y
+	help
+	  Stop all processes and either halt, reboot, or power off the system.
+
+config FEATURE_CALL_TELINIT
+	bool "Call telinit on shutdown and reboot"
+	default y
+	depends on HALT && !INIT
+	help
+	  Call an external program (normally telinit) to facilitate
+	  a switch to a proper runlevel.
+
+	  This option is only available if you selected halt and friends,
+	  but did not select init.
+
+config TELINIT_PATH
+	string "Path to telinit executable"
+	default "/sbin/telinit"
+	depends on FEATURE_CALL_TELINIT
+	help
+	  When busybox halt and friends have to call external telinit
+	  to facilitate proper shutdown, this path is to be used when
+	  locating telinit executable.
+config INIT
+	bool "init"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  init is the first program run when the system boots.
+
+config FEATURE_USE_INITTAB
+	bool "Support reading an inittab file"
+	default y
+	depends on INIT
+	help
+	  Allow init to read an inittab file when the system boot.
+
+config FEATURE_KILL_REMOVED
+	bool "Support killing processes that have been removed from inittab"
+	default n
+	depends on FEATURE_USE_INITTAB
+	help
+	  When respawn entries are removed from inittab and a SIGHUP is
+	  sent to init, this option will make init kill the processes
+	  that have been removed.
+
+config FEATURE_KILL_DELAY
+	int "How long to wait between TERM and KILL (0 - send TERM only)" if FEATURE_KILL_REMOVED
+	range 0 1024
+	default 0
+	depends on FEATURE_KILL_REMOVED
+	help
+	  With nonzero setting, init sends TERM, forks, child waits N
+	  seconds, sends KILL and exits. Setting it too high is unwise
+	  (child will hang around for too long and could actually kill
+	  the wrong process!)
+
+config FEATURE_INIT_SCTTY
+	bool "Run commands with leading dash with controlling tty"
+	default y
+	depends on INIT
+	help
+	  If this option is enabled, init will try to give a controlling
+	  tty to any command which has leading hyphen (often it's "-/bin/sh").
+	  More precisely, init will do "ioctl(STDIN_FILENO, TIOCSCTTY, 0)".
+	  If device attached to STDIN_FILENO can be a ctty but is not yet
+	  a ctty for other session, it will become this process' ctty.
+	  This is not the traditional init behavour, but is often what you want
+	  in an embedded system where the console is only accessed during
+	  development or for maintenance.
+	  NB: using cttyhack applet may work better.
+
+config FEATURE_INIT_SYSLOG
+	bool "Enable init to write to syslog"
+	default y
+	depends on INIT
+
+config FEATURE_EXTRA_QUIET
+	bool "Be _extra_ quiet on boot"
+	default y
+	depends on INIT
+	help
+	  Prevent init from logging some messages to the console during boot.
+
+config FEATURE_INIT_COREDUMPS
+	bool "Support dumping core for child processes (debugging only)"
+	default y
+	depends on INIT
+	help
+	  If this option is enabled and the file /.init_enable_core
+	  exists, then init will call setrlimit() to allow unlimited
+	  core file sizes. If this option is disabled, processes
+	  will not generate any core files.
+
+config FEATURE_INITRD
+	bool "Support running init from within an initrd (not initramfs)"
+	default y
+	depends on INIT
+	help
+	  Legacy support for running init under the old-style initrd. Allows
+	  the name linuxrc to act as init, and it doesn't assume init is PID 1.
+
+	  This does not apply to initramfs, which runs /init as PID 1 and
+	  requires no special support.
+
+config INIT_TERMINAL_TYPE
+	string "Initial terminal type"
+	default "linux"
+	depends on INIT
+	help
+	  This is the initial value set by init for the TERM environment
+	  variable. This variable is used by programs which make use of
+	  extended terminal capabilities.
+
+	  Note that on Linux, init attempts to detect serial terminal and
+	  sets TERM to "vt102" if one is found.
+config MESG
+	bool "mesg"
+	default y
+	help
+	  Mesg controls access to your terminal by others. It is typically
+	  used to allow or disallow other users to write to your terminal
+
+config FEATURE_MESG_ENABLE_ONLY_GROUP
+	bool "Enable writing to tty only by group, not by everybody"
+	default y
+	depends on MESG
+	help
+	  Usually, ttys are owned by group "tty", and "write" tool is
+	  setgid to this group. This way, "mesg y" only needs to enable
+	  "write by owning group" bit in tty mode.
+
+	  If you set this option to N, "mesg y" will enable writing
+	  by anybody at all. This is not recommended.
+
+endmenu
+# -> source loginutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Login/Password Management Utilities"
+
+config ADD_SHELL
+       bool "add-shell"
+       default y if DESKTOP
+       help
+         Add shells to /etc/shells.
+
+config REMOVE_SHELL
+       bool "remove-shell"
+       default y if DESKTOP
+       help
+         Remove shells from /etc/shells.
+
+config FEATURE_SHADOWPASSWDS
+	bool "Support for shadow passwords"
+	default y
+	help
+	  Build support for shadow password in /etc/shadow. This file is only
+	  readable by root and thus the encrypted passwords are no longer
+	  publicly readable.
+
+config USE_BB_PWD_GRP
+	bool "Use internal password and group functions rather than system functions"
+	default y
+	help
+	  If you leave this disabled, busybox will use the system's password
+	  and group functions. And if you are using the GNU C library
+	  (glibc), you will then need to install the /etc/nsswitch.conf
+	  configuration file and the required /lib/libnss_* libraries in
+	  order for the password and group functions to work. This generally
+	  makes your embedded system quite a bit larger.
+
+	  Enabling this option will cause busybox to directly access the
+	  system's /etc/password, /etc/group files (and your system will be
+	  smaller, and I will get fewer emails asking about how glibc NSS
+	  works). When this option is enabled, you will not be able to use
+	  PAM to access remote LDAP password servers and whatnot. And if you
+	  want hostname resolution to work with glibc, you still need the
+	  /lib/libnss_* libraries.
+
+	  If you need to use glibc's nsswitch.conf mechanism
+	  (e.g. if user/group database is NOT stored in /etc/passwd etc),
+	  you must NOT use this option.
+
+	  If you enable this option, it will add about 1.5k.
+
+config USE_BB_SHADOW
+	bool "Use internal shadow password functions"
+	default y
+	depends on USE_BB_PWD_GRP && FEATURE_SHADOWPASSWDS
+	help
+	  If you leave this disabled, busybox will use the system's shadow
+	  password handling functions. And if you are using the GNU C library
+	  (glibc), you will then need to install the /etc/nsswitch.conf
+	  configuration file and the required /lib/libnss_* libraries in
+	  order for the shadow password functions to work. This generally
+	  makes your embedded system quite a bit larger.
+
+	  Enabling this option will cause busybox to directly access the
+	  system's /etc/shadow file when handling shadow passwords. This
+	  makes your system smaller (and I will get fewer emails asking about
+	  how glibc NSS works). When this option is enabled, you will not be
+	  able to use PAM to access shadow passwords from remote LDAP
+	  password servers and whatnot.
+
+config USE_BB_CRYPT
+	bool "Use internal crypt functions"
+	default y
+	help
+	  Busybox has internal DES and MD5 crypt functions.
+	  They produce results which are identical to corresponding
+	  standard C library functions.
+
+	  If you leave this disabled, busybox will use the system's
+	  crypt functions. Most C libraries use large (~70k)
+	  static buffers there, and also combine them with more general
+	  DES encryption/decryption.
+
+	  For busybox, having large static buffers is undesirable,
+	  especially on NOMMU machines. Busybox also doesn't need
+	  DES encryption/decryption and can do with smaller code.
+
+	  If you enable this option, it will add about 4.8k of code
+	  if you are building dynamically linked executable.
+	  In static build, it makes code _smaller_ by about 1.2k,
+	  and likely many kilobytes less of bss.
+
+config USE_BB_CRYPT_SHA
+	bool "Enable SHA256/512 crypt functions"
+	default y
+	depends on USE_BB_CRYPT
+	help
+	  Enable this if you have passwords starting with "$5$" or "$6$"
+	  in your /etc/passwd or /etc/shadow files. These passwords
+	  are hashed using SHA256 and SHA512 algorithms. Support for them
+	  was added to glibc in 2008.
+	  With this option off, login will fail password check for any
+	  user which has password encrypted with these algorithms.
+
+config ADDUSER
+	bool "adduser"
+	default y
+	help
+	  Utility for creating a new user account.
+
+config FEATURE_ADDUSER_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on ADDUSER && LONG_OPTS
+	help
+	  Support long options for the adduser applet.
+
+config FEATURE_CHECK_NAMES
+	bool "Enable sanity check on user/group names in adduser and addgroup"
+	default n
+	depends on ADDUSER || ADDGROUP
+	help
+	  Enable sanity check on user and group names in adduser and addgroup.
+	  To avoid problems, the user or group name should consist only of
+	  letters, digits, underscores, periods, at signs and dashes,
+	  and not start with a dash (as defined by IEEE Std 1003.1-2001).
+	  For compatibility with Samba machine accounts "$" is also supported
+	  at the end of the user or group name.
+
+config FIRST_SYSTEM_ID
+	int "First valid system uid or gid for adduser and addgroup"
+	depends on ADDUSER || ADDGROUP
+	range 0 64900
+	default 100
+	help
+	  First valid system uid or gid for adduser and addgroup
+
+config LAST_SYSTEM_ID
+	int "Last valid system uid or gid for adduser and addgroup"
+	depends on ADDUSER || ADDGROUP
+	range 0 64900
+	default 999
+	help
+	  Last valid system uid or gid for adduser and addgroup
+
+config ADDGROUP
+	bool "addgroup"
+	default y
+	help
+	  Utility for creating a new group account.
+
+config FEATURE_ADDGROUP_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on ADDGROUP && LONG_OPTS
+	help
+	  Support long options for the addgroup applet.
+
+config FEATURE_ADDUSER_TO_GROUP
+	bool "Support for adding users to groups"
+	default y
+	depends on ADDGROUP
+	help
+	  If  called  with two non-option arguments,
+	  addgroup will add an existing user to an
+	  existing group.
+
+config DELUSER
+	bool "deluser"
+	default y
+	help
+	  Utility for deleting a user account.
+
+config DELGROUP
+	bool "delgroup"
+	default y
+	help
+	  Utility for deleting a group account.
+
+config FEATURE_DEL_USER_FROM_GROUP
+	bool "Support for removing users from groups"
+	default y
+	depends on DELGROUP
+	help
+	  If called with two non-option arguments, deluser
+	  or delgroup will remove an user from a specified group.
+
+config GETTY
+	bool "getty"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  getty lets you log in on a tty. It is normally invoked by init.
+
+	  Note that you can save a few bytes by disabling it and
+	  using login applet directly.
+	  If you need to reset tty attributes before calling login,
+	  this script approximates getty:
+
+	  exec </dev/$1 >/dev/$1 2>&1 || exit 1
+	  reset
+	  stty sane; stty ispeed 38400; stty ospeed 38400
+	  printf "%s login: " "`hostname`"
+	  read -r login
+	  exec /bin/login "$login"
+
+config LOGIN
+	bool "login"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  login is used when signing onto a system.
+
+	  Note that Busybox binary must be setuid root for this applet to
+	  work properly.
+
+config PAM
+	bool "Support for PAM (Pluggable Authentication Modules)"
+	default n
+	depends on LOGIN
+	help
+	  Use PAM in login(1) instead of direct access to password database.
+
+config LOGIN_SCRIPTS
+	bool "Support for login scripts"
+	depends on LOGIN
+	default y
+	help
+	  Enable this if you want login to execute $LOGIN_PRE_SUID_SCRIPT
+	  just prior to switching from root to logged-in user.
+
+config FEATURE_NOLOGIN
+	bool "Support for /etc/nologin"
+	default y
+	depends on LOGIN
+	help
+	  The file /etc/nologin is used by (some versions of) login(1).
+	  If it exists, non-root logins are prohibited.
+
+config FEATURE_SECURETTY
+	bool "Support for /etc/securetty"
+	default y
+	depends on LOGIN
+	help
+	  The file /etc/securetty is used by (some versions of) login(1).
+	  The file contains the device names of tty lines (one per line,
+	  without leading /dev/) on which root is allowed to login.
+
+config PASSWD
+	bool "passwd"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  passwd changes passwords for user and group accounts. A normal user
+	  may only change the password for his/her own account, the super user
+	  may change the password for any account. The administrator of a group
+	  may change the password for the group.
+
+	  Note that Busybox binary must be setuid root for this applet to
+	  work properly.
+
+config FEATURE_PASSWD_WEAK_CHECK
+	bool "Check new passwords for weakness"
+	default y
+	depends on PASSWD
+	help
+	  With this option passwd will refuse new passwords which are "weak".
+
+config CRYPTPW
+	bool "cryptpw"
+	default y
+	help
+	  Encrypts the given password with the crypt(3) libc function
+	  using the given salt. Debian has this utility under mkpasswd
+	  name. Busybox provides mkpasswd as an alias for cryptpw.
+
+config CHPASSWD
+	bool "chpasswd"
+	default y
+	help
+	  Reads a file of user name and password pairs from standard input
+	  and uses this information to update a group of existing users.
+
+config SU
+	bool "su"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  su is used to become another user during a login session.
+	  Invoked without a username, su defaults to becoming the super user.
+
+	  Note that Busybox binary must be setuid root for this applet to
+	  work properly.
+
+config FEATURE_SU_SYSLOG
+	bool "Enable su to write to syslog"
+	default y
+	depends on SU
+
+config FEATURE_SU_CHECKS_SHELLS
+	bool "Enable su to check user's shell to be listed in /etc/shells"
+	depends on SU
+	default y
+
+config SULOGIN
+	bool "sulogin"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  sulogin is invoked when the system goes into single user
+	  mode (this is done through an entry in inittab).
+
+config VLOCK
+	bool "vlock"
+	default y
+	help
+	  Build the "vlock" applet which allows you to lock (virtual) terminals.
+
+	  Note that Busybox binary must be setuid root for this applet to
+	  work properly.
+
+endmenu
+# -> source e2fsprogs/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Linux Ext2 FS Progs"
+
+
+
+config CHATTR
+	bool "chattr"
+	default y
+	help
+	  chattr changes the file attributes on a second extended file system.
+
+### config E2FSCK
+###	bool "e2fsck"
+###	default y
+###	help
+###	  e2fsck is used to check Linux second extended file systems (ext2fs).
+###	  e2fsck also supports ext2 filesystems countaining a journal (ext3).
+###	  The normal compat symlinks 'fsck.ext2' and 'fsck.ext3' are also
+###	  provided.
+
+config FSCK
+	bool "fsck"
+	default y
+	help
+	  fsck is used to check and optionally repair one or more filesystems.
+	  In actuality, fsck is simply a front-end for the various file system
+	  checkers (fsck.fstype) available under Linux.
+
+config LSATTR
+	bool "lsattr"
+	default y
+	select PLATFORM_LINUX
+	help
+	  lsattr lists the file attributes on a second extended file system.
+
+### config MKE2FS
+###	bool "mke2fs"
+###	default y
+###	help
+###	  mke2fs is used to create an ext2/ext3 filesystem. The normal compat
+###	  symlinks 'mkfs.ext2' and 'mkfs.ext3' are also provided.
+
+config TUNE2FS
+	bool "tune2fs"
+	default n  # off: it is too limited compared to upstream version
+	help
+	  tune2fs allows the system administrator to adjust various tunable
+	  filesystem parameters on Linux ext2/ext3 filesystems.
+
+### config E2LABEL
+###	bool "e2label"
+###	default y
+###	depends on TUNE2FS
+###	help
+###	  e2label will display or change the filesystem label on the ext2
+###	  filesystem located on device.
+
+### NB: this one is now provided by util-linux/volume_id/*
+### config FINDFS
+###	bool "findfs"
+###	default y
+###	depends on TUNE2FS
+###	help
+###	  findfs will search the disks in the system looking for a filesystem
+###	  which has a label matching label or a UUID equal to uuid.
+
+endmenu
+# -> source modutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Linux Module Utilities"
+
+config MODINFO
+	bool "modinfo"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Show information about a Linux Kernel module
+
+config MODPROBE_SMALL
+	bool "Simplified modutils"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Simplified modutils.
+
+	  With this option modprobe does not require modules.dep file
+	  and does not use /etc/modules.conf file.
+	  It scans module files in /lib/modules/`uname -r` and
+	  determines dependencies and module alias names on the fly.
+	  This may make module loading slower, most notably
+	  when one needs to load module by alias (this requires
+	  scanning through module _bodies_).
+
+	  At the first attempt to load a module by alias modprobe
+	  will try to generate modules.dep.bb file in order to speed up
+	  future loads by alias. Failure to do so (read-only /lib/modules,
+	  etc) is not reported, and future modprobes will be slow too.
+
+	  NB: modules.dep.bb file format is not compatible
+	  with modules.dep file as created/used by standard module tools.
+
+	  Additional module parameters can be stored in
+	  /etc/modules/$module_name files.
+
+	  Apart from modprobe, other utilities are also provided:
+	  - insmod is an alias to modprobe
+	  - rmmod is an alias to modprobe -r
+	  - depmod generates modules.dep.bb
+
+	  As of 2008-07, this code is experimental. It is 14kb smaller
+	  than "non-small" modutils.
+
+config FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE
+	bool "Accept module options on modprobe command line"
+	default y
+	depends on MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  Allow insmod and modprobe take module options from command line.
+
+config FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED
+	bool "Skip loading of already loaded modules"
+	default y
+	depends on MODPROBE_SMALL
+	help
+	  Check if the module is already loaded.
+
+config INSMOD
+	bool "insmod"
+	default n
+	depends on !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  insmod is used to load specified modules in the running kernel.
+
+config RMMOD
+	bool "rmmod"
+	default n
+	depends on !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  rmmod is used to unload specified modules from the kernel.
+
+config LSMOD
+	bool "lsmod"
+	default n
+	depends on !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  lsmod is used to display a list of loaded modules.
+
+config FEATURE_LSMOD_PRETTY_2_6_OUTPUT
+	bool "Pretty output"
+	default n
+	depends on LSMOD
+	select PLATFORM_LINUX
+	help
+	  This option makes output format of lsmod adjusted to
+	  the format of module-init-tools for Linux kernel 2.6.
+	  Increases size somewhat.
+
+config MODPROBE
+	bool "modprobe"
+	default n
+	depends on !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  Handle the loading of modules, and their dependencies on a high
+	  level.
+
+config FEATURE_MODPROBE_BLACKLIST
+	bool "Blacklist support"
+	default n
+	depends on MODPROBE
+	select PLATFORM_LINUX
+	help
+	  Say 'y' here to enable support for the 'blacklist' command in
+	  modprobe.conf. This prevents the alias resolver to resolve
+	  blacklisted modules. This is useful if you want to prevent your
+	  hardware autodetection scripts to load modules like evdev, frame
+	  buffer drivers etc.
+
+config DEPMOD
+	bool "depmod"
+	default n
+	depends on !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  depmod generates modules.dep (and potentially modules.alias
+	  and modules.symbols) that contain dependency information
+	  for modprobe.
+
+comment "Options common to multiple modutils"
+
+config FEATURE_2_4_MODULES
+	bool "Support version 2.2/2.4 Linux kernels"
+	default n
+	depends on INSMOD || RMMOD || LSMOD
+	select PLATFORM_LINUX
+	help
+	  Support module loading for 2.2.x and 2.4.x Linux kernels.
+	  This increases size considerably. Say N unless you plan
+	  to run ancient kernels.
+
+config FEATURE_INSMOD_TRY_MMAP
+	bool "Try to load module from a mmap'ed area"
+	default n
+	depends on INSMOD || MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  This option causes module loading code to try to mmap
+	  module first. If it does not work (for example,
+	  it does not work for compressed modules), module will be read
+	  (and unpacked if needed) into a memory block allocated by malloc.
+
+	  The only case when mmap works but malloc does not is when
+	  you are trying to load a big module on a very memory-constrained
+	  machine. Malloc will momentarily need 2x as much memory as mmap.
+
+	  Choosing N saves about 250 bytes of code (on 32-bit x86).
+
+config FEATURE_INSMOD_VERSION_CHECKING
+	bool "Enable module version checking"
+	default n
+	depends on FEATURE_2_4_MODULES && (INSMOD || MODPROBE)
+	select PLATFORM_LINUX
+	help
+	  Support checking of versions for modules. This is used to
+	  ensure that the kernel and module are made for each other.
+
+config FEATURE_INSMOD_KSYMOOPS_SYMBOLS
+	bool "Add module symbols to kernel symbol table"
+	default n
+	depends on FEATURE_2_4_MODULES && (INSMOD || MODPROBE)
+	select PLATFORM_LINUX
+	help
+	  By adding module symbols to the kernel symbol table, Oops messages
+	  occuring within kernel modules can be properly debugged. By enabling
+	  this feature, module symbols will always be added to the kernel symbol
+	  table for proper debugging support. If you are not interested in
+	  Oops messages from kernel modules, say N.
+
+config FEATURE_INSMOD_LOADINKMEM
+	bool "In kernel memory optimization (uClinux only)"
+	default n
+	depends on FEATURE_2_4_MODULES && (INSMOD || MODPROBE)
+	select PLATFORM_LINUX
+	help
+	  This is a special uClinux only memory optimization that lets insmod
+	  load the specified kernel module directly into kernel space, reducing
+	  memory usage by preventing the need for two copies of the module
+	  being loaded into memory.
+
+config FEATURE_INSMOD_LOAD_MAP
+	bool "Enable insmod load map (-m) option"
+	default n
+	depends on FEATURE_2_4_MODULES && INSMOD
+	select PLATFORM_LINUX
+	help
+	  Enabling this, one would be able to get a load map
+	  output on stdout. This makes kernel module debugging
+	  easier.
+	  If you don't plan to debug kernel modules, you
+	  don't need this option.
+
+config FEATURE_INSMOD_LOAD_MAP_FULL
+	bool "Symbols in load map"
+	default y
+	depends on FEATURE_INSMOD_LOAD_MAP && !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  Without this option, -m will only output section
+	  load map. With this option, -m will also output
+	  symbols load map.
+
+config FEATURE_CHECK_TAINTED_MODULE
+	bool "Support tainted module checking with new kernels"
+	default y
+	depends on (LSMOD || FEATURE_2_4_MODULES) && !MODPROBE_SMALL
+	select PLATFORM_LINUX
+	help
+	  Support checking for tainted modules. These are usually binary
+	  only modules that will make the linux-kernel list ignore your
+	  support request.
+	  This option is required to support GPLONLY modules.
+
+config FEATURE_MODUTILS_ALIAS
+	bool "Support for module.aliases file"
+	default y
+	depends on DEPMOD || MODPROBE
+	select PLATFORM_LINUX
+	help
+	  Generate and parse modules.alias containing aliases for bus
+	  identifiers:
+	    alias pcmcia:m*c*f03fn*pfn*pa*pb*pc*pd* parport_cs
+
+	  and aliases for logical modules names e.g.:
+	    alias padlock_aes aes
+	    alias aes_i586 aes
+	    alias aes_generic aes
+
+	  Say Y if unsure.
+
+config FEATURE_MODUTILS_SYMBOLS
+	bool "Support for module.symbols file"
+	default y
+	depends on DEPMOD || MODPROBE
+	select PLATFORM_LINUX
+	help
+	  Generate and parse modules.symbols containing aliases for
+	  symbol_request() kernel calls, such as:
+	    alias symbol:usb_sg_init usbcore
+
+	  Say Y if unsure.
+
+config DEFAULT_MODULES_DIR
+	string "Default directory containing modules"
+	default "/lib/modules"
+	depends on DEPMOD || MODPROBE || MODPROBE_SMALL || MODINFO
+	help
+	  Directory that contains kernel modules.
+	  Defaults to "/lib/modules"
+
+config DEFAULT_DEPMOD_FILE
+	string "Default name of modules.dep"
+	default "modules.dep"
+	depends on DEPMOD || MODPROBE || MODPROBE_SMALL || MODINFO
+	help
+	  Filename that contains kernel modules dependencies.
+	  Defaults to "modules.dep"
+
+endmenu
+# -> source util-linux/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Linux System Utilities"
+
+config BLOCKDEV
+	bool "blockdev"
+	default y
+	help
+	  Performs some ioctls with block devices.
+config REV
+	bool "rev"
+	default y
+	help
+	  Reverse lines of a file or files.
+
+config ACPID
+	bool "acpid"
+	default y
+	select PLATFORM_LINUX
+	help
+	  acpid listens to ACPI events coming either in textual form from
+	  /proc/acpi/event (though it is marked deprecated it is still widely
+	  used and _is_ a standard) or in binary form from specified evdevs
+	  (just use /dev/input/event*).
+
+	  It parses the event to retrieve ACTION and a possible PARAMETER.
+	  It then spawns /etc/acpi/<ACTION>[/<PARAMETER>] either via run-parts
+	  (if the resulting path is a directory) or directly as an executable.
+
+	  N.B. acpid relies on run-parts so have the latter installed.
+
+config FEATURE_ACPID_COMPAT
+	bool "Accept and ignore redundant options"
+	default y
+	depends on ACPID
+	help
+	  Accept and ignore compatibility options -g -m -s -S -v.
+
+config BLKID
+	bool "blkid"
+	default y
+	select PLATFORM_LINUX
+	select VOLUMEID
+	help
+	  Lists labels and UUIDs of all filesystems.
+	  WARNING:
+	  With all submodules selected, it will add ~8k to busybox.
+
+config FEATURE_BLKID_TYPE
+	bool "Print filesystem type"
+	default n
+	depends on BLKID
+	help
+	  Show TYPE="filesystem type"
+
+config DMESG
+	bool "dmesg"
+	default y
+	select PLATFORM_LINUX
+	help
+	  dmesg is used to examine or control the kernel ring buffer. When the
+	  Linux kernel prints messages to the system log, they are stored in
+	  the kernel ring buffer. You can use dmesg to print the kernel's ring
+	  buffer, clear the kernel ring buffer, change the size of the kernel
+	  ring buffer, and change the priority level at which kernel messages
+	  are also logged to the system console. Enable this option if you
+	  wish to enable the 'dmesg' utility.
+
+config FEATURE_DMESG_PRETTY
+	bool "Pretty dmesg output"
+	default y
+	depends on DMESG
+	help
+	  If you wish to scrub the syslog level from the output, say 'Y' here.
+	  The syslog level is a string prefixed to every line with the form
+	  "<#>".
+
+	  With this option you will see:
+	    # dmesg
+	    Linux version 2.6.17.4 .....
+	    BIOS-provided physical RAM map:
+	     BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
+
+	  Without this option you will see:
+	    # dmesg
+	    <5>Linux version 2.6.17.4 .....
+	    <6>BIOS-provided physical RAM map:
+	    <6> BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
+
+config FBSET
+	bool "fbset"
+	default y
+	select PLATFORM_LINUX
+	help
+	  fbset is used to show or change the settings of a Linux frame buffer
+	  device. The frame buffer device provides a simple and unique
+	  interface to access a graphics display. Enable this option
+	  if you wish to enable the 'fbset' utility.
+
+config FEATURE_FBSET_FANCY
+	bool "Turn on extra fbset options"
+	default y
+	depends on FBSET
+	help
+	  This option enables extended fbset options, allowing one to set the
+	  framebuffer size, color depth, etc. interface to access a graphics
+	  display. Enable this option if you wish to enable extended fbset
+	  options.
+
+config FEATURE_FBSET_READMODE
+	bool "Turn on fbset readmode support"
+	default y
+	depends on FBSET
+	help
+	  This option allows fbset to read the video mode database stored by
+	  default as /etc/fb.modes, which can be used to set frame buffer
+	  device to pre-defined video modes.
+
+config FDFLUSH
+	bool "fdflush"
+	default y
+	select PLATFORM_LINUX
+	help
+	  fdflush is only needed when changing media on slightly-broken
+	  removable media drives. It is used to make Linux believe that a
+	  hardware disk-change switch has been actuated, which causes Linux to
+	  forget anything it has cached from the previous media. If you have
+	  such a slightly-broken drive, you will need to run fdflush every time
+	  you change a disk. Most people have working hardware and can safely
+	  leave this disabled.
+
+config FDFORMAT
+	bool "fdformat"
+	default y
+	select PLATFORM_LINUX
+	help
+	  fdformat is used to low-level format a floppy disk.
+
+config FDISK
+	bool "fdisk"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The fdisk utility is used to divide hard disks into one or more
+	  logical disks, which are generally called partitions. This utility
+	  can be used to list and edit the set of partitions or BSD style
+	  'disk slices' that are defined on a hard drive.
+
+config FDISK_SUPPORT_LARGE_DISKS
+	bool "Support over 4GB disks"
+	default y
+	depends on FDISK
+	depends on !LFS   # with LFS no special code is needed
+	help
+	  Enable this option to support large disks > 4GB.
+
+config FEATURE_FDISK_WRITABLE
+	bool "Write support"
+	default y
+	depends on FDISK
+	help
+	  Enabling this option allows you to create or change a partition table
+	  and write those changes out to disk. If you leave this option
+	  disabled, you will only be able to view the partition table.
+
+config FEATURE_AIX_LABEL
+	bool "Support AIX disklabels"
+	default n
+	depends on FDISK && FEATURE_FDISK_WRITABLE
+	help
+	  Enabling this option allows you to create or change AIX disklabels.
+	  Most people can safely leave this option disabled.
+
+config FEATURE_SGI_LABEL
+	bool "Support SGI disklabels"
+	default n
+	depends on FDISK && FEATURE_FDISK_WRITABLE
+	help
+	  Enabling this option allows you to create or change SGI disklabels.
+	  Most people can safely leave this option disabled.
+
+config FEATURE_SUN_LABEL
+	bool "Support SUN disklabels"
+	default n
+	depends on FDISK && FEATURE_FDISK_WRITABLE
+	help
+	  Enabling this option allows you to create or change SUN disklabels.
+	  Most people can safely leave this option disabled.
+
+config FEATURE_OSF_LABEL
+	bool "Support BSD disklabels"
+	default n
+	depends on FDISK && FEATURE_FDISK_WRITABLE
+	help
+	  Enabling this option allows you to create or change BSD disklabels
+	  and define and edit BSD disk slices.
+
+config FEATURE_GPT_LABEL
+	bool "Support GPT disklabels"
+	default n
+	depends on FDISK && FEATURE_FDISK_WRITABLE
+	help
+	  Enabling this option allows you to view GUID Partition Table
+	  disklabels.
+
+config FEATURE_FDISK_ADVANCED
+	bool "Support expert mode"
+	default y
+	depends on FDISK && FEATURE_FDISK_WRITABLE
+	help
+	  Enabling this option allows you to do terribly unsafe things like
+	  define arbitrary drive geometry, move the beginning of data in a
+	  partition, and similarly evil things. Unless you have a very good
+	  reason you would be wise to leave this disabled.
+
+config FINDFS
+	bool "findfs"
+	default y
+	select PLATFORM_LINUX
+	select VOLUMEID
+	help
+	  Prints the name of a filesystem with given label or UUID.
+	  WARNING:
+	  With all submodules selected, it will add ~8k to busybox.
+
+config FLOCK
+	bool "flock"
+	default y
+	help
+	  Manage locks from shell scripts
+
+config FREERAMDISK
+	bool "freeramdisk"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Linux allows you to create ramdisks. This utility allows you to
+	  delete them and completely free all memory that was used for the
+	  ramdisk. For example, if you boot Linux into a ramdisk and later
+	  pivot_root, you may want to free the memory that is allocated to the
+	  ramdisk. If you have no use for freeing memory from a ramdisk, leave
+	  this disabled.
+
+config FSCK_MINIX
+	bool "fsck_minix"
+	default y
+	help
+	  The minix filesystem is a nice, small, compact, read-write filesystem
+	  with little overhead. It is not a journaling filesystem however and
+	  can experience corruption if it is not properly unmounted or if the
+	  power goes off in the middle of a write. This utility allows you to
+	  check for and attempt to repair any corruption that occurs to a minix
+	  filesystem.
+
+config MKFS_EXT2
+	bool "mkfs_ext2"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Utility to create EXT2 filesystems.
+
+config MKFS_MINIX
+	bool "mkfs_minix"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The minix filesystem is a nice, small, compact, read-write filesystem
+	  with little overhead. If you wish to be able to create minix
+	  filesystems this utility will do the job for you.
+
+config FEATURE_MINIX2
+	bool "Support Minix fs v2 (fsck_minix/mkfs_minix)"
+	default y
+	depends on FSCK_MINIX || MKFS_MINIX
+	help
+	  If you wish to be able to create version 2 minix filesystems, enable
+	  this. If you enabled 'mkfs_minix' then you almost certainly want to
+	  be using the version 2 filesystem support.
+
+config MKFS_REISER
+	bool "mkfs_reiser"
+	default n
+	select PLATFORM_LINUX
+	help
+	  Utility to create ReiserFS filesystems.
+	  Note: this applet needs a lot of testing and polishing.
+
+config MKFS_VFAT
+	bool "mkfs_vfat"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Utility to create FAT32 filesystems.
+
+config GETOPT
+	bool "getopt"
+	default y
+	help
+	  The getopt utility is used to break up (parse) options in command
+	  lines to make it easy to write complex shell scripts that also check
+	  for legal (and illegal) options. If you want to write horribly
+	  complex shell scripts, or use some horribly complex shell script
+	  written by others, this utility may be for you. Most people will
+	  wisely leave this disabled.
+
+config FEATURE_GETOPT_LONG
+	bool "Support option -l"
+	default y if LONG_OPTS
+	depends on GETOPT
+	help
+	  Enable support for long options (option -l).
+
+config HEXDUMP
+	bool "hexdump"
+	default y
+	help
+	  The hexdump utility is used to display binary data in a readable
+	  way that is comparable to the output from most hex editors.
+
+config FEATURE_HEXDUMP_REVERSE
+	bool "Support -R, reverse of 'hexdump -Cv'"
+	default y
+	depends on HEXDUMP
+	help
+	  The hexdump utility is used to display binary data in an ascii
+	  readable way. This option creates binary data from an ascii input.
+	  NB: this option is non-standard. It's unwise to use it in scripts
+	  aimed to be portable.
+
+config HD
+	bool "hd"
+	default y
+	depends on HEXDUMP
+	help
+	  hd is an alias to hexdump -C.
+
+config HWCLOCK
+	bool "hwclock"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The hwclock utility is used to read and set the hardware clock
+	  on a system. This is primarily used to set the current time on
+	  shutdown in the hardware clock, so the hardware will keep the
+	  correct time when Linux is _not_ running.
+
+config FEATURE_HWCLOCK_LONG_OPTIONS
+	bool "Support long options (--hctosys,...)"
+	default y
+	depends on HWCLOCK && LONG_OPTS
+	help
+	  By default, the hwclock utility only uses short options. If you
+	  are overly fond of its long options, such as --hctosys, --utc, etc)
+	  then enable this option.
+
+config FEATURE_HWCLOCK_ADJTIME_FHS
+	bool "Use FHS /var/lib/hwclock/adjtime"
+	default n  # util-linux-ng in Fedora 13 still uses /etc/adjtime
+	depends on HWCLOCK
+	help
+	  Starting with FHS 2.3, the adjtime state file is supposed to exist
+	  at /var/lib/hwclock/adjtime instead of /etc/adjtime. If you wish
+	  to use the FHS behavior, answer Y here, otherwise answer N for the
+	  classic /etc/adjtime path.
+
+	  pathname.com/fhs/pub/fhs-2.3.html#VARLIBHWCLOCKSTATEDIRECTORYFORHWCLO
+
+config IPCRM
+	bool "ipcrm"
+	default y
+	help
+	  The ipcrm utility allows the removal of System V interprocess
+	  communication (IPC) objects and the associated data structures
+	  from the system.
+
+config IPCS
+	bool "ipcs"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The ipcs utility is used to provide information on the currently
+	  allocated System V interprocess (IPC) objects in the system.
+
+config LOSETUP
+	bool "losetup"
+	default y
+	select PLATFORM_LINUX
+	help
+	  losetup is used to associate or detach a loop device with a regular
+	  file or block device, and to query the status of a loop device. This
+	  version does not currently support enabling data encryption.
+
+config LSPCI
+	bool "lspci"
+	default y
+	#select PLATFORM_LINUX
+	help
+	  lspci is a utility for displaying information about PCI buses in the
+	  system and devices connected to them.
+
+	  This version uses sysfs (/sys/bus/pci/devices) only.
+
+config LSUSB
+	bool "lsusb"
+	default y
+	#select PLATFORM_LINUX
+	help
+	  lsusb is a utility for displaying information about USB buses in the
+	  system and devices connected to them.
+
+	  This version uses sysfs (/sys/bus/usb/devices) only.
+
+config MDEV
+	bool "mdev"
+	default y
+	select PLATFORM_LINUX
+	help
+	  mdev is a mini-udev implementation for dynamically creating device
+	  nodes in the /dev directory.
+
+	  For more information, please see docs/mdev.txt
+
+config FEATURE_MDEV_CONF
+	bool "Support /etc/mdev.conf"
+	default y
+	depends on MDEV
+	help
+	  Add support for the mdev config file to control ownership and
+	  permissions of the device nodes.
+
+	  For more information, please see docs/mdev.txt
+
+config FEATURE_MDEV_RENAME
+	bool "Support subdirs/symlinks"
+	default y
+	depends on FEATURE_MDEV_CONF
+	help
+	  Add support for renaming devices and creating symlinks.
+
+	  For more information, please see docs/mdev.txt
+
+config FEATURE_MDEV_RENAME_REGEXP
+	bool "Support regular expressions substitutions when renaming device"
+	default y
+	depends on FEATURE_MDEV_RENAME
+	help
+	  Add support for regular expressions substitutions when renaming
+	  device.
+
+config FEATURE_MDEV_EXEC
+	bool "Support command execution at device addition/removal"
+	default y
+	depends on FEATURE_MDEV_CONF
+	help
+	  This adds support for an optional field to /etc/mdev.conf for
+	  executing commands when devices are created/removed.
+
+	  For more information, please see docs/mdev.txt
+
+config FEATURE_MDEV_LOAD_FIRMWARE
+	bool "Support loading of firmwares"
+	default y
+	depends on MDEV
+	help
+	  Some devices need to load firmware before they can be usable.
+
+	  These devices will request userspace look up the files in
+	  /lib/firmware/ and if it exists, send it to the kernel for
+	  loading into the hardware.
+
+config MKSWAP
+	bool "mkswap"
+	default y
+	help
+	  The mkswap utility is used to configure a file or disk partition as
+	  Linux swap space. This allows Linux to use the entire file or
+	  partition as if it were additional RAM, which can greatly increase
+	  the capability of low-memory machines. This additional memory is
+	  much slower than real RAM, but can be very helpful at preventing your
+	  applications being killed by the Linux out of memory (OOM) killer.
+	  Once you have created swap space using 'mkswap' you need to enable
+	  the swap space using the 'swapon' utility.
+
+config FEATURE_MKSWAP_UUID
+	bool "UUID support"
+	default y
+	depends on MKSWAP
+	help
+	  Generate swap spaces with universally unique identifiers.
+
+config MORE
+	bool "more"
+	default y
+	help
+	  more is a simple utility which allows you to read text one screen
+	  sized page at a time. If you want to read text that is larger than
+	  the screen, and you are using anything faster than a 300 baud modem,
+	  you will probably find this utility very helpful. If you don't have
+	  any need to reading text files, you can leave this disabled.
+
+config MOUNT
+	bool "mount"
+	default y
+	select PLATFORM_LINUX
+	help
+	  All files and filesystems in Unix are arranged into one big directory
+	  tree. The 'mount' utility is used to graft a filesystem onto a
+	  particular part of the tree. A filesystem can either live on a block
+	  device, or it can be accessible over the network, as is the case with
+	  NFS filesystems. Most people using BusyBox will also want to enable
+	  the 'mount' utility.
+
+config FEATURE_MOUNT_FAKE
+	bool "Support option -f"
+	default y
+	depends on MOUNT
+	help
+	  Enable support for faking a file system mount.
+
+config FEATURE_MOUNT_VERBOSE
+	bool "Support option -v"
+	default y
+	depends on MOUNT
+	help
+	  Enable multi-level -v[vv...] verbose messages. Useful if you
+	  debug mount problems and want to see what is exactly passed
+	  to the kernel.
+
+config FEATURE_MOUNT_HELPERS
+	bool "Support mount helpers"
+	default n
+	depends on MOUNT
+	help
+	  Enable mounting of virtual file systems via external helpers.
+	  E.g. "mount obexfs#-b00.11.22.33.44.55 /mnt" will in effect call
+	  "obexfs -b00.11.22.33.44.55 /mnt"
+	  Also "mount -t sometype [-o opts] fs /mnt" will try
+	  "sometype [-o opts] fs /mnt" if simple mount syscall fails.
+	  The idea is to use such virtual filesystems in /etc/fstab.
+
+config FEATURE_MOUNT_LABEL
+	bool "Support specifying devices by label or UUID"
+	default y
+	depends on MOUNT
+	select VOLUMEID
+	help
+	  This allows for specifying a device by label or uuid, rather than by
+	  name. This feature utilizes the same functionality as blkid/findfs.
+	  This also enables label or uuid support for swapon.
+
+config FEATURE_MOUNT_NFS
+	bool "Support mounting NFS file systems"
+	default y
+	depends on MOUNT
+	select FEATURE_HAVE_RPC
+	select FEATURE_SYSLOG
+	help
+	  Enable mounting of NFS file systems.
+
+config FEATURE_MOUNT_CIFS
+	bool "Support mounting CIFS/SMB file systems"
+	default y
+	depends on MOUNT
+	help
+	  Enable support for samba mounts.
+
+config FEATURE_MOUNT_FLAGS
+	depends on MOUNT
+	bool "Support lots of -o flags in mount"
+	default y
+	help
+	  Without this, mount only supports ro/rw/remount. With this, it
+	  supports nosuid, suid, dev, nodev, exec, noexec, sync, async, atime,
+	  noatime, diratime, nodiratime, loud, bind, move, shared, slave,
+	  private, unbindable, rshared, rslave, rprivate, and runbindable.
+
+config FEATURE_MOUNT_FSTAB
+	depends on MOUNT
+	bool "Support /etc/fstab and -a"
+	default y
+	help
+	  Support mount all and looking for files in /etc/fstab.
+
+config PIVOT_ROOT
+	bool "pivot_root"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The pivot_root utility swaps the mount points for the root filesystem
+	  with some other mounted filesystem. This allows you to do all sorts
+	  of wild and crazy things with your Linux system and is far more
+	  powerful than 'chroot'.
+
+	  Note: This is for initrd in linux 2.4. Under initramfs (introduced
+	  in linux 2.6) use switch_root instead.
+
+config RDATE
+	bool "rdate"
+	default y
+	help
+	  The rdate utility allows you to synchronize the date and time of your
+	  system clock with the date and time of a remote networked system using
+	  the RFC868 protocol, which is built into the inetd daemon on most
+	  systems.
+
+config RDEV
+	bool "rdev"
+	default y
+	help
+	  Print the device node associated with the filesystem mounted at '/'.
+
+config READPROFILE
+	bool "readprofile"
+	default y
+	#select PLATFORM_LINUX
+	help
+	  This allows you to parse /proc/profile for basic profiling.
+
+config RTCWAKE
+	bool "rtcwake"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Enter a system sleep state until specified wakeup time.
+
+config SCRIPT
+	bool "script"
+	default y
+	help
+	  The script makes typescript of terminal session.
+
+config SCRIPTREPLAY
+	bool "scriptreplay"
+	default y
+	help
+	  This program replays a typescript, using timing information
+	  given by script -t.
+
+config SETARCH
+	bool "setarch"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The linux32 utility is used to create a 32bit environment for the
+	  specified program (usually a shell). It only makes sense to have
+	  this util on a system that supports both 64bit and 32bit userland
+	  (like amd64/x86, ppc64/ppc, sparc64/sparc, etc...).
+
+config SWAPONOFF
+	bool "swaponoff"
+	default y
+	select PLATFORM_LINUX
+	help
+	  This option enables both the 'swapon' and the 'swapoff' utilities.
+	  Once you have created some swap space using 'mkswap', you also need
+	  to enable your swap space with the 'swapon' utility. The 'swapoff'
+	  utility is used, typically at system shutdown, to disable any swap
+	  space. If you are not using any swap space, you can leave this
+	  option disabled.
+
+config FEATURE_SWAPON_PRI
+	bool "Support priority option -p"
+	default y
+	depends on SWAPONOFF
+	help
+	  Enable support for setting swap device priority in swapon.
+
+config SWITCH_ROOT
+	bool "switch_root"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The switch_root utility is used from initramfs to select a new
+	  root device. Under initramfs, you have to use this instead of
+	  pivot_root. (Stop reading here if you don't care why.)
+
+	  Booting with initramfs extracts a gzipped cpio archive into rootfs
+	  (which is a variant of ramfs/tmpfs). Because rootfs can't be moved
+	  or unmounted*, pivot_root will not work from initramfs. Instead,
+	  switch_root deletes everything out of rootfs (including itself),
+	  does a mount --move that overmounts rootfs with the new root, and
+	  then execs the specified init program.
+
+	  * Because the Linux kernel uses rootfs internally as the starting
+	  and ending point for searching through the kernel's doubly linked
+	  list of active mount points. That's why.
+
+config UMOUNT
+	bool "umount"
+	default y
+	select PLATFORM_LINUX
+	help
+	  When you want to remove a mounted filesystem from its current mount
+	  point, for example when you are shutting down the system, the
+	  'umount' utility is the tool to use. If you enabled the 'mount'
+	  utility, you almost certainly also want to enable 'umount'.
+
+config FEATURE_UMOUNT_ALL
+	bool "Support option -a"
+	default y
+	depends on UMOUNT
+	help
+	  Support -a option to unmount all currently mounted filesystems.
+
+comment "Common options for mount/umount"
+	depends on MOUNT || UMOUNT
+
+config FEATURE_MOUNT_LOOP
+	bool "Support loopback mounts"
+	default y
+	depends on MOUNT || UMOUNT
+	help
+	  Enabling this feature allows automatic mounting of files (containing
+	  filesystem images) via the linux kernel's loopback devices.
+	  The mount command will detect you are trying to mount a file instead
+	  of a block device, and transparently associate the file with a
+	  loopback device. The umount command will also free that loopback
+	  device.
+
+	  You can still use the 'losetup' utility (to manually associate files
+	  with loop devices) if you need to do something advanced, such as
+	  specify an offset or cryptographic options to the loopback device.
+	  (If you don't want umount to free the loop device, use "umount -D".)
+
+config FEATURE_MOUNT_LOOP_CREATE
+	bool "Create new loopback devices if needed"
+	default y
+	depends on FEATURE_MOUNT_LOOP
+	help
+	  Linux kernels >= 2.6.24 support unlimited loopback devices. They are
+	  allocated for use when trying to use a loop device. The loop device
+	  must however exist.
+
+	  This feature lets mount to try to create next /dev/loopN device
+	  if it does not find a free one.
+
+config FEATURE_MTAB_SUPPORT
+	bool "Support for the old /etc/mtab file"
+	default n
+	depends on MOUNT || UMOUNT
+	select FEATURE_MOUNT_FAKE
+	help
+	  Historically, Unix systems kept track of the currently mounted
+	  partitions in the file "/etc/mtab". These days, the kernel exports
+	  the list of currently mounted partitions in "/proc/mounts", rendering
+	  the old mtab file obsolete. (In modern systems, /etc/mtab should be
+	  a symlink to /proc/mounts.)
+
+	  The only reason to have mount maintain an /etc/mtab file itself is if
+	  your stripped-down embedded system does not have a /proc directory.
+	  If you must use this, keep in mind it's inherently brittle (for
+	  example a mount under chroot won't update it), can't handle modern
+	  features like separate per-process filesystem namespaces, requires
+	  that your /etc directory be writable, tends to get easily confused
+	  by --bind or --move mounts, won't update if you rename a directory
+	  that contains a mount point, and so on. (In brief: avoid.)
+
+	  About the only reason to use this is if you've removed /proc from
+	  your kernel.
+
+config VOLUMEID
+	bool #No description makes it a hidden option
+	default n
+
+menu "Filesystem/Volume identification"
+	depends on VOLUMEID
+
+config FEATURE_VOLUMEID_EXT
+	bool "Ext filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_BTRFS
+	bool "btrfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_REISERFS
+	bool "Reiser filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_FAT
+	bool "fat filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_HFS
+	bool "hfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_JFS
+	bool "jfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+### config FEATURE_VOLUMEID_UFS
+###	bool "ufs filesystem"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+config FEATURE_VOLUMEID_XFS
+	bool "xfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_NTFS
+	bool "ntfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_ISO9660
+	bool "iso9660 filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_UDF
+	bool "udf filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_LUKS
+	bool "luks filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_LINUXSWAP
+	bool "linux swap filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+### config FEATURE_VOLUMEID_LVM
+###	bool "lvm"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+config FEATURE_VOLUMEID_CRAMFS
+	bool "cramfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+### config FEATURE_VOLUMEID_HPFS
+###	bool "hpfs filesystem"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+config FEATURE_VOLUMEID_ROMFS
+	bool "romfs filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+config FEATURE_VOLUMEID_SYSV
+	bool "sysv filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+### config FEATURE_VOLUMEID_MINIX
+###	bool "minix filesystem"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### These only detect partition tables - not used (yet?)
+### config FEATURE_VOLUMEID_MAC
+###	bool "mac filesystem"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+###
+### config FEATURE_VOLUMEID_MSDOS
+###	bool "msdos filesystem"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+config FEATURE_VOLUMEID_OCFS2
+	bool "ocfs2 filesystem"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+### config FEATURE_VOLUMEID_HIGHPOINTRAID
+###	bool "highpoint raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### config FEATURE_VOLUMEID_ISWRAID
+###	bool "intel raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### config FEATURE_VOLUMEID_LSIRAID
+###	bool "lsi raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### config FEATURE_VOLUMEID_VIARAID
+###	bool "via raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### config FEATURE_VOLUMEID_SILICONRAID
+###	bool "silicon raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### config FEATURE_VOLUMEID_NVIDIARAID
+###	bool "nvidia raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+### config FEATURE_VOLUMEID_PROMISERAID
+###	bool "promise raid"
+###	default y
+###	depends on VOLUMEID
+###	help
+###	  TODO
+
+config FEATURE_VOLUMEID_LINUXRAID
+	bool "linuxraid"
+	default y
+	depends on VOLUMEID
+	help
+	  TODO
+
+endmenu
+
+endmenu
+# -> source miscutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Miscellaneous Utilities"
+
+config CONSPY
+	bool "conspy"
+	default n
+	select PLATFORM_LINUX
+	help
+	  A text-mode VNC like program for Linux virtual terminals.
+	  example:  conspy NUM      shared access to console num
+	  or        conspy -nd NUM  screenshot of console num
+	  or        conspy -cs NUM  poor man's GNU screen like
+config LESS
+	bool "less"
+	default y
+	help
+	  'less' is a pager, meaning that it displays text files. It possesses
+	  a wide array of features, and is an improvement over 'more'.
+
+config FEATURE_LESS_MAXLINES
+	int "Max number of input lines less will try to eat"
+	default 9999999
+	depends on LESS
+
+config FEATURE_LESS_BRACKETS
+	bool "Enable bracket searching"
+	default y
+	depends on LESS
+	help
+	  This option adds the capability to search for matching left and right
+	  brackets, facilitating programming.
+
+config FEATURE_LESS_FLAGS
+	bool "Enable extra flags"
+	default y
+	depends on LESS
+	help
+	  The extra flags provided do the following:
+
+	  The -M flag enables a more sophisticated status line.
+	  The -m flag enables a simpler status line with a percentage.
+
+config FEATURE_LESS_MARKS
+	bool "Enable marks"
+	default y
+	depends on LESS
+	help
+	  Marks enable positions in a file to be stored for easy reference.
+
+config FEATURE_LESS_REGEXP
+	bool "Enable regular expressions"
+	default y
+	depends on LESS
+	help
+	  Enable regular expressions, allowing complex file searches.
+
+config FEATURE_LESS_WINCH
+	bool "Enable automatic resizing on window size changes"
+	default y
+	depends on LESS
+	help
+	  Makes less track window size changes.
+
+config FEATURE_LESS_ASK_TERMINAL
+	bool "Use 'tell me cursor position' ESC sequence to measure window"
+	default y
+	depends on FEATURE_LESS_WINCH
+	help
+	  Makes less track window size changes.
+	  If terminal size can't be retrieved and $LINES/$COLUMNS are not set,
+	  this option makes less perform a last-ditch effort to find it:
+	  position cursor to 999,999 and ask terminal to report real
+	  cursor position using "ESC [ 6 n" escape sequence, then read stdin.
+
+	  This is not clean but helps a lot on serial lines and such.
+
+config FEATURE_LESS_DASHCMD
+	bool "Enable flag changes ('-' command)"
+	default y
+	depends on LESS
+	help
+	  This enables the ability to change command-line flags within
+	  less itself ('-' keyboard command).
+
+config FEATURE_LESS_LINENUMS
+	bool "Enable dynamic switching of line numbers"
+	default y
+	depends on FEATURE_LESS_DASHCMD
+	help
+	  Enables "-N" command.
+config NANDWRITE
+	bool "nandwrite"
+	default n
+	select PLATFORM_LINUX
+	help
+	  Write to the specified MTD device, with bad blocks awareness
+
+config NANDDUMP
+	bool "nanddump"
+	default n
+	select PLATFORM_LINUX
+	help
+	  Dump the content of raw NAND chip
+config SETSERIAL
+	bool "setserial"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Retrieve or set Linux serial port.
+config UBIATTACH
+	bool "ubiattach"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Attach MTD device to an UBI device.
+
+config UBIDETACH
+	bool "ubidetach"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Detach MTD device from an UBI device.
+
+config UBIMKVOL
+	bool "ubimkvol"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Create a UBI volume.
+
+config UBIRMVOL
+	bool "ubirmvol"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Delete a UBI volume.
+
+config UBIRSVOL
+	bool "ubirsvol"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Resize a UBI volume.
+
+config UBIUPDATEVOL
+	bool "ubiupdatevol"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Update a UBI volume.
+
+config ADJTIMEX
+	bool "adjtimex"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Adjtimex reads and optionally sets adjustment parameters for
+	  the Linux clock adjustment algorithm.
+
+config BBCONFIG
+	bool "bbconfig"
+	default n
+	help
+	  The bbconfig applet will print the config file with which
+	  busybox was built.
+
+config FEATURE_COMPRESS_BBCONFIG
+	bool "Compress bbconfig data"
+	default y
+	depends on BBCONFIG
+	help
+	  Store bbconfig data in compressed form, uncompress them on-the-fly
+	  before output.
+
+	  If you have a really tiny busybox with few applets enabled (and
+	  bunzip2 isn't one of them), the overhead of the decompressor might
+	  be noticeable. Also, if you run executables directly from ROM
+	  and have very little memory, this might not be a win. Otherwise,
+	  you probably want this.
+
+config BEEP
+	bool "beep"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The beep applets beeps in a given freq/Hz.
+
+config FEATURE_BEEP_FREQ
+	int "default frequency"
+	range 0 2147483647
+	default 4000
+	depends on BEEP
+	help
+	  Frequency for default beep.
+
+config FEATURE_BEEP_LENGTH_MS
+	int "default length"
+	range 0 2147483647
+	default 30
+	depends on BEEP
+	help
+	  Length in ms for default beep.
+
+config CHAT
+	bool "chat"
+	default y
+	help
+	  Simple chat utility.
+
+config FEATURE_CHAT_NOFAIL
+	bool "Enable NOFAIL expect strings"
+	depends on CHAT
+	default y
+	help
+	  When enabled expect strings which are started with a dash trigger
+	  no-fail mode. That is when expectation is not met within timeout
+	  the script is not terminated but sends next SEND string and waits
+	  for next EXPECT string. This allows to compose far more flexible
+	  scripts.
+
+config FEATURE_CHAT_TTY_HIFI
+	bool "Force STDIN to be a TTY"
+	depends on CHAT
+	default n
+	help
+	  Original chat always treats STDIN as a TTY device and sets for it
+	  so-called raw mode. This option turns on such behaviour.
+
+config FEATURE_CHAT_IMPLICIT_CR
+	bool "Enable implicit Carriage Return"
+	depends on CHAT
+	default y
+	help
+	  When enabled make chat to terminate all SEND strings with a "\r"
+	  unless "\c" is met anywhere in the string.
+
+config FEATURE_CHAT_SWALLOW_OPTS
+	bool "Swallow options"
+	depends on CHAT
+	default y
+	help
+	  Busybox chat require no options. To make it not fail when used
+	  in place of original chat (which has a bunch of options) turn
+	  this on.
+
+config FEATURE_CHAT_SEND_ESCAPES
+	bool "Support weird SEND escapes"
+	depends on CHAT
+	default y
+	help
+	  Original chat uses some escape sequences in SEND arguments which
+	  are not sent to device but rather performs special actions.
+	  E.g. "\K" means to send a break sequence to device.
+	  "\d" delays execution for a second, "\p" -- for a 1/100 of second.
+	  Before turning this option on think twice: do you really need them?
+
+config FEATURE_CHAT_VAR_ABORT_LEN
+	bool "Support variable-length ABORT conditions"
+	depends on CHAT
+	default y
+	help
+	  Original chat uses fixed 50-bytes length ABORT conditions. Say N here.
+
+config FEATURE_CHAT_CLR_ABORT
+	bool "Support revoking of ABORT conditions"
+	depends on CHAT
+	default y
+	help
+	  Support CLR_ABORT directive.
+
+config CHRT
+	bool "chrt"
+	default y
+	help
+	  manipulate real-time attributes of a process.
+	  This requires sched_{g,s}etparam support in your libc.
+
+config CROND
+	bool "crond"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  Crond is a background daemon that parses individual crontab
+	  files and executes commands on behalf of the users in question.
+	  This is a port of dcron from slackware. It uses files of the
+	  format /var/spool/cron/crontabs/<username> files, for example:
+	      $ cat /var/spool/cron/crontabs/root
+	      # Run daily cron jobs at 4:40 every day:
+	      40 4 * * * /etc/cron/daily > /dev/null 2>&1
+
+config FEATURE_CROND_D
+	bool "Support option -d to redirect output to stderr"
+	depends on CROND
+	default y
+	help
+	  -d sets loglevel to 0 (most verbose) and directs all output to stderr.
+
+config FEATURE_CROND_CALL_SENDMAIL
+	bool "Report command output via email (using sendmail)"
+	default y
+	depends on CROND
+	help
+	  Command output will be sent to corresponding user via email.
+
+config FEATURE_CROND_DIR
+	string "crond spool directory"
+	default "/var/spool/cron"
+	depends on CROND || CRONTAB
+	help
+	  Location of crond spool.
+
+config CRONTAB
+	bool "crontab"
+	default y
+	help
+	  Crontab manipulates the crontab for a particular user. Only
+	  the superuser may specify a different user and/or crontab directory.
+	  Note that Busybox binary must be setuid root for this applet to
+	  work properly.
+
+config DC
+	bool "dc"
+	default y
+	help
+	  Dc is a reverse-polish desk calculator which supports unlimited
+	  precision arithmetic.
+
+config FEATURE_DC_LIBM
+	bool "Enable power and exp functions (requires libm)"
+	default y
+	depends on DC
+	help
+	  Enable power and exp functions.
+	  NOTE: This will require libm to be present for linking.
+
+config DEVFSD
+	bool "devfsd (obsolete)"
+	default n
+	select PLATFORM_LINUX
+	select FEATURE_SYSLOG
+	help
+	  This is deprecated and should NOT be used anymore.
+	  Use linux >= 2.6 (optionally with hotplug) and mdev instead!
+	  See docs/mdev.txt for detailed instructions on how to use mdev
+	  instead.
+
+	  Provides compatibility with old device names on a devfs systems.
+	  You should set it to true if you have devfs enabled.
+	  The following keywords in devsfd.conf are supported:
+	  "CLEAR_CONFIG", "INCLUDE", "OPTIONAL_INCLUDE", "RESTORE",
+	  "PERMISSIONS", "EXECUTE", "COPY", "IGNORE",
+	  "MKOLDCOMPAT", "MKNEWCOMPAT","RMOLDCOMPAT", "RMNEWCOMPAT".
+
+	  But only if they are written UPPERCASE!!!!!!!!
+
+config DEVFSD_MODLOAD
+	bool "Adds support for MODLOAD keyword in devsfd.conf"
+	default y
+	depends on DEVFSD
+	help
+	  This actually doesn't work with busybox modutils but needs
+	  the external modutils.
+
+config DEVFSD_FG_NP
+	bool "Enables the -fg and -np options"
+	default y
+	depends on DEVFSD
+	help
+	  -fg  Run the daemon in the foreground.
+	  -np  Exit after parsing the configuration file.
+	       Do not poll for events.
+
+config DEVFSD_VERBOSE
+	bool "Increases logging (and size)"
+	default y
+	depends on DEVFSD
+	help
+	  Increases logging to stderr or syslog.
+
+config FEATURE_DEVFS
+	bool "Use devfs names for all devices (obsolete)"
+	default n
+	select PLATFORM_LINUX
+	help
+	  This is obsolete and should NOT be used anymore.
+	  Use linux >= 2.6 (optionally with hotplug) and mdev instead!
+
+	  For legacy systems -- if there is no way around devfsd -- this
+	  tells busybox to look for names like /dev/loop/0 instead of
+	  /dev/loop0. If your /dev directory has normal names instead of
+	  devfs names, you don't want this.
+
+config DEVMEM
+	bool "devmem"
+	default y
+	help
+	  devmem is a small program that reads and writes from physical
+	  memory using /dev/mem.
+
+config EJECT
+	bool "eject"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Used to eject cdroms. (defaults to /dev/cdrom)
+
+config FEATURE_EJECT_SCSI
+	bool "SCSI support"
+	default y
+	depends on EJECT
+	help
+	  Add the -s option to eject, this allows to eject SCSI-Devices and
+	  usb-storage devices.
+
+config FBSPLASH
+	bool "fbsplash"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Shows splash image and progress bar on framebuffer device.
+	  Can be used during boot phase of an embedded device. ~2kb.
+	  Usage:
+	  - use kernel option 'vga=xxx' or otherwise enable fb device.
+	  - put somewhere fbsplash.cfg file and an image in .ppm format.
+	  - $ setsid fbsplash [params] &
+	    -c: hide cursor
+	    -d /dev/fbN: framebuffer device (if not /dev/fb0)
+	    -s path_to_image_file (can be "-" for stdin)
+	    -i path_to_cfg_file (can be "-" for stdin)
+	    -f path_to_fifo (can be "-" for stdin)
+	  - if you want to run it only in presence of kernel parameter:
+	    grep -q "fbsplash=on" </proc/cmdline && setsid fbsplash [params] &
+	  - commands for fifo:
+	    "NN" (ASCII decimal number) - percentage to show on progress bar
+	    "exit" - well you guessed it
+
+config FLASHCP
+	bool "flashcp"
+	default n  # doesn't build on Ubuntu 8.04
+	help
+	  The flashcp binary, inspired by mtd-utils as of git head 5eceb74f7.
+	  This utility is used to copy images into a MTD device.
+
+config FLASH_LOCK
+	bool "flash_lock"
+	default n  # doesn't build on Ubuntu 8.04
+	help
+	  The flash_lock binary from mtd-utils as of git head 5ec0c10d0. This
+	  utility locks part or all of the flash device.
+
+config FLASH_UNLOCK
+	bool "flash_unlock"
+	default n  # doesn't build on Ubuntu 8.04
+	help
+	  The flash_unlock binary from mtd-utils as of git head 5ec0c10d0. This
+	  utility unlocks part or all of the flash device.
+
+config FLASH_ERASEALL
+	bool "flash_eraseall"
+	default n  # doesn't build on Ubuntu 8.04
+	help
+	  The flash_eraseall binary from mtd-utils as of git head c4c6a59eb.
+	  This utility is used to erase the whole MTD device.
+
+config IONICE
+	bool "ionice"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Set/set program io scheduling class and priority
+	  Requires kernel >= 2.6.13
+
+config INOTIFYD
+	bool "inotifyd"
+	default n  # doesn't build on Knoppix 5
+	help
+	  Simple inotify daemon. Reports filesystem changes. Requires
+	  kernel >= 2.6.13
+
+config LAST
+	bool "last"
+	default y
+	depends on FEATURE_WTMP
+	help
+	  'last' displays a list of the last users that logged into the system.
+
+choice
+	prompt "Choose last implementation"
+	depends on LAST
+	default FEATURE_LAST_FANCY
+
+config FEATURE_LAST_SMALL
+	bool "small"
+	help
+	  This is a small version of last with just the basic set of
+	  features.
+
+config FEATURE_LAST_FANCY
+	bool "huge"
+	help
+	  'last' displays detailed information about the last users that
+	  logged into the system (mimics sysvinit last). +900 bytes.
+endchoice
+
+config HDPARM
+	bool "hdparm"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Get/Set hard drive parameters. Primarily intended for ATA
+	  drives. Adds about 13k (or around 30k if you enable the
+	  FEATURE_HDPARM_GET_IDENTITY option)....
+
+config FEATURE_HDPARM_GET_IDENTITY
+	bool "Support obtaining detailed information directly from drives"
+	default y
+	depends on HDPARM
+	help
+	  Enables the -I and -i options to obtain detailed information
+	  directly from drives about their capabilities and supported ATA
+	  feature set. If no device name is specified, hdparm will read
+	  identify data from stdin. Enabling this option will add about 16k...
+
+config FEATURE_HDPARM_HDIO_SCAN_HWIF
+	bool "Register an IDE interface (DANGEROUS)"
+	default y
+	depends on HDPARM
+	help
+	  Enables the 'hdparm -R' option to register an IDE interface.
+	  This is dangerous stuff, so you should probably say N.
+
+config FEATURE_HDPARM_HDIO_UNREGISTER_HWIF
+	bool "Un-register an IDE interface (DANGEROUS)"
+	default y
+	depends on HDPARM
+	help
+	  Enables the 'hdparm -U' option to un-register an IDE interface.
+	  This is dangerous stuff, so you should probably say N.
+
+config FEATURE_HDPARM_HDIO_DRIVE_RESET
+	bool "Perform device reset (DANGEROUS)"
+	default y
+	depends on HDPARM
+	help
+	  Enables the 'hdparm -w' option to perform a device reset.
+	  This is dangerous stuff, so you should probably say N.
+
+config FEATURE_HDPARM_HDIO_TRISTATE_HWIF
+	bool "Tristate device for hotswap (DANGEROUS)"
+	default y
+	depends on HDPARM
+	help
+	  Enables the 'hdparm -x' option to tristate device for hotswap,
+	  and the '-b' option to get/set bus state. This is dangerous
+	  stuff, so you should probably say N.
+
+config FEATURE_HDPARM_HDIO_GETSET_DMA
+	bool "Get/set using_dma flag"
+	default y
+	depends on HDPARM
+	help
+	  Enables the 'hdparm -d' option to get/set using_dma flag.
+
+config MAKEDEVS
+	bool "makedevs"
+	default y
+	help
+	  'makedevs' is a utility used to create a batch of devices with
+	  one command.
+
+	  There are two choices for command line behaviour, the interface
+	  as used by LEAF/Linux Router Project, or a device table file.
+
+	  'leaf' is traditionally what busybox follows, it allows multiple
+	  devices of a particluar type to be created per command.
+	  e.g. /dev/hda[0-9]
+	  Device properties are passed as command line arguments.
+
+	  'table' reads device properties from a file or stdin, allowing
+	  a batch of unrelated devices to be made with one command.
+	  User/group names are allowed as an alternative to uid/gid.
+
+choice
+	prompt "Choose makedevs behaviour"
+	depends on MAKEDEVS
+	default FEATURE_MAKEDEVS_TABLE
+
+config FEATURE_MAKEDEVS_LEAF
+	bool "leaf"
+
+config FEATURE_MAKEDEVS_TABLE
+	bool "table"
+
+endchoice
+
+config MAN
+	bool "man"
+	default y
+	help
+	  Format and display manual pages.
+
+config MICROCOM
+	bool "microcom"
+	default y
+	help
+	  The poor man's minicom utility for chatting with serial port devices.
+
+config MOUNTPOINT
+	bool "mountpoint"
+	default y
+	help
+	  mountpoint checks if the directory is a mountpoint.
+
+config MT
+	bool "mt"
+	default y
+	help
+	  mt is used to control tape devices. You can use the mt utility
+	  to advance or rewind a tape past a specified number of archive
+	  files on the tape.
+
+config RAIDAUTORUN
+	bool "raidautorun"
+	default y
+	select PLATFORM_LINUX
+	help
+	  raidautorun tells the kernel md driver to
+	  search and start RAID arrays.
+
+config READAHEAD
+	bool "readahead"
+	default y
+	depends on LFS
+	select PLATFORM_LINUX
+	help
+	  Preload the files listed on the command line into RAM cache so that
+	  subsequent reads on these files will not block on disk I/O.
+
+	  This applet just calls the readahead(2) system call on each file.
+	  It is mainly useful in system startup scripts to preload files
+	  or executables before they are used. When used at the right time
+	  (in particular when a CPU bound process is running) it can
+	  significantly speed up system startup.
+
+	  As readahead(2) blocks until each file has been read, it is best to
+	  run this applet as a background job.
+
+config RFKILL
+	bool "rfkill"
+	default n  # doesn't build on Ubuntu 9.04
+	select PLATFORM_LINUX
+	help
+	  Enable/disable wireless devices.
+
+	  rfkill list : list all wireless devices
+	  rfkill list bluetooth : list all bluetooth devices
+	  rfkill list 1 : list device corresponding to the given index
+	  rfkill block|unblock wlan : block/unblock all wlan(wifi) devices
+
+config RUNLEVEL
+	bool "runlevel"
+	default y
+	depends on FEATURE_UTMP
+	help
+	  find the current and previous system runlevel.
+
+	  This applet uses utmp but does not rely on busybox supporing
+	  utmp on purpose. It is used by e.g. emdebian via /etc/init.d/rc.
+
+config RX
+	bool "rx"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Receive files using the Xmodem protocol.
+
+config SETSID
+	bool "setsid"
+	default y
+	help
+	  setsid runs a program in a new session
+
+config STRINGS
+	bool "strings"
+	default y
+	help
+	  strings prints the printable character sequences for each file
+	  specified.
+
+config TASKSET
+	bool "taskset"
+	default n  # doesn't build on some non-x86 targets (m68k)
+	help
+	  Retrieve or set a processes's CPU affinity.
+	  This requires sched_{g,s}etaffinity support in your libc.
+
+config FEATURE_TASKSET_FANCY
+	bool "Fancy output"
+	default y
+	depends on TASKSET
+	help
+	  Add code for fancy output. This merely silences a compiler-warning
+	  and adds about 135 Bytes. May be needed for machines with alot
+	  of CPUs.
+
+config TIME
+	bool "time"
+	default y
+	help
+	  The time command runs the specified program with the given arguments.
+	  When the command finishes, time writes a message to standard output
+	  giving timing statistics about this program run.
+
+config TIMEOUT
+	bool "timeout"
+	default y
+	help
+	  Runs a program and watches it. If it does not terminate in
+	  specified number of seconds, it is sent a signal.
+
+config TTYSIZE
+	bool "ttysize"
+	default y
+	help
+	  A replacement for "stty size". Unlike stty, can report only width,
+	  only height, or both, in any order. It also does not complain on
+	  error, but returns default 80x24.
+	  Usage in shell scripts: width=`ttysize w`.
+
+config VOLNAME
+	bool "volname"
+	default y
+	help
+	  Prints a CD-ROM volume name.
+
+config WALL
+	bool "wall"
+	default y
+	depends on FEATURE_UTMP
+	help
+	  Write a message to all users that are logged in.
+
+config WATCHDOG
+	bool "watchdog"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The watchdog utility is used with hardware or software watchdog
+	  device drivers. It opens the specified watchdog device special file
+	  and periodically writes a magic character to the device. If the
+	  watchdog applet ever fails to write the magic character within a
+	  certain amount of time, the watchdog device assumes the system has
+	  hung, and will cause the hardware to reboot.
+
+endmenu
+# -> source networking/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Networking Utilities"
+
+config NAMEIF
+	bool "nameif"
+	default y
+	select PLATFORM_LINUX
+	select FEATURE_SYSLOG
+	help
+	  nameif is used to rename network interface by its MAC address.
+	  Renamed interfaces MUST be in the down state.
+	  It is possible to use a file (default: /etc/mactab)
+	  with list of new interface names and MACs.
+	  Maximum interface name length: IFNAMSIZ = 16
+	  File fields are separated by space or tab.
+	  File format:
+	  # Comment
+	  new_interface_name    XX:XX:XX:XX:XX:XX
+
+config FEATURE_NAMEIF_EXTENDED
+	bool "Extended nameif"
+	default y
+	depends on NAMEIF
+	help
+	  This extends the nameif syntax to support the bus_info, driver,
+	  phyaddr selectors. The syntax is compatible to the normal nameif.
+	  File format:
+	    new_interface_name  driver=asix bus=usb-0000:00:08.2-3
+	    new_interface_name  bus=usb-0000:00:08.2-3 00:80:C8:38:91:B5
+	    new_interface_name  phy_address=2 00:80:C8:38:91:B5
+	    new_interface_name  mac=00:80:C8:38:91:B5
+	    new_interface_name  00:80:C8:38:91:B5
+config NBDCLIENT
+	bool "nbd-client"
+	default y
+	help
+	  Network block device client
+config NC
+	bool "nc"
+	default y
+	help
+	  A simple Unix utility which reads and writes data across network
+	  connections.
+
+config NC_SERVER
+	bool "Netcat server options (-l)"
+	default y
+	depends on NC
+	help
+	  Allow netcat to act as a server.
+
+config NC_EXTRA
+	bool "Netcat extensions (-eiw and filename)"
+	default y
+	depends on NC
+	help
+	  Add -e (support for executing the rest of the command line after
+	  making or receiving a successful connection), -i (delay interval for
+	  lines sent), -w (timeout for initial connection).
+
+config NC_110_COMPAT
+	bool "Netcat 1.10 compatibility (+2.5k)"
+	default n  # off specially for Rob
+	depends on NC
+	help
+	  This option makes nc closely follow original nc-1.10.
+	  The code is about 2.5k bigger. It enables
+	  -s ADDR, -n, -u, -v, -o FILE, -z options, but loses
+	  busybox-specific extensions: -f FILE and -ll.
+config PING
+	bool "ping"
+	default y
+	select PLATFORM_LINUX
+	help
+	  ping uses the ICMP protocol's mandatory ECHO_REQUEST datagram to
+	  elicit an ICMP ECHO_RESPONSE from a host or gateway.
+
+config PING6
+	bool "ping6"
+	default y
+	depends on FEATURE_IPV6 && PING
+	help
+	  This will give you a ping that can talk IPv6.
+
+config FEATURE_FANCY_PING
+	bool "Enable fancy ping output"
+	default y
+	depends on PING
+	help
+	  Make the output from the ping applet include statistics, and at the
+	  same time provide full support for ICMP packets.
+config WHOIS
+	bool "whois"
+	default y
+	help
+	  whois is a client for the whois directory service
+
+config FEATURE_IPV6
+	bool "Enable IPv6 support"
+	default y
+	help
+	  Enable IPv6 support in busybox.
+	  This adds IPv6 support in the networking applets.
+
+config FEATURE_UNIX_LOCAL
+	bool "Enable Unix domain socket support (usually not needed)"
+	default n
+	help
+	  Enable Unix domain socket support in all busybox networking
+	  applets.  Address of the form local:/path/to/unix/socket
+	  will be recognized.
+
+	  This extension is almost never used in real world usage.
+	  You most likely want to say N.
+
+config FEATURE_PREFER_IPV4_ADDRESS
+	bool "Prefer IPv4 addresses from DNS queries"
+	default y
+	depends on FEATURE_IPV6
+	help
+	  Use IPv4 address of network host if it has one.
+
+	  If this option is off, the first returned address will be used.
+	  This may cause problems when your DNS server is IPv6-capable and
+	  is returning IPv6 host addresses too. If IPv6 address
+	  precedes IPv4 one in DNS reply, busybox network applets
+	  (e.g. wget) will use IPv6 address. On an IPv6-incapable host
+	  or network applets will fail to connect to the host
+	  using IPv6 address.
+
+config VERBOSE_RESOLUTION_ERRORS
+	bool "Verbose resolution errors"
+	default n
+	help
+	  Enable if you are not satisfied with simplistic
+	  "can't resolve 'hostname.com'" and want to know more.
+	  This may increase size of your executable a bit.
+
+config ARP
+	bool "arp"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Manipulate the system ARP cache.
+
+config ARPING
+	bool "arping"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Ping hosts by ARP packets.
+
+config BRCTL
+	bool "brctl"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Manage ethernet bridges.
+	  Supports addbr/delbr and addif/delif.
+
+config FEATURE_BRCTL_FANCY
+	bool "Fancy options"
+	default y
+	depends on BRCTL
+	help
+	  Add support for extended option like:
+	    setageing, setfd, sethello, setmaxage,
+	    setpathcost, setportprio, setbridgeprio,
+	    stp
+	  This adds about 600 bytes.
+
+config FEATURE_BRCTL_SHOW
+	bool "Support show, showmac and showstp"
+	default y
+	depends on BRCTL && FEATURE_BRCTL_FANCY
+	help
+	  Add support for option which prints the current config:
+	    showmacs, showstp, show
+
+config DNSD
+	bool "dnsd"
+	default y
+	help
+	  Small and static DNS server daemon.
+
+config ETHER_WAKE
+	bool "ether-wake"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Send a magic packet to wake up sleeping machines.
+
+config FAKEIDENTD
+	bool "fakeidentd"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  fakeidentd listens on the ident port and returns a predefined
+	  fake value on any query.
+
+config FTPD
+	bool "ftpd"
+	default y
+	help
+	  simple FTP daemon. You have to run it via inetd.
+
+config FEATURE_FTP_WRITE
+	bool "Enable upload commands"
+	default y
+	depends on FTPD
+	help
+	  Enable all kinds of FTP upload commands (-w option)
+
+config FEATURE_FTPD_ACCEPT_BROKEN_LIST
+	bool "Enable workaround for RFC-violating clients"
+	default y
+	depends on FTPD
+	help
+	  Some ftp clients (among them KDE's Konqueror) issue illegal
+	  "LIST -l" requests. This option works around such problems.
+	  It might prevent you from listing files starting with "-" and
+	  it increases the code size by ~40 bytes.
+	  Most other ftp servers seem to behave similar to this.
+
+config FTPGET
+	bool "ftpget"
+	default y
+	help
+	  Retrieve a remote file via FTP.
+
+config FTPPUT
+	bool "ftpput"
+	default y
+	help
+	  Store a remote file via FTP.
+
+config FEATURE_FTPGETPUT_LONG_OPTIONS
+	bool "Enable long options in ftpget/ftpput"
+	default y
+	depends on LONG_OPTS && (FTPGET || FTPPUT)
+	help
+	  Support long options for the ftpget/ftpput applet.
+
+config HOSTNAME
+	bool "hostname"
+	default y
+	help
+	  Show or set the system's host name.
+
+config HTTPD
+	bool "httpd"
+	default y
+	help
+	  Serve web pages via an HTTP server.
+
+config FEATURE_HTTPD_RANGES
+	bool "Support 'Ranges:' header"
+	default y
+	depends on HTTPD
+	help
+	  Makes httpd emit "Accept-Ranges: bytes" header and understand
+	  "Range: bytes=NNN-[MMM]" header. Allows for resuming interrupted
+	  downloads, seeking in multimedia players etc.
+
+config FEATURE_HTTPD_USE_SENDFILE
+	bool "Use sendfile system call"
+	default y
+	depends on HTTPD
+	help
+	  When enabled, httpd will use the kernel sendfile() function
+	  instead of read/write loop.
+
+config FEATURE_HTTPD_SETUID
+	bool "Enable -u <user> option"
+	default y
+	depends on HTTPD
+	help
+	  This option allows the server to run as a specific user
+	  rather than defaulting to the user that starts the server.
+	  Use of this option requires special privileges to change to a
+	  different user.
+
+config FEATURE_HTTPD_BASIC_AUTH
+	bool "Enable Basic http Authentication"
+	default y
+	depends on HTTPD
+	help
+	  Utilizes password settings from /etc/httpd.conf for basic
+	  authentication on a per url basis.
+
+config FEATURE_HTTPD_AUTH_MD5
+	bool "Support MD5 crypted passwords for http Authentication"
+	default y
+	depends on FEATURE_HTTPD_BASIC_AUTH
+	help
+	  Enables basic per URL authentication from /etc/httpd.conf
+	  using md5 passwords.
+
+config FEATURE_HTTPD_CGI
+	bool "Support Common Gateway Interface (CGI)"
+	default y
+	depends on HTTPD
+	help
+	  This option allows scripts and executables to be invoked
+	  when specific URLs are requested.
+
+config FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR
+	bool "Support for running scripts through an interpreter"
+	default y
+	depends on FEATURE_HTTPD_CGI
+	help
+	  This option enables support for running scripts through an
+	  interpreter. Turn this on if you want PHP scripts to work
+	  properly. You need to supply an additional line in your httpd
+	  config file:
+	  *.php:/path/to/your/php
+
+config FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV
+	bool "Set REMOTE_PORT environment variable for CGI"
+	default y
+	depends on FEATURE_HTTPD_CGI
+	help
+	  Use of this option can assist scripts in generating
+	  references that contain a unique port number.
+
+config FEATURE_HTTPD_ENCODE_URL_STR
+	bool "Enable -e option (useful for CGIs written as shell scripts)"
+	default y
+	depends on HTTPD
+	help
+	  This option allows html encoding of arbitrary strings for display
+	  by the browser. Output goes to stdout.
+	  For example, httpd -e "<Hello World>" produces
+	  "&#60Hello&#32World&#62".
+
+config FEATURE_HTTPD_ERROR_PAGES
+	bool "Support for custom error pages"
+	default y
+	depends on HTTPD
+	help
+	  This option allows you to define custom error pages in
+	  the configuration file instead of the default HTTP status
+	  error pages. For instance, if you add the line:
+	        E404:/path/e404.html
+	  in the config file, the server will respond the specified
+	  '/path/e404.html' file instead of the terse '404 NOT FOUND'
+	  message.
+
+config FEATURE_HTTPD_PROXY
+	bool "Support for reverse proxy"
+	default y
+	depends on HTTPD
+	help
+	  This option allows you to define URLs that will be forwarded
+	  to another HTTP server. To setup add the following line to the
+	  configuration file
+	        P:/url/:http://hostname[:port]/new/path/
+	  Then a request to /url/myfile will be forwarded to
+	  http://hostname[:port]/new/path/myfile.
+
+config FEATURE_HTTPD_GZIP
+	bool "Support for GZIP content encoding"
+	default y
+	depends on HTTPD
+	help
+	  Makes httpd send files using GZIP content encoding if the
+	  client supports it and a pre-compressed <file>.gz exists.
+
+config IFCONFIG
+	bool "ifconfig"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Ifconfig is used to configure the kernel-resident network interfaces.
+
+config FEATURE_IFCONFIG_STATUS
+	bool "Enable status reporting output (+7k)"
+	default y
+	depends on IFCONFIG
+	help
+	  If ifconfig is called with no arguments it will display the status
+	  of the currently active interfaces.
+
+config FEATURE_IFCONFIG_SLIP
+	bool "Enable slip-specific options \"keepalive\" and \"outfill\""
+	default y
+	depends on IFCONFIG
+	help
+	  Allow "keepalive" and "outfill" support for SLIP. If you're not
+	  planning on using serial lines, leave this unchecked.
+
+config FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ
+	bool "Enable options \"mem_start\", \"io_addr\", and \"irq\""
+	default y
+	depends on IFCONFIG
+	help
+	  Allow the start address for shared memory, start address for I/O,
+	  and/or the interrupt line used by the specified device.
+
+config FEATURE_IFCONFIG_HW
+	bool "Enable option \"hw\" (ether only)"
+	default y
+	depends on IFCONFIG
+	help
+	  Set the hardware address of this interface, if the device driver
+	  supports  this  operation. Currently, we only support the 'ether'
+	  class.
+
+config FEATURE_IFCONFIG_BROADCAST_PLUS
+	bool "Set the broadcast automatically"
+	default y
+	depends on IFCONFIG
+	help
+	  Setting this will make ifconfig attempt to find the broadcast
+	  automatically if the value '+' is used.
+
+config IFENSLAVE
+	bool "ifenslave"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Userspace application to bind several interfaces
+	  to a logical interface (use with kernel bonding driver).
+
+config IFPLUGD
+	bool "ifplugd"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Network interface plug detection daemon.
+
+config IFUPDOWN
+	bool "ifupdown"
+	default y
+	help
+	  Activate or deactivate the specified interfaces. This applet makes
+	  use of either "ifconfig" and "route" or the "ip" command to actually
+	  configure network interfaces. Therefore, you will probably also want
+	  to enable either IFCONFIG and ROUTE, or enable
+	  FEATURE_IFUPDOWN_IP and the various IP options. Of
+	  course you could use non-busybox versions of these programs, so
+	  against my better judgement (since this will surely result in plenty
+	  of support questions on the mailing list), I do not force you to
+	  enable these additional options. It is up to you to supply either
+	  "ifconfig", "route" and "run-parts" or the "ip" command, either
+	  via busybox or via standalone utilities.
+
+config IFUPDOWN_IFSTATE_PATH
+	string "Absolute path to ifstate file"
+	default "/var/run/ifstate"
+	depends on IFUPDOWN
+	help
+	  ifupdown keeps state information in a file called ifstate.
+	  Typically it is located in /var/run/ifstate, however
+	  some distributions tend to put it in other places
+	  (debian, for example, uses /etc/network/run/ifstate).
+	  This config option defines location of ifstate.
+
+config FEATURE_IFUPDOWN_IP
+	bool "Use ip applet"
+	default y
+	depends on IFUPDOWN
+	help
+	  Use the iproute "ip" command to implement "ifup" and "ifdown", rather
+	  than the default of using the older 'ifconfig' and 'route' utilities.
+
+config FEATURE_IFUPDOWN_IP_BUILTIN
+	bool "Use busybox ip applet"
+	default y
+	depends on FEATURE_IFUPDOWN_IP
+	select PLATFORM_LINUX
+	select IP
+	select FEATURE_IP_ADDRESS
+	select FEATURE_IP_LINK
+	select FEATURE_IP_ROUTE
+	help
+	  Use the busybox iproute "ip" applet to implement "ifupdown".
+
+	  If left disabled, you must install the full-blown iproute2
+	  utility or the  "ifup" and "ifdown" applets will not work.
+
+config FEATURE_IFUPDOWN_IFCONFIG_BUILTIN
+	bool "Use busybox ifconfig and route applets"
+	default n
+	depends on IFUPDOWN && !FEATURE_IFUPDOWN_IP
+	select IFCONFIG
+	select ROUTE
+	help
+	  Use the busybox iproute "ifconfig" and "route" applets to
+	  implement the "ifup" and "ifdown" utilities.
+
+	  If left disabled, you must install the full-blown ifconfig
+	  and route utilities, or the  "ifup" and "ifdown" applets will not
+	  work.
+
+config FEATURE_IFUPDOWN_IPV4
+	bool "Support for IPv4"
+	default y
+	depends on IFUPDOWN
+	help
+	  If you want ifup/ifdown to talk IPv4, leave this on.
+
+config FEATURE_IFUPDOWN_IPV6
+	bool "Support for IPv6"
+	default y
+	depends on IFUPDOWN && FEATURE_IPV6
+	help
+	  If you need support for IPv6, turn this option on.
+
+### UNUSED
+###config FEATURE_IFUPDOWN_IPX
+###	bool "Support for IPX"
+###	default y
+###	depends on IFUPDOWN
+###	help
+###	  If this option is selected you can use busybox to work with IPX
+###	  networks.
+
+config FEATURE_IFUPDOWN_MAPPING
+	bool "Enable mapping support"
+	default y
+	depends on IFUPDOWN
+	help
+	  This enables support for the "mapping" stanza, unless you have
+	  a weird network setup you don't need it.
+
+config FEATURE_IFUPDOWN_EXTERNAL_DHCP
+	bool "Support for external dhcp clients"
+	default n
+	depends on IFUPDOWN
+	help
+	  This enables support for the external dhcp clients. Clients are
+	  tried in the following order: dhcpcd, dhclient, pump and udhcpc.
+	  Otherwise, if udhcpc applet is enabled, it is used.
+	  Otherwise, ifup/ifdown will have no support for DHCP.
+
+config INETD
+	bool "inetd"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  Internet superserver daemon
+
+config FEATURE_INETD_SUPPORT_BUILTIN_ECHO
+	bool "Support echo service"
+	default y
+	depends on INETD
+	help
+	  Echo received data internal inetd service
+
+config FEATURE_INETD_SUPPORT_BUILTIN_DISCARD
+	bool "Support discard service"
+	default y
+	depends on INETD
+	help
+	  Internet /dev/null internal inetd service
+
+config FEATURE_INETD_SUPPORT_BUILTIN_TIME
+	bool "Support time service"
+	default y
+	depends on INETD
+	help
+	  Return 32 bit time since 1900 internal inetd service
+
+config FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME
+	bool "Support daytime service"
+	default y
+	depends on INETD
+	help
+	  Return human-readable time internal inetd service
+
+config FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN
+	bool "Support chargen service"
+	default y
+	depends on INETD
+	help
+	  Familiar character generator internal inetd service
+
+config FEATURE_INETD_RPC
+	bool "Support RPC services"
+	default y
+	depends on INETD
+	select FEATURE_HAVE_RPC
+	help
+	  Support Sun-RPC based services
+
+config IP
+	bool "ip"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The "ip" applet is a TCP/IP interface configuration and routing
+	  utility. You generally don't need "ip" to use busybox with
+	  TCP/IP.
+
+config FEATURE_IP_ADDRESS
+	bool "ip address"
+	default y
+	depends on IP
+	help
+	  Address manipulation support for the "ip" applet.
+
+config FEATURE_IP_LINK
+	bool "ip link"
+	default y
+	depends on IP
+	help
+	  Configure network devices with "ip".
+
+config FEATURE_IP_ROUTE
+	bool "ip route"
+	default y
+	depends on IP
+	help
+	  Add support for routing table management to "ip".
+
+config FEATURE_IP_TUNNEL
+	bool "ip tunnel"
+	default y
+	depends on IP
+	help
+	  Add support for tunneling commands to "ip".
+
+config FEATURE_IP_RULE
+	bool "ip rule"
+	default y
+	depends on IP
+	help
+	  Add support for rule commands to "ip".
+
+config FEATURE_IP_SHORT_FORMS
+	bool "Support short forms of ip commands"
+	default y
+	depends on IP
+	help
+	  Also support short-form of ip <OBJECT> commands:
+	  ip addr   -> ipaddr
+	  ip link   -> iplink
+	  ip route  -> iproute
+	  ip tunnel -> iptunnel
+	  ip rule   -> iprule
+
+	  Say N unless you desparately need the short form of the ip
+	  object commands.
+
+config FEATURE_IP_RARE_PROTOCOLS
+	bool "Support displaying rarely used link types"
+	default n
+	depends on IP
+	help
+	  If you are not going to use links of type "frad", "econet",
+	  "bif" etc, you probably don't need to enable this.
+	  Ethernet, wireless, infrared, ppp/slip, ip tunnelling
+	  link types are supported without this option selected.
+
+config IPADDR
+	bool
+	default y
+	depends on FEATURE_IP_SHORT_FORMS && FEATURE_IP_ADDRESS
+
+config IPLINK
+	bool
+	default y
+	depends on FEATURE_IP_SHORT_FORMS && FEATURE_IP_LINK
+
+config IPROUTE
+	bool
+	default y
+	depends on FEATURE_IP_SHORT_FORMS && FEATURE_IP_ROUTE
+
+config IPTUNNEL
+	bool
+	default y
+	depends on FEATURE_IP_SHORT_FORMS && FEATURE_IP_TUNNEL
+
+config IPRULE
+	bool
+	default y
+	depends on FEATURE_IP_SHORT_FORMS && FEATURE_IP_RULE
+
+config IPCALC
+	bool "ipcalc"
+	default y
+	help
+	  ipcalc takes an IP address and netmask and calculates the
+	  resulting broadcast, network, and host range.
+
+config FEATURE_IPCALC_FANCY
+	bool "Fancy IPCALC, more options, adds 1 kbyte"
+	default y
+	depends on IPCALC
+	help
+	  Adds the options hostname, prefix and silent to the output of
+	  "ipcalc".
+
+config FEATURE_IPCALC_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on IPCALC && LONG_OPTS
+	help
+	  Support long options for the ipcalc applet.
+
+config NETSTAT
+	bool "netstat"
+	default y
+	select PLATFORM_LINUX
+	help
+	  netstat prints information about the Linux networking subsystem.
+
+config FEATURE_NETSTAT_WIDE
+	bool "Enable wide netstat output"
+	default y
+	depends on NETSTAT
+	help
+	  Add support for wide columns. Useful when displaying IPv6 addresses
+	  (-W option).
+
+config FEATURE_NETSTAT_PRG
+	bool "Enable PID/Program name output"
+	default y
+	depends on NETSTAT
+	help
+	  Add support for -p flag to print out PID and program name.
+	  +700 bytes of code.
+
+config NSLOOKUP
+	bool "nslookup"
+	default y
+	help
+	  nslookup is a tool to query Internet name servers.
+
+config NTPD
+	bool "ntpd"
+	default y
+	select PLATFORM_LINUX
+	help
+	  The NTP client/server daemon.
+
+config FEATURE_NTPD_SERVER
+	bool "Make ntpd usable as a NTP server"
+	default y
+	depends on NTPD
+	help
+	  Make ntpd usable as a NTP server. If you disable this option
+	  ntpd will be usable only as a NTP client.
+
+config PSCAN
+	bool "pscan"
+	default y
+	help
+	  Simple network port scanner.
+
+config ROUTE
+	bool "route"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Route displays or manipulates the kernel's IP routing tables.
+
+config SLATTACH
+	bool "slattach"
+	default y
+	select PLATFORM_LINUX
+	help
+	  slattach is a small utility to attach network interfaces to serial
+	  lines.
+
+#config TC
+#	bool "tc"
+#	default y
+#	help
+#	  show / manipulate traffic control settings
+#
+#config FEATURE_TC_INGRESS
+#	def_bool n
+#	depends on TC
+
+config TCPSVD
+	bool "tcpsvd"
+	default y
+	help
+	  tcpsvd listens on a TCP port and runs a program for each new
+	  connection.
+
+config TELNET
+	bool "telnet"
+	default y
+	help
+	  Telnet is an interface to the TELNET protocol, but is also commonly
+	  used to test other simple protocols.
+
+config FEATURE_TELNET_TTYPE
+	bool "Pass TERM type to remote host"
+	default y
+	depends on TELNET
+	help
+	  Setting this option will forward the TERM environment variable to the
+	  remote host you are connecting to. This is useful to make sure that
+	  things like ANSI colors and other control sequences behave.
+
+config FEATURE_TELNET_AUTOLOGIN
+	bool "Pass USER type to remote host"
+	default y
+	depends on TELNET
+	help
+	  Setting this option will forward the USER environment variable to the
+	  remote host you are connecting to. This is useful when you need to
+	  log into a machine without telling the username (autologin). This
+	  option enables `-a' and `-l USER' arguments.
+
+config TELNETD
+	bool "telnetd"
+	default y
+	select FEATURE_SYSLOG
+	help
+	  A daemon for the TELNET protocol, allowing you to log onto the host
+	  running the daemon. Please keep in mind that the TELNET protocol
+	  sends passwords in plain text. If you can't afford the space for an
+	  SSH daemon and you trust your network, you may say 'y' here. As a
+	  more secure alternative, you should seriously consider installing the
+	  very small Dropbear SSH daemon instead:
+		http://matt.ucc.asn.au/dropbear/dropbear.html
+
+	  Note that for busybox telnetd to work you need several things:
+	  First of all, your kernel needs:
+		  UNIX98_PTYS=y
+		  DEVPTS_FS=y
+
+	  Next, you need a /dev/pts directory on your root filesystem:
+
+		  $ ls -ld /dev/pts
+		  drwxr-xr-x  2 root root 0 Sep 23 13:21 /dev/pts/
+
+	  Next you need the pseudo terminal master multiplexer /dev/ptmx:
+
+		  $ ls -la /dev/ptmx
+		  crw-rw-rw-  1 root tty 5, 2 Sep 23 13:55 /dev/ptmx
+
+	  Any /dev/ttyp[0-9]* files you may have can be removed.
+	  Next, you need to mount the devpts filesystem on /dev/pts using:
+
+		  mount -t devpts devpts /dev/pts
+
+	  You need to be sure that busybox has LOGIN and
+	  FEATURE_SUID enabled. And finally, you should make
+	  certain that Busybox has been installed setuid root:
+
+		chown root.root /bin/busybox
+		chmod 4755 /bin/busybox
+
+	  with all that done, telnetd _should_ work....
+
+
+config FEATURE_TELNETD_STANDALONE
+	bool "Support standalone telnetd (not inetd only)"
+	default y
+	depends on TELNETD
+	help
+	  Selecting this will make telnetd able to run standalone.
+
+config FEATURE_TELNETD_INETD_WAIT
+	bool "Support -w SEC option (inetd wait mode)"
+	default y
+	depends on FEATURE_TELNETD_STANDALONE
+	help
+	  This option allows you to run telnetd in "inet wait" mode.
+	  Example inetd.conf line (note "wait", not usual "nowait"):
+
+	  telnet stream tcp wait root /bin/telnetd telnetd -w10
+
+	  In this example, inetd passes _listening_ socket_ as fd 0
+	  to telnetd when connection appears.
+	  telnetd will wait for connections until all existing
+	  connections are closed, and no new connections
+	  appear during 10 seconds. Then it exits, and inetd continues
+	  to listen for new connections.
+
+	  This option is rarely used. "tcp nowait" is much more usual
+	  way of running tcp services, including telnetd.
+	  You most probably want to say N here.
+
+config TFTP
+	bool "tftp"
+	default y
+	help
+	  This enables the Trivial File Transfer Protocol client program. TFTP
+	  is usually used for simple, small transfers such as a root image
+	  for a network-enabled bootloader.
+
+config TFTPD
+	bool "tftpd"
+	default y
+	help
+	  This enables the Trivial File Transfer Protocol server program.
+	  It expects that stdin is a datagram socket and a packet
+	  is already pending on it. It will exit after one transfer.
+	  In other words: it should be run from inetd in nowait mode,
+	  or from udpsvd. Example: "udpsvd -E 0 69 tftpd DIR"
+
+comment "Common options for tftp/tftpd"
+	depends on TFTP || TFTPD
+
+config FEATURE_TFTP_GET
+	bool "Enable 'tftp get' and/or tftpd upload code"
+	default y
+	depends on TFTP || TFTPD
+	help
+	  Add support for the GET command within the TFTP client. This allows
+	  a client to retrieve a file from a TFTP server.
+	  Also enable upload support in tftpd, if tftpd is selected.
+
+	  Note: this option does _not_ make tftpd capable of download
+	  (the usual operation people need from it)!
+
+config FEATURE_TFTP_PUT
+	bool "Enable 'tftp put' and/or tftpd download code"
+	default y
+	depends on TFTP || TFTPD
+	help
+	  Add support for the PUT command within the TFTP client. This allows
+	  a client to transfer a file to a TFTP server.
+	  Also enable download support in tftpd, if tftpd is selected.
+
+config FEATURE_TFTP_BLOCKSIZE
+	bool "Enable 'blksize' and 'tsize' protocol options"
+	default y
+	depends on TFTP || TFTPD
+	help
+	  Allow tftp to specify block size, and tftpd to understand
+	  "blksize" and "tsize" options.
+
+config FEATURE_TFTP_PROGRESS_BAR
+	bool "Enable tftp progress meter"
+	default y
+	depends on TFTP && FEATURE_TFTP_BLOCKSIZE
+	help
+	  Show progress bar.
+
+config TFTP_DEBUG
+	bool "Enable debug"
+	default n
+	depends on TFTP || TFTPD
+	help
+	  Make tftp[d] print debugging messages on stderr.
+	  This is useful if you are diagnosing a bug in tftp[d].
+
+config TRACEROUTE
+	bool "traceroute"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Utility to trace the route of IP packets.
+
+config TRACEROUTE6
+	bool "traceroute6"
+	default y
+	depends on FEATURE_IPV6 && TRACEROUTE
+	help
+	  Utility to trace the route of IPv6 packets.
+
+config FEATURE_TRACEROUTE_VERBOSE
+	bool "Enable verbose output"
+	default y
+	depends on TRACEROUTE
+	help
+	  Add some verbosity to traceroute. This includes among other things
+	  hostnames and ICMP response types.
+
+config FEATURE_TRACEROUTE_SOURCE_ROUTE
+	bool "Enable loose source route"
+	default n
+	depends on TRACEROUTE
+	help
+	  Add option to specify a loose source route gateway
+	  (8 maximum).
+
+config FEATURE_TRACEROUTE_USE_ICMP
+	bool "Use ICMP instead of UDP"
+	default n
+	depends on TRACEROUTE
+	help
+	  Add option -I to use ICMP ECHO instead of UDP datagrams.
+
+config TUNCTL
+	bool "tunctl"
+	default y
+	select PLATFORM_LINUX
+	help
+	  tunctl creates or deletes tun devices.
+
+config FEATURE_TUNCTL_UG
+	bool "Support owner:group assignment"
+	default y
+	depends on TUNCTL
+	help
+	  Allow to specify owner and group of newly created interface.
+	  340 bytes of pure bloat. Say no here.
+
+# -> source networking/udhcp/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+
+
+config UDHCPD
+	bool "udhcp server (udhcpd)"
+	default y
+	select PLATFORM_LINUX
+	help
+	  udhcpd is a DHCP server geared primarily toward embedded systems,
+	  while striving to be fully functional and RFC compliant.
+
+config DHCPRELAY
+	bool "dhcprelay"
+	default y
+	depends on UDHCPD
+	help
+	  dhcprelay listens for dhcp requests on one or more interfaces
+	  and forwards these requests to a different interface or dhcp
+	  server.
+
+config DUMPLEASES
+	bool "Lease display utility (dumpleases)"
+	default y
+	depends on UDHCPD
+	help
+	  dumpleases displays the leases written out by the udhcpd server.
+	  Lease times are stored in the file by time remaining in lease, or
+	  by the absolute time that it expires in seconds from epoch.
+
+config FEATURE_UDHCPD_WRITE_LEASES_EARLY
+	bool "Rewrite the lease file at every new acknowledge"
+	default y
+	depends on UDHCPD
+	help
+	  If selected, udhcpd will write a new file with leases every
+	  time a new lease has been accepted, thus eliminating the need
+	  to send SIGUSR1 for the initial writing or updating. Any timed
+	  rewriting remains undisturbed.
+
+config FEATURE_UDHCPD_BASE_IP_ON_MAC
+	bool "Select IP address based on client MAC"
+	default n
+	depends on UDHCPD
+	help
+	  If selected, udhcpd will base its selection of IP address to offer
+	  on the client's hardware address. Otherwise udhcpd uses the next
+	  consecutive free address.
+
+	  This reduces the frequency of IP address changes for clients
+	  which let their lease expire, and makes consecutive DHCPOFFERS
+	  for the same client to (almost always) contain the same
+	  IP address.
+
+config DHCPD_LEASES_FILE
+	string "Absolute path to lease file"
+	default "/var/lib/misc/udhcpd.leases"
+	depends on UDHCPD
+	help
+	  udhcpd stores addresses in a lease file. This is the absolute path
+	  of the file. Normally it is safe to leave it untouched.
+
+config UDHCPC
+	bool "udhcp client (udhcpc)"
+	default y
+	select PLATFORM_LINUX
+	help
+	  udhcpc is a DHCP client geared primarily toward embedded systems,
+	  while striving to be fully functional and RFC compliant.
+
+	  The udhcp client negotiates a lease with the DHCP server and
+	  runs a script when a lease is obtained or lost.
+
+config FEATURE_UDHCPC_ARPING
+	bool "Verify that the offered address is free, using ARP ping"
+	default y
+	depends on UDHCPC
+	help
+	  If selected, udhcpc will send ARP probes and make sure
+	  the offered address is really not in use by anyone. The client
+	  will DHCPDECLINE the offer if the address is in use,
+	  and restart the discover process.
+
+config FEATURE_UDHCP_PORT
+	bool "Enable '-P port' option for udhcpd and udhcpc"
+	default n
+	depends on UDHCPD || UDHCPC
+	help
+	  At the cost of ~300 bytes, enables -P port option.
+	  This feature is typically not needed.
+
+config UDHCP_DEBUG
+	int "Maximum verbosity level for udhcp applets (0..9)"
+	default 9
+	range 0 9
+	depends on UDHCPD || UDHCPC || DHCPRELAY
+	help
+	  Verbosity can be increased with multiple -v options.
+	  This option controls how high it can be cranked up.
+
+	  Bigger values result in bigger code. Levels above 1
+	  are very verbose and useful for debugging only.
+
+config FEATURE_UDHCP_RFC3397
+	bool "Support for RFC3397 domain search (experimental)"
+	default y
+	depends on UDHCPD || UDHCPC
+	help
+	  If selected, both client and server will support passing of domain
+	  search lists via option 119, specified in RFC 3397,
+	  and SIP servers option 120, specified in RFC 3361.
+
+config FEATURE_UDHCP_8021Q
+	bool "Support for 802.1Q VLAN parameters"
+	default y
+	depends on UDHCPD || UDHCPC
+	help
+	  If selected, both client and server will support passing of VLAN
+	  ID and priority via options 132 and 133 as per 802.1Q.
+
+config UDHCPC_DEFAULT_SCRIPT
+	string "Absolute path to config script"
+	default "/usr/share/udhcpc/default.script"
+	depends on UDHCPC
+	help
+	  This script is called after udhcpc receives an answer. See
+	  examples/udhcp for a working example. Normally it is safe
+	  to leave this untouched.
+
+config UDHCPC_SLACK_FOR_BUGGY_SERVERS
+	int "DHCP options slack buffer size"
+	default 80
+	range 0 924
+	depends on UDHCPD || UDHCPC
+	help
+	  Some buggy DHCP servers send DHCP offer packets with option
+	  field larger than we expect (which might also be considered a
+	  buffer overflow attempt). These packets are normally discarded.
+	  If circumstances beyond your control force you to support such
+	  servers, this may help. The upper limit (924) makes dhcpc accept
+	  even 1500 byte packets (maximum-sized ethernet packets).
+
+	  This option does not make dhcp[cd] emit non-standard
+	  sized packets.
+
+	  Known buggy DHCP servers:
+	  3Com OfficeConnect Remote 812 ADSL Router:
+	    seems to confuse maximum allowed UDP packet size with
+	    maximum size of entire IP packet, and sends packets which are
+	    28 bytes too large.
+	  Seednet (ISP) VDSL: sends packets 2 bytes too large.
+
+config IFUPDOWN_UDHCPC_CMD_OPTIONS
+	string "ifup udhcpc command line options"
+	default "-R -n"
+	depends on IFUPDOWN && UDHCPC
+	help
+	  Command line options to pass to udhcpc from ifup.
+	  Intended to alter options not available in /etc/network/interfaces.
+	  (IE: --syslog --background etc...)
+
+config UDPSVD
+	bool "udpsvd"
+	default y
+	help
+	  udpsvd listens on an UDP port and runs a program for each new
+	  connection.
+
+config VCONFIG
+	bool "vconfig"
+	default y
+	select PLATFORM_LINUX
+	help
+	  Creates, removes, and configures VLAN interfaces
+
+config WGET
+	bool "wget"
+	default y
+	help
+	  wget is a utility for non-interactive download of files from HTTP,
+	  HTTPS, and FTP servers.
+
+config FEATURE_WGET_STATUSBAR
+	bool "Enable a nifty process meter (+2k)"
+	default y
+	depends on WGET
+	help
+	  Enable the transfer progress bar for wget transfers.
+
+config FEATURE_WGET_AUTHENTICATION
+	bool "Enable HTTP authentication"
+	default y
+	depends on WGET
+	help
+	  Support authenticated HTTP transfers.
+
+config FEATURE_WGET_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on WGET && LONG_OPTS
+	help
+	  Support long options for the wget applet.
+
+config FEATURE_WGET_TIMEOUT
+	bool "Enable read timeout option -T SEC"
+	default y
+	depends on WGET
+	help
+	  Supports network read timeout for wget, so that wget will give
+	  up and timeout when reading network data, through the -T command
+	  line option.  Currently only network data read timeout is
+	  supported (i.e., timeout is not applied to the DNS nor TCP
+	  connection initialization).  When FEATURE_WGET_LONG_OPTIONS is
+	  also enabled, the --timeout option will work in addition to -T.
+
+config ZCIP
+	bool "zcip"
+	default y
+	select PLATFORM_LINUX
+	select FEATURE_SYSLOG
+	help
+	  ZCIP provides ZeroConf IPv4 address selection, according to RFC 3927.
+	  It's a daemon that allocates and defends a dynamically assigned
+	  address on the 169.254/16 network, requiring no system administrator.
+
+	  See http://www.zeroconf.org for further details, and "zcip.script"
+	  in the busybox examples.
+
+endmenu
+# -> source printutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Print Utilities"
+
+
+
+config LPD
+	bool "lpd"
+	default y
+	help
+	  lpd is a print spooling daemon.
+
+config LPR
+	bool "lpr"
+	default y
+	help
+	  lpr sends files (or standard input) to a print spooling daemon.
+
+config LPQ
+	bool "lpq"
+	default y
+	help
+	  lpq is a print spool queue examination and manipulation program.
+
+endmenu
+# -> source mailutils/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+menu "Mail Utilities"
+
+
+
+config MAKEMIME
+	bool "makemime"
+	default y
+	help
+	  Create MIME-formatted messages.
+
+config FEATURE_MIME_CHARSET
+	string "Default charset"
+	default "us-ascii"
+	depends on MAKEMIME || REFORMIME || SENDMAIL
+	help
+	  Default charset of the message.
+
+config POPMAILDIR
+	bool "popmaildir"
+	default y
+	help
+	  Simple yet powerful POP3 mail popper. Delivers content
+	  of remote mailboxes to local Maildir.
+
+config FEATURE_POPMAILDIR_DELIVERY
+	bool "Allow message filters and custom delivery program"
+	default y
+	depends on POPMAILDIR
+	help
+	  Allow to use a custom program to filter the content
+	  of the message before actual delivery (-F "prog [args...]").
+	  Allow to use a custom program for message actual delivery
+	  (-M "prog [args...]").
+
+config REFORMIME
+	bool "reformime"
+	default y
+	help
+	  Parse MIME-formatted messages.
+
+config FEATURE_REFORMIME_COMPAT
+	bool "Accept and ignore options other than -x and -X"
+	default y
+	depends on REFORMIME
+	help
+	  Accept (for compatibility only) and ignore options
+	  other than -x and -X.
+
+config SENDMAIL
+	bool "sendmail"
+	default y
+	help
+	  Barebones sendmail.
+
+endmenu
+# -> source procps/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Process Utilities"
+
+config IOSTAT
+	bool "iostat"
+	default y
+	help
+	  Report CPU and I/O statistics
+config MPSTAT
+	bool "mpstat"
+	default y
+	help
+	  Per-processor statistics
+config NMETER
+	bool "nmeter"
+	default y
+	help
+	  Prints selected system stats continuously, one line per update.
+config PMAP
+       bool "pmap"
+       default y
+       help
+         Display processes' memory mappings.
+config POWERTOP
+	bool "powertop"
+	default y
+	help
+	  Analyze power consumption on Intel-based laptops
+config PSTREE
+	bool "pstree"
+	default y
+	help
+	  Display a tree of processes.
+config PWDX
+	bool "pwdx"
+	default y
+	help
+	  Report current working directory of a process
+config SMEMCAP
+	bool "smemcap"
+	default y
+	help
+	  smemcap is a tool for capturing process data for smem,
+	  a memory usage statistic tool.
+config UPTIME
+	bool "uptime"
+	default y
+	select PLATFORM_LINUX #sysinfo()
+	help
+	  uptime gives a one line display of the current time, how long
+	  the system has been running, how many users are currently logged
+	  on, and the system load averages for the past 1, 5, and 15 minutes.
+
+config FEATURE_UPTIME_UTMP_SUPPORT
+	bool "Support for showing the number of users"
+	default y
+	depends on UPTIME && FEATURE_UTMP
+	help
+	  Makes uptime display the number of users currently logged on.
+
+config FREE
+	bool "free"
+	default y
+	select PLATFORM_LINUX #sysinfo()
+	help
+	  free displays the total amount of free and used physical and swap
+	  memory in the system, as well as the buffers used by the kernel.
+	  The shared memory column should be ignored; it is obsolete.
+
+config FUSER
+	bool "fuser"
+	default y
+	help
+	  fuser lists all PIDs (Process IDs) that currently have a given
+	  file open. fuser can also list all PIDs that have a given network
+	  (TCP or UDP) port open.
+
+config KILL
+	bool "kill"
+	default y
+	help
+	  The command kill sends the specified signal to the specified
+	  process or process group. If no signal is specified, the TERM
+	  signal is sent.
+
+config KILLALL
+	bool "killall"
+	default y
+	depends on KILL
+	help
+	  killall sends a signal to all processes running any of the
+	  specified commands. If no signal name is specified, SIGTERM is
+	  sent.
+
+config KILLALL5
+	bool "killall5"
+	default y
+	depends on KILL
+
+config PGREP
+	bool "pgrep"
+	default y
+	help
+	  Look for processes by name.
+
+config PIDOF
+	bool "pidof"
+	default y
+	help
+	  Pidof finds the process id's (pids) of the named programs. It prints
+	  those id's on the standard output.
+
+config FEATURE_PIDOF_SINGLE
+	bool "Enable argument for single shot (-s)"
+	default y
+	depends on PIDOF
+	help
+	  Support argument '-s' for returning only the first pid found.
+
+config FEATURE_PIDOF_OMIT
+	bool "Enable argument for omitting pids (-o)"
+	default y
+	depends on PIDOF
+	help
+	  Support argument '-o' for omitting the given pids in output.
+	  The special pid %PPID can be used to name the parent process
+	  of the pidof, in other words the calling shell or shell script.
+
+config PKILL
+	bool "pkill"
+	default y
+	help
+	  Send signals to processes by name.
+
+config PS
+	bool "ps"
+	default y
+	help
+	  ps gives a snapshot of the current processes.
+
+config FEATURE_PS_WIDE
+	bool "Enable wide output option (-w)"
+	default y
+	depends on PS
+	help
+	  Support argument 'w' for wide output.
+	  If given once, 132 chars are printed, and if given more
+	  than once, the length is unlimited.
+
+config FEATURE_PS_TIME
+	bool "Enable time and elapsed time output"
+	default y
+	depends on PS && DESKTOP
+	select PLATFORM_LINUX
+	help
+	  Support -o time and -o etime output specifiers.
+
+config FEATURE_PS_ADDITIONAL_COLUMNS
+	bool "Enable additional ps columns"
+	default y
+	depends on PS && DESKTOP
+	help
+	  Support -o rgroup, -o ruser, -o nice output specifiers.
+
+config FEATURE_PS_UNUSUAL_SYSTEMS
+	bool "Support Linux prior to 2.4.0 and non-ELF systems"
+	default n
+	depends on FEATURE_PS_TIME
+	help
+	  Include support for measuring HZ on old kernels and non-ELF systems
+	  (if you are on Linux 2.4.0+ and use ELF, you don't need this)
+
+config RENICE
+	bool "renice"
+	default y
+	help
+	  Renice alters the scheduling priority of one or more running
+	  processes.
+
+config BB_SYSCTL
+	bool "sysctl"
+	default y
+	help
+	  Configure kernel parameters at runtime.
+
+config TOP
+	bool "top"
+	default y
+	help
+	  The top program provides a dynamic real-time view of a running
+	  system.
+
+config FEATURE_TOP_CPU_USAGE_PERCENTAGE
+	bool "Show CPU per-process usage percentage"
+	default y
+	depends on TOP
+	help
+	  Make top display CPU usage for each process.
+	  This adds about 2k.
+
+config FEATURE_TOP_CPU_GLOBAL_PERCENTS
+	bool "Show CPU global usage percentage"
+	default y
+	depends on FEATURE_TOP_CPU_USAGE_PERCENTAGE
+	help
+	  Makes top display "CPU: NN% usr NN% sys..." line.
+	  This adds about 0.5k.
+
+config FEATURE_TOP_SMP_CPU
+	bool "SMP CPU usage display ('c' key)"
+	default y
+	depends on FEATURE_TOP_CPU_GLOBAL_PERCENTS
+	help
+	  Allow 'c' key to switch between individual/cumulative CPU stats
+	  This adds about 0.5k.
+
+config FEATURE_TOP_DECIMALS
+	bool "Show 1/10th of a percent in CPU/mem statistics"
+	default y
+	depends on FEATURE_TOP_CPU_USAGE_PERCENTAGE
+	help
+	  Show 1/10th of a percent in CPU/mem statistics.
+	  This adds about 0.3k.
+
+config FEATURE_TOP_SMP_PROCESS
+	bool "Show CPU process runs on ('j' field)"
+	default y
+	depends on TOP
+	help
+	  Show CPU where process was last found running on.
+	  This is the 'j' field.
+
+config FEATURE_TOPMEM
+	bool "Topmem command ('s' key)"
+	default y
+	depends on TOP
+	help
+	  Enable 's' in top (gives lots of memory info).
+
+config FEATURE_SHOW_THREADS
+	bool "Support for showing threads in ps/pstree/top"
+	default y
+	depends on PS || TOP || PSTREE
+	help
+	  Enables the ps -T option, showing of threads in pstree,
+	  and 'h' command in top.
+
+config WATCH
+	bool "watch"
+	default y
+	help
+	  watch is used to execute a program periodically, showing
+	  output to the screen.
+
+endmenu
+# -> source runit/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Runit Utilities"
+
+
+
+config RUNSV
+	bool "runsv"
+	default y
+	help
+	  runsv starts and monitors a service and optionally an appendant log
+	  service.
+
+config RUNSVDIR
+	bool "runsvdir"
+	default y
+	help
+	  runsvdir starts a runsv process for each subdirectory, or symlink to
+	  a directory, in the services directory dir, up to a limit of 1000
+	  subdirectories, and restarts a runsv process if it terminates.
+
+config FEATURE_RUNSVDIR_LOG
+	bool "Enable scrolling argument log"
+	depends on RUNSVDIR
+	default n
+	help
+	  Enable feature where second parameter of runsvdir holds last error
+	  message (viewable via top/ps). Otherwise (feature is off
+	  or no parameter), error messages go to stderr only.
+
+config SV
+	bool "sv"
+	default y
+	help
+	  sv reports the current status and controls the state of services
+	  monitored by the runsv supervisor.
+
+config SV_DEFAULT_SERVICE_DIR
+	string "Default directory for services"
+	default "/var/service"
+	depends on SV
+	help
+	  Default directory for services.
+	  Defaults to "/var/service"
+
+config SVLOGD
+	bool "svlogd"
+	default y
+	help
+	  svlogd continuously reads log data from its standard input, optionally
+	  filters log messages, and writes the data to one or more automatically
+	  rotated logs.
+
+config CHPST
+	bool "chpst"
+	default y
+	help
+	  chpst changes the process state according to the given options, and
+	  execs specified program.
+
+config SETUIDGID
+	bool "setuidgid"
+	default y
+	help
+	  Sets soft resource limits as specified by options
+
+config ENVUIDGID
+	bool "envuidgid"
+	default y
+	help
+	  Sets $UID to account's uid and $GID to account's gid
+
+config ENVDIR
+	bool "envdir"
+	default y
+	help
+	  Sets various environment variables as specified by files
+	  in the given directory
+
+config SOFTLIMIT
+	bool "softlimit"
+	default y
+	help
+	  Sets soft resource limits as specified by options
+
+endmenu
+# -> source selinux/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "SELinux Utilities"
+	depends on SELINUX
+
+
+
+config CHCON
+	bool "chcon"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to change the security context of file.
+
+config FEATURE_CHCON_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on CHCON && LONG_OPTS
+	help
+	  Support long options for the chcon applet.
+
+config GETENFORCE
+	bool "getenforce"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to get the current mode of SELinux.
+
+config GETSEBOOL
+	bool "getsebool"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to get SELinux boolean values.
+
+config LOAD_POLICY
+	bool "load_policy"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to load SELinux policy.
+
+config MATCHPATHCON
+	bool "matchpathcon"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to get default security context of the
+	  specified path from the file contexts configuration.
+
+config RESTORECON
+	bool "restorecon"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to relabel files. The feature is almost
+	  the same as setfiles, but usage is a little different.
+
+config RUNCON
+	bool "runcon"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to run command in speficied security context.
+
+config FEATURE_RUNCON_LONG_OPTIONS
+	bool "Enable long options"
+	default y
+	depends on RUNCON && LONG_OPTS
+	help
+	  Support long options for the runcon applet.
+
+config SELINUXENABLED
+	bool "selinuxenabled"
+	default n
+	depends on SELINUX
+	help
+	  Enable support for this command to be used within shell scripts
+	  to determine if selinux is enabled.
+
+config SETENFORCE
+	bool "setenforce"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to modify the mode SELinux is running in.
+
+config SETFILES
+	bool "setfiles"
+	default n
+	depends on SELINUX
+	help
+	  Enable support to modify to relabel files.
+	  Notice: If you built libselinux with -D_FILE_OFFSET_BITS=64,
+	  (It is default in libselinux's Makefile), you _must_ enable
+	  CONFIG_LFS.
+
+config FEATURE_SETFILES_CHECK_OPTION
+	bool "Enable check option"
+	default n
+	depends on SETFILES
+	help
+	  Support "-c" option (check the validity of the contexts against
+	  the specified binary policy) for setfiles. Requires libsepol.
+
+config SETSEBOOL
+	bool "setsebool"
+	default n
+	depends on SELINUX
+	help
+	  Enable support for change boolean.
+	  semanage and -P option is not supported yet.
+
+config SESTATUS
+	bool "sestatus"
+	default n
+	depends on SELINUX
+	help
+	  Displays the status of SELinux.
+
+endmenu
+# -> source shell/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "Shells"
+
+config ASH
+	bool "ash"
+	default y
+	depends on !NOMMU
+	help
+	  Tha 'ash' shell adds about 60k in the default configuration and is
+	  the most complete and most pedantically correct shell included with
+	  busybox. This shell is actually a derivative of the Debian 'dash'
+	  shell (by Herbert Xu), which was created by porting the 'ash' shell
+	  (written by Kenneth Almquist) from NetBSD.
+
+config ASH_BASH_COMPAT
+	bool "bash-compatible extensions"
+	default y
+	depends on ASH
+	help
+	  Enable bash-compatible extensions.
+
+config ASH_IDLE_TIMEOUT
+	bool "Idle timeout variable"
+	default n
+	depends on ASH
+	help
+	  Enables bash-like auto-logout after $TMOUT seconds of idle time.
+
+config ASH_JOB_CONTROL
+	bool "Job control"
+	default y
+	depends on ASH
+	help
+	  Enable job control in the ash shell.
+
+config ASH_ALIAS
+	bool "Alias support"
+	default y
+	depends on ASH
+	help
+	  Enable alias support in the ash shell.
+
+config ASH_GETOPTS
+	bool "Builtin getopt to parse positional parameters"
+	default y
+	depends on ASH
+	help
+	  Enable support for getopts builtin in ash.
+
+config ASH_BUILTIN_ECHO
+	bool "Builtin version of 'echo'"
+	default y
+	depends on ASH
+	help
+	  Enable support for echo builtin in ash.
+
+config ASH_BUILTIN_PRINTF
+	bool "Builtin version of 'printf'"
+	default y
+	depends on ASH
+	help
+	  Enable support for printf builtin in ash.
+
+config ASH_BUILTIN_TEST
+	bool "Builtin version of 'test'"
+	default y
+	depends on ASH
+	help
+	  Enable support for test builtin in ash.
+
+config ASH_CMDCMD
+	bool "'command' command to override shell builtins"
+	default y
+	depends on ASH
+	help
+	  Enable support for the ash 'command' builtin, which allows
+	  you to run the specified command with the specified arguments,
+	  even when there is an ash builtin command with the same name.
+
+config ASH_MAIL
+	bool "Check for new mail on interactive shells"
+	default n
+	depends on ASH
+	help
+	  Enable "check for new mail" function in the ash shell.
+
+config ASH_OPTIMIZE_FOR_SIZE
+	bool "Optimize for size instead of speed"
+	default y
+	depends on ASH
+	help
+	  Compile ash for reduced size at the price of speed.
+
+config ASH_RANDOM_SUPPORT
+	bool "Pseudorandom generator and $RANDOM variable"
+	default y
+	depends on ASH
+	help
+	  Enable pseudorandom generator and dynamic variable "$RANDOM".
+	  Each read of "$RANDOM" will generate a new pseudorandom value.
+	  You can reset the generator by using a specified start value.
+	  After "unset RANDOM" the generator will switch off and this
+	  variable will no longer have special treatment.
+
+config ASH_EXPAND_PRMT
+	bool "Expand prompt string"
+	default y
+	depends on ASH
+	help
+	  "PS#" may contain volatile content, such as backquote commands.
+	  This option recreates the prompt string from the environment
+	  variable each time it is displayed.
+
+config CTTYHACK
+	bool "cttyhack"
+	default y
+	help
+	  One common problem reported on the mailing list is the "can't
+	  access tty; job control turned off" error message, which typically
+	  appears when one tries to use a shell with stdin/stdout on
+	  /dev/console.
+	  This device is special - it cannot be a controlling tty.
+
+	  The proper solution is to use the correct device instead of
+	  /dev/console.
+
+	  cttyhack provides a "quick and dirty" solution to this problem.
+	  It analyzes stdin with various ioctls, trying to determine whether
+	  it is a /dev/ttyN or /dev/ttySN (virtual terminal or serial line).
+	  On Linux it also checks sysfs for a pointer to the active console.
+	  If cttyhack is able to find the real console device, it closes
+	  stdin/out/err and reopens that device.
+	  Then it executes the given program. Opening the device will make
+	  that device a controlling tty. This may require cttyhack
+	  to be a session leader.
+
+	  Example for /etc/inittab (for busybox init):
+
+	  ::respawn:/bin/cttyhack /bin/sh
+
+	  Starting an interactive shell from boot shell script:
+
+	  setsid cttyhack sh
+
+	  Giving controlling tty to shell running with PID 1:
+
+	  # exec cttyhack sh
+
+	  Without cttyhack, you need to know exact tty name,
+	  and do something like this:
+
+	  # exec setsid sh -c 'exec sh </dev/tty1 >/dev/tty1 2>&1'
+
+config HUSH
+	bool "hush"
+	default y
+	help
+	  hush is a small shell (25k). It handles the normal flow control
+	  constructs such as if/then/elif/else/fi, for/in/do/done, while loops,
+	  case/esac. Redirections, here documents, $((arithmetic))
+	  and functions are supported.
+
+	  It will compile and work on no-mmu systems.
+
+	  It does not handle select, aliases, tilde expansion,
+	  &>file and >&file redirection of stdout+stderr.
+
+config HUSH_BASH_COMPAT
+	bool "bash-compatible extensions"
+	default y
+	depends on HUSH
+	help
+	  Enable bash-compatible extensions.
+
+config HUSH_BRACE_EXPANSION
+	bool "Brace expansion"
+	default y
+	depends on HUSH_BASH_COMPAT
+	help
+	  Enable {abc,def} extension.
+
+config HUSH_HELP
+	bool "help builtin"
+	default y
+	depends on HUSH
+	help
+	  Enable help builtin in hush. Code size + ~1 kbyte.
+
+config HUSH_INTERACTIVE
+	bool "Interactive mode"
+	default y
+	depends on HUSH
+	help
+	  Enable interactive mode (prompt and command editing).
+	  Without this, hush simply reads and executes commands
+	  from stdin just like a shell script from a file.
+	  No prompt, no PS1/PS2 magic shell variables.
+
+config HUSH_SAVEHISTORY
+	bool "Save command history to .hush_history"
+	default y
+	depends on HUSH_INTERACTIVE && FEATURE_EDITING_SAVEHISTORY
+	help
+	  Enable history saving in hush.
+
+config HUSH_JOB
+	bool "Job control"
+	default y
+	depends on HUSH_INTERACTIVE
+	help
+	  Enable job control: Ctrl-Z backgrounds, Ctrl-C interrupts current
+	  command (not entire shell), fg/bg builtins work. Without this option,
+	  "cmd &" still works by simply spawning a process and immediately
+	  prompting for next command (or executing next command in a script),
+	  but no separate process group is formed.
+
+config HUSH_TICK
+	bool "Process substitution"
+	default y
+	depends on HUSH
+	help
+	  Enable process substitution `command` and $(command) in hush.
+
+config HUSH_IF
+	bool "Support if/then/elif/else/fi"
+	default y
+	depends on HUSH
+	help
+	  Enable if/then/elif/else/fi in hush.
+
+config HUSH_LOOPS
+	bool "Support for, while and until loops"
+	default y
+	depends on HUSH
+	help
+	  Enable for, while and until loops in hush.
+
+config HUSH_CASE
+	bool "Support case ... esac statement"
+	default y
+	depends on HUSH
+	help
+	  Enable case ... esac statement in hush. +400 bytes.
+
+config HUSH_FUNCTIONS
+	bool "Support funcname() { commands; } syntax"
+	default y
+	depends on HUSH
+	help
+	  Enable support for shell functions in hush. +800 bytes.
+
+config HUSH_LOCAL
+	bool "Support local builtin"
+	default y
+	depends on HUSH_FUNCTIONS
+	help
+	  Enable support for local variables in functions.
+
+config HUSH_RANDOM_SUPPORT
+	bool "Pseudorandom generator and $RANDOM variable"
+	default y
+	depends on HUSH
+	help
+	  Enable pseudorandom generator and dynamic variable "$RANDOM".
+	  Each read of "$RANDOM" will generate a new pseudorandom value.
+
+config HUSH_EXPORT_N
+	bool "Support 'export -n' option"
+	default y
+	depends on HUSH
+	help
+	  export -n unexports variables. It is a bash extension.
+
+config HUSH_MODE_X
+	bool "Support 'hush -x' option and 'set -x' command"
+	default y
+	depends on HUSH
+	help
+	  This instructs hush to print commands before execution.
+	  Adds ~300 bytes.
+
+config MSH
+	bool "msh (deprecated: aliased to hush)"
+	default n
+	select HUSH
+	help
+	  msh is deprecated and will be removed, please migrate to hush.
+
+
+choice
+	prompt "Choose which shell is aliased to 'sh' name"
+	default FEATURE_SH_IS_ASH
+	help
+	  Choose which shell you want to be executed by 'sh' alias.
+	  The ash shell is the most bash compatible and full featured one.
+
+# note: cannot use "select ASH" here, it breaks "make allnoconfig"
+config FEATURE_SH_IS_ASH
+	depends on ASH
+	bool "ash"
+	depends on !NOMMU
+
+config FEATURE_SH_IS_HUSH
+	depends on HUSH
+	bool "hush"
+
+config FEATURE_SH_IS_NONE
+	bool "none"
+
+endchoice
+
+choice
+	prompt "Choose which shell is aliased to 'bash' name"
+	default FEATURE_BASH_IS_NONE
+	help
+	  Choose which shell you want to be executed by 'bash' alias.
+	  The ash shell is the most bash compatible and full featured one.
+
+	  Note that selecting this option does not switch on any bash
+	  compatibility code. It merely makes it possible to install
+	  /bin/bash (sym)link and run scripts which start with
+	  #!/bin/bash line.
+
+	  Many systems use it in scripts which use bash-specific features,
+	  even simple ones like $RANDOM. Without this option, busybox
+	  can't be used for running them because it won't recongnize
+	  "bash" as a supported applet name.
+
+config FEATURE_BASH_IS_ASH
+	depends on ASH
+	bool "ash"
+	depends on !NOMMU
+
+config FEATURE_BASH_IS_HUSH
+	depends on HUSH
+	bool "hush"
+
+config FEATURE_BASH_IS_NONE
+	bool "none"
+
+endchoice
+
+
+config SH_MATH_SUPPORT
+	bool "POSIX math support"
+	default y
+	depends on ASH || HUSH
+	help
+	  Enable math support in the shell via $((...)) syntax.
+
+config SH_MATH_SUPPORT_64
+	bool "Extend POSIX math support to 64 bit"
+	default y
+	depends on SH_MATH_SUPPORT
+	help
+	  Enable 64-bit math support in the shell. This will make the shell
+	  slightly larger, but will allow computation with very large numbers.
+	  This is not in POSIX, so do not rely on this in portable code.
+
+config FEATURE_SH_EXTRA_QUIET
+	bool "Hide message on interactive shell startup"
+	default y
+	depends on HUSH || ASH
+	help
+	  Remove the busybox introduction when starting a shell.
+
+config FEATURE_SH_STANDALONE
+	bool "Standalone shell"
+	default n
+	depends on (HUSH || ASH) && FEATURE_PREFER_APPLETS
+	help
+	  This option causes busybox shells to use busybox applets
+	  in preference to executables in the PATH whenever possible. For
+	  example, entering the command 'ifconfig' into the shell would cause
+	  busybox to use the ifconfig busybox applet. Specifying the fully
+	  qualified executable name, such as '/sbin/ifconfig' will still
+	  execute the /sbin/ifconfig executable on the filesystem. This option
+	  is generally used when creating a statically linked version of busybox
+	  for use as a rescue shell, in the event that you screw up your system.
+
+	  This is implemented by re-execing /proc/self/exe (typically)
+	  with right parameters. Some selected applets ("NOFORK" applets)
+	  can even be executed without creating new process.
+	  Instead, busybox will call <applet>_main() internally.
+
+	  However, this causes problems in chroot jails without mounted /proc
+	  and with ps/top (command name can be shown as 'exe' for applets
+	  started this way).
+# untrue?
+#	  Note that this will *also* cause applets to take precedence
+#	  over shell builtins of the same name. So turning this on will
+#	  eliminate any performance gained by turning on the builtin "echo"
+#	  and "test" commands in ash.
+# untrue?
+#	  Note that when using this option, the shell will attempt to directly
+#	  run '/bin/busybox'. If you do not have the busybox binary sitting in
+#	  that exact location with that exact name, this option will not work at
+#	  all.
+
+config FEATURE_SH_NOFORK
+	bool "Run 'nofork' applets directly"
+	default n
+	depends on (HUSH || ASH) && FEATURE_PREFER_APPLETS
+	help
+	  This option causes busybox shells to not execute typical
+	  fork/exec/wait sequence, but call <applet>_main directly,
+	  if possible. (Sometimes it is not possible: for example,
+	  this is not possible in pipes).
+
+	  This will be done only for some applets (those which are marked
+	  NOFORK in include/applets.h).
+
+	  This may significantly speed up some shell scripts.
+
+	  This feature is relatively new. Use with care. Report bugs
+	  to project mailing list.
+
+config FEATURE_SH_HISTFILESIZE
+	bool "Use $HISTFILESIZE"
+	default y
+	depends on HUSH || ASH
+	help
+	  This option makes busybox shells to use $HISTFILESIZE variable
+	  to set shell history size. Note that its max value is capped
+	  by "History size" setting in library tuning section.
+
+
+endmenu
+# -> source sysklogd/Config.in
+# DO NOT EDIT. This file is generated from Config.src
+#
+# For a description of the syntax of this configuration file,
+# see scripts/kbuild/config-language.txt.
+#
+
+menu "System Logging Utilities"
+
+
+
+config SYSLOGD
+	bool "syslogd"
+	default y
+	help
+	  The syslogd utility is used to record logs of all the
+	  significant events that occur on a system. Every
+	  message that is logged records the date and time of the
+	  event, and will generally also record the name of the
+	  application that generated the message. When used in
+	  conjunction with klogd, messages from the Linux kernel
+	  can also be recorded. This is terribly useful,
+	  especially for finding what happened when something goes
+	  wrong. And something almost always will go wrong if
+	  you wait long enough....
+
+config FEATURE_ROTATE_LOGFILE
+	bool "Rotate message files"
+	default y
+	depends on SYSLOGD
+	help
+	  This enables syslogd to rotate the message files
+	  on his own. No need to use an external rotatescript.
+
+config FEATURE_REMOTE_LOG
+	bool "Remote Log support"
+	default y
+	depends on SYSLOGD
+	help
+	  When you enable this feature, the syslogd utility can
+	  be used to send system log messages to another system
+	  connected via a network. This allows the remote
+	  machine to log all the system messages, which can be
+	  terribly useful for reducing the number of serial
+	  cables you use. It can also be a very good security
+	  measure to prevent system logs from being tampered with
+	  by an intruder.
+
+config FEATURE_SYSLOGD_DUP
+	bool "Support -D (drop dups) option"
+	default y
+	depends on SYSLOGD
+	help
+	  Option -D instructs syslogd to drop consecutive messages
+	  which are totally the same.
+
+config FEATURE_SYSLOGD_CFG
+	bool "Support syslog.conf"
+	default y
+	depends on SYSLOGD
+	help
+	  Supports restricted syslogd config. See docs/syslog.conf.txt
+
+config FEATURE_SYSLOGD_READ_BUFFER_SIZE
+	int "Read buffer size in bytes"
+	default 256
+	range 256 20000
+	depends on SYSLOGD
+	help
+	  This option sets the size of the syslog read buffer.
+	  Actual memory usage increases around five times the
+	  change done here.
+
+config FEATURE_IPC_SYSLOG
+	bool "Circular Buffer support"
+	default y
+	depends on SYSLOGD
+	help
+	  When you enable this feature, the syslogd utility will
+	  use a circular buffer to record system log messages.
+	  When the buffer is filled it will continue to overwrite
+	  the oldest messages. This can be very useful for
+	  systems with little or no permanent storage, since
+	  otherwise system logs can eventually fill up your
+	  entire filesystem, which may cause your system to
+	  break badly.
+
+config FEATURE_IPC_SYSLOG_BUFFER_SIZE
+	int "Circular buffer size in Kbytes (minimum 4KB)"
+	default 16
+	range 4 2147483647
+	depends on FEATURE_IPC_SYSLOG
+	help
+	  This option sets the size of the circular buffer
+	  used to record system log messages.
+
+config LOGREAD
+	bool "logread"
+	default y
+	depends on FEATURE_IPC_SYSLOG
+	help
+	  If you enabled Circular Buffer support, you almost
+	  certainly want to enable this feature as well. This
+	  utility will allow you to read the messages that are
+	  stored in the syslogd circular buffer.
+
+config FEATURE_LOGREAD_REDUCED_LOCKING
+	bool "Double buffering"
+	default y
+	depends on LOGREAD
+	help
+	  'logread' ouput to slow serial terminals can have
+	  side effects on syslog because of the semaphore.
+	  This option make logread to double buffer copy
+	  from circular buffer, minimizing semaphore
+	  contention at some minor memory expense.
+
+config KLOGD
+	bool "klogd"
+	default y
+	help
+	  klogd is a utility which intercepts and logs all
+	  messages from the Linux kernel and sends the messages
+	  out to the 'syslogd' utility so they can be logged. If
+	  you wish to record the messages produced by the kernel,
+	  you should enable this option.
+
+config FEATURE_KLOGD_KLOGCTL
+	bool "Use the klogctl() interface"
+	default y
+	depends on KLOGD
+	select PLATFORM_LINUX
+	help
+	  The klogd applet supports two interfaces for reading
+	  kernel messages. Linux provides the klogctl() interface
+	  which allows reading messages from the kernel ring buffer
+	  independently from the file system.
+
+	  If you answer 'N' here, klogd will use the more portable
+	  approach of reading them from /proc or a device node.
+	  However, this method requires the file to be available.
+
+	  If in doubt, say 'Y'.
+
+config LOGGER
+	bool "logger"
+	default y
+	select FEATURE_SYSLOG
+	help
+	    The logger utility allows you to send arbitrary text
+	    messages to the system log (i.e. the 'syslogd' utility) so
+	    they can be logged. This is generally used to help locate
+	    problems that occur within programs and scripts.
+
+endmenu
-- 
1.6.4.1
