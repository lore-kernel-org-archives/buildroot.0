From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2011 09:07:39 +0200
Subject: [Buildroot] buildroot-2011.08, crosstool-ng-1.12.1, and Samba
In-Reply-To: <4E600F20.7010606@telesoft.com>
References: <4E600F20.7010606@telesoft.com>
Message-ID: <20110902090739.373ab82f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Scott,

Thanks for your report!

Le Thu, 01 Sep 2011 16:02:56 -0700,
Scott Dudley <scott@telesoft.com> a ?crit :

> I've been using buildroot + crosstool-ng targeted for i486 and glibc 
> successfully for some time.
> 
> I was asked today to include Samba in my target build.  Simple
> enough. Compiled without issue however both nmbd and smbd segfault on 
> execution.  If I run them interactively via the -i flag, I see much
> of the following:
> 
> init_iconv: Conversion from UTF-16LE to CP850 not supported
> init_iconv: Attempting to replace with conversion from UTF-16LE to
> ASCII init_iconv: Conversion from UTF-8 to CP850 not supported
> init_iconv: Attempting to replace with conversion from ASCII to ASCII
> init_iconv: Conversion from ANSI_X3.4-1968 to CP850 not supported
> init_iconv: Attempting to replace with conversion from ASCII to ASCII
> init_iconv: Conversion from CP850 to UTF-16LE not supported
> init_iconv: Attempting to replace with conversion from ASCII to
> UTF-16LE init_iconv: Conversion from CP850 to UTF-8 not supported
> init_iconv: Attempting to replace with conversion from ASCII to ASCII
> ...
> 
> I see no option in buildroot to build libiconv.

I guess your system lacks the gconv libraries. For example, in the
CodeSourcery toolchains, there are :

thomas at skate:~/x-tools/arm-2011.03$ find . | grep gconv
[...]
./arm-none-linux-gnueabi/libc/usr/include/gconv.h
./arm-none-linux-gnueabi/libc/usr/lib/gconv
./arm-none-linux-gnueabi/libc/usr/lib/gconv/IBM939.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/CP1257.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/ISO8859-13.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/GBK.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/EBCDIC-DK-NO.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/ISO8859-6.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/CP1258.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/MAC-UK.so
./arm-none-linux-gnueabi/libc/usr/lib/gconv/LATIN-GREEK-1.so
[...]

And Buildroot does not copy those files to the target automatically.
Maybe we need to extend the toolchain mechanism a bit to provide an
option to copy those files. Copying them all unconditionally is
unfortunately not really an option: the complete gconv directory
contains ~9 MB of libraries.

Which toolchain are you using ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
