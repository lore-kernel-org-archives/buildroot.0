From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 23 Dec 2018 17:04:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/gettext-tiny: Add new package
In-Reply-To: <20181223150448.21980-1-vadim4j@gmail.com>
References: <20181223150448.21980-1-vadim4j@gmail.com>
Message-ID: <20181223150448.21980-3-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Add gettext-tiny package from the sabotage-linux project:

gettext-tiny provides lightweight replacements for tools typically used
from the GNU gettext suite, which is incredibly bloated and takes a lot
of time to build (in the order of an hour on slow devices). the most
notable component is msgfmt which is used to create binary translation
files in the .mo format out of textual input files in .po format. this
is the most important tool for building software from source, because it
is used from the build processes of many software packages.

Some files were taken from built gettext gnu (po/* and gettextize) to
make possible perform gettextizing of packages. They will be removed
once they will be added to the gettext-tiny project.

Allow to select it to be as gettext gnu alternative for the host &
target builds.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS                                         |    3 +
 ...-format-not-a-string-literal-error-for-gc.patch |   51 +
 ...l-Use-gettext-wrappers-if-NLS-is-disabled.patch |   26 +
 package/gettext-tiny/files/ABOUT-NLS               | 1379 ++++++++++++++++++++
 package/gettext-tiny/files/gettextize              | 1346 +++++++++++++++++++
 package/gettext-tiny/files/po/Makefile.in.in       |  483 +++++++
 package/gettext-tiny/files/po/Makevars.template    |   78 ++
 package/gettext-tiny/files/po/Rules-quot           |   58 +
 package/gettext-tiny/files/po/boldquot.sed         |   10 +
 package/gettext-tiny/files/po/en at boldquot.header   |   25 +
 package/gettext-tiny/files/po/en at quot.header       |   22 +
 package/gettext-tiny/files/po/insert-header.sin    |   23 +
 package/gettext-tiny/files/po/quot.sed             |    6 +
 package/gettext-tiny/files/po/remove-potcdate.sin  |   19 +
 package/gettext-tiny/gettext-tiny.hash             |    2 +
 package/gettext-tiny/gettext-tiny.mk               |   84 ++
 package/gettext/Config.in                          |   20 +-
 17 files changed, 3633 insertions(+), 2 deletions(-)
 create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
 create mode 100644 package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch
 create mode 100644 package/gettext-tiny/files/ABOUT-NLS
 create mode 100644 package/gettext-tiny/files/gettextize
 create mode 100644 package/gettext-tiny/files/po/Makefile.in.in
 create mode 100644 package/gettext-tiny/files/po/Makevars.template
 create mode 100644 package/gettext-tiny/files/po/Rules-quot
 create mode 100644 package/gettext-tiny/files/po/boldquot.sed
 create mode 100644 package/gettext-tiny/files/po/en at boldquot.header
 create mode 100644 package/gettext-tiny/files/po/en at quot.header
 create mode 100644 package/gettext-tiny/files/po/insert-header.sin
 create mode 100644 package/gettext-tiny/files/po/quot.sed
 create mode 100644 package/gettext-tiny/files/po/remove-potcdate.sin
 create mode 100644 package/gettext-tiny/gettext-tiny.hash
 create mode 100644 package/gettext-tiny/gettext-tiny.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d58ea9014..282844bab4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2141,6 +2141,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Vadim Kochan <vadim4j@gmail.com>
+F:	package/gettext-tiny/
+
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
diff --git a/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
new file mode 100644
index 0000000000..57a7f3dd53
--- /dev/null
+++ b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
@@ -0,0 +1,51 @@
+From 9483ad60f8a39d2e8173add070ecb9839a54d140 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim.kochan@petcube.com>
+Date: Sun, 21 Oct 2018 11:16:14 +0300
+Subject: [PATCH] libintl: Add 'format_arg' attribute
+
+Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
+---
+ include/libintl.h | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index b7123a9..173b3f3 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -1,12 +1,27 @@
+ #ifndef LIBINTL_H
+ #define LIBINTL_H
+ 
+-char *gettext(const char *msgid);
+-char *dgettext(const char *domainname, const char *msgid);
+-char *dcgettext(const char *domainname, const char *msgid, int category);
+-char *ngettext(const char *msgid1, const char *msgid2, unsigned long n);
+-char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n);
+-char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category);
++/* _INTL_MAY_RETURN_STRING_ARG(n) declares that the given function may return
++ *    its n-th argument literally.  This enables GCC to warn for example about
++ *       printf (gettext ("foo %y")).  */
++#if defined __GNUC__ && __GNUC__ >= 3 && !(defined __APPLE_CC__ && __APPLE_CC__ > 1 && defined __cplusplus)
++# define _INTL_MAY_RETURN_STRING_ARG(n) __attribute__ ((__format_arg__ (n)))
++#else
++# define _INTL_MAY_RETURN_STRING_ARG(n)
++#endif
++
++char *gettext(const char *msgid)
++	_INTL_MAY_RETURN_STRING_ARG(1);
++char *dgettext(const char *domainname, const char *msgid)
++	_INTL_MAY_RETURN_STRING_ARG(2);
++char *dcgettext(const char *domainname, const char *msgid, int category)
++	_INTL_MAY_RETURN_STRING_ARG(2);
++char *ngettext(const char *msgid1, const char *msgid2, unsigned long n)
++	_INTL_MAY_RETURN_STRING_ARG(1) _INTL_MAY_RETURN_STRING_ARG(2);
++char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n)
++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
++char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category)
++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
+ 
+ char *textdomain(const char *domainname);
+ char *bind_textdomain_codeset(const char *domainname, const char *codeset);
+-- 
+2.14.1
+
diff --git a/package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch b/package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch
new file mode 100644
index 0000000000..a6a4fcb892
--- /dev/null
+++ b/package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch
@@ -0,0 +1,26 @@
+From 8d6897b7b9df3dc8228fcdab42bcb9a915b64cef Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim.kochan@petcube.com>
+Date: Sun, 21 Oct 2018 19:00:03 +0300
+Subject: [PATCH] libintl: Use gettext wrappers if NLS is disabled
+
+Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
+---
+ include/libintl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index 173b3f3..73384fa 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -30,7 +30,7 @@ char *bindtextdomain(const char *domainname, const char *dirname);
+ #undef gettext_noop
+ #define gettext_noop(X) X
+ 
+-#ifndef LIBINTL_NO_MACROS
++#if !ENABLE_NLS
+ /* if these macros are defined, configure checks will detect libintl as
+  * built into the libc because test programs will work without -lintl.
+  * for example:
+-- 
+2.14.1
+
diff --git a/package/gettext-tiny/files/ABOUT-NLS b/package/gettext-tiny/files/ABOUT-NLS
new file mode 100644
index 0000000000..3cc828658c
--- /dev/null
+++ b/package/gettext-tiny/files/ABOUT-NLS
@@ -0,0 +1,1379 @@
+1 Notes on the Free Translation Project
+***************************************
+
+Free software is going international!  The Free Translation Project is a
+way to get maintainers of free software, translators, and users all
+together, so that free software will gradually become able to speak many
+languages.  A few packages already provide translations for their
+messages.
+
+   If you found this 'ABOUT-NLS' file inside a distribution, you may
+assume that the distributed package does use GNU 'gettext' internally,
+itself available at your nearest GNU archive site.  But you do _not_
+need to install GNU 'gettext' prior to configuring, installing or using
+this package with messages translated.
+
+   Installers will find here some useful hints.  These notes also
+explain how users should proceed for getting the programs to use the
+available translations.  They tell how people wanting to contribute and
+work on translations can contact the appropriate team.
+
+1.1 INSTALL Matters
+===================
+
+Some packages are "localizable" when properly installed; the programs
+they contain can be made to speak your own native language.  Most such
+packages use GNU 'gettext'.  Other packages have their own ways to
+internationalization, predating GNU 'gettext'.
+
+   By default, this package will be installed to allow translation of
+messages.  It will automatically detect whether the system already
+provides the GNU 'gettext' functions.  Installers may use special
+options at configuration time for changing the default behaviour.  The
+command:
+
+     ./configure --disable-nls
+
+will _totally_ disable translation of messages.
+
+   When you already have GNU 'gettext' installed on your system and run
+configure without an option for your new package, 'configure' will
+probably detect the previously built and installed 'libintl' library and
+will decide to use it.  If not, you may have to to use the
+'--with-libintl-prefix' option to tell 'configure' where to look for it.
+
+   Internationalized packages usually have many 'po/LL.po' files, where
+LL gives an ISO 639 two-letter code identifying the language.  Unless
+translations have been forbidden at 'configure' time by using the
+'--disable-nls' switch, all available translations are installed
+together with the package.  However, the environment variable 'LINGUAS'
+may be set, prior to configuration, to limit the installed set.
+'LINGUAS' should then contain a space separated list of two-letter
+codes, stating which languages are allowed.
+
+1.2 Using This Package
+======================
+
+As a user, if your language has been installed for this package, you
+only have to set the 'LANG' environment variable to the appropriate
+'LL_CC' combination.  If you happen to have the 'LC_ALL' or some other
+'LC_xxx' environment variables set, you should unset them before setting
+'LANG', otherwise the setting of 'LANG' will not have the desired
+effect.  Here 'LL' is an ISO 639 two-letter language code, and 'CC' is
+an ISO 3166 two-letter country code.  For example, let's suppose that
+you speak German and live in Germany.  At the shell prompt, merely
+execute 'setenv LANG de_DE' (in 'csh'), 'export LANG; LANG=de_DE' (in
+'sh') or 'export LANG=de_DE' (in 'bash').  This can be done from your
+'.login' or '.profile' file, once and for all.
+
+   You might think that the country code specification is redundant.
+But in fact, some languages have dialects in different countries.  For
+example, 'de_AT' is used for Austria, and 'pt_BR' for Brazil.  The
+country code serves to distinguish the dialects.
+
+   The locale naming convention of 'LL_CC', with 'LL' denoting the
+language and 'CC' denoting the country, is the one use on systems based
+on GNU libc.  On other systems, some variations of this scheme are used,
+such as 'LL' or 'LL_CC.ENCODING'.  You can get the list of locales
+supported by your system for your language by running the command
+'locale -a | grep '^LL''.
+
+   Not all programs have translations for all languages.  By default, an
+English message is shown in place of a nonexistent translation.  If you
+understand other languages, you can set up a priority list of languages.
+This is done through a different environment variable, called
+'LANGUAGE'.  GNU 'gettext' gives preference to 'LANGUAGE' over 'LANG'
+for the purpose of message handling, but you still need to have 'LANG'
+set to the primary language; this is required by other parts of the
+system libraries.  For example, some Swedish users who would rather read
+translations in German than English for when Swedish is not available,
+set 'LANGUAGE' to 'sv:de' while leaving 'LANG' to 'sv_SE'.
+
+   Special advice for Norwegian users: The language code for Norwegian
+bokma*l changed from 'no' to 'nb' recently (in 2003).  During the
+transition period, while some message catalogs for this language are
+installed under 'nb' and some older ones under 'no', it's recommended
+for Norwegian users to set 'LANGUAGE' to 'nb:no' so that both newer and
+older translations are used.
+
+   In the 'LANGUAGE' environment variable, but not in the 'LANG'
+environment variable, 'LL_CC' combinations can be abbreviated as 'LL' to
+denote the language's main dialect.  For example, 'de' is equivalent to
+'de_DE' (German as spoken in Germany), and 'pt' to 'pt_PT' (Portuguese
+as spoken in Portugal) in this context.
+
+1.3 Translating Teams
+=====================
+
+For the Free Translation Project to be a success, we need interested
+people who like their own language and write it well, and who are also
+able to synergize with other translators speaking the same language.
+Each translation team has its own mailing list.  The up-to-date list of
+teams can be found at the Free Translation Project's homepage,
+'http://translationproject.org/', in the "Teams" area.
+
+   If you'd like to volunteer to _work_ at translating messages, you
+should become a member of the translating team for your own language.
+The subscribing address is _not_ the same as the list itself, it has
+'-request' appended.  For example, speakers of Swedish can send a
+message to 'sv-request at li.org', having this message body:
+
+     subscribe
+
+   Keep in mind that team members are expected to participate _actively_
+in translations, or at solving translational difficulties, rather than
+merely lurking around.  If your team does not exist yet and you want to
+start one, or if you are unsure about what to do or how to get started,
+please write to 'coordinator at translationproject.org' to reach the
+coordinator for all translator teams.
+
+   The English team is special.  It works at improving and uniformizing
+the terminology in use.  Proven linguistic skills are praised more than
+programming skills, here.
+
+1.4 Available Packages
+======================
+
+Languages are not equally supported in all packages.  The following
+matrix shows the current state of internationalization, as of Jun 2014.
+The matrix shows, in regard of each package, for which languages PO
+files have been submitted to translation coordination, with a
+translation percentage of at least 50%.
+
+     Ready PO files       af am an ar as ast az be bg bn bn_IN bs ca crh cs
+                        +---------------------------------------------------+
+     a2ps               |                       []                []     [] |
+     aegis              |                                                   |
+     anubis             |                                                   |
+     aspell             |                []                       []     [] |
+     bash               |                          []             []     [] |
+     bfd                |                                                   |
+     binutils           |                                         []        |
+     bison              |                                                   |
+     bison-runtime      |                []                                 |
+     buzztrax           |                                                [] |
+     ccd2cue            |                                                   |
+     ccide              |                                                   |
+     cflow              |                                                   |
+     clisp              |                                                   |
+     coreutils          |                                         []     [] |
+     cpio               |                                                   |
+     cppi               |                                                   |
+     cpplib             |                                         []        |
+     cryptsetup         |                                                [] |
+     datamash           |                                                   |
+     denemo             |                                         []     [] |
+     dfarc              |                                         []        |
+     dialog             |       []                                []     [] |
+     dico               |                                                   |
+     diffutils          |                                                [] |
+     dink               |                                         []        |
+     direvent           |                                                   |
+     doodle             |                                                [] |
+     dos2unix           |                                                   |
+     dos2unix-man       |                                                   |
+     e2fsprogs          |                                         []     [] |
+     enscript           |                                         []        |
+     exif               |                                                [] |
+     fetchmail          |                                         []     [] |
+     findutils          |                                                [] |
+     flex               |                                         []        |
+     freedink           |                                         []     [] |
+     fusionforge        |                                                   |
+     gas                |                                                   |
+     gawk               |                                         []        |
+     gcal               |                                         []        |
+     gcc                |                                                   |
+     gdbm               |                                                   |
+     gettext-examples   | []             []        []             []     [] |
+     gettext-runtime    |                          []             []     [] |
+     gettext-tools      |                          []             []        |
+     gjay               |                                                   |
+     glunarclock        |                []        []                    [] |
+     gnubiff            |                                                [] |
+     gnubik             |          []                                       |
+     gnucash            |          ()              ()             []        |
+     gnuchess           |                                                   |
+     gnulib             |                                                [] |
+     gnunet             |                                                   |
+     gnunet-gtk         |                                                   |
+     gold               |                                                   |
+     gphoto2            |                                                [] |
+     gprof              |                          []                       |
+     gramadoir          |                                                   |
+     grep               |                          []             []     [] |
+     grub               |                                         []        |
+     gsasl              |                                                   |
+     gss                |                                                   |
+     gst-plugins-bad    |                          []                    [] |
+     gst-plugins-base   |                          []             []     [] |
+     gst-plugins-good   |                          []             []     [] |
+     gst-plugins-ugly   |                          []             []     [] |
+     gstreamer          |                []        []             []     [] |
+     gtick              |                                                [] |
+     gtkam              |                       []                       [] |
+     gtkspell           | []             []     []                []     [] |
+     guix               |                                                   |
+     guix-packages      |                                                   |
+     gutenprint         |                                         []        |
+     hello              |                                         []        |
+     help2man           |                                                   |
+     help2man-texi      |                                                   |
+     hylafax            |                                                   |
+     idutils            |                                                   |
+     iso_15924          |                                                [] |
+     iso_3166           | []          []        [] [] []  []   [] [] []  [] |
+     iso_3166_2         |                                                   |
+     iso_4217           |                                                [] |
+     iso_639            |             [] []     [] [] []  []      [] []  [] |
+     iso_639_3          |                []                          []     |
+     iso_639_5          |                                                   |
+     jwhois             |                                                   |
+     kbd                |                                                [] |
+     klavaro            |          []              [] []          []     [] |
+     ld                 |                          []                       |
+     leafpad            |                       [] []             []     [] |
+     libc               |                          []             []     [] |
+     libexif            |                       ()                          |
+     libextractor       |                                                   |
+     libgnutls          |                                                [] |
+     libgphoto2         |                                                [] |
+     libgphoto2_port    |                                                [] |
+     libgsasl           |                                                   |
+     libiconv           |                          []                    [] |
+     libidn             |                                                [] |
+     liferea            |          []    []                       []     [] |
+     lilypond           |                                         []     [] |
+     lordsawar          |                                         []        |
+     lprng              |                                                   |
+     lynx               |                                         []     [] |
+     m4                 |                                                [] |
+     mailfromd          |                                                   |
+     mailutils          |                                                   |
+     make               |                                                [] |
+     man-db             |                                         []     [] |
+     man-db-manpages    |                                                   |
+     midi-instruments   |          []                             []     [] |
+     minicom            |                                                [] |
+     mkisofs            |                                                [] |
+     myserver           |                                                [] |
+     nano               |                          []             []     [] |
+     opcodes            |                                                   |
+     parted             |                                                [] |
+     pies               |                                                   |
+     pnmixer            |                                                   |
+     popt               |                                                [] |
+     procps-ng          |                                                   |
+     procps-ng-man      |                                                   |
+     psmisc             |                                                [] |
+     pspp               |                                         []        |
+     pushover           |                                                [] |
+     pwdutils           |                                                   |
+     pyspread           |                                                   |
+     radius             |                                         []        |
+     recode             |                       []                []     [] |
+     recutils           |                                                   |
+     rpm                |                                                   |
+     rush               |                                                   |
+     sarg               |                                                   |
+     sed                |                []        []             []     [] |
+     sharutils          |                                                [] |
+     shishi             |                                                   |
+     skribilo           |                                                   |
+     solfege            |                                         []     [] |
+     solfege-manual     |                                                   |
+     spotmachine        |                                                   |
+     sudo               |                                         []     [] |
+     sudoers            |                                         []     [] |
+     sysstat            |                                                [] |
+     tar                |                          []             []     [] |
+     texinfo            |                                         []     [] |
+     texinfo_document   |                                         []     [] |
+     tigervnc           |                          []                       |
+     tin                |                                                   |
+     tin-man            |                                                   |
+     tracgoogleappsa... |                                                   |
+     trader             |                                                   |
+     util-linux         |                                                [] |
+     ve                 |                                                   |
+     vice               |                                                   |
+     vmm                |                                                   |
+     vorbis-tools       |                                                [] |
+     wastesedge         |                                                   |
+     wcd                |                                                   |
+     wcd-man            |                                                   |
+     wdiff              |                                         []     [] |
+     wget               |                                                [] |
+     wyslij-po          |                                                   |
+     xboard             |                                                   |
+     xdg-user-dirs      | []    []    [] []     [] []     []      [] []  [] |
+     xkeyboard-config   |                          []             []     [] |
+                        +---------------------------------------------------+
+                          af am an ar as ast az be bg bn bn_IN bs ca crh cs
+                           4  0  2  5  3 11   0  8 25  3   3    1 55  4  74
+
+                          da  de  el en en_GB en_ZA eo es et eu fa fi  fr 
+                        +--------------------------------------------------+
+     a2ps               | []  []  []     []         [] [] []       []  []  |
+     aegis              | []  []                       []              []  |
+     anubis             | []  []                       []          []  []  |
+     aspell             | []  []         []         [] []          []  []  |
+     bash               |                           [] []              []  |
+     bfd                | []                           []          []  []  |
+     binutils           |                              []          []  []  |
+     bison              | []  []  []                [] [] []       []  []  |
+     bison-runtime      | []  []  []                [] [] []       []  []  |
+     buzztrax           | []  []                                   []  []  |
+     ccd2cue            | []  []                    []                 []  |
+     ccide              | []  []                    [] []          []  []  |
+     cflow              | []  []                    []             []  []  |
+     clisp              | []  []     []                []              []  |
+     coreutils          | []  []                       [] []           []  |
+     cpio               | []  []                       []          []  []  |
+     cppi               | []  []                    []             []  []  |
+     cpplib             | []  []                    [] []          []  []  |
+     cryptsetup         | []  []                       []          []  []  |
+     datamash           | []  []                    []                 []  |
+     denemo             | []                                               |
+     dfarc              | []  []                    [] []          []  []  |
+     dialog             | []  []  []                [] []    [] [] []  []  |
+     dico               | []  []                                   []  []  |
+     diffutils          | []  []  []                [] []              []  |
+     dink               | []  []                    [] []          []  []  |
+     direvent           | []  []                    []                 []  |
+     doodle             | []  []                    []             []      |
+     dos2unix           | []  []                    [] []              []  |
+     dos2unix-man       |     []                       []              []  |
+     e2fsprogs          | []  []                    [] []              []  |
+     enscript           | []  []         []         []             []  []  |
+     exif               | []  []                    [] []          []  []  |
+     fetchmail          | []  ()  []     []         [] []              []  |
+     findutils          | []  []  []                [] [] []       []  []  |
+     flex               | []  []                    [] []          []  []  |
+     freedink           | []  []  []                [] []    []    []  []  |
+     fusionforge        |     []                       []              []  |
+     gas                |                              []          []  []  |
+     gawk               | []  []                       []          []  []  |
+     gcal               | []  []                       []              []  |
+     gcc                |     []                                           |
+     gdbm               | []  []                    []             []  []  |
+     gettext-examples   | []  []  []                [] []          []  []  |
+     gettext-runtime    | []  []                    [] []          []  []  |
+     gettext-tools      | []  []                       []          []  []  |
+     gjay               |     []                    []             []  []  |
+     glunarclock        | []  []                    []             []  []  |
+     gnubiff            |     ()                    []             []  ()  |
+     gnubik             | []  []                    []             []  []  |
+     gnucash            | []  ()  ()     ()            ()          ()  ()  |
+     gnuchess           |     []                    [] []              []  |
+     gnulib             | []  []                    [] [] []       []  []  |
+     gnunet             |                              []                  |
+     gnunet-gtk         |     []                                           |
+     gold               |                              []          []  []  |
+     gphoto2            | []  ()                    []                 []  |
+     gprof              | []  []                    [] []          []  []  |
+     gramadoir          | []  []                    []             []  []  |
+     grep               | []  []                    [] [] []       []  []  |
+     grub               | []  []                       []          []  []  |
+     gsasl              | []  []                    []             []  []  |
+     gss                | []  []                    []             []  []  |
+     gst-plugins-bad    | []  []                                       []  |
+     gst-plugins-base   | []  []  []                   []          []  []  |
+     gst-plugins-good   | []  []  []                   []    []    []  []  |
+     gst-plugins-ugly   | []  []  []                [] []    []    []  []  |
+     gstreamer          | []  []  []                   []    []    []  []  |
+     gtick              | []  ()                    []             []  []  |
+     gtkam              | []  ()                    [] []          []  []  |
+     gtkspell           | []  []  []                [] []    []    []  []  |
+     guix               | []                        []                     |
+     guix-packages      |                                                  |
+     gutenprint         | []  []                                   []  []  |
+     hello              | []  []  []                [] [] []       []  []  |
+     help2man           | []  []  []                [] []          []  []  |
+     help2man-texi      |     []                       []              []  |
+     hylafax            |     []                       []                  |
+     idutils            | []  []                    []             []  []  |
+     iso_15924          | []  ()                    [] []    ()    []  ()  |
+     iso_3166           | []  ()  []                [] [] [] ()    []  ()  |
+     iso_3166_2         | []  ()                             ()        ()  |
+     iso_4217           | []  ()  []                   [] [] ()    []  ()  |
+     iso_639            | []  ()                    [] []    ()    []  ()  |
+     iso_639_3          |     ()                             ()        ()  |
+     iso_639_5          |     ()                             ()        ()  |
+     jwhois             |     []                    [] []          []  []  |
+     kbd                | []  []  []                [] []              []  |
+     klavaro            | []  []  []                [] []    []        []  |
+     ld                 | []                           []          []  []  |
+     leafpad            | []  []  []                [] []    []    []  []  |
+     libc               | []  []                       []          []  []  |
+     libexif            | []  []         ()            []              []  |
+     libextractor       |     []                                           |
+     libgnutls          |     []                    []             []  []  |
+     libgphoto2         | []  ()                                       []  |
+     libgphoto2_port    | []  ()                       []    []    []  []  |
+     libgsasl           | []  []                    []             []  []  |
+     libiconv           | []  []                    [] [] []       []  []  |
+     libidn             | []  []                    []             []  []  |
+     liferea            | []  ()  []                   []    []    []  []  |
+     lilypond           | []  []  []                [] []              []  |
+     lordsawar          | []  []                                           |
+     lprng              |                                                  |
+     lynx               | []  []                    []    []       []  []  |
+     m4                 | []  []  []                []             []  []  |
+     mailfromd          |                                              []  |
+     mailutils          |     []                       []          []  []  |
+     make               | []  []                       []          []  []  |
+     man-db             | []  []                    []                 []  |
+     man-db-manpages    |     []                                       []  |
+     midi-instruments   | []  []  []                [] [] []    [] []  []  |
+     minicom            | []  []                       []          []  []  |
+     mkisofs            |                           []             []  []  |
+     myserver           |     []                    []             []  []  |
+     nano               | []  []                    [] []    []    []  []  |
+     opcodes            | []  []                       []          []  []  |
+     parted             | []  []                                       []  |
+     pies               |     []                                           |
+     pnmixer            |     []                                       []  |
+     popt               | []  []                    [] []          []  []  |
+     procps-ng          |     []                                       []  |
+     procps-ng-man      |     []                                       []  |
+     psmisc             | []  []  []                []       []    []  []  |
+     pspp               |     []                       []              []  |
+     pushover           |     ()                    [] []              []  |
+     pwdutils           | []  []                                       []  |
+     pyspread           | []  []                                       []  |
+     radius             |                              []              []  |
+     recode             | []  []  []                [] []          []  []  |
+     recutils           |     []                       []          []  []  |
+     rpm                | []  []                    []             []  []  |
+     rush               |     []                                   []  []  |
+     sarg               | []                                           []  |
+     sed                | []  []  []                [] [] []       []  []  |
+     sharutils          |     []                    []    []           []  |
+     shishi             |     []                                   []  []  |
+     skribilo           | []                           []              []  |
+     solfege            | []  []                    [] [] []    [] []  []  |
+     solfege-manual     |     []                    [] [] []           []  |
+     spotmachine        | []  []                    []             []  []  |
+     sudo               | []  []                    [] []          []  []  |
+     sudoers            | []  []  []                []             []  []  |
+     sysstat            | []  []                    [] []          []  []  |
+     tar                | []  []                    [] [] []       []  []  |
+     texinfo            | []  []                    [] []              []  |
+     texinfo_document   |     []                    [] []              []  |
+     tigervnc           | []  []  []                []             []  []  |
+     tin                | []  []                          []           []  |
+     tin-man            |                []                                |
+     tracgoogleappsa... | []  []                    []             []  []  |
+     trader             | []  []         []         []             []  []  |
+     util-linux         | []  []                       []              []  |
+     ve                 |     []                    [] []          []  []  |
+     vice               | ()  ()                                       ()  |
+     vmm                |     []                                   []      |
+     vorbis-tools       | []  []                    []                 []  |
+     wastesedge         | []                                               |
+     wcd                |     []                    [] []          []      |
+     wcd-man            |     []                                           |
+     wdiff              | []  []                    [] [] []       []  []  |
+     wget               |     []                    [] [] []       []  []  |
+     wyslij-po          |     []                    []             []  []  |
+     xboard             | []  []                       []              []  |
+     xdg-user-dirs      | []  []  []                [] [] [] [] [] []  []  |
+     xkeyboard-config   | []  []  []                [] []          []  []  |
+                        +--------------------------------------------------+
+                          da  de  el en en_GB en_ZA eo es et eu fa fi  fr 
+                          119 131 32  1   6     0   94 95 22 13  4 102 139
+
+                          ga gd gl gu he hi hr hu hy ia id is it ja ka kk
+                        +-------------------------------------------------+
+     a2ps               |                   []          []    [] []       |
+     aegis              |                                     []          |
+     anubis             |                   [] []       []    []          |
+     aspell             | []                []          []    [] []       |
+     bash               |                      []       []    [] []       |
+     bfd                |                               []       []       |
+     binutils           |                               []    [] []       |
+     bison              |                   []                            |
+     bison-runtime      | []    []          [] []    [] []    [] []       |
+     buzztrax           |                                                 |
+     ccd2cue            |                      []                         |
+     ccide              |                   [] []                         |
+     cflow              | []                []          []                |
+     clisp              |                                                 |
+     coreutils          |                      []                []       |
+     cpio               | []                [] []       []    [] []       |
+     cppi               |       []          [] []             [] []       |
+     cpplib             |                               []       []       |
+     cryptsetup         |                                     []          |
+     datamash           |                                                 |
+     denemo             |                                     []          |
+     dfarc              |                   [] []             []          |
+     dialog             | [] [] []          [] []    [] [] [] [] []       |
+     dico               |                                                 |
+     diffutils          |                      []       []    [] []       |
+     dink               |                      []                         |
+     direvent           |                      []                         |
+     doodle             | []                                  []          |
+     dos2unix           |                      []                []       |
+     dos2unix-man       |                                                 |
+     e2fsprogs          |                      []       []                |
+     enscript           | []                []          []                |
+     exif               |       []          []          [] [] [] []       |
+     fetchmail          |                               []    [] []       |
+     findutils          | []    []          [] []       []    [] []       |
+     flex               | []                                              |
+     freedink           |                   [] []       []    []          |
+     fusionforge        |                                                 |
+     gas                |                               []                |
+     gawk               |                               []    () []       |
+     gcal               |                                                 |
+     gcc                |                                                 |
+     gdbm               |                                                 |
+     gettext-examples   | []    []          [] []       []    [] []       |
+     gettext-runtime    | []    []          [] []       []    [] []       |
+     gettext-tools      |                               []    [] []       |
+     gjay               |       []                                        |
+     glunarclock        | []    []          [] []       []    []          |
+     gnubiff            |                      []       []    ()          |
+     gnubik             |       []          []                []          |
+     gnucash            |          () () ()    ()             ()          |
+     gnuchess           |                                                 |
+     gnulib             | []    []             []             [] []       |
+     gnunet             |                                                 |
+     gnunet-gtk         |                                                 |
+     gold               |                               []    []          |
+     gphoto2            |                      []       []    [] []       |
+     gprof              | []                   []       []    []          |
+     gramadoir          | []                   []       []                |
+     grep               | []    []          [] []       []    [] []       |
+     grub               |       []             []             []          |
+     gsasl              | []                [] []       []    []          |
+     gss                | []                [] []       []    []          |
+     gst-plugins-bad    |                   [] []       []                |
+     gst-plugins-base   |       []          [] []       []                |
+     gst-plugins-good   |       []          [] []       []    [] []       |
+     gst-plugins-ugly   |       []          [] []       []    [] []       |
+     gstreamer          |       []          [] []       []    []          |
+     gtick              | []    []             []       []    []          |
+     gtkam              |                      []       [] [] [] []       |
+     gtkspell           | []    []    []    [] [] []    [] [] [] []       |
+     guix               |                                                 |
+     guix-packages      |                                                 |
+     gutenprint         |       []             []             []          |
+     hello              | []    []          [] []       []                |
+     help2man           |                   []                [] []       |
+     help2man-texi      |                                                 |
+     hylafax            |                               []                |
+     idutils            |                      []       []                |
+     iso_15924          |       []             []    [] [] [] []          |
+     iso_3166           | []    [] [] [] [] [] []    [] [] [] [] []    [] |
+     iso_3166_2         |                               []    []          |
+     iso_4217           |                   [] []       [] [] [] []       |
+     iso_639            | []    [] []       [] []       [] [] [] []       |
+     iso_639_3          |       []                            []          |
+     iso_639_5          |                                                 |
+     jwhois             |       []             []       []    []          |
+     kbd                |                      []       []    []          |
+     klavaro            |       []          [] []             []       [] |
+     ld                 | []                            []    [] []       |
+     leafpad            | []    []    []    [] []       []    [] ()       |
+     libc               |       []          []          []    [] []       |
+     libexif            |                                     []          |
+     libextractor       |                                                 |
+     libgnutls          |                                     []          |
+     libgphoto2         |                                     [] []       |
+     libgphoto2_port    |                                     [] []       |
+     libgsasl           | []                   []       []    []          |
+     libiconv           | []    []          [] []       []    [] []       |
+     libidn             |                   [] []       []    []          |
+     liferea            |       []    []       []             [] []       |
+     lilypond           |                                     []          |
+     lordsawar          |                                                 |
+     lprng              |                               []                |
+     lynx               |                      []       []    [] []       |
+     m4                 | []    []          []          []       []       |
+     mailfromd          |                                                 |
+     mailutils          |                                                 |
+     make               |                   []          []    [] []       |
+     man-db             |                               []       []       |
+     man-db-manpages    |                               []       []       |
+     midi-instruments   |       []    []    [] [] []    [] [] [] []       |
+     minicom            |                      []       []       []       |
+     mkisofs            |                               []    []          |
+     myserver           |                                     []          |
+     nano               | []    []          [] []             [] []       |
+     opcodes            | []                            []    []          |
+     parted             |       []             []       []    [] []       |
+     pies               |                                                 |
+     pnmixer            |                   []                []          |
+     popt               | []    [] []       [] []    [] [] [] [] []       |
+     procps-ng          |                                                 |
+     procps-ng-man      |                                                 |
+     psmisc             |                   [] []       []    []          |
+     pspp               |       []                               []       |
+     pushover           |                                     []          |
+     pwdutils           |                               []                |
+     pyspread           |                                                 |
+     radius             |                               []                |
+     recode             | []    []    []    [] []       []    []          |
+     recutils           |                                                 |
+     rpm                |                               []                |
+     rush               |       []                                        |
+     sarg               |                                                 |
+     sed                | []    []          [] []       []    [] []       |
+     sharutils          |                                                 |
+     shishi             |                                                 |
+     skribilo           |                      []                         |
+     solfege            |       []                            []          |
+     solfege-manual     |                                                 |
+     spotmachine        |                                                 |
+     sudo               |       []          []                [] []       |
+     sudoers            |                   []                [] []       |
+     sysstat            |                   [] []       []       []       |
+     tar                | []                [] []       []    [] []       |
+     texinfo            |                   []          []    []          |
+     texinfo_document   |                   [] []             []          |
+     tigervnc           |                                                 |
+     tin                |                                                 |
+     tin-man            |                                                 |
+     tracgoogleappsa... |       []    []    [] []                         |
+     trader             |                   [] []                         |
+     util-linux         |                                        []       |
+     ve                 |                                     []          |
+     vice               |                      ()             ()          |
+     vmm                |                                                 |
+     vorbis-tools       |                   []          []                |
+     wastesedge         |                                     []          |
+     wcd                |                                                 |
+     wcd-man            |                                                 |
+     wdiff              |       []             []             []          |
+     wget               |                   [] []             [] []       |
+     wyslij-po          |       []          []          []                |
+     xboard             |                                                 |
+     xdg-user-dirs      | [] [] [] [] [] [] [] []    [] [] [] [] []    [] |
+     xkeyboard-config   |       []          [] []       []    [] []       |
+                        +-------------------------------------------------+
+                          ga gd gl gu he hi hr hu hy ia id is it ja ka kk
+                          35  2 47  4  8  2 60 71  2  6 81 11 87 57  0  3
+
+                          kn ko ku ky lg lt lv mk ml mn mr ms mt nb ne nl 
+                        +--------------------------------------------------+
+     a2ps               |                                  []          []  |
+     aegis              |                                              []  |
+     anubis             |                                  []    []    []  |
+     aspell             |                            []                []  |
+     bash               |                                        []    []  |
+     bfd                |                                                  |
+     binutils           |                                                  |
+     bison              |                                              []  |
+     bison-runtime      |          []    [] []             []    []    []  |
+     buzztrax           |                                                  |
+     ccd2cue            |                                                  |
+     ccide              |                   []                         []  |
+     cflow              |                                              []  |
+     clisp              |                                              []  |
+     coreutils          |                                        []    []  |
+     cpio               |                                              []  |
+     cppi               |                                                  |
+     cpplib             |                                              []  |
+     cryptsetup         |                                              []  |
+     datamash           |                                        []    []  |
+     denemo             |                                                  |
+     dfarc              |                      []                      []  |
+     dialog             |       []       [] []             []    []    []  |
+     dico               |                                                  |
+     diffutils          |                   []                   []    []  |
+     dink               |                                              []  |
+     direvent           |                                              []  |
+     doodle             |                                              []  |
+     dos2unix           |                                        []    []  |
+     dos2unix-man       |                                              []  |
+     e2fsprogs          |                                              []  |
+     enscript           |                                              []  |
+     exif               |    []             []                         []  |
+     fetchmail          |                                              []  |
+     findutils          |                                        []    []  |
+     flex               |                                              []  |
+     freedink           |                                        []    []  |
+     fusionforge        |                                                  |
+     gas                |                                                  |
+     gawk               |                                              []  |
+     gcal               |                                                  |
+     gcc                |                                                  |
+     gdbm               |                                                  |
+     gettext-examples   |          []       []             [] [] []    []  |
+     gettext-runtime    |    []                                  []    []  |
+     gettext-tools      |    []                                            |
+     gjay               |                                                  |
+     glunarclock        |                   []                         []  |
+     gnubiff            |                                              []  |
+     gnubik             |                                        []    []  |
+     gnucash            | () ()          () ()          ()       () () []  |
+     gnuchess           |                                        []    []  |
+     gnulib             |                                              []  |
+     gnunet             |                                                  |
+     gnunet-gtk         |                                                  |
+     gold               |                                                  |
+     gphoto2            |                                              []  |
+     gprof              |                                  []          []  |
+     gramadoir          |                                              []  |
+     grep               |                                        []    []  |
+     grub               |                []                      []    []  |
+     gsasl              |                                              []  |
+     gss                |                                                  |
+     gst-plugins-bad    |                   []                   []    []  |
+     gst-plugins-base   |                   []                   []    []  |
+     gst-plugins-good   |                [] []                   []    []  |
+     gst-plugins-ugly   |                   []             [] [] []    []  |
+     gstreamer          |                []                      []    []  |
+     gtick              |                                              []  |
+     gtkam              |                                        []    []  |
+     gtkspell           |          []    [] []       []    []    []    []  |
+     guix               |                                                  |
+     guix-packages      |                                                  |
+     gutenprint         |                                              []  |
+     hello              |                   []                   []    []  |
+     help2man           |                                        []        |
+     help2man-texi      |                                                  |
+     hylafax            |                                              []  |
+     idutils            |                                              []  |
+     iso_15924          |                () []                         []  |
+     iso_3166           | [] [] []       () [] [] []    []       []    []  |
+     iso_3166_2         |                ()                            []  |
+     iso_4217           |                () []                   []    []  |
+     iso_639            | [] []          () []    []    []             []  |
+     iso_639_3          | []             ()             []                 |
+     iso_639_5          |                ()                                |
+     jwhois             |                   []                         []  |
+     kbd                |                                              []  |
+     klavaro            |                                        []    []  |
+     ld                 |                                                  |
+     leafpad            |    []    []    [] []                         []  |
+     libc               |    []                                        []  |
+     libexif            |                                              []  |
+     libextractor       |                                              []  |
+     libgnutls          |                                  []          []  |
+     libgphoto2         |                                              []  |
+     libgphoto2_port    |                                              []  |
+     libgsasl           |                                              []  |
+     libiconv           |                []                            []  |
+     libidn             |                                              []  |
+     liferea            |                [] []                         []  |
+     lilypond           |                                              []  |
+     lordsawar          |                                                  |
+     lprng              |                                                  |
+     lynx               |                                              []  |
+     m4                 |                                              []  |
+     mailfromd          |                                                  |
+     mailutils          |                                                  |
+     make               |    []                                        []  |
+     man-db             |                                              []  |
+     man-db-manpages    |                                              []  |
+     midi-instruments   |    [] []       []          []    []       [] []  |
+     minicom            |                                        []        |
+     mkisofs            |                                              []  |
+     myserver           |                                                  |
+     nano               |                                  []    []    []  |
+     opcodes            |                                              []  |
+     parted             |    []                                        []  |
+     pies               |                                                  |
+     pnmixer            |                                              []  |
+     popt               | [] []             []                   []    []  |
+     procps-ng          |                                                  |
+     procps-ng-man      |                                                  |
+     psmisc             |                                              []  |
+     pspp               |                []                            []  |
+     pushover           |                                                  |
+     pwdutils           |                                              []  |
+     pyspread           |                                                  |
+     radius             |                                              []  |
+     recode             |                                        []    []  |
+     recutils           |                                              []  |
+     rpm                |                                              []  |
+     rush               |                                              []  |
+     sarg               |                                                  |
+     sed                |                                        []    []  |
+     sharutils          |                                              []  |
+     shishi             |                                                  |
+     skribilo           |                                                  |
+     solfege            |                                        []    []  |
+     solfege-manual     |                                              []  |
+     spotmachine        |                                              []  |
+     sudo               |    []                                  []    []  |
+     sudoers            |    []                                  []    []  |
+     sysstat            |                                        []    []  |
+     tar                |          []                            []    []  |
+     texinfo            |                                              []  |
+     texinfo_document   |                                              []  |
+     tigervnc           |                                              []  |
+     tin                |                                                  |
+     tin-man            |                                                  |
+     tracgoogleappsa... |                   []                   []    []  |
+     trader             |                                        []        |
+     util-linux         |                                              []  |
+     ve                 |                                              []  |
+     vice               |                                              []  |
+     vmm                |                                              []  |
+     vorbis-tools       |                                              []  |
+     wastesedge         |                                              []  |
+     wcd                |                                              []  |
+     wcd-man            |                                              []  |
+     wdiff              |                                              []  |
+     wget               |                                        []    []  |
+     wyslij-po          |                                              []  |
+     xboard             |                                              []  |
+     xdg-user-dirs      | [] [] [] []    [] [] [] []    []       []    []  |
+     xkeyboard-config   |    []          []                            []  |
+                        +--------------------------------------------------+
+                          kn ko ku ky lg lt lv mk ml mn mr ms mt nb ne nl 
+                           5 15  4  6  0 13 23  3  3  3  4 11  2 42  1 125
+
+                          nn or pa pl  ps pt pt_BR ro ru rw sk sl sq sr 
+                        +------------------------------------------------+
+     a2ps               |          []     []  []   [] []       []    []  |
+     aegis              |                     []      []                 |
+     anubis             |          []                 []             []  |
+     aspell             |          []         []   [] []    [] []    []  |
+     bash               |          []         []      []    [] []    []  |
+     bfd                |                             []             []  |
+     binutils           |                             []             []  |
+     bison              |          []         []                     []  |
+     bison-runtime      |          []     []  []   [] []       [] [] []  |
+     buzztrax           |                     []                         |
+     ccd2cue            |                     []                     []  |
+     ccide              |          []                 []             []  |
+     cflow              |          []         []                     []  |
+     clisp              |                             []                 |
+     coreutils          |          []                 []       []    []  |
+     cpio               |          []                 []             []  |
+     cppi               |          []         []                     []  |
+     cpplib             |                     []      []             []  |
+     cryptsetup         |          []         []                     []  |
+     datamash           |                     []                     []  |
+     denemo             |                                                |
+     dfarc              |          []         []                     []  |
+     dialog             |          []         []   [] []    [] []    []  |
+     dico               |          []                                    |
+     diffutils          |          []         []                     []  |
+     dink               |                                                |
+     direvent           |          []         []                     []  |
+     doodle             |                                         [] []  |
+     dos2unix           |          []         []      []             []  |
+     dos2unix-man       |          []         []                         |
+     e2fsprogs          |          []                                    |
+     enscript           |          []         []   [] []       []    []  |
+     exif               |          []         []   [] []    []       []  |
+     fetchmail          |          []                 []          []     |
+     findutils          |          []         []      []    [] []    []  |
+     flex               |          []         []   [] []             []  |
+     freedink           |          []         []      []       []    []  |
+     fusionforge        |                                                |
+     gas                |                                                |
+     gawk               |          []                                    |
+     gcal               |                                                |
+     gcc                |                                                |
+     gdbm               |          []         []                     []  |
+     gettext-examples   |          []     []  []   [] []    [] []    []  |
+     gettext-runtime    | []       []     []  []   [] []    [] []    []  |
+     gettext-tools      |          []         []   [] []    [] []    []  |
+     gjay               |                                            []  |
+     glunarclock        |          []         []   []       [] []    []  |
+     gnubiff            |                                            []  |
+     gnubik             |          []         []               []    []  |
+     gnucash            |          ()     ()  ()   () ()             []  |
+     gnuchess           |                     []                     []  |
+     gnulib             |          []         []      []       []    []  |
+     gnunet             |                                                |
+     gnunet-gtk         |                                                |
+     gold               |                                                |
+     gphoto2            |          []         []   [] []             []  |
+     gprof              |                     []   [] []             []  |
+     gramadoir          |                                   []       []  |
+     grep               |          []         []      []    [] []    []  |
+     grub               |          []         []      []       []    []  |
+     gsasl              |          []                       []       []  |
+     gss                |          []              []       []       []  |
+     gst-plugins-bad    |          []         []      []    []       []  |
+     gst-plugins-base   |          []         []      []    [] []    []  |
+     gst-plugins-good   |          []         []   [] []    [] []    []  |
+     gst-plugins-ugly   |          []         []   [] []    [] []    []  |
+     gstreamer          |          []         []   [] []    [] []    []  |
+     gtick              |          []         []      []    []       []  |
+     gtkam              |       [] []         []      []    []       []  |
+     gtkspell           |          []     []  []   [] []    [] [] [] []  |
+     guix               |                                                |
+     guix-packages      |                                                |
+     gutenprint         |                                   [] []        |
+     hello              |          []         []      []    [] []    []  |
+     help2man           |          []         []      []             []  |
+     help2man-texi      |          []                                    |
+     hylafax            |                                                |
+     idutils            |          []                 []             []  |
+     iso_15924          |          []     ()       [] []       []    []  |
+     iso_3166           | [] [] [] []     ()  []   [] [] [] [] [] [] []  |
+     iso_3166_2         |          []     ()                         []  |
+     iso_4217           | []       []     ()       [] [] []    []    []  |
+     iso_639            |    [] [] []     ()       [] [] [] [] []    []  |
+     iso_639_3          |       []        ()                             |
+     iso_639_5          |                 ()                         []  |
+     jwhois             |          []         []   []                []  |
+     kbd                |          []                 []                 |
+     klavaro            |       [] []         []      []       []        |
+     ld                 |                                                |
+     leafpad            | []       []     []  []      []    [] []    []  |
+     libc               |          []                 []    []           |
+     libexif            |          []         ()            []           |
+     libextractor       |          []                                    |
+     libgnutls          |          []                                    |
+     libgphoto2         |          []                                    |
+     libgphoto2_port    |          []         []      []    []       []  |
+     libgsasl           |          []              []       []       []  |
+     libiconv           |          []         []            [] []    []  |
+     libidn             |          []         []                     []  |
+     liferea            |          []     []  []   [] ()    []    []     |
+     lilypond           |                                                |
+     lordsawar          |                                                |
+     lprng              |          []                                    |
+     lynx               |                     []      []                 |
+     m4                 |          []         []   [] []             []  |
+     mailfromd          |          []                                    |
+     mailutils          |          []                                    |
+     make               |          []         []      []                 |
+     man-db             |          []                 []             []  |
+     man-db-manpages    |          []                 []             []  |
+     midi-instruments   |          []     []  []   [] []    [] []    []  |
+     minicom            |          []         []   [] []                 |
+     mkisofs            |          []                 []             []  |
+     myserver           |                                      []    []  |
+     nano               |          []         []   [] []       []    []  |
+     opcodes            |                                                |
+     parted             |          []         []      []    [] []    []  |
+     pies               |          []                                    |
+     pnmixer            |                             []                 |
+     popt               |          []     []  []      []       []    []  |
+     procps-ng          |          []                                    |
+     procps-ng-man      |          []                                    |
+     psmisc             |          []         []      []             []  |
+     pspp               |          []                 []                 |
+     pushover           |                                                |
+     pwdutils           |          []                                    |
+     pyspread           | []                  []                         |
+     radius             |          []                 []                 |
+     recode             |          []     []  []   [] []    [] []    []  |
+     recutils           |                     []                     []  |
+     rpm                |          []                                    |
+     rush               |          []         []                     []  |
+     sarg               |                     []      []                 |
+     sed                |          []     []  []   [] []    [] []    []  |
+     sharutils          |          []         []                     []  |
+     shishi             |          []                                []  |
+     skribilo           |                                            []  |
+     solfege            |          []         []      []                 |
+     solfege-manual     |          []         []                         |
+     spotmachine        |                     []                     []  |
+     sudo               |          []         []      []    [] []    []  |
+     sudoers            |          []         []               []    []  |
+     sysstat            |          []         []      []    []       []  |
+     tar                |          []         []      []       []    []  |
+     texinfo            |          []         []      []                 |
+     texinfo_document   |          []         []                         |
+     tigervnc           |                     []      []             []  |
+     tin                |                             []                 |
+     tin-man            |                                                |
+     tracgoogleappsa... |          []         []      []             []  |
+     trader             |                             []             []  |
+     util-linux         |          []         []                         |
+     ve                 |          []         []                     []  |
+     vice               |                                                |
+     vmm                |                                                |
+     vorbis-tools       |          []                          []    []  |
+     wastesedge         |                                                |
+     wcd                |                                                |
+     wcd-man            |                                                |
+     wdiff              |          []         []      []       []    []  |
+     wget               |          []         []      []    []       []  |
+     wyslij-po          | []       []         []                     []  |
+     xboard             |          []                 []             []  |
+     xdg-user-dirs      | [] [] [] []  [] []  []   [] []    [] [] [] []  |
+     xkeyboard-config   |          []         []      []       []        |
+                        +------------------------------------------------+
+                          nn or pa pl  ps pt pt_BR ro ru rw sk sl sq sr 
+                           7  3  6 114  1 12  88   32 82  3 40 45  7 101
+
+                          sv  sw ta te tg th tr uk  ur vi  wa wo zh_CN
+                        +----------------------------------------------+
+     a2ps               | []              [] [] []     []              |
+     aegis              |                              []              |
+     anubis             | []                 [] []     []              |
+     aspell             | []                    []     []  []     []   |
+     bash               | []                    []     []         []   |
+     bfd                | []                    []     []              |
+     binutils           | []                    []     []              |
+     bison              | []                    []     []         []   |
+     bison-runtime      | []              [] [] []     []         []   |
+     buzztrax           | []                           []         []   |
+     ccd2cue            |                       []     []         []   |
+     ccide              | []                    []     []         []   |
+     cflow              | []                    []     []         []   |
+     clisp              |                                              |
+     coreutils          | []                    []     []              |
+     cpio               | []                 [] []     []         []   |
+     cppi               | []                    []     []         []   |
+     cpplib             | []                 [] []     []         []   |
+     cryptsetup         |                       []     []         []   |
+     datamash           | []                    []     []              |
+     denemo             |                                         []   |
+     dfarc              | []                           []              |
+     dialog             | []  []          []           []  []     []   |
+     dico               |                       []                     |
+     diffutils          | []                 [] []     []         []   |
+     dink               | []                                           |
+     direvent           |                       []     []              |
+     doodle             | []                           []              |
+     dos2unix           | []                    []     []         []   |
+     dos2unix-man       | []                    []                []   |
+     e2fsprogs          | []                    []     []         []   |
+     enscript           | []                 [] []     []              |
+     exif               | []                 [] []     []         []   |
+     fetchmail          | []                 []        []         []   |
+     findutils          | []                 [] []     []         []   |
+     flex               | []                 []        []         []   |
+     freedink           | []              []           []              |
+     fusionforge        |                                              |
+     gas                |                       []                     |
+     gawk               | []                           []         []   |
+     gcal               | []                 []                   []   |
+     gcc                | []                                           |
+     gdbm               |                       []     []              |
+     gettext-examples   | []                 [] []     []         []   |
+     gettext-runtime    | []                 [] []     []         []   |
+     gettext-tools      | []                 [] []     []         []   |
+     gjay               |                 []           []         []   |
+     glunarclock        | []                           []  []     []   |
+     gnubiff            | []                           []              |
+     gnubik             | []                    []     []         []   |
+     gnucash            |        () ()              () ()         []   |
+     gnuchess           |                       []     []         []   |
+     gnulib             | []                    []     []         []   |
+     gnunet             |                                              |
+     gnunet-gtk         |                                              |
+     gold               |                       []     []              |
+     gphoto2            | []                    []     []         []   |
+     gprof              | []                 [] []     []              |
+     gramadoir          | []                           []         []   |
+     grep               | []              []    []     []         []   |
+     grub               | []                 [] []     []              |
+     gsasl              | []                    []     []         []   |
+     gss                | []                           []         []   |
+     gst-plugins-bad    | []                 [] []     []         []   |
+     gst-plugins-base   | []                 [] []     []         []   |
+     gst-plugins-good   | []                 [] []     []         []   |
+     gst-plugins-ugly   | []                 [] []     []         []   |
+     gstreamer          | []                 [] []     []         []   |
+     gtick              |                       []     []         []   |
+     gtkam              | []                    []     []         []   |
+     gtkspell           | []              [] [] []     []  []     []   |
+     guix               |                                              |
+     guix-packages      |                                              |
+     gutenprint         |                    [] []     []         []   |
+     hello              | []              [] [] []     []         []   |
+     help2man           |                       []     []         []   |
+     help2man-texi      |                       []                     |
+     hylafax            |                              []              |
+     idutils            |                       []     []         []   |
+     iso_15924          | []              () [] []     ()         []   |
+     iso_3166           | []        []    () [] []     ()  []     []   |
+     iso_3166_2         |                 () [] []     ()         []   |
+     iso_4217           | []              () [] []     ()         []   |
+     iso_639            | []     [] []    () [] []     ()  []     []   |
+     iso_639_3          |        []       () [] []     ()              |
+     iso_639_5          |                 ()    []     ()              |
+     jwhois             | []                 []        []         []   |
+     kbd                | []                    []     []         []   |
+     klavaro            | []                    []  [] []     []  []   |
+     ld                 | []                 [] []     []         []   |
+     leafpad            | []              [] [] []     []         []   |
+     libc               | []                 [] []     []         []   |
+     libexif            | []                           []         ()   |
+     libextractor       |                       []     []              |
+     libgnutls          | []                    []     []         []   |
+     libgphoto2         | []                    []     []              |
+     libgphoto2_port    | []                    []     []         []   |
+     libgsasl           | []                    []     []         []   |
+     libiconv           | []                    []     []  []     []   |
+     libidn             | ()                    []     []         []   |
+     liferea            | []                 [] []     []         []   |
+     lilypond           |                              []              |
+     lordsawar          |                                              |
+     lprng              |                              []              |
+     lynx               | []                 [] []     []              |
+     m4                 | []                           []         []   |
+     mailfromd          |                       []     []              |
+     mailutils          |                              []              |
+     make               | []                    []     []         []   |
+     man-db             | []                           []         []   |
+     man-db-manpages    | []                                      []   |
+     midi-instruments   | []              [] [] []     []         []   |
+     minicom            | []                           []              |
+     mkisofs            |                       []     []         []   |
+     myserver           |                              []              |
+     nano               | []                    []     []         []   |
+     opcodes            |                       []     []         []   |
+     parted             | []                 [] []     []         []   |
+     pies               |                       []     []              |
+     pnmixer            |                       []     []         []   |
+     popt               | []     []       [] [] []     []         []   |
+     procps-ng          |                       []     []              |
+     procps-ng-man      |                       []                     |
+     psmisc             | []                    []     []         []   |
+     pspp               |                    [] []                []   |
+     pushover           | []                                           |
+     pwdutils           | []                           []              |
+     pyspread           |                       []                     |
+     radius             |                       []     []              |
+     recode             | []                 []        []         []   |
+     recutils           | []                    []     []              |
+     rpm                | []                    []     []         []   |
+     rush               |                       []     []              |
+     sarg               |                                              |
+     sed                | []                 [] []     []         []   |
+     sharutils          | []                    []     []         []   |
+     shishi             |                              []         []   |
+     skribilo           | []                    []                     |
+     solfege            | []                 []        []         []   |
+     solfege-manual     |                    []                        |
+     spotmachine        | []                    []     []              |
+     sudo               | []                 [] []     []         []   |
+     sudoers            | []                    []     []         []   |
+     sysstat            | []                 [] []     []         []   |
+     tar                | []                 [] []     []         []   |
+     texinfo            |                    [] []     []              |
+     texinfo_document   |                       []                     |
+     tigervnc           | []                    []                []   |
+     tin                |                                         []   |
+     tin-man            |                                              |
+     tracgoogleappsa... | []              []    []     []         []   |
+     trader             | []                                           |
+     util-linux         | []                    []     []         []   |
+     ve                 | []                    []     []         []   |
+     vice               | ()                 ()                        |
+     vmm                |                                              |
+     vorbis-tools       | []                           []              |
+     wastesedge         |                                              |
+     wcd                |                       []     []         []   |
+     wcd-man            |                       []                     |
+     wdiff              | []                    []     []         []   |
+     wget               |                       []     []         []   |
+     wyslij-po          |                       []     []              |
+     xboard             |                       []                []   |
+     xdg-user-dirs      | []     [] []    [] [] []     []         []   |
+     xkeyboard-config   | []                 [] []     []              |
+                        +----------------------------------------------+
+                          sv  sw ta te tg th tr uk  ur vi  wa wo zh_CN
+                          106  1  4  3  0 13 51 115  1 125  7  1  100 
+
+                          zh_HK zh_TW
+                        +-------------+
+     a2ps               |             | 30
+     aegis              |             |  9
+     anubis             |             | 19
+     aspell             |             | 29
+     bash               |        []   | 23
+     bfd                |             | 11
+     binutils           |             | 12
+     bison              |        []   | 18
+     bison-runtime      |        []   | 38
+     buzztrax           |             |  9
+     ccd2cue            |             | 10
+     ccide              |             | 17
+     cflow              |             | 16
+     clisp              |             | 10
+     coreutils          |             | 18
+     cpio               |             | 20
+     cppi               |             | 17
+     cpplib             |        []   | 19
+     cryptsetup         |             | 14
+     datamash           |             | 11
+     denemo             |             |  5
+     dfarc              |             | 17
+     dialog             |        []   | 42
+     dico               |             |  6
+     diffutils          |             | 22
+     dink               |             | 10
+     direvent           |             | 11
+     doodle             |             | 12
+     dos2unix           |        []   | 18
+     dos2unix-man       |             |  9
+     e2fsprogs          |             | 15
+     enscript           |             | 21
+     exif               |             | 27
+     fetchmail          |             | 19
+     findutils          |             | 29
+     flex               |        []   | 19
+     freedink           |             | 24
+     fusionforge        |             |  3
+     gas                |             |  5
+     gawk               |             | 13
+     gcal               |             |  8
+     gcc                |             |  2
+     gdbm               |             | 10
+     gettext-examples   |  []    []   | 40
+     gettext-runtime    |  []    []   | 35
+     gettext-tools      |        []   | 24
+     gjay               |             |  9
+     glunarclock        |        []   | 27
+     gnubiff            |             |  9
+     gnubik             |             | 19
+     gnucash            |        ()   |  6
+     gnuchess           |             | 11
+     gnulib             |             | 23
+     gnunet             |             |  1
+     gnunet-gtk         |             |  1
+     gold               |             |  7
+     gphoto2            |        []   | 19
+     gprof              |             | 21
+     gramadoir          |             | 14
+     grep               |        []   | 31
+     grub               |             | 21
+     gsasl              |        []   | 19
+     gss                |             | 17
+     gst-plugins-bad    |             | 21
+     gst-plugins-base   |             | 27
+     gst-plugins-good   |             | 32
+     gst-plugins-ugly   |             | 34
+     gstreamer          |        []   | 32
+     gtick              |             | 19
+     gtkam              |             | 24
+     gtkspell           |  []    []   | 48
+     guix               |             |  2
+     guix-packages      |             |  0
+     gutenprint         |             | 15
+     hello              |        []   | 30
+     help2man           |             | 18
+     help2man-texi      |             |  5
+     hylafax            |             |  5
+     idutils            |             | 14
+     iso_15924          |        []   | 23
+     iso_3166           |  []    []   | 58
+     iso_3166_2         |             |  9
+     iso_4217           |  []    []   | 28
+     iso_639            |  []    []   | 46
+     iso_639_3          |             | 10
+     iso_639_5          |             |  2
+     jwhois             |        []   | 20
+     kbd                |             | 17
+     klavaro            |             | 30
+     ld                 |        []   | 15
+     leafpad            |        []   | 39
+     libc               |        []   | 24
+     libexif            |             | 10
+     libextractor       |             |  5
+     libgnutls          |             | 13
+     libgphoto2         |             | 10
+     libgphoto2_port    |        []   | 19
+     libgsasl           |             | 18
+     libiconv           |        []   | 29
+     libidn             |             | 17
+     liferea            |             | 29
+     lilypond           |             | 11
+     lordsawar          |             |  3
+     lprng              |             |  3
+     lynx               |             | 19
+     m4                 |        []   | 22
+     mailfromd          |             |  4
+     mailutils          |             |  6
+     make               |             | 19
+     man-db             |             | 15
+     man-db-manpages    |             | 10
+     midi-instruments   |        []   | 43
+     minicom            |        []   | 17
+     mkisofs            |             | 13
+     myserver           |             |  9
+     nano               |        []   | 30
+     opcodes            |             | 12
+     parted             |        []   | 23
+     pies               |             |  4
+     pnmixer            |             |  9
+     popt               |        []   | 36
+     procps-ng          |             |  5
+     procps-ng-man      |             |  4
+     psmisc             |        []   | 22
+     pspp               |             | 13
+     pushover           |             |  6
+     pwdutils           |             |  8
+     pyspread           |             |  6
+     radius             |             |  9
+     recode             |             | 31
+     recutils           |             | 10
+     rpm                |        []   | 13
+     rush               |             | 10
+     sarg               |             |  4
+     sed                |        []   | 35
+     sharutils          |             | 13
+     shishi             |             |  7
+     skribilo           |             |  7
+     solfege            |             | 21
+     solfege-manual     |             |  9
+     spotmachine        |             | 11
+     sudo               |             | 26
+     sudoers            |             | 22
+     sysstat            |             | 23
+     tar                |        []   | 30
+     texinfo            |             | 17
+     texinfo_document   |             | 13
+     tigervnc           |             | 14
+     tin                |        []   |  7
+     tin-man            |             |  1
+     tracgoogleappsa... |        []   | 22
+     trader             |             | 12
+     util-linux         |             | 13
+     ve                 |             | 14
+     vice               |             |  1
+     vmm                |             |  3
+     vorbis-tools       |             | 13
+     wastesedge         |             |  3
+     wcd                |             |  8
+     wcd-man            |             |  3
+     wdiff              |        []   | 23
+     wget               |             | 21
+     wyslij-po          |             | 14
+     xboard             |             | 10
+     xdg-user-dirs      |  []    []   | 68
+     xkeyboard-config   |        []   | 28
+                        +-------------+
+       89 teams           zh_HK zh_TW
+      166 domains           7    42    2809
+
+   Some counters in the preceding matrix are higher than the number of
+visible blocks let us expect.  This is because a few extra PO files are
+used for implementing regional variants of languages, or language
+dialects.
+
+   For a PO file in the matrix above to be effective, the package to
+which it applies should also have been internationalized and distributed
+as such by its maintainer.  There might be an observable lag between the
+mere existence a PO file and its wide availability in a distribution.
+
+   If Jun 2014 seems to be old, you may fetch a more recent copy of this
+'ABOUT-NLS' file on most GNU archive sites.  The most up-to-date matrix
+with full percentage details can be found at
+'http://translationproject.org/extra/matrix.html'.
+
+1.5 Using 'gettext' in new packages
+===================================
+
+If you are writing a freely available program and want to
+internationalize it you are welcome to use GNU 'gettext' in your
+package.  Of course you have to respect the GNU Lesser General Public
+License which covers the use of the GNU 'gettext' library.  This means
+in particular that even non-free programs can use 'libintl' as a shared
+library, whereas only free software can use 'libintl' as a static
+library or use modified versions of 'libintl'.
+
+   Once the sources are changed appropriately and the setup can handle
+the use of 'gettext' the only thing missing are the translations.  The
+Free Translation Project is also available for packages which are not
+developed inside the GNU project.  Therefore the information given above
+applies also for every other Free Software Project.  Contact
+'coordinator at translationproject.org' to make the '.pot' files available
+to the translation teams.
diff --git a/package/gettext-tiny/files/gettextize b/package/gettext-tiny/files/gettextize
new file mode 100644
index 0000000000..7b61cc0c0c
--- /dev/null
+++ b/package/gettext-tiny/files/gettextize
@@ -0,0 +1,1346 @@
+#! /bin/sh
+#
+# Copyright (C) 1995-1998, 2000-2016 Free Software Foundation, Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 3 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# This file is meant for authors or maintainers which want to
+# internationalize their package with the help of GNU gettext.  For
+# further information how to use it consult the GNU gettext manual.
+
+progname=$0
+package=gettext-tools
+version=0.19.8.1
+archive_version=0.19.8
+
+# Set variables
+# - gettext_datadir     directory where the data files are stored.
+prefix="@prefix@"
+datarootdir="${prefix}/share"
+: ${gettext_datadir="${datarootdir}/gettext"}
+: ${AUTOM4TE=autom4te}
+
+# func_tmpdir
+# creates a temporary directory.
+# Sets variable
+# - tmp             pathname of freshly created temporary directory
+func_tmpdir ()
+{
+  # Use the environment variable TMPDIR, falling back to /tmp. This allows
+  # users to specify a different temporary directory, for example, if their
+  # /tmp is filled up or too small.
+  : ${TMPDIR=/tmp}
+  {
+    # Use the mktemp program if available. If not available, hide the error
+    # message.
+    tmp=`(umask 077 && mktemp -d "$TMPDIR/gtXXXXXX") 2>/dev/null` &&
+    test -n "$tmp" && test -d "$tmp"
+  } ||
+  {
+    # Use a simple mkdir command. It is guaranteed to fail if the directory
+    # already exists.  $RANDOM is bash specific and expands to empty in shells
+    # other than bash, ksh and zsh.  Its use does not increase security;
+    # rather, it minimizes the probability of failure in a very cluttered /tmp
+    # directory.
+    tmp=$TMPDIR/gt$$-$RANDOM
+    (umask 077 && mkdir "$tmp")
+  } ||
+  {
+    echo "$0: cannot create a temporary directory in $TMPDIR" >&2
+    { (exit 1); exit 1; }
+  }
+}
+
+# Support for relocatability.
+func_find_curr_installdir ()
+{
+  # Determine curr_installdir, even taking into account symlinks.
+  curr_executable="$0"
+  case "$curr_executable" in
+    */* | *\\*) ;;
+    *) # Need to look in the PATH.
+      save_IFS="$IFS"; IFS="${PATH_SEPARATOR=':'}"
+      for dir in $PATH; do
+        IFS="$save_IFS"
+        test -z "$dir" && dir=.
+        for exec_ext in ''; do
+          if test -f "$dir/$curr_executable$exec_ext"; then
+            curr_executable="$dir/$curr_executable$exec_ext"
+            break 2
+          fi
+        done
+      done
+      IFS="$save_IFS"
+      ;;
+  esac
+  # Make absolute.
+  case "$curr_executable" in
+    /* | ?:/* | ?:\\*) ;;
+    *) curr_executable=`pwd`/"$curr_executable" ;;
+  esac
+  # Resolve symlinks.
+  sed_dirname='s,/[^/]*$,,'
+  sed_linkdest='s,^.* -> \(.*\),\1,p'
+  while : ; do
+    lsline=`LC_ALL=C ls -l "$curr_executable"`
+    case "$lsline" in
+      *" -> "*)
+        linkdest=`echo "$lsline" | sed -n -e "$sed_linkdest"`
+        case "$linkdest" in
+          /* | ?:/* | ?:\\*) curr_executable="$linkdest" ;;
+          *) curr_executable=`echo "$curr_executable" | sed -e "$sed_dirname"`/"$linkdest" ;;
+        esac ;;
+      *) break ;;
+    esac
+  done
+  curr_installdir=`echo "$curr_executable" | sed -e 's,/[^/]*$,,'`
+  # Canonicalize.
+  curr_installdir=`cd "$curr_installdir" && pwd`
+}
+func_find_prefixes ()
+{
+  # Compute the original/current installation prefixes by stripping the
+  # trailing directories off the original/current installation directories.
+  orig_installprefix="$orig_installdir"
+  curr_installprefix="$curr_installdir"
+  while true; do
+    orig_last=`echo "$orig_installprefix" | sed -n -e 's,^.*/\([^/]*\)$,\1,p'`
+    curr_last=`echo "$curr_installprefix" | sed -n -e 's,^.*/\([^/]*\)$,\1,p'`
+    if test -z "$orig_last" || test -z "$curr_last"; then
+      break
+    fi
+    if test "$orig_last" != "$curr_last"; then
+      break
+    fi
+    orig_installprefix=`echo "$orig_installprefix" | sed -e 's,/[^/]*$,,'`
+    curr_installprefix=`echo "$curr_installprefix" | sed -e 's,/[^/]*$,,'`
+  done
+}
+if test "no" = yes; then
+  exec_prefix="${prefix}"
+  bindir="${exec_prefix}/bin"
+  orig_installdir="$bindir" # see Makefile.am's *_SCRIPTS variables
+  func_find_curr_installdir # determine curr_installdir
+  func_find_prefixes
+  # Relocate the directory variables that we use.
+  gettext_datadir=`echo "$gettext_datadir/" | sed -e "s%^${orig_installprefix}/%${curr_installprefix}/%" | sed -e 's,/$,,'`
+fi
+
+# func_trace_autoconf macro configure.ac
+# traces an Autoconf macro call and outputs the arguments to stdout,
+# using autom4te.
+func_trace_autoconf ()
+{
+  echo '\
+dnl replace macros which may abort autom4te with a no-op variant
+m4_pushdef([m4_assert])
+m4_pushdef([m4_fatal])
+m4_pushdef([m4_warn])
+m4_pushdef([m4_errprintn])
+m4_pushdef([m4_exit])
+m4_pushdef([m4_include])
+m4_pushdef([m4_esyscmd])
+' \
+  | "$AUTOM4TE" --no-cache --language=Autoconf-without-aclocal-m4 \
+    --trace="$1":\$% - "$2" 2>/dev/null
+}
+
+# func_trace_sed macro configure.ac
+# traces an Autoconf macro call and outputs the arguments to stdout,
+# using sed.
+func_trace_sed ()
+{
+  sed_extract_arguments='
+s,#.*$,,; s,^dnl .*$,,; s, dnl .*$,,;
+/'"$1"'(/ {
+  ta
+  :a
+    s/)/)/
+    tb
+    s/\\$//
+    N
+    ba
+  :b
+  s,^.*'"$1"'([[ ]*\([^]"$`\\)]*\).*$,\1,p
+}
+d'
+  sed -e "$sed_extract_arguments" "$2"
+}
+
+# func_usage
+# outputs to stdout the --help usage message.
+func_usage ()
+{
+  echo "\
+Usage: gettextize [OPTION]... [package-dir]
+
+Prepares a source package to use gettext.
+
+Options:
+      --help           print this help and exit
+      --version        print version information and exit
+  -f, --force          force writing of new files even if old exist
+      --intl           install libintl in a subdirectory (deprecated)
+      --po-dir=DIR     specify directory with PO files
+      --no-changelog   don't update or create ChangeLog files
+      --symlink        make symbolic links instead of copying files
+  -n, --dry-run        print modifications but don't perform them
+
+Report bugs to <bug-gnu-gettext@gnu.org>."
+}
+
+# func_version
+# outputs to stdout the --version message.
+func_version ()
+{
+  echo "$progname (GNU $package) $version"
+  echo "Copyright (C) 1995-1998, 2000-2013 Free Software Foundation, Inc.
+License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
+This is free software: you are free to change and redistribute it.
+There is NO WARRANTY, to the extent permitted by law."
+  echo "Written by" "Ulrich Drepper"
+}
+
+# func_fatal_error message
+# outputs to stderr a fatal error message, and terminates the program.
+func_fatal_error ()
+{
+  echo "gettextize: *** $1" 1>&2
+  echo "gettextize: *** Stop." 1>&2
+  exit 1
+}
+
+# Nuisances.
+(unset CDPATH) >/dev/null 2>&1 && unset CDPATH
+
+# Unset more variables known to interfere with behavior of common tools.
+CLICOLOR_FORCE= GREP_OPTIONS=
+unset CLICOLOR_FORCE GREP_OPTIONS
+
+# Command-line option processing.
+# Removes the OPTIONS from the arguments. Sets the variables:
+# - force           1 if --force was given, 0 otherwise
+# - intldir         yes if --intl was given, empty otherwise
+# - podirs          list of directories specified with --po-dir
+# - try_ln_s        : if --symlink was given, false otherwise
+# - do_changelog    false if --no-changelog was given, : otherwise
+# - doit            false if --dry-run was given, : otherwise
+{
+  force=0
+  intldir=
+  podirs=
+  try_ln_s=false
+  do_changelog=:
+  doit=:
+
+  while test $# -gt 0; do
+    case "$1" in
+      -c | --copy | --cop | --co | --c ) # accepted for backward compatibility
+        shift ;;
+      -n | --dry-run | --dry-ru | --dry-r | --dry- | --dry | --dr | --d )
+        shift
+        doit=false ;;
+      -f | --force | --forc | --for | --fo | --f )
+        shift
+        force=1 ;;
+      --help | --hel | --he | --h )
+        func_usage; exit 0 ;;
+      --intl | --int | --in | --i )
+        shift
+        intldir=yes ;;
+      --po-dir | --po-di | --po-d | --po- | --po | --p )
+        shift 
+        if test $# = 0; then
+          func_fatal_error "missing argument for --po-dir"
+        fi
+        case "$1" in
+          -*) func_fatal_error "missing argument for --po-dir" ;;
+        esac
+        podirs="$podirs $1"
+        shift ;;
+      --po-dir=* )
+        arg=`echo "X$1" | sed -e 's/^X--po-dir=//'`
+        podirs="$podirs $arg"
+        shift ;;
+      --no-changelog | --no-changelo | --no-changel | --no-change | --no-chang | --no-chan | --no-cha | --no-ch | --no-c )
+        shift
+        do_changelog=false ;;
+      --symlink | --symlin | --symli | --syml | --sym | --sy | --s )
+        shift
+        try_ln_s=: ;;
+      --version | --versio | --versi | --vers | --ver | --ve | --v )
+        func_version
+        exit 0 ;;
+      -- ) # Stop option prcessing
+        shift; break ;;
+      -* )
+        echo "gettextize: unknown option $1" 1>&2
+        echo "Try 'gettextize --help' for more information." 1>&2
+        exit 1 ;;
+      * )
+        break ;;
+    esac
+  done
+  # podirs defaults to "po".
+  test -n "$podirs" || podirs="po"
+}
+
+# Warn about deprecated options.
+if test -n "$intldir"; then
+  echo "gettextize: warning: the option '--intl' is deprecated and will be removed" 1>&2
+fi
+
+# Command-line argument processing.
+# Analyzes the remaining arguments.
+# Sets the variables
+# - origdir         to the original directory,
+# - srcdir          to the package directory, and cd-s into it.
+{
+  if test $# -gt 1; then
+    func_usage 1>&2
+    exit 1
+  fi
+  origdir=`pwd`
+  if test $# -eq 1; then
+    srcdir=$1
+    if cd "$srcdir"; then
+      srcdir=`pwd`
+    else
+      func_fatal_error "Cannot change directory to '$srcdir'."
+    fi
+  else
+    srcdir=$origdir
+  fi
+}
+
+# The current directory is now $srcdir.
+
+# Check integrity of package: A configure.in/ac must be present. Sets variable
+# - configure_in    name of configure.in/ac file.
+test -f configure.in || test -f configure.ac ||
+  func_fatal_error "Missing configure.in or configure.ac, please cd to your package first."
+configure_in=NONE
+if test -f configure.in; then
+  configure_in=configure.in
+else
+  if test -f configure.ac; then
+    configure_in=configure.ac
+  fi
+fi
+
+# Check whether the --force option is needed but has not been specified.
+if test $force -eq 0; then
+  if test -d intl; then
+    func_fatal_error "intl/ subdirectory exists: use option -f if you really want to delete it."
+  fi
+  for podir in $podirs; do
+    if test -f "$podir/Makefile.in.in"; then
+      func_fatal_error "$podir/Makefile.in.in exists: use option -f if you really want to delete it."
+    fi
+  done
+  if test -f ABOUT-NLS; then
+    func_fatal_error "ABOUT-NLS exists: use option -f if you really want to delete it."
+  fi
+fi
+
+# Select the method for Autoconf macro tracing.  func_trace_autoconf
+# is more accurate than func_trace_sed, but it only works with
+# autoconf >= 2.69.
+if echo "AC_PREREQ([2.69])" \
+  | "$AUTOM4TE" --no-cache --language=Autoconf-without-aclocal-m4 - 2>&1; then
+  func_trace=func_trace_autoconf
+else
+  func_trace=func_trace_sed
+fi
+
+# Check in which directory config.rpath etc. belong.
+auxdir=`"$func_trace" AC_CONFIG_AUX_DIR "$configure_in"`
+if test -n "$auxdir"; then
+  auxdir="$auxdir/"
+fi
+
+# Check in which directory gettext.m4 etc. belong.
+macrodirs=`"$func_trace" AC_CONFIG_MACRO_DIR_TRACE "$configure_in"`
+if test -z "$macrodirs"; then
+  macrodirs=`"$func_trace" AC_CONFIG_MACRO_DIR "$configure_in"`
+fi
+for arg in $macrodirs; do
+  m4dir="$arg"
+  break
+done
+
+# For simplicity we change to the gettext source directory.
+cd "$gettext_datadir" ||
+  func_fatal_error "gettext source directory '${gettext_datadir}' doesn't exist"
+
+# Variables which keep track what has been modified.
+added_directories=
+removed_directory=
+added_extradist=
+added_acoutput=
+removed_acoutput=" intl/intlh.inst"
+
+# Variable:
+# - please          accumulates instructions for the user.
+please=
+
+# Variable:
+# - date            current date, for use in ChangeLog entries.
+date=`date +%Y-%m-%d`
+
+# func_copy from to
+# copies a file.
+# 'from' is a relative pathname, relative to the current directory.
+# 'to' is a relative pathname, relative to $srcdir.
+func_copy ()
+{
+  if $doit; then
+    rm -f "$srcdir/$2"
+    echo "Copying file $2"
+    cp "$1" "$srcdir/$2"
+  else
+    echo "Copy file $2"
+  fi
+}
+
+# func_linkorcopy from absfrom to
+# links or copies a file.
+# 'from' is a relative pathname, relative to the current directory.
+# 'absfrom' is the corresponding absolute pathname.
+# 'to' is a relative pathname, relative to $srcdir.
+func_linkorcopy ()
+{
+  if $doit; then
+    rm -f "$srcdir/$3"
+    ($try_ln_s && ln -s "$2" "$srcdir/$3" && echo "Symlinking file $3") 2>/dev/null ||
+    { echo "Copying file $3"; cp "$1" "$srcdir/$3"; }
+  else
+    if $try_ln_s; then
+      echo "Symlink file $3"
+    else
+      echo "Copy file $3"
+    fi
+  fi
+}
+
+# func_backup to
+# makes a backup of a file that is about to be overwritten or replaced.
+# 'to' is a relative pathname, relative to $srcdir.
+func_backup ()
+{
+  if $doit; then
+    if test -f "$srcdir/$1"; then
+      rm -f "$srcdir/$1~"
+      cp -p "$srcdir/$1" "$srcdir/$1~"
+    fi
+  fi
+}
+
+# func_remove to
+# removes a file.
+# 'to' is a relative pathname, relative to $srcdir.
+func_remove ()
+{
+  if $doit; then
+    echo "Removing $1"
+    rm -f "$srcdir/$1"
+  else
+    echo "Remove $1"
+  fi
+}
+
+# func_ChangeLog_init
+# func_ChangeLog_add_entry line
+# func_ChangeLog_finish
+# manage the ChangeLog file, relative to $srcdir.
+func_ChangeLog_init ()
+{
+  modified_ChangeLog=
+}
+func_ChangeLog_add_entry ()
+{
+  if $doit; then
+    if test -z "$modified_ChangeLog"; then
+      echo "$date  gettextize  <bug-gnu-gettext@gnu.org>" > "$srcdir/ChangeLog.tmp"
+      echo >> "$srcdir/ChangeLog.tmp"
+      modified_ChangeLog=yes
+    fi
+    echo "$1" >> "$srcdir/ChangeLog.tmp"
+  else
+    modified_ChangeLog=yes
+  fi
+}
+func_ChangeLog_finish ()
+{
+  if test -n "$modified_ChangeLog"; then
+    if $doit; then
+      echo >> "$srcdir/ChangeLog.tmp"
+      if test -f "$srcdir/ChangeLog"; then
+        echo "Adding an entry to ChangeLog (backup is in ChangeLog~)"
+        cat "$srcdir/ChangeLog" >> "$srcdir/ChangeLog.tmp"
+        rm -f "$srcdir/ChangeLog~"
+        cp -p "$srcdir/ChangeLog" "$srcdir/ChangeLog~"
+      else
+        echo "Creating ChangeLog"
+      fi
+      cp "$srcdir/ChangeLog.tmp" "$srcdir/ChangeLog"
+      rm -f "$srcdir/ChangeLog.tmp"
+    else
+      if test -f "$srcdir/ChangeLog"; then
+        echo "Add an entry to ChangeLog"
+      else
+        echo "Create ChangeLog"
+      fi
+    fi
+  fi
+}
+
+# func_poChangeLog_init
+# func_poChangeLog_add_entry line
+# func_poChangeLog_finish
+# manage the $podir/ChangeLog file, relative to $srcdir.
+func_poChangeLog_init ()
+{
+  modified_poChangeLog=
+}
+func_poChangeLog_add_entry ()
+{
+  if $doit; then
+    if test -z "$modified_poChangeLog"; then
+      echo "$date  gettextize  <bug-gnu-gettext@gnu.org>" > "$srcdir/$podir/ChangeLog.tmp"
+      echo >> "$srcdir/$podir/ChangeLog.tmp"
+      modified_poChangeLog=yes
+    fi
+    echo "$1" >> "$srcdir/$podir/ChangeLog.tmp"
+  else
+    modified_poChangeLog=yes
+  fi
+}
+func_poChangeLog_finish ()
+{
+  if test -n "$modified_poChangeLog"; then
+    if $doit; then
+      echo >> "$srcdir/$podir/ChangeLog.tmp"
+      if test -f "$srcdir/$podir/ChangeLog"; then
+        echo "Adding an entry to $podir/ChangeLog (backup is in $podir/ChangeLog~)"
+        cat "$srcdir/$podir/ChangeLog" >> "$srcdir/$podir/ChangeLog.tmp"
+        rm -f "$srcdir/$podir/ChangeLog~"
+        cp -p "$srcdir/$podir/ChangeLog" "$srcdir/$podir/ChangeLog~"
+      else
+        echo "Creating $podir/ChangeLog"
+      fi
+      cp "$srcdir/$podir/ChangeLog.tmp" "$srcdir/$podir/ChangeLog"
+      rm -f "$srcdir/$podir/ChangeLog.tmp"
+    else
+      if test -f "$srcdir/$podir/ChangeLog"; then
+        echo "Add an entry to $podir/ChangeLog"
+      else
+        echo "Create $podir/ChangeLog"
+      fi
+    fi
+  fi
+}
+
+# func_m4ChangeLog_init
+# func_m4ChangeLog_add_entry line
+# func_m4ChangeLog_finish
+# manage the $m4dir/ChangeLog file, relative to $srcdir.
+func_m4ChangeLog_init ()
+{
+  if test -n "$using_m4ChangeLog"; then
+    modified_m4ChangeLog=
+    created_m4ChangeLog=
+  fi
+}
+func_m4ChangeLog_add_entry ()
+{
+  if test -n "$using_m4ChangeLog"; then
+    if $doit; then
+      if test -z "$modified_m4ChangeLog"; then
+        echo "$date  gettextize  <bug-gnu-gettext@gnu.org>" > "$srcdir/$m4dir/ChangeLog.tmp"
+        echo >> "$srcdir/$m4dir/ChangeLog.tmp"
+        modified_m4ChangeLog=yes
+      fi
+      echo "$1" >> "$srcdir/$m4dir/ChangeLog.tmp"
+    else
+      modified_m4ChangeLog=yes
+    fi
+  else
+    line="$1"
+    line=`echo "$line" | sed -e "s%^	\\* %	* $m4dir/%"`
+    func_ChangeLog_add_entry "$line"
+  fi
+}
+func_m4ChangeLog_finish ()
+{
+  if test -n "$using_m4ChangeLog"; then
+    if test -n "$modified_m4ChangeLog"; then
+      if $doit; then
+        echo >> "$srcdir/$m4dir/ChangeLog.tmp"
+        if test -f "$srcdir/$m4dir/ChangeLog"; then
+          echo "Adding an entry to $m4dir/ChangeLog (backup is in $m4dir/ChangeLog~)"
+          cat "$srcdir/$m4dir/ChangeLog" >> "$srcdir/$m4dir/ChangeLog.tmp"
+          rm -f "$srcdir/$m4dir/ChangeLog~"
+          cp -p "$srcdir/$m4dir/ChangeLog" "$srcdir/$m4dir/ChangeLog~"
+        else
+          echo "Creating $m4dir/ChangeLog"
+          created_m4ChangeLog=yes
+        fi
+        cp "$srcdir/$m4dir/ChangeLog.tmp" "$srcdir/$m4dir/ChangeLog"
+        rm -f "$srcdir/$m4dir/ChangeLog.tmp"
+      else
+        if test -f "$srcdir/$m4dir/ChangeLog"; then
+          echo "Add an entry to $m4dir/ChangeLog"
+        else
+          echo "Create $m4dir/ChangeLog"
+          created_m4ChangeLog=yes
+        fi
+      fi
+    fi
+  fi
+}
+using_m4ChangeLog=yes
+
+if test ! -f "$srcdir/intl/Makefile.in" && test -n "$intldir"; then
+  added_acoutput="$added_acoutput intl/Makefile"
+fi
+if test -f "$srcdir/intl/Makefile.in" && test -z "$intldir"; then
+  removed_acoutput="$removed_acoutput intl/Makefile"
+fi
+if test -d "$srcdir/intl"; then
+  # Remove everything inside intl except for RCS and CVS subdirs and invisible
+  # files.
+  if $doit; then
+    echo "Wiping out intl/ subdirectory"
+    (cd "$srcdir/intl" &&
+     for f in *; do
+       if test CVS != "$f" && test RCS != "$f"; then
+         rm -rf "$f"
+       fi
+     done)
+  else
+    echo "Wipe out intl/ subdirectory"
+  fi
+  if test -z "$intldir"; then
+    removed_directory=intl
+  fi
+else
+  if test -n "$intldir"; then
+    if $doit; then
+      echo "Creating intl/ subdirectory"
+      mkdir "$srcdir/intl" || func_fatal_error "failed to create intl/ subdirectory"
+    else
+      echo "Create intl/ subdirectory"
+    fi
+    added_directories="$added_directories intl"
+  fi
+fi
+
+$do_changelog && func_ChangeLog_init
+
+for podir in $podirs; do
+  test -d "$srcdir/$podir" || {
+    if $doit; then
+      echo "Creating $podir/ subdirectory"
+      mkdir "$srcdir/$podir" || func_fatal_error "failed to create $podir/ subdirectory"
+    else
+      echo "Create $podir/ subdirectory"
+    fi
+    added_directories="$added_directories $podir"
+  }
+done
+
+# Create the directory for config.rpath, if needed.
+# This is for consistency with autoreconf and automake.
+# Note that $auxdir is either empty or ends in a slash.
+test -d "$srcdir/$auxdir" || {
+  if $doit; then
+    echo "Creating $auxdir subdirectory"
+    mkdir "$srcdir/$auxdir" || func_fatal_error "failed to create $auxdir subdirectory"
+  else
+    echo "Create $auxdir subdirectory"
+  fi
+}
+
+# Now copy all files.  Take care for the destination directories.
+for file in *; do
+  case $file in
+    ABOUT-NLS)
+      func_linkorcopy $file "$gettext_datadir/$file" $file
+      ;;
+    config.rpath)
+      if test -f "$srcdir/$auxdir$file"; then
+        :
+      else
+        added_extradist="$added_extradist $auxdir$file"
+      fi
+      func_linkorcopy $file "$gettext_datadir/$file" "$auxdir$file"
+      ;;
+  esac
+done
+
+# Copy files to intl/ subdirectory.
+if test -n "$intldir"; then
+  cd intl
+  for file in *; do
+    if test $file != COPYING.LIB-2.0 && test $file != COPYING.LIB-2.1; then
+      if test $file != plural.c; then
+        func_linkorcopy $file "$gettext_datadir/intl/$file" intl/$file
+      else
+        # plural.c is a generated file; it must be copied and touched.
+        func_copy $file intl/$file
+        if $doit; then
+          (sleep 2; touch "$srcdir/intl/$file") &
+        fi
+      fi
+    fi
+  done
+  cd ..
+else
+  echo "Not copying intl/ directory."
+  # Tell the user what to put into configure.ac, if it is not already there.
+  external=
+  # Need to use func_trace_sed instead of $func_trace, since
+  # AM_GNU_GETTEXT is not a standard Autoconf trace.
+  xargs=`func_trace_sed AM_GNU_GETTEXT "$srcdir/$configure_in"`
+  save_IFS="$IFS"; IFS=:
+  for arg in $xargs; do
+    if test 'external' = "$arg"; then
+      external=yes
+      break
+    fi
+  done
+  IFS="$save_IFS"
+  if test -z "$external"; then
+    please="$please
+Please use AM_GNU_GETTEXT([external]) in order to cause autoconfiguration
+to look for an external libintl.
+"
+  fi
+fi
+
+# Copy files to po/ subdirectory.
+cd po
+for podir in $podirs; do
+  $do_changelog && func_poChangeLog_init
+  for file in Makefile.in.in; do
+    same=no
+    if test -f "$srcdir/$podir/$file"; then
+      if cmp -s $file "$srcdir/$podir/$file"; then
+        same=yes
+      fi
+    else
+      added_acoutput="$added_acoutput $podir/Makefile.in"
+    fi
+    if $do_changelog && test $same = no; then
+      if test -f "$srcdir/$podir/$file"; then
+        func_poChangeLog_add_entry "	* $file: Upgrade to gettext-${version}."
+      else
+        func_poChangeLog_add_entry "	* $file: New file, from gettext-${version}."
+      fi
+    fi
+    func_backup "$podir/$file"
+    func_linkorcopy $file "$gettext_datadir/po/$file" "$podir/$file"
+  done
+  for file in *; do
+    case $file in
+      Makefile.in.in)
+        # Already handled above.
+        ;;
+      Makevars.template)
+        func_linkorcopy Makevars.template "$gettext_datadir/po/Makevars.template" "$podir/Makevars.template"
+        if test -f "$srcdir/po/Makevars"; then
+          LC_ALL=C sed -n -e 's/[ 	]*\([A-Za-z0-9_]*\)[ 	]*=.*/\1/p' < "$srcdir/$podir/Makevars" | LC_ALL=C sort > "$srcdir/$podir/Makevars.tmp1"
+          LC_ALL=C sed -n -e 's/[ 	]*\([A-Za-z0-9_]*\)[ 	]*=.*/\1/p' < "$srcdir/$podir/Makevars.template" | LC_ALL=C sort > "$srcdir/$podir/Makevars.tmp2"
+          missingvars=`LC_ALL=C comm -13 "$srcdir/$podir/Makevars.tmp1" "$srcdir/$podir/Makevars.tmp2"`
+          rm -f "$srcdir/$podir/Makevars.tmp1" "$srcdir/$podir/Makevars.tmp2"
+          if test -n "$missingvars"; then
+            please="$please
+Please update $podir/Makevars so that it defines all the variables mentioned
+in $podir/Makevars.template.
+You can then remove $podir/Makevars.template.
+"
+          fi
+        else
+          please="$please
+Please create $podir/Makevars from the template in $podir/Makevars.template.
+You can then remove $podir/Makevars.template.
+"
+        fi
+        ;;
+      *)
+        same=no
+        if test -f "$srcdir/$podir/$file"; then
+          if cmp -s $file "$srcdir/$podir/$file"; then
+            same=yes
+          fi
+        fi
+        if $do_changelog && test $same = no; then
+          if test -f "$srcdir/$podir/$file"; then
+            func_poChangeLog_add_entry "	* $file: Upgrade to gettext-${version}."
+          else
+            func_poChangeLog_add_entry "	* $file: New file, from gettext-${version}."
+          fi
+        fi
+        func_backup "$podir/$file"
+        func_linkorcopy $file "$gettext_datadir/po/$file" "$podir/$file"
+        ;;
+    esac
+  done
+  if test -f "$srcdir/$podir/cat-id-tbl.c"; then
+    func_remove "$podir/cat-id-tbl.c"
+    $do_changelog && func_poChangeLog_add_entry "	* cat-id-tbl.c: Remove file."
+  fi
+  if test -f "$srcdir/$podir/stamp-cat-id"; then
+    func_remove "$podir/stamp-cat-id"
+    $do_changelog && func_poChangeLog_add_entry "	* stamp-cat-id: Remove file."
+  fi
+  if test ! -f "$srcdir/$podir/POTFILES.in"; then
+    if $doit; then
+      echo "Creating initial $podir/POTFILES.in"
+      echo '# List of source files which contain translatable strings.' > "$srcdir/$podir/POTFILES.in"
+    else
+      echo "Create initial $podir/POTFILES.in"
+    fi
+    $do_changelog && func_poChangeLog_add_entry "	* POTFILES.in: New file."
+    please="$please
+Please fill $podir/POTFILES.in as described in the documentation.
+"
+  fi
+  $do_changelog && func_poChangeLog_finish
+done
+
+# Determine whether we can assume automake 1.9 or newer.
+have_automake19=
+if (aclocal --version) >/dev/null 2>/dev/null; then
+  aclocal_version=`aclocal --version | sed -n -e 1p | sed -e 's/^[^0-9]*//'`
+  case $aclocal_version in
+    1.9* | 1.[1-9][0-9]* | [2-9]*) have_automake19=yes ;;
+  esac
+fi
+
+m4filelist='gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4
+ po.m4 progtest.m4'
+# With aclocal versions < 1.9 we need all m4 files, otherwise "aclocal -I m4"
+# might give an error. (aclocal < 1.9 didn't know which macros are really
+# needed, it looked which macros are potentially needed.)
+min_automake_version=1.9
+if test -n "$intldir" || test -z "$have_automake19"; then
+  # Add intldir.m4, intl.m4 and its dependencies.
+  m4filelist=$m4filelist' codeset.m4 fcntl-o.m4 glibc2.m4 glibc21.m4 intdiv0.m4
+   intl.m4 intldir.m4 intlmacosx.m4 intmax.m4 inttypes_h.m4 inttypes-pri.m4
+   lcmessage.m4 lock.m4 longlong.m4 printf-posix.m4 size_max.m4 stdint_h.m4
+   threadlib.m4 uintmax_t.m4 visibility.m4 wchar_t.m4 wint_t.m4 xsize.m4'
+  min_automake_version=1.8
+fi
+
+# All sorts of bugs could occur if the configure file was remade with the wrong
+# version of gettext.m4 et al. (because then the configure and the po/Makefile.in.in
+# don't fit together). It is therefore important that the package carries the
+# right versions of gettext.m4 et al. with it.
+if test -f "$srcdir/Makefile.am"; then
+  # A package using automake.
+
+  # Determine whether it's using automake 1.8 or newer.
+  have_automake18=
+  if (aclocal --version) >/dev/null 2>/dev/null; then
+    aclocal_version=`aclocal --version | sed -n -e 1p | sed -e 's/^[^0-9]*//'`
+    case $aclocal_version in
+      1.[8-9]* | 1.[1-9][0-9]* | [2-9]*) have_automake18=yes ;;
+    esac
+  fi
+
+  if test -z "$m4dir"; then
+    # Extract the macro directory name from Makefile.am.
+    aclocal_amflags=`grep '^ACLOCAL_AMFLAGS[ 	]*=' "$srcdir/Makefile.am" | sed -e 's/^ACLOCAL_AMFLAGS[ 	]*=\(.*\)$/\1/'`
+    m4dir_is_next=
+    for arg in $aclocal_amflags; do
+      if test -n "$m4dir_is_next"; then
+        # Ignore absolute directory pathnames, like /usr/local/share/aclocal.
+        case "$arg" in
+          /*) ;;
+          *)
+            test -z "$m4dir" || m4dir="$arg"
+            macrodirs="$macrodirs $arg"
+            ;;
+        esac
+        m4dir_is_next=
+      else
+        if test "X$arg" = "X-I"; then
+          m4dir_is_next=yes
+        else
+          m4dir_is_next=
+        fi
+      fi
+    done
+    for arg in $macrodirs; do
+      m4dir="$arg"
+      break
+    done
+  fi
+
+  if test -z "$m4dir"; then
+    m4dir=m4
+    m4dir_defaulted=yes
+  fi
+
+  # Decide whether to use $m4dir/ChangeLog, or to use ChangeLog instead.
+  if test -d "$srcdir/$m4dir" && test -f "$srcdir/ChangeLog" && test ! -f "$srcdir/$m4dir/ChangeLog"; then
+    # The programmer has no $m4dir/ChangeLog so far. Don't introduce one.
+    using_m4ChangeLog=
+  fi
+
+  # Update the *.m4 files and the corresponding Makefile.am.
+  $do_changelog && func_m4ChangeLog_init
+  added_m4dir=
+  added_m4files=
+  if test -d "$srcdir/$m4dir"; then
+    :
+  else
+    if $doit; then
+      echo "Creating directory $m4dir"
+      mkdir "$srcdir/$m4dir"
+    else
+      echo "Create directory $m4dir"
+    fi
+    added_m4dir=yes
+  fi
+  for file in $m4filelist; do
+    same=no
+    if test -f "$srcdir/$m4dir/$file"; then
+      if cmp -s "${datarootdir}/aclocal/$file" "$srcdir/$m4dir/$file"; then
+        same=yes
+      fi
+    else
+      added_m4files="$added_m4files $file"
+    fi
+    if $do_changelog && test $same = no; then
+      if test -f "$srcdir/$m4dir/$file"; then
+        func_m4ChangeLog_add_entry "	* $file: Upgrade to gettext-${version}."
+      else
+        func_m4ChangeLog_add_entry "	* $file: New file, from gettext-${version}."
+      fi
+    fi
+    func_backup "$m4dir/$file"
+    func_linkorcopy "${datarootdir}/aclocal/$file" "${datarootdir}/aclocal/$file" "$m4dir/$file"
+  done
+  missing_m4Makefileam=
+  if test -n "$added_m4files"; then
+    if test -f "$srcdir/$m4dir/Makefile.am"; then
+      if $doit; then
+        echo "Updating EXTRA_DIST in $m4dir/Makefile.am (backup is in $m4dir/Makefile.am~)"
+        func_backup "$m4dir/Makefile.am"
+        rm -f "$srcdir/$m4dir/Makefile.am"
+        if grep '^EXTRA_DIST[ 	]*=' "$srcdir/$m4dir/Makefile.am~" > /dev/null; then
+          sed -e "s%^\(EXTRA_DIST[ 	]*=\) \\?%\\1$added_m4files %" < "$srcdir/$m4dir/Makefile.am~" > "$srcdir/$m4dir/Makefile.am"
+          $do_changelog && func_m4ChangeLog_add_entry "	* Makefile.am (EXTRA_DIST): Add the new files."
+        else
+          (cat "$srcdir/$m4dir/Makefile.am~"; echo; echo "EXTRA_DIST =$added_m4files") > "$srcdir/$m4dir/Makefile.am"
+          $do_changelog && func_m4ChangeLog_add_entry "	* Makefile.am (EXTRA_DIST): New variable."
+        fi
+      else
+        echo "Update EXTRA_DIST in $m4dir/Makefile.am"
+        $do_changelog && func_m4ChangeLog_add_entry "	* Makefile.am (EXTRA_DIST)."
+      fi
+    else
+      # $m4dir/Makefile.am is not needed any more when aclocal 1.8 or newer
+      # is used.
+      if test -z "$have_automake18"; then
+        if $doit; then
+          echo "Creating $m4dir/Makefile.am"
+          echo "EXTRA_DIST =$added_m4files" > "$srcdir/$m4dir/Makefile.am"
+        else
+          echo "Create $m4dir/Makefile.am"
+        fi
+        $do_changelog && func_m4ChangeLog_add_entry "	* Makefile.am: New file."
+        added_acoutput="$added_acoutput $m4dir/Makefile"
+      else
+        missing_m4Makefileam=yes
+      fi
+    fi
+  fi
+  if test -n "$added_m4dir" && test -z "$missing_m4Makefileam"; then
+    added_directories="$added_directories $m4dir"
+  fi
+  $do_changelog && func_m4ChangeLog_finish
+  # automake will arrange for $m4dir/ChangeLog to be distributed if a
+  # $m4dir/Makefile.am exists. If not, we need to add it to Makefile.am's
+  # EXTRA_DIST explicitly.
+  if test -n "$created_m4ChangeLog" && test -n "$missing_m4Makefileam"; then
+    added_extradist="$added_extradist $m4dir/ChangeLog"
+  fi
+
+  # Update the top-level Makefile.am.
+  modified_Makefile_am=
+  # func_modify_Makefile_am changelog_comment
+  # assumes a modified copy of $srcdir/Makefile.am in $srcdir/Makefile.am.tmp
+  # and replaces the original Makefile.am file with the modified one if
+  # the two files differ. Then it removes the modified copy.
+  func_modify_Makefile_am ()
+  {
+    if cmp -s "$srcdir/Makefile.am" "$srcdir/Makefile.am.tmp"; then
+      :
+    else
+      if test -z "$modified_Makefile_am"; then
+        if $doit; then
+          echo "Updating Makefile.am (backup is in Makefile.am~)"
+          func_backup Makefile.am
+        else
+          echo "Update Makefile.am"
+        fi
+      fi
+      if $doit; then
+        rm -f "$srcdir/Makefile.am"
+        cp "$srcdir/Makefile.am.tmp" "$srcdir/Makefile.am"
+      fi
+      if $do_changelog; then
+        if test -z "$modified_Makefile_am"; then
+          func_ChangeLog_add_entry "	* Makefile.am $1"
+        else
+          func_ChangeLog_add_entry "	$1"
+        fi
+      fi
+      modified_Makefile_am=yes
+    fi
+    rm -f "$srcdir/Makefile.am.tmp"
+  }
+
+  if test -n "$added_directories"; then
+    if grep '^SUBDIRS[ 	]*=' "$srcdir/Makefile.am" > /dev/null; then
+      sed -e "s%^\(SUBDIRS[ 	]*=\) \\?%\\1$added_directories %" < "$srcdir/Makefile.am" > "$srcdir/Makefile.am.tmp"
+      added_directories_pretty=`echo $added_directories | sed -e 's/ /, /g'`
+      func_modify_Makefile_am "(SUBDIRS): Add $added_directories_pretty."
+    else
+      (cat "$srcdir/Makefile.am"; echo; echo "SUBDIRS =$added_directories") > "$srcdir/Makefile.am.tmp"
+      func_modify_Makefile_am "(SUBDIRS): New variable."
+    fi
+  fi
+  if test -n "$removed_directory"; then
+    sed -e '/^SUBDIRS[ 	]*=/ {
+        :a
+        s%\([ 	]\)'"$removed_directory"'[ 	]%\1%
+        s%[ 	]'"$removed_directory"'$%%
+        tb
+        :b
+        s%\\$%\\%
+        tc
+        bd
+        :c
+        n
+        ba
+      :d
+    }' < "$srcdir/Makefile.am" > "$srcdir/Makefile.am.tmp"
+    func_modify_Makefile_am "(SUBDIRS): Remove $removed_directory."
+  fi
+  if test -n "$added_directories"; then
+    if grep '^DIST_SUBDIRS[ 	]*=' "$srcdir/Makefile.am" > /dev/null; then
+      sed -e "s%^\(DIST_SUBDIRS[ 	]*=\) \\?%\\1$added_directories %" < "$srcdir/Makefile.am" > "$srcdir/Makefile.am.tmp"
+      added_directories_pretty=`echo $added_directories | sed -e 's/ /, /g'`
+      func_modify_Makefile_am "(DIST_SUBDIRS): Add $added_directories_pretty."
+    fi
+  fi
+  if test -n "$removed_directory"; then
+    sed -e '/^DIST_SUBDIRS[ 	]*=/ {
+        :a
+        s%\([ 	]\)'"$removed_directory"'[ 	]%\1%
+        s%[ 	]'"$removed_directory"'$%%
+        tb
+        :b
+        s%\\$%\\%
+        tc
+        bd
+        :c
+        n
+        ba
+      :d
+    }' < "$srcdir/Makefile.am" > "$srcdir/Makefile.am.tmp"
+    func_modify_Makefile_am "(DIST_SUBDIRS): Remove $removed_directory."
+  fi
+  if test -n "$m4dir_defaulted"; then
+    if grep '^ACLOCAL_AMFLAGS[ 	]*=' "$srcdir/Makefile.am" > /dev/null; then
+      sed -e "s%^\(ACLOCAL_AMFLAGS[ 	]*=\) \\?%\\1 -I $m4dir %" < "$srcdir/Makefile.am" > "$srcdir/Makefile.am.tmp"
+      func_modify_Makefile_am "(ACLOCAL_AMFLAGS): Add -I $m4dir."
+    else
+      (cat "$srcdir/Makefile.am"; echo; echo "ACLOCAL_AMFLAGS = -I $m4dir") > "$srcdir/Makefile.am.tmp"
+      func_modify_Makefile_am "(ACLOCAL_AMFLAGS): New variable."
+    fi
+    # Also update Makefile.in and, if existent, Makefile. Otherwise they
+    # would take into account the new flags only after a few rounds of
+    # "./configure", "make", "touch configure.in", "make distclean".
+    if $doit; then
+      for file in Makefile.in Makefile; do
+        if test -f "$srcdir/$file"; then
+          func_backup $file
+          rm -f "$srcdir/$file"
+          sed -e "s%(ACLOCAL)%(ACLOCAL) -I $m4dir%" < "$srcdir/$file~" > "$srcdir/$file"
+        fi
+      done
+    fi
+  fi
+  if test -n "$added_extradist"; then
+    if grep '^EXTRA_DIST[ 	]*=' "$srcdir/Makefile.am" > /dev/null; then
+      sed -e "s%^\(EXTRA_DIST[ 	]*=\)%\\1$added_extradist %" < "$srcdir/Makefile.am" > "$srcdir/Makefile.am.tmp"
+      added_extradist_pretty=`echo $added_extradist | sed -e 's/ /, /g'`
+      func_modify_Makefile_am "(EXTRA_DIST): Add $added_extradist_pretty."
+    else
+      (cat "$srcdir/Makefile.am"; echo; echo "EXTRA_DIST =$added_extradist") > "$srcdir/Makefile.am.tmp"
+      func_modify_Makefile_am "(EXTRA_DIST): New variable."
+    fi
+  fi
+  # Extract the aclocal options name from Makefile.am.
+  aclocal_options=
+  for arg in $macrodirs; do
+    aclocal_options="$aclocal_options -I $arg"
+  done
+  please="$please
+Please run 'aclocal$aclocal_options' to regenerate the aclocal.m4 file.
+You need aclocal from GNU automake $min_automake_version (or newer) to do this.
+Then run 'autoconf' to regenerate the configure file.
+"
+
+  # Also create $m4dir/Makefile.in from $m4dir/Makefile.am, because automake
+  # doesn't do it by itself.
+  if $doit; then
+    case "$added_acoutput" in
+      *" $m4dir/Makefile")
+        (cd "$srcdir" && automake "$m4dir/Makefile") 2>/dev/null ||
+        please="$please
+Please run 'automake $m4dir/Makefile' to create $m4dir/Makefile.in
+"
+        ;;
+    esac
+  fi
+else
+  please="$please
+Please add the files
+$m4filelist
+from the ${datarootdir}/aclocal directory to your aclocal.m4 file.
+"
+fi
+
+modified_configure_in=
+# func_modify_configure_in changelog_comment
+# assumes a modified copy of $srcdir/$configure_in in $srcdir/$configure_in.tmp
+# and replaces the original configure.in/ac file with the modified one if
+# the two files differ. Then it removes the modified copy.
+func_modify_configure_in ()
+{
+  if cmp -s "$srcdir/$configure_in" "$srcdir/$configure_in.tmp"; then
+    :
+  else
+    if test -z "$modified_configure_in"; then
+      if $doit; then
+        echo "Updating $configure_in (backup is in $configure_in~)"
+        func_backup $configure_in
+      else
+        echo "Update $configure_in"
+      fi
+    fi
+    if $doit; then
+      rm -f "$srcdir/$configure_in"
+      cp "$srcdir/$configure_in.tmp" "$srcdir/$configure_in"
+    fi
+    if $do_changelog; then
+      if test -z "$modified_configure_in"; then
+        func_ChangeLog_add_entry "	* $configure_in $1"
+      else
+        func_ChangeLog_add_entry "	$1"
+      fi
+    fi
+    modified_configure_in=yes
+  fi
+  rm -f "$srcdir/$configure_in.tmp"
+}
+
+if test -n "$added_acoutput"; then
+  if grep '^AC_CONFIG_FILES(' "$srcdir/$configure_in" > /dev/null; then
+    sedprog='
+ta
+b
+:a
+n
+ba'
+    sed -e "s%^\\(AC_CONFIG_FILES([^])\\,]*\\)%\\1$added_acoutput%$sedprog" < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+    added_acoutput_pretty=`echo $added_acoutput | sed -e 's/ /, /g'`
+    func_modify_configure_in "(AC_CONFIG_FILES): Add $added_acoutput_pretty."
+  else
+    if grep '^AC_OUTPUT(' "$srcdir/$configure_in" > /dev/null; then
+      sed -e "s%^\\(AC_OUTPUT([^])\\,]*\\)%\\1$added_acoutput%" < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+      added_acoutput_pretty=`echo $added_acoutput | sed -e 's/ /, /g'`
+      func_modify_configure_in "(AC_OUTPUT): Add $added_acoutput_pretty."
+    else
+      please="$please
+Please add$added_acoutput to the AC_OUTPUT or AC_CONFIG_FILES invocation in the $configure_in file.
+"
+    fi
+  fi
+fi
+if test -n "$removed_acoutput"; then
+  for file in $removed_acoutput; do
+    tag=
+    sedprog='{
+      s%\([[ 	]\)'"$file"'[ 	]%\1%
+      s%\([[ 	]\)'"$file"'\([]),]\)%\1\2%
+      s%[[ 	]'"$file"'$%%
+        :a
+        tb
+        :b
+        s%\\$%\\%
+        tc
+        bd
+        :c
+        n
+        s%\([ 	]\)'"$file"'[ 	]%\1%
+        s%\([ 	]\)'"$file"'\([]),]\)%\1\2%
+        s%[ 	]'"$file"'$%%
+        ba
+      :d
+    }'
+    sed -e '/^AC_CONFIG_FILES(/'"$sedprog" < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+    if cmp -s "$srcdir/$configure_in" "$srcdir/$configure_in.tmp"; then
+      sed -e '/^AC_OUTPUT(/'"$sedprog" < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+      if cmp -s "$srcdir/$configure_in" "$srcdir/$configure_in.tmp"; then
+        :
+      else
+        tag=AC_OUTPUT
+      fi
+    else
+      tag=AC_CONFIG_FILES
+    fi
+    if test -n "$tag"; then
+      func_modify_configure_in "($tag): Remove $file."
+    else
+      rm -f "$srcdir/$configure_in.tmp"
+      if test "$file" != intl/intlh.inst; then
+        please="$please
+Please remove $file from the AC_OUTPUT or AC_CONFIG_FILES invocation
+in the $configure_in file.
+"
+      fi
+    fi
+  done
+fi
+sed -e 's%sed -e "/POTFILES =/r po/POTFILES" po/Makefile\.in > po/Makefile *;* *%%' < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+func_modify_configure_in "(AC_OUTPUT): Remove command that created po/Makefile."
+sed -e '/^\(dnl \|\)AC_LINK_FILES(\$nls_cv_header_libgt, \$nls_cv_header_intl)$/d' < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+func_modify_configure_in "(AC_LINK_FILES): Remove invocation."
+# AM_GNU_GETTEXT_VERSION may not be present, when AM_GNU_GETTEXT_REQUIRE_VERSION is used.
+if grep '^AM_GNU_GETTEXT_VERSION(' "$srcdir/$configure_in" 2>&1 >/dev/null; then
+  sed -e 's/^AM_GNU_GETTEXT_VERSION([^()]*)/AM_GNU_GETTEXT_VERSION(['"$archive_version"'])/' < "$srcdir/$configure_in" > "$srcdir/$configure_in.tmp"
+  func_modify_configure_in "(AM_GNU_GETTEXT_VERSION): Bump to $archive_version."
+fi
+$do_changelog && func_ChangeLog_finish
+
+# Recommend replacement for deprecated Makefile variables.
+use_libtool=`cat "$srcdir/$configure_in" | grep '^A[CM]_PROG_LIBTOOL'`
+for file in `(cd "$srcdir"; find . -name Makefile.am -print; find . -name Makefile.in -print) | sed -e 's,^\./,,'`; do
+  if test -f "$srcdir/$file"; then
+    if test `echo "$file" | sed -e 's,^.*/,,'` = Makefile.in && grep automake "$srcdir/$file" >/dev/null 2>&1; then
+      continue;
+    fi
+    # INTLLIBS is deprecated because it doesn't distinguish the two
+    # cases: with libtool, without libtool.
+    if grep '@''INTLLIBS''@' "$srcdir/$file" >/dev/null 2>&1; then
+      if test -n "$use_libtool"; then
+        please="$please
+Please change $file to use @""LTLIBINTL""@ or @""LIBINTL""@ instead of
+@""INTLLIBS""@. Which one, depends whether it is used with libtool or not.
+@""INTLLIBS""@ will go away.
+"
+      else
+        please="$please
+Please change $file to use @""LIBINTL""@ instead of @""INTLLIBS""@.
+@""INTLLIBS""@ will go away.
+"
+      fi
+    fi
+    # DATADIRNAME is deprecated because we install only .gmo files nowadays,
+    # which can be stored in the platform independent $prefix/share hierarchy.
+    if grep '@''DATADIRNAME''@' "$srcdir/$file" >/dev/null 2>&1; then
+      please="$please
+Please change $file to use the constant string \"share\" instead of
+@""DATADIRNAME""@. @""DATADIRNAME""@ will go away.
+"
+    fi
+    # INSTOBJEXT is deprecated because we install only .gmo files nowadays,
+    # no catgets .cat catalogs.
+    if grep '@''INSTOBJEXT''@' "$srcdir/$file" >/dev/null 2>&1; then
+      please="$please
+Please change $file to use the constant string \".mo\" instead of
+@""INSTOBJEXT""@. @""INSTOBJEXT""@ will go away.
+"
+    fi
+    # GENCAT is deprecated because we install no catgets catalogs anymore.
+    if grep '@''GENCAT''@' "$srcdir/$file" >/dev/null 2>&1; then
+      please="$please
+Please change $file to use the constant string \"gencat\" instead of
+@""GENCAT""@. @""GENCAT""@ will go away. Maybe you don't even need it any more?
+"
+    fi
+    # POSUB is deprecated because it causes "./configure --disable-nls", "make",
+    # "make dist" to create a buggy tarfile.
+    if grep '@''POSUB''@' "$srcdir/$file" >/dev/null 2>&1; then
+      please="$please
+Please change $file to use the constant string \"po\" instead of
+@""POSUB""@. @""POSUB""@ will go away.
+"
+    fi
+  fi
+done
+
+# Recommend replacement for deprecated configure variables.
+if grep '\$nls_cv_header_' "$srcdir/$configure_in" >/dev/null 2>&1; then
+  please="$please
+Please stop using \$nls_cv_header_intl or \$nls_cv_header_libgt in the
+$configure_in file. Both will go away. Use <libintl.h> or \"gettext.h\" instead.
+"
+fi
+
+# Recommend fetching config.guess and config.sub.
+if test -f "$srcdir/$auxdir"config.guess && test -f "$srcdir/$auxdir"config.sub; then
+  :
+else
+  please="$please
+You will also need config.guess and config.sub, which you can get from the CVS
+of the 'config' project at http://savannah.gnu.org/. The commands to fetch them
+are
+\$ wget 'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess'
+\$ wget 'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub'
+"
+fi
+
+if $doit; then
+  echo "$please"
+  echo "You might also want to copy the convenience header file gettext.h"
+  echo "from the $gettext_datadir directory into your package."
+  echo "It is a wrapper around <libintl.h> that implements the configure --disable-nls"
+  echo "option."
+  echo
+  count=`echo "$please" | grep '^$' | wc -l`
+  count=`echo "$count" | sed -e 's/[ 	]//g'`
+  case "$count" in
+    1) count="paragraph";;
+    2) count="two paragraphs";;
+    3) count="three paragraphs";;
+    4) count="four paragraphs";;
+    5) count="five paragraphs";;
+    *) count="$count paragraphs";;
+  esac
+  echo "Press Return to acknowledge the previous $count."
+  # Read from /dev/tty, not stdin, so that gettextize cannot be abused by
+  # non-interactive tools.
+fi
+
+exit 0
diff --git a/package/gettext-tiny/files/po/Makefile.in.in b/package/gettext-tiny/files/po/Makefile.in.in
new file mode 100644
index 0000000000..38c293d2ed
--- /dev/null
+++ b/package/gettext-tiny/files/po/Makefile.in.in
@@ -0,0 +1,483 @@
+# Makefile for PO directory in any package using GNU gettext.
+# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
+#
+# Copying and distribution of this file, with or without modification,
+# are permitted in any medium without royalty provided the copyright
+# notice and this notice are preserved.  This file is offered as-is,
+# without any warranty.
+#
+# Origin: gettext-0.19.8
+GETTEXT_MACRO_VERSION = 0.19
+
+PACKAGE = @PACKAGE@
+VERSION = @VERSION@
+PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
+
+SED = @SED@
+SHELL = /bin/sh
+ at SET_MAKE@
+
+srcdir = @srcdir@
+top_srcdir = @top_srcdir@
+VPATH = @srcdir@
+
+prefix = @prefix@
+exec_prefix = @exec_prefix@
+datarootdir = @datarootdir@
+datadir = @datadir@
+localedir = @localedir@
+gettextsrcdir = $(datadir)/gettext/po
+
+INSTALL = @INSTALL@
+INSTALL_DATA = @INSTALL_DATA@
+
+# We use $(mkdir_p).
+# In automake <= 1.9.x, $(mkdir_p) is defined either as "mkdir -p --" or as
+# "$(mkinstalldirs)" or as "$(install_sh) -d". For these automake versions,
+# @install_sh@ does not start with $(SHELL), so we add it.
+# In automake >= 1.10, @mkdir_p@ is derived from ${MKDIR_P}, which is defined
+# either as "/path/to/mkdir -p" or ".../install-sh -c -d". For these automake
+# versions, $(mkinstalldirs) and $(install_sh) are unused.
+mkinstalldirs = $(SHELL) @install_sh@ -d
+install_sh = $(SHELL) @install_sh@
+MKDIR_P = @MKDIR_P@
+mkdir_p = @mkdir_p@
+
+# When building gettext-tools, we prefer to use the built programs
+# rather than installed programs.  However, we can't do that when we
+# are cross compiling.
+CROSS_COMPILING = @CROSS_COMPILING@
+
+GMSGFMT_ = @GMSGFMT@
+GMSGFMT_no = @GMSGFMT@
+GMSGFMT_yes = @GMSGFMT_015@
+GMSGFMT = $(GMSGFMT_$(USE_MSGCTXT))
+MSGFMT_ = @MSGFMT@
+MSGFMT_no = @MSGFMT@
+MSGFMT_yes = @MSGFMT_015@
+MSGFMT = $(MSGFMT_$(USE_MSGCTXT))
+XGETTEXT_ = @XGETTEXT@
+XGETTEXT_no = @XGETTEXT@
+XGETTEXT_yes = @XGETTEXT_015@
+XGETTEXT = $(XGETTEXT_$(USE_MSGCTXT))
+MSGMERGE = msgmerge
+MSGMERGE_UPDATE = @MSGMERGE@ --update
+MSGINIT = msginit
+MSGCONV = msgconv
+MSGFILTER = msgfilter
+
+POFILES = @POFILES@
+GMOFILES = @GMOFILES@
+UPDATEPOFILES = @UPDATEPOFILES@
+DUMMYPOFILES = @DUMMYPOFILES@
+DISTFILES.common = Makefile.in.in remove-potcdate.sin \
+$(DISTFILES.common.extra1) $(DISTFILES.common.extra2) $(DISTFILES.common.extra3)
+DISTFILES = $(DISTFILES.common) Makevars POTFILES.in \
+$(POFILES) $(GMOFILES) \
+$(DISTFILES.extra1) $(DISTFILES.extra2) $(DISTFILES.extra3)
+
+POTFILES = \
+
+CATALOGS = @CATALOGS@
+
+POFILESDEPS_ = $(srcdir)/$(DOMAIN).pot
+POFILESDEPS_yes = $(POFILESDEPS_)
+POFILESDEPS_no =
+POFILESDEPS = $(POFILESDEPS_$(PO_DEPENDS_ON_POT))
+
+DISTFILESDEPS_ = update-po
+DISTFILESDEPS_yes = $(DISTFILESDEPS_)
+DISTFILESDEPS_no =
+DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
+
+# Makevars gets inserted here. (Don't remove this line!)
+
+.SUFFIXES:
+.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update
+
+.po.mo:
+	@echo "$(MSGFMT) -c -o $@ $<"; \
+	$(MSGFMT) -c -o t-$@ $< && mv t-$@ $@
+
+.po.gmo:
+	@lang=`echo $* | sed -e 's,.*/,,'`; \
+	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.po"; \
+	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
+
+.sin.sed:
+	sed -e '/^#/d' $< > t-$@
+	mv t-$@ $@
+
+
+all: all- at USE_NLS@
+
+all-yes: stamp-po
+all-no:
+
+# Ensure that the gettext macros and this Makefile.in.in are in sync.
+CHECK_MACRO_VERSION = \
+	test "$(GETTEXT_MACRO_VERSION)" = "@GETTEXT_MACRO_VERSION@" \
+	  || { echo "*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version $(GETTEXT_MACRO_VERSION) but the autoconf macros are from gettext version @GETTEXT_MACRO_VERSION@" 1>&2; \
+	       exit 1; \
+	     }
+
+# $(srcdir)/$(DOMAIN).pot is only created when needed. When xgettext finds no
+# internationalized messages, no $(srcdir)/$(DOMAIN).pot is created (because
+# we don't want to bother translators with empty POT files). We assume that
+# LINGUAS is empty in this case, i.e. $(POFILES) and $(GMOFILES) are empty.
+# In this case, stamp-po is a nop (i.e. a phony target).
+
+# stamp-po is a timestamp denoting the last time at which the CATALOGS have
+# been loosely updated. Its purpose is that when a developer or translator
+# checks out the package via CVS, and the $(DOMAIN).pot file is not in CVS,
+# "make" will update the $(DOMAIN).pot and the $(CATALOGS), but subsequent
+# invocations of "make" will do nothing. This timestamp would not be necessary
+# if updating the $(CATALOGS) would always touch them; however, the rule for
+# $(POFILES) has been designed to not touch files that don't need to be
+# changed.
+stamp-po: $(srcdir)/$(DOMAIN).pot
+	@$(CHECK_MACRO_VERSION)
+	test ! -f $(srcdir)/$(DOMAIN).pot || \
+	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
+	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
+	  echo "touch stamp-po" && \
+	  echo timestamp > stamp-poT && \
+	  mv stamp-poT stamp-po; \
+	}
+
+# Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
+# otherwise packages like GCC can not be built if only parts of the source
+# have been downloaded.
+
+# This target rebuilds $(DOMAIN).pot; it is an expensive operation.
+# Note that $(DOMAIN).pot is not touched if it doesn't need to be changed.
+# The determination of whether the package xyz is a GNU one is based on the
+# heuristic whether some file in the top level directory mentions "GNU xyz".
+# If GNU 'find' is available, we avoid grepping through monster files.
+$(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
+	package_gnu="$(PACKAGE_GNU)"; \
+	test -n "$$package_gnu" || { \
+	  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
+		 LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f \
+			       -size -10000000c -exec grep 'GNU @PACKAGE@' \
+			       /dev/null '{}' ';' 2>/dev/null; \
+	       else \
+		 LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+	       fi; \
+	     } | grep -v 'libtool:' >/dev/null; then \
+	     package_gnu=yes; \
+	   else \
+	     package_gnu=no; \
+	   fi; \
+	}; \
+	if test "$$package_gnu" = "yes"; then \
+	  package_prefix='GNU '; \
+	else \
+	  package_prefix=''; \
+	fi; \
+	if test -n '$(MSGID_BUGS_ADDRESS)' || test '$(PACKAGE_BUGREPORT)' = '@'PACKAGE_BUGREPORT'@'; then \
+	  msgid_bugs_address='$(MSGID_BUGS_ADDRESS)'; \
+	else \
+	  msgid_bugs_address='$(PACKAGE_BUGREPORT)'; \
+	fi; \
+	case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
+	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+	      --files-from=$(srcdir)/POTFILES.in \
+	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+	      --msgid-bugs-address="$$msgid_bugs_address" \
+	    ;; \
+	  *) \
+	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+	      --files-from=$(srcdir)/POTFILES.in \
+	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+	      --package-name="$${package_prefix}@PACKAGE@" \
+	      --package-version='@VERSION@' \
+	      --msgid-bugs-address="$$msgid_bugs_address" \
+	    ;; \
+	esac
+	test ! -f $(DOMAIN).po || { \
+	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
+	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
+	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po; \
+	    rm -f $(DOMAIN).1po; \
+	  fi; \
+	  if test -f $(srcdir)/$(DOMAIN).pot; then \
+	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
+	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
+	    if cmp $(DOMAIN).1po $(DOMAIN).2po >/dev/null 2>&1; then \
+	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(DOMAIN).po; \
+	    else \
+	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(srcdir)/$(DOMAIN).pot && \
+	      mv $(DOMAIN).po $(srcdir)/$(DOMAIN).pot; \
+	    fi; \
+	  else \
+	    mv $(DOMAIN).po $(srcdir)/$(DOMAIN).pot; \
+	  fi; \
+	}
+
+# This rule has no dependencies: we don't need to update $(DOMAIN).pot at
+# every "make" invocation, only create it when it is missing.
+# Only "make $(DOMAIN).pot-update" or "make dist" will force an update.
+$(srcdir)/$(DOMAIN).pot:
+	$(MAKE) $(DOMAIN).pot-update
+
+# This target rebuilds a PO file if $(DOMAIN).pot has changed.
+# Note that a PO file is not touched if it doesn't need to be changed.
+$(POFILES): $(POFILESDEPS)
+	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
+	if test -f "$(srcdir)/$${lang}.po"; then \
+	  test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot; \
+	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
+	  cd $(srcdir) \
+	    && { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \
+	           *) \
+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot;; \
+	         esac; \
+	       }; \
+	else \
+	  $(MAKE) $${lang}.po-create; \
+	fi
+
+
+install: install-exec install-data
+install-exec:
+install-data: install-data- at USE_NLS@
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+	  for file in $(DISTFILES.common) Makevars.template; do \
+	    $(INSTALL_DATA) $(srcdir)/$$file \
+			    $(DESTDIR)$(gettextsrcdir)/$$file; \
+	  done; \
+	  for file in Makevars; do \
+	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+	  done; \
+	else \
+	  : ; \
+	fi
+install-data-no: all
+install-data-yes: all
+	@catalogs='$(CATALOGS)'; \
+	for cat in $$catalogs; do \
+	  cat=`basename $$cat`; \
+	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+	  dir=$(localedir)/$$lang/LC_MESSAGES; \
+	  $(mkdir_p) $(DESTDIR)$$dir; \
+	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
+	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
+	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
+	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
+	    if test -n "$$lc"; then \
+	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
+	        link=`cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc | sed -e 's/^.* -> //'`; \
+	        mv $(DESTDIR)$(localedir)/$$lang/$$lc $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	        mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        (cd $(DESTDIR)$(localedir)/$$lang/$$lc.old && \
+	         for file in *; do \
+	           if test -f $$file; then \
+	             ln -s ../$$link/$$file $(DESTDIR)$(localedir)/$$lang/$$lc/$$file; \
+	           fi; \
+	         done); \
+	        rm -f $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	      else \
+	        if test -d $(DESTDIR)$(localedir)/$$lang/$$lc; then \
+	          :; \
+	        else \
+	          rm -f $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	          mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        fi; \
+	      fi; \
+	      rm -f $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo; \
+	      ln -s ../LC_MESSAGES/$(DOMAIN).mo $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo 2>/dev/null || \
+	      ln $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(DOMAIN).mo $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo 2>/dev/null || \
+	      cp -p $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(DOMAIN).mo $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo; \
+	      echo "installing $$realcat link as $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo"; \
+	    fi; \
+	  done; \
+	done
+
+install-strip: install
+
+installdirs: installdirs-exec installdirs-data
+installdirs-exec:
+installdirs-data: installdirs-data- at USE_NLS@
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+	else \
+	  : ; \
+	fi
+installdirs-data-no:
+installdirs-data-yes:
+	@catalogs='$(CATALOGS)'; \
+	for cat in $$catalogs; do \
+	  cat=`basename $$cat`; \
+	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+	  dir=$(localedir)/$$lang/LC_MESSAGES; \
+	  $(mkdir_p) $(DESTDIR)$$dir; \
+	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
+	    if test -n "$$lc"; then \
+	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
+	        link=`cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc | sed -e 's/^.* -> //'`; \
+	        mv $(DESTDIR)$(localedir)/$$lang/$$lc $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	        mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        (cd $(DESTDIR)$(localedir)/$$lang/$$lc.old && \
+	         for file in *; do \
+	           if test -f $$file; then \
+	             ln -s ../$$link/$$file $(DESTDIR)$(localedir)/$$lang/$$lc/$$file; \
+	           fi; \
+	         done); \
+	        rm -f $(DESTDIR)$(localedir)/$$lang/$$lc.old; \
+	      else \
+	        if test -d $(DESTDIR)$(localedir)/$$lang/$$lc; then \
+	          :; \
+	        else \
+	          rm -f $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	          mkdir $(DESTDIR)$(localedir)/$$lang/$$lc; \
+	        fi; \
+	      fi; \
+	    fi; \
+	  done; \
+	done
+
+# Define this as empty until I found a useful application.
+installcheck:
+
+uninstall: uninstall-exec uninstall-data
+uninstall-exec:
+uninstall-data: uninstall-data- at USE_NLS@
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  for file in $(DISTFILES.common) Makevars.template; do \
+	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+	  done; \
+	else \
+	  : ; \
+	fi
+uninstall-data-no:
+uninstall-data-yes:
+	catalogs='$(CATALOGS)'; \
+	for cat in $$catalogs; do \
+	  cat=`basename $$cat`; \
+	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
+	  for lc in LC_MESSAGES $(EXTRA_LOCALE_CATEGORIES); do \
+	    rm -f $(DESTDIR)$(localedir)/$$lang/$$lc/$(DOMAIN).mo; \
+	  done; \
+	done
+
+check: all
+
+info dvi ps pdf html tags TAGS ctags CTAGS ID:
+
+mostlyclean:
+	rm -f remove-potcdate.sed
+	rm -f stamp-poT
+	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
+	rm -fr *.o
+
+clean: mostlyclean
+
+distclean: clean
+	rm -f Makefile Makefile.in POTFILES *.mo
+
+maintainer-clean: distclean
+	@echo "This command is intended for maintainers to use;"
+	@echo "it deletes files that may require special tools to rebuild."
+	rm -f stamp-po $(GMOFILES)
+
+distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
+dist distdir:
+	test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
+	@$(MAKE) dist2
+# This is a separate target because 'update-po' must be executed before.
+dist2: stamp-po $(DISTFILES)
+	dists="$(DISTFILES)"; \
+	if test "$(PACKAGE)" = "gettext-tools"; then \
+	  dists="$$dists Makevars.template"; \
+	fi; \
+	if test -f $(srcdir)/$(DOMAIN).pot; then \
+	  dists="$$dists $(DOMAIN).pot stamp-po"; \
+	fi; \
+	if test -f $(srcdir)/ChangeLog; then \
+	  dists="$$dists ChangeLog"; \
+	fi; \
+	for i in 0 1 2 3 4 5 6 7 8 9; do \
+	  if test -f $(srcdir)/ChangeLog.$$i; then \
+	    dists="$$dists ChangeLog.$$i"; \
+	  fi; \
+	done; \
+	if test -f $(srcdir)/LINGUAS; then dists="$$dists LINGUAS"; fi; \
+	for file in $$dists; do \
+	  if test -f $$file; then \
+	    cp -p $$file $(distdir) || exit 1; \
+	  else \
+	    cp -p $(srcdir)/$$file $(distdir) || exit 1; \
+	  fi; \
+	done
+
+update-po: Makefile
+	$(MAKE) $(DOMAIN).pot-update
+	test -z "$(UPDATEPOFILES)" || $(MAKE) $(UPDATEPOFILES)
+	$(MAKE) update-gmo
+
+# General rule for creating PO files.
+
+.nop.po-create:
+	@lang=`echo $@ | sed -e 's/\.po-create$$//'`; \
+	echo "File $$lang.po does not exist. If you are a translator, you can create it through 'msginit'." 1>&2; \
+	exit 1
+
+# General rule for updating PO files.
+
+.nop.po-update:
+	@lang=`echo $@ | sed -e 's/\.po-update$$//'`; \
+	if test "$(PACKAGE)" = "gettext-tools" && test "$(CROSS_COMPILING)" != "yes"; then PATH=`pwd`/../src:$$PATH; fi; \
+	tmpdir=`pwd`; \
+	echo "$$lang:"; \
+	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
+	cd $(srcdir); \
+	if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+	       *) \
+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+	     esac; \
+	   }; then \
+	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
+	    rm -f $$tmpdir/$$lang.new.po; \
+	  else \
+	    if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
+	      :; \
+	    else \
+	      echo "msgmerge for $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
+	      exit 1; \
+	    fi; \
+	  fi; \
+	else \
+	  echo "msgmerge for $$lang.po failed!" 1>&2; \
+	  rm -f $$tmpdir/$$lang.new.po; \
+	fi
+
+$(DUMMYPOFILES):
+
+update-gmo: Makefile $(GMOFILES)
+	@:
+
+# Recreate Makefile by invoking config.status. Explicitly invoke the shell,
+# because execution permission bits may not work on the current file system.
+# Use @SHELL@, which is the shell determined by autoconf for the use by its
+# scripts, not $(SHELL) which is hardwired to /bin/sh and may be deficient.
+Makefile: Makefile.in.in Makevars $(top_builddir)/config.status @POMAKEFILEDEPS@
+	cd $(top_builddir) \
+	  && @SHELL@ ./config.status $(subdir)/$@.in po-directories
+
+force:
+
+# Tell versions [3.59,3.63) of GNU make not to export all variables.
+# Otherwise a system limit (for SysV at least) may be exceeded.
+.NOEXPORT:
diff --git a/package/gettext-tiny/files/po/Makevars.template b/package/gettext-tiny/files/po/Makevars.template
new file mode 100644
index 0000000000..0648ec7590
--- /dev/null
+++ b/package/gettext-tiny/files/po/Makevars.template
@@ -0,0 +1,78 @@
+# Makefile variables for PO directory in any package using GNU gettext.
+
+# Usually the message domain is the same as the package name.
+DOMAIN = $(PACKAGE)
+
+# These two variables depend on the location of this directory.
+subdir = po
+top_builddir = ..
+
+# These options get passed to xgettext.
+XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
+
+# This is the copyright holder that gets inserted into the header of the
+# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
+# package.  (Note that the msgstr strings, extracted from the package's
+# sources, belong to the copyright holder of the package.)  Translators are
+# expected to transfer the copyright for their translations to this person
+# or entity, or to disclaim their copyright.  The empty string stands for
+# the public domain; in this case the translators are expected to disclaim
+# their copyright.
+COPYRIGHT_HOLDER = Free Software Foundation, Inc.
+
+# This tells whether or not to prepend "GNU " prefix to the package
+# name that gets inserted into the header of the $(DOMAIN).pot file.
+# Possible values are "yes", "no", or empty.  If it is empty, try to
+# detect it automatically by scanning the files in $(top_srcdir) for
+# "GNU packagename" string.
+PACKAGE_GNU =
+
+# This is the email address or URL to which the translators shall report
+# bugs in the untranslated strings:
+# - Strings which are not entire sentences, see the maintainer guidelines
+#   in the GNU gettext documentation, section 'Preparing Strings'.
+# - Strings which use unclear terms or require additional context to be
+#   understood.
+# - Strings which make invalid assumptions about notation of date, time or
+#   money.
+# - Pluralisation problems.
+# - Incorrect English spelling.
+# - Incorrect formatting.
+# It can be your email address, or a mailing list address where translators
+# can write to without being subscribed, or the URL of a web page through
+# which the translators can contact you.
+MSGID_BUGS_ADDRESS =
+
+# This is the list of locale categories, beyond LC_MESSAGES, for which the
+# message catalogs shall be used.  It is usually empty.
+EXTRA_LOCALE_CATEGORIES =
+
+# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
+# context.  Possible values are "yes" and "no".  Set this to yes if the
+# package uses functions taking also a message context, like pgettext(), or
+# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
+USE_MSGCTXT = no
+
+# These options get passed to msgmerge.
+# Useful options are in particular:
+#   --previous            to keep previous msgids of translated messages,
+#   --quiet               to reduce the verbosity.
+MSGMERGE_OPTIONS =
+
+# These options get passed to msginit.
+# If you want to disable line wrapping when writing PO files, add
+# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
+# MSGINIT_OPTIONS.
+MSGINIT_OPTIONS =
+
+# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
+# has changed.  Possible values are "yes" and "no".  Set this to no if
+# the POT file is checked in the repository and the version control
+# program ignores timestamps.
+PO_DEPENDS_ON_POT = yes
+
+# This tells whether or not to forcibly update $(DOMAIN).pot and
+# regenerate PO files on "make dist".  Possible values are "yes" and
+# "no".  Set this to no if the POT file and PO files are maintained
+# externally.
+DIST_DEPENDS_ON_UPDATE_PO = yes
diff --git a/package/gettext-tiny/files/po/Rules-quot b/package/gettext-tiny/files/po/Rules-quot
new file mode 100644
index 0000000000..baf652858a
--- /dev/null
+++ b/package/gettext-tiny/files/po/Rules-quot
@@ -0,0 +1,58 @@
+# This file, Rules-quot, can be copied and used freely without restrictions.
+# Special Makefile rules for English message catalogs with quotation marks.
+
+DISTFILES.common.extra1 = quot.sed boldquot.sed en at quot.header en at boldquot.header insert-header.sin Rules-quot
+
+.SUFFIXES: .insert-header .po-update-en
+
+en at quot.po-create:
+	$(MAKE) en at quot.po-update
+en at boldquot.po-create:
+	$(MAKE) en at boldquot.po-update
+
+en at quot.po-update: en at quot.po-update-en
+en at boldquot.po-update: en at boldquot.po-update-en
+
+.insert-header.po-update-en:
+	@lang=`echo $@ | sed -e 's/\.po-update-en$$//'`; \
+	if test "$(PACKAGE)" = "gettext-tools" && test "$(CROSS_COMPILING)" != "yes"; then PATH=`pwd`/../src:$$PATH; GETTEXTLIBDIR=`cd $(top_srcdir)/src && pwd`; export GETTEXTLIBDIR; fi; \
+	tmpdir=`pwd`; \
+	echo "$$lang:"; \
+	ll=`echo $$lang | sed -e 's/@.*//'`; \
+	LC_ALL=C; export LC_ALL; \
+	cd $(srcdir); \
+	if $(MSGINIT) $(MSGINIT_OPTIONS) -i $(DOMAIN).pot --no-translator -l $$lang -o - 2>/dev/null \
+	   | $(SED) -f $$tmpdir/$$lang.insert-header | $(MSGCONV) -t UTF-8 | \
+	   { case `$(MSGFILTER) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	     '' | 0.[0-9] | 0.[0-9].* | 0.1[0-8] | 0.1[0-8].*) \
+	       $(MSGFILTER) $(SED) -f `echo $$lang | sed -e 's/.*@//'`.sed \
+	       ;; \
+	     *) \
+	       $(MSGFILTER) `echo $$lang | sed -e 's/.*@//'` \
+	       ;; \
+	     esac } 2>/dev/null > $$tmpdir/$$lang.new.po \
+	     ; then \
+	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
+	    rm -f $$tmpdir/$$lang.new.po; \
+	  else \
+	    if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
+	      :; \
+	    else \
+	      echo "creation of $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
+	      exit 1; \
+	    fi; \
+	  fi; \
+	else \
+	  echo "creation of $$lang.po failed!" 1>&2; \
+	  rm -f $$tmpdir/$$lang.new.po; \
+	fi
+
+en at quot.insert-header: insert-header.sin
+	sed -e '/^#/d' -e 's/HEADER/en at quot.header/g' $(srcdir)/insert-header.sin > en at quot.insert-header
+
+en at boldquot.insert-header: insert-header.sin
+	sed -e '/^#/d' -e 's/HEADER/en at boldquot.header/g' $(srcdir)/insert-header.sin > en at boldquot.insert-header
+
+mostlyclean: mostlyclean-quot
+mostlyclean-quot:
+	rm -f *.insert-header
diff --git a/package/gettext-tiny/files/po/boldquot.sed b/package/gettext-tiny/files/po/boldquot.sed
new file mode 100644
index 0000000000..4b937aa517
--- /dev/null
+++ b/package/gettext-tiny/files/po/boldquot.sed
@@ -0,0 +1,10 @@
+s/"\([^"]*\)"/?\1?/g
+s/`\([^`']*\)'/?\1?/g
+s/ '\([^`']*\)' / ?\1? /g
+s/ '\([^`']*\)'$/ ?\1?/g
+s/^'\([^`']*\)' /?\1? /g
+s/??/""/g
+s/?/?[1m/g
+s/?/[0m?/g
+s/?/?[1m/g
+s/?/[0m?/g
diff --git a/package/gettext-tiny/files/po/en at boldquot.header b/package/gettext-tiny/files/po/en at boldquot.header
new file mode 100644
index 0000000000..fedb6a06d1
--- /dev/null
+++ b/package/gettext-tiny/files/po/en at boldquot.header
@@ -0,0 +1,25 @@
+# All this catalog "translates" are quotation characters.
+# The msgids must be ASCII and therefore cannot contain real quotation
+# characters, only substitutes like grave accent (0x60), apostrophe (0x27)
+# and double quote (0x22). These substitutes look strange; see
+# http://www.cl.cam.ac.uk/~mgk25/ucs/quotes.html
+#
+# This catalog translates grave accent (0x60) and apostrophe (0x27) to
+# left single quotation mark (U+2018) and right single quotation mark (U+2019).
+# It also translates pairs of apostrophe (0x27) to
+# left single quotation mark (U+2018) and right single quotation mark (U+2019)
+# and pairs of quotation mark (0x22) to
+# left double quotation mark (U+201C) and right double quotation mark (U+201D).
+#
+# When output to an UTF-8 terminal, the quotation characters appear perfectly.
+# When output to an ISO-8859-1 terminal, the single quotation marks are
+# transliterated to apostrophes (by iconv in glibc 2.2 or newer) or to
+# grave/acute accent (by libiconv), and the double quotation marks are
+# transliterated to 0x22.
+# When output to an ASCII terminal, the single quotation marks are
+# transliterated to apostrophes, and the double quotation marks are
+# transliterated to 0x22.
+#
+# This catalog furthermore displays the text between the quotation marks in
+# bold face, assuming the VT100/XTerm escape sequences.
+#
diff --git a/package/gettext-tiny/files/po/en at quot.header b/package/gettext-tiny/files/po/en at quot.header
new file mode 100644
index 0000000000..a9647fc35c
--- /dev/null
+++ b/package/gettext-tiny/files/po/en at quot.header
@@ -0,0 +1,22 @@
+# All this catalog "translates" are quotation characters.
+# The msgids must be ASCII and therefore cannot contain real quotation
+# characters, only substitutes like grave accent (0x60), apostrophe (0x27)
+# and double quote (0x22). These substitutes look strange; see
+# http://www.cl.cam.ac.uk/~mgk25/ucs/quotes.html
+#
+# This catalog translates grave accent (0x60) and apostrophe (0x27) to
+# left single quotation mark (U+2018) and right single quotation mark (U+2019).
+# It also translates pairs of apostrophe (0x27) to
+# left single quotation mark (U+2018) and right single quotation mark (U+2019)
+# and pairs of quotation mark (0x22) to
+# left double quotation mark (U+201C) and right double quotation mark (U+201D).
+#
+# When output to an UTF-8 terminal, the quotation characters appear perfectly.
+# When output to an ISO-8859-1 terminal, the single quotation marks are
+# transliterated to apostrophes (by iconv in glibc 2.2 or newer) or to
+# grave/acute accent (by libiconv), and the double quotation marks are
+# transliterated to 0x22.
+# When output to an ASCII terminal, the single quotation marks are
+# transliterated to apostrophes, and the double quotation marks are
+# transliterated to 0x22.
+#
diff --git a/package/gettext-tiny/files/po/insert-header.sin b/package/gettext-tiny/files/po/insert-header.sin
new file mode 100644
index 0000000000..b26de01f6c
--- /dev/null
+++ b/package/gettext-tiny/files/po/insert-header.sin
@@ -0,0 +1,23 @@
+# Sed script that inserts the file called HEADER before the header entry.
+#
+# At each occurrence of a line starting with "msgid ", we execute the following
+# commands. At the first occurrence, insert the file. At the following
+# occurrences, do nothing. The distinction between the first and the following
+# occurrences is achieved by looking at the hold space.
+/^msgid /{
+x
+# Test if the hold space is empty.
+s/m/m/
+ta
+# Yes it was empty. First occurrence. Read the file.
+r HEADER
+# Output the file's contents by reading the next line. But don't lose the
+# current line while doing this.
+g
+N
+bb
+:a
+# The hold space was nonempty. Following occurrences. Do nothing.
+x
+:b
+}
diff --git a/package/gettext-tiny/files/po/quot.sed b/package/gettext-tiny/files/po/quot.sed
new file mode 100644
index 0000000000..0122c46318
--- /dev/null
+++ b/package/gettext-tiny/files/po/quot.sed
@@ -0,0 +1,6 @@
+s/"\([^"]*\)"/?\1?/g
+s/`\([^`']*\)'/?\1?/g
+s/ '\([^`']*\)' / ?\1? /g
+s/ '\([^`']*\)'$/ ?\1?/g
+s/^'\([^`']*\)' /?\1? /g
+s/??/""/g
diff --git a/package/gettext-tiny/files/po/remove-potcdate.sin b/package/gettext-tiny/files/po/remove-potcdate.sin
new file mode 100644
index 0000000000..2436c49e78
--- /dev/null
+++ b/package/gettext-tiny/files/po/remove-potcdate.sin
@@ -0,0 +1,19 @@
+# Sed script that remove the POT-Creation-Date line in the header entry
+# from a POT file.
+#
+# The distinction between the first and the following occurrences of the
+# pattern is achieved by looking at the hold space.
+/^"POT-Creation-Date: .*"$/{
+x
+# Test if the hold space is empty.
+s/P/P/
+ta
+# Yes it was empty. First occurrence. Remove the line.
+g
+d
+bb
+:a
+# The hold space was nonempty. Following occurrences. Do nothing.
+x
+:b
+}
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
new file mode 100644
index 0000000000..3b0b73d047
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -0,0 +1,2 @@
+# Locally Computed:
+sha256 40a003e850ae8c29b8e6e6321925596c3a57d7ae8296d880dc1e88a07aebcd93  gettext-tiny-f733dd3fdd7be973f523a464165aae827a17d838.tar.gz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
new file mode 100644
index 0000000000..cd4fdc9005
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -0,0 +1,84 @@
+################################################################################
+#
+# gettext-tiny
+#
+################################################################################
+
+GETTEXT_TINY_VERSION = f733dd3fdd7be973f523a464165aae827a17d838
+GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
+GETTEXT_TINY_LICENSE = MIT
+GETTEXT_TINY_INSTALL_STAGING = YES
+GETTEXT_TINY_LICENSE_FILES = LICENSE
+GETTEXT_TINY_PROVIDES = gettext
+
+ifneq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
+GETTEXT_TINY_OPTS = LIBINTL=NONE
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+GETTEXT_TINY_OPTS = LIBINTL=MUSL
+endif
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+GETTEXT_TINY_DEPENDENCIES = libiconv
+endif
+
+define GETTEXT_TINY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(GETTEXT_TINY_OPTS)
+endef
+
+define HOST_GETTEXT_TINY_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		$(GETTEXT_TINY_OPTS)
+endef
+
+define HOST_GETTEXT_TINY_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		prefix=$(HOST_DIR) install
+
+	$(INSTALL) -D -m 0755 $(GETTEXT_TINY_PKGDIR)/files/gettextize \
+		$(HOST_DIR)/bin
+	$(SED) "s:@prefix@:$(HOST_DIR):" $(HOST_DIR)/bin/gettextize
+
+	cp -r $(GETTEXT_TINY_PKGDIR)/files/po \
+		$(HOST_DIR)/share/gettext-tiny
+endef
+
+define GETTEXT_TINY_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(STAGING_DIR) prefix=/usr install
+endef
+
+define GETTEXT_TINY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
+
+define GETTEXT_TINY_REMOVE_UNNEEDED
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/gettext-tiny
+endef
+
+GETTEXT_TINY_POST_INSTALL_TARGET_HOOKS += GETTEXT_TINY_REMOVE_UNNEEDED
+
+# autoreconf expects gettextize to install ABOUT-NLS
+define HOST_GETTEXT_TINY_ADD_ABOUT_NLS
+	$(INSTALL) -m 0644 $(GETTEXT_TINY_PKGDIR)/files/ABOUT-NLS \
+		$(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
+endef
+
+HOST_GETTEXT_TINY_POST_INSTALL_HOOKS += HOST_GETTEXT_TINY_ADD_ABOUT_NLS
+
+ifeq ($(BR2_PACKAGE_GETTEXT_TINY),y)
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) \
+	     AUTOM4TE=$(HOST_DIR)/bin/autom4te \
+	     gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny \
+	     $(HOST_DIR)/bin/gettextize -f
+endif
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 9546468571..176c771161 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -7,7 +7,7 @@ if BR2_PACKAGE_GETTEXT
 config BR2_PACKAGE_GETTEXT_GNU
 	bool "gettext-gnu"
 	default y
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR && !BR2_PACKAGE_GETTEXT_TINY
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
@@ -22,6 +22,20 @@ config BR2_PACKAGE_GETTEXT_GNU
 comment "gettext-gnu needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+comment "gettext-gnu can't be enabled with gettext-tiny"
+	depends on BR2_PACKAGE_GETTEXT_TINY
+
+config BR2_PACKAGE_GETTEXT_TINY
+	bool "gettext-tiny"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  gettext-tiny provides lightweight replacements for tools typically
+	  used from the GNU gettext suite, which is incredibly bloated and
+	  takes a lot of time to build (in the order of an hour on slow
+	  devices).
+
+	  https://github.com/sabotage-linux/gettext-tiny
+
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
 	default y if BR2_SYSTEM_ENABLE_NLS
@@ -30,12 +44,14 @@ config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 config BR2_PACKAGE_PROVIDES_GETTEXT
 	string
 	default "gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
+	default "gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY
 
 config BR2_PACKAGE_HAS_GETTEXT
 	bool
 
 config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
 	string
-	default "host-gettext-gnu"
+	default "host-gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
+	default "host-gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY
 
 endif
-- 
2.14.1
