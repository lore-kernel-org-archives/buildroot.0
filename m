From: Sebastian Meisner <the-b@gmx.de>
Date: Tue, 19 Aug 2008 10:20:21 +0200
Subject: [Buildroot] gettext Segmentation Fault
Message-ID: <48AA8245.6000505@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I use the buildroot snapshot from 2008.08.05 and compile for a ARM
architecture. See the attached .config file.

I activated the gettext package and i18n support in the toolchain, as i need
localization support in shell scripts. These shell scripts generate some
webpages, that display their messages in different languages.

As soon as i set LC_ALL to de_DE or any other legal language code, gettext
segfaults:

# export LC_ALL=de_DE
# gettext "Hello"
Segmentation fault

But en_EN seems to be ok :

# export LC_ALL=en_EN
# gettext "Hello"
Hello#

As well as any random string:

# export LC_ALL=foo
# gettext "Hello"
Hello#

I 'ltrace'ed gettext and got the following output:

# export LC_ALL=de_DE
# ltrace gettext "Hello"
__uClibc_main(37544, 2, 0xbefb3dc4, 35696, 45824 <unfinished ...>
__errno_location()                               = 0x400b4470
getenv("TEXTDOMAIN")                             = NULL
getenv("TEXTDOMAINDIR")                          = NULL
strrchr("gettext", '/')                          = NULL
strncmp("gettext", "lt-", 3)                     = -5
setlocale(6, "" <unfinished ...>
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++

It crashes in the function "setlocale" which schould be part of the uClibc, right?

A normal run looks like this, with LC_ALL empty:

# ltrace gettext hello
__uClibc_main(37548, 2, 0xbea68dd4, 35700, 45828 <unfinished ...>
__errno_location()                               = 0x400b5470
getenv("TEXTDOMAIN")                             = NULL
getenv("TEXTDOMAINDIR")                          = NULL
strrchr("gettext", '/')                          = NULL
strncmp("gettext", "lt-", 3)                     = -5
setlocale(6, "")                                 = "C"
libintl_bindtextdomain(47140, 47016, 0, 0x400b5478, 0xbea68dd4) = 0x40014ce4
libintl_textdomain(47140, 0x4001d3d4, 284, 0, 0xbea68dd4) = 81960
__cxa_atexit(38652, 0, 0, 80860, 0xbea68dd4)     = 0
getopt_long(2, 0xbea68dd4, "+d:eEhnsV", 0xb9a8, NULL) = -1
fputs("hello", 0x400b515c)                       = 5
exit(0 <unfinished ...>
__errno_location()                               = 0x400b5470
ferror(0x400b515c)                               = 0
fflush(0x400b515chello)                               = 0
fclose(0x400b515c)                               = 0
__errno_location()                               = 0x400b5470
ferror(0x400b51c4)                               = 0
fflush(0x400b51c4)                               = 0
fclose(0x400b51c4)                               = 0
+++ exited (status 0) +++

I did a 'make uclibc-menuconfig' and checked the localization options, 
everything needed seems to be activated.

Is this a configuration problem?

Sebastian
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config-uclibc
Url: http://busybox.net/lists/buildroot/attachments/20080819/f0604ec6/attachment-0001.txt 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 14716 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080819/f0604ec6/attachment-0001.xml 
