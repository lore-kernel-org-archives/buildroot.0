From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2009 17:44:50 +0100
Subject: [Buildroot] On the usefulness of .la files and .pc files
Message-ID: <20090318174450.2641b85d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My question is slightly out of topic because it doesn't concern
Buildroot specifically, but as it concerns the autotools build system,
I thought I could share it with the list.

When compiling libraries using libtool, a .la file gets installed
in /usr/lib. It defines several informations such as :

 * The names of the library ;
 * The dependencies of the library ;
 * The directory where the library is installed ;
 * A few other informations.

Many libraries also install a .pc file in /usr/lib/pkgconfig/. It also
describe the dependencies, the library name, the flags to compile new
applications/libraries on top of the library, etc.

I can't figure out why there are two different mechanisms. From my
understanding, both of these files serve the same purpose : describe
how new applications/libraries can be built against the library. Am I
wrong ?

Let's take the example of libpng. It installs :

 * /usr/lib/libpng12.la, with things like

dlname='libpng12.so.0'
dependency_libs='-L/home/thomas/thirdparty/staging/usr/lib/ -lz -lm'
libdir='/usr/lib'

 * /usr/lib/pkgconfig/libpng12.pc, with :

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include/libpng12

Name: libpng
Description: Loads and saves PNG files
Version: 1.2.35
Libs: -L${libdir} -lpng12
Libs.private: -lz -lm 
Cflags: -I${includedir} 

 * /usr/bin/libpng12-config, which is a shell script that also
   basically gives the same information.

While I understand that /usr/bin/libpng12-config is a legacy script
that predates the widespread usage of pkg-config, I can't figure out
why both the .pc file and .la file are needed.

Any insight ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
