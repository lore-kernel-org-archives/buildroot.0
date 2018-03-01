From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 1 Mar 2018 14:16:20 +1300
Subject: [Buildroot] util-linux pkg-config files point to build machine paths
Message-ID: <CAFOYHZBt8tGfL+vbT=jGLuGoGLp8CUNKjBuJ_Z7ArMTOj7gbJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot,

I imagine this will end-up on the util-linux mailing-list eventually
but hopefully someone here can help me formulate an intelligent
suggestion first.

If I build one of the libraries from util-linux the generated .pc
refers to /usr/include instead of ${prefix}/include which makes
cross-compilation interesting (particularly when the host doesn't have
those files).

For example here's uuid.pc

prefix=/usr
exec_prefix=/usr
libdir=/usr/lib
includedir=/usr/include

Name: uuid
Description: Universally unique id library
Version: 2.31.1
Requires:
Cflags: -I${includedir}/uuid
Libs: -L${libdir} -luuid

Compare that with zlib.pc

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
sharedlibdir=${libdir}
includedir=${prefix}/include

Name: zlib
Description: zlib compression library
Version: 1.2.11

Requires:
Libs: -L${libdir} -L${sharedlibdir} -lz
Cflags: -I${includedir}

But the .pc.in files that these were generated from are pretty
similar. I assume it has something to do with the way these are
generated. Does anyone have an intelligent suggestion for something to
propose upstream or should I just patch the pc files after the fact?

Thanks,
Chris
