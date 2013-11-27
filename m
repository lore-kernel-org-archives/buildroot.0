From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Wed, 27 Nov 2013 16:45:36 +0000
Subject: [Buildroot] libglib2 (or maybe libffi) build failure
In-Reply-To: <20131127173755.6019dd2f@skate>
References: <52960F8C.5040003@newflow.co.uk>	<20131127171511.2abd4873@skate>	<52961D17.6020904@newflow.co.uk>
 <20131127173755.6019dd2f@skate>
Message-ID: <529621B0.60106@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/13 16:37, Thomas Petazzoni wrote:
> Dear Mark Jackson,
> 
> On Wed, 27 Nov 2013 16:25:59 +0000, Mark Jackson wrote:
> 
>>> Interesting, thanks. Can you see in output/staging/usr/lib/pkgconfig/
>>> if you have the file named libffi.pc ?
>>
>> Yes ...
>>
>> $ ls output/staging/usr/lib/pkgconfig/ -la
>> total 64
>> drwxrwxr-x 2 mpfj mpfj 4096 Nov 27 15:14 .
>> drwxrwxr-x 9 mpfj mpfj 4096 Nov 27 15:14 ..
>> -rw-r--r-- 1 mpfj mpfj  258 Nov  6 12:35 avahi-core.pc
>> -rw-r--r-- 1 mpfj mpfj  508 Nov 27 10:06 dbus-1.pc
>> -rw-r--r-- 1 mpfj mpfj  221 Nov 25 12:06 expat.pc
>> -rw-r--r-- 1 mpfj mpfj  255 Nov  6 12:36 libcrypto.pc
>> -rw-r--r-- 1 mpfj mpfj  260 Nov  6 12:35 libdaemon.pc
>> -rw-r--r-- 1 mpfj mpfj  169 Nov 27 15:14 libffi.pc
>> -rw-r--r-- 1 mpfj mpfj  222 Nov  6 12:36 libnl-3.0.pc
>> -rw-r--r-- 1 mpfj mpfj  298 Nov  6 12:36 libnl-cli-3.0.pc
>> -rw-r--r-- 1 mpfj mpfj  236 Nov  6 12:36 libnl-genl-3.0.pc
>> -rw-r--r-- 1 mpfj mpfj  240 Nov  6 12:36 libnl-nf-3.0.pc
>> -rw-r--r-- 1 mpfj mpfj  245 Nov  6 12:36 libnl-route-3.0.pc
>> -rw-r--r-- 1 mpfj mpfj  270 Nov  6 12:36 libssl.pc
>> -rw-r--r-- 1 mpfj mpfj  280 Nov  6 12:36 openssl.pc
>> -rw-r--r-- 1 mpfj mpfj  252 Nov 27 10:08 zlib.pc
> 
> Ok. What does libffi.pc contains?

$ cat output/staging/usr/lib/pkgconfig/libffi.pc 
prefix=/usr
exec_prefix=/usr
libdir=${exec_prefix}/lib

Name: libffi
Description: Library supporting Foreign Function Interfaces
Version: 3.0.13
Libs: -L${libdir} -lffi

>>> If that's the case, then, can you try:
>>>
>>> 	./output/host/usr/bin/pkg-config --list-all
>>>
>>> and see if libffi is part of the list ?
>>
>> No ...
>>
>> $ ./output/host/usr/bin/pkg-config --list-all 
>> libnl-route-3.0                libnl-route - Netlink Routing Family Library
>> avahi-core                     avahi-core - Avahi Multicast DNS Responder (Embeddable Stack)
>> zlib                           zlib - zlib compression library
>> libssl                         OpenSSL - Secure Sockets Layer and cryptography libraries
>> libnl-3.0                      libnl - Convenience library for netlink sockets
>> libnl-genl-3.0                 libnl-genl - Generic Netlink Library
>> libnl-nf-3.0                   libnl-nf - Netfilter Netlink Library
>> libnl-cli-3.0                  libnl-cli - Command Line Interface library for netlink sockets
>> libcrypto                      OpenSSL-libcrypto - OpenSSL cryptography library
>> openssl                        OpenSSL - Secure Sockets Layer and cryptography libraries and tools
>> libdaemon                      libdaemon - a lightweight C library that eases the writing of UNIX daemons
> 
> Weird, that matches more or less the contents of the usr/lib/pkgconfig
> directory above, with the exception of dbus-1, expat, libcrypto and
> libffi.
> 
>>> If that's the case, can you pastebin (http://code.bulix.org) the entire
>>> output/build/libglib2-2.36.3/config.log file, and give us the URL at
>>> which it was posted?
>>
>> http://code.bulix.org/aq3veb-85084
> 
> Ok. Nothing interesting here.
> 
>>> Finally, can you inspect your environment (by running "env") to see if
>>> there's anything suspicious. Ideally, giving your environment might be
>>> useful, but read it first to remove any personal stuff from it, if
>>> applicable.
>>
>> http://code.bulix.org/ng3wku-85083
> 
> However here, I see:
> 
> PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/mpfj/buildroot/output/host/usr/bin
> 
> So you have /home/mpfj/buildroot/output/host/usr/bin but the failing
> build takes place in /home/mpjf/buildroot-bt/.
> 
> Can you remove /home/mpfj/buildroot/output/host/usr/bin from your PATH
> and try again?
> 
> To be honest, I don't quite see why this would be causing problems, but
> that's the only possibly "odd" thing that I see in your
> configuration/setup for the moment.

Still fails ...

$ echo $PATH
/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
$ make
>>> libglib2 2.36.3 Autoreconfiguring
...
>>> libglib2 2.36.3 Configuring
...
checking for stdint.h... yes
checking for unistd.h... yes
checking for LIBFFI... no
configure: error: Package requirements (libffi >= 3.0.0) were not met:

Package libffi was not found in the pkg-config search path.
Perhaps you should add the directory containing `libffi.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libffi' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables LIBFFI_CFLAGS
and LIBFFI_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
