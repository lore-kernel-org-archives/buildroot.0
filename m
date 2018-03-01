From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Mar 2018 10:13:20 +0100
Subject: [Buildroot] util-linux pkg-config files point to build machine
 paths
In-Reply-To: <CAFOYHZBt8tGfL+vbT=jGLuGoGLp8CUNKjBuJ_Z7ArMTOj7gbJA@mail.gmail.com>
References: <CAFOYHZBt8tGfL+vbT=jGLuGoGLp8CUNKjBuJ_Z7ArMTOj7gbJA@mail.gmail.com>
Message-ID: <20180301101320.671394fe@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Thu, 1 Mar 2018 14:16:20 +1300, Chris Packham wrote:
> Hi Buildroot,
> 
> I imagine this will end-up on the util-linux mailing-list eventually
> but hopefully someone here can help me formulate an intelligent
> suggestion first.
> 
> If I build one of the libraries from util-linux the generated .pc
> refers to /usr/include instead of ${prefix}/include which makes
> cross-compilation interesting (particularly when the host doesn't have
> those files).
> 
> For example here's uuid.pc
> 
> prefix=/usr
> exec_prefix=/usr
> libdir=/usr/lib
> includedir=/usr/include
> 
> Name: uuid
> Description: Universally unique id library
> Version: 2.31.1
> Requires:
> Cflags: -I${includedir}/uuid
> Libs: -L${libdir} -luuid
> 
> Compare that with zlib.pc
> 
> prefix=/usr
> exec_prefix=${prefix}
> libdir=${exec_prefix}/lib
> sharedlibdir=${libdir}
> includedir=${prefix}/include
> 
> Name: zlib
> Description: zlib compression library
> Version: 1.2.11
> 
> Requires:
> Libs: -L${libdir} -L${sharedlibdir} -lz
> Cflags: -I${includedir}
> 
> But the .pc.in files that these were generated from are pretty
> similar. I assume it has something to do with the way these are
> generated. Does anyone have an intelligent suggestion for something to
> propose upstream or should I just patch the pc files after the fact?

The way uuid.pc is written is perfectly fine. See:

thomas at windsurf:~$ cat /usr/lib64/pkgconfig/uuid.pc 
prefix=/usr
exec_prefix=/usr
libdir=/usr/lib64
includedir=/usr/include

Name: uuid
Description: Universally unique id library
Version: 2.30.2
Requires:
Cflags: -I${includedir}/uuid
Libs: -L${libdir} -luuid
thomas at windsurf:~$ cat /usr/lib64/pkgconfig/uuid.pc 
prefix=/usr
exec_prefix=/usr
libdir=/usr/lib64
includedir=/usr/include

Name: uuid
Description: Universally unique id library
Version: 2.30.2
Requires:
Cflags: -I${includedir}/uuid
Libs: -L${libdir} -luuid
thomas at windsurf:~$ pkg-config --cflags uuid
-I/usr/include/uuid 
thomas at windsurf:~$ PKG_CONFIG_SYSROOT_DIR=/foo/bar/ pkg-config --cflags uuid
-I/foo/bar/usr/include/uuid 

I.e, pkg-config doesn't use the ${prefix} variable or anything like
that to prepend the sysroot location. The ${prefix} variable is just a
convenience to make the .pc file easier to read. But the
PKG_CONFIG_SYSROOT_DIR mechanism is independent of that. As you can see
above, despite uuid.pc not using ${prefix}, PKG_CONFIG_SYSROOT_DIR does
work as expected.

Therefore, unless I misunderstood your concern, I believe there is no
need to contact the util-linux guys :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
