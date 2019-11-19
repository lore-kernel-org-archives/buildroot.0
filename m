From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Tue, 19 Nov 2019 16:18:48 +0000
Subject: [Buildroot] [PATCH 1/2] package/gmpc: needs -lm
In-Reply-To: <20191118234722.21f79c8f@windsurf.home>
References: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
 <20191108220442.4b596996@windsurf> <20191108222841.4ff8debf@gmx.net>
 <c16fab60-ebf2-106e-962f-c2595472803d@mind.be>
 <20191117212001.6907f54a@gmx.net> <20191117214818.4d68ae6f@gmx.net>
 <df61ba8d-99d4-f16b-50ed-3e7ae28e4962@mind.be>
 <20191118234238.363e7c04@gmx.net> <20191118234722.21f79c8f@windsurf.home>
Message-ID: <56bd6374-c235-1fa8-4e1f-c7137068a92b@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas Petazzoni, all,
Thanks for bringing this to my attention.

On 18/11/2019 22:47, Thomas Petazzoni wrote:
> Adding Thomas Preston in the loop. Thomas: one of your patch causes
> some regression, see below.
> 

Before the pkgconf patch, `-lm` somehow made its way into the .la files:

	gmpc-11.8.16-before-pkgconf-fix$ grep -lwr "\-lm"
	ltmain.sh.orig
	ltmain.sh
	src/libeggsmclient.la
	src/libeggdesktopfile.la
	m4/libtool.m4
	libtool

In addition to this, there are lots of system include and libraries
littering the Makefile (which should be handled by --sysroot):

	-L/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib
	-I/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include

After the pkgconf patch, the gmpc build directory more closely resembles
building upstream gmpc - which doesn't seem to require `-lm`. So why does
it in buildroot?

gmpc-11.8.16$ cat fedora.Dockerfile
FROM fedora:30
RUN dnf install -y @development-tools
RUN dnf install -y \
        gob2 \
        harfbuzz \
        harfbuzz-devel \
        intltool \
        libICE \
        libICE-devel \
        libmpd-devel \
        libSM \
        libSM-devel \
        libsoup-devel \
        libvala \
        libvala-devel \
        pkgconf \
        unique-devel \
        vala
WORKDIR /mnt
CMD "/bin/bash"

$ docker build -t build-gmpc - < fedora.Dockerfile
$ docker run -it -v$PWD:/mnt build-gmpc ./configure --disable-mmkeys --disable-unique
$ docker run -it -v$PWD:/mnt build-gmpc make
$ ls -l src/gmpc
-rwxr-xr-x 1 root root 5818944 Nov 19 15:52 src/gmpc

Seems to work, without a -lm in sight:

$ grep -rw "\-lm"
ltmain.sh:        # a FreeBSD bug that causes programs to crash when -lm is
m4/libtool.m4:  AC_CHECK_LIB(m, cos, LIBM="$LIBM -lm")
m4/libtool.m4:  AC_CHECK_LIB(m, cos, LIBM="-lm")
libtool:          # a FreeBSD bug that causes programs to crash when -lm is

So I don't understand two things:
1. Where did `-lm` in the .la files come from before the pkgconf patch?
2. Why does upsteam gmpc build without `-lm`?
