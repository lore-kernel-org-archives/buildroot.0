From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 21 Nov 2019 18:14:27 +0000
Subject: [Buildroot] [PATCH 1/2] package/gmpc: needs -lm
In-Reply-To: <20191119194247.2376e81e@gmx.net>
References: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
 <20191108220442.4b596996@windsurf> <20191108222841.4ff8debf@gmx.net>
 <c16fab60-ebf2-106e-962f-c2595472803d@mind.be>
 <20191117212001.6907f54a@gmx.net> <20191117214818.4d68ae6f@gmx.net>
 <df61ba8d-99d4-f16b-50ed-3e7ae28e4962@mind.be>
 <20191118234238.363e7c04@gmx.net> <20191118234722.21f79c8f@windsurf.home>
 <56bd6374-c235-1fa8-4e1f-c7137068a92b@codethink.co.uk>
 <CAPi7W83fDiF+iM4FZrPgAXvujqVXMHS66uCjs+s4=9R1F0qVhw@mail.gmail.com>
 <20191119194247.2376e81e@gmx.net>
Message-ID: <f807bbca-c991-d01e-9b43-6bfba4f5dcdb@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/2019 18:42, Peter Seiderer wrote:
> Hello *,
> 
> On Tue, 19 Nov 2019 18:58:03 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Dear all,
>>
>> Le mar. 19 nov. 2019 ? 17:18, Thomas Preston
>> <thomas.preston@codethink.co.uk> a ?crit :
>>>
>>> Hi Thomas Petazzoni, all,
>>> Thanks for bringing this to my attention.
>>>
>>> On 18/11/2019 22:47, Thomas Petazzoni wrote:  
>>>> Adding Thomas Preston in the loop. Thomas: one of your patch causes
>>>> some regression, see below.
>>>>  
>>>
>>> Before the pkgconf patch, `-lm` somehow made its way into the .la files:
>>>
>>>         gmpc-11.8.16-before-pkgconf-fix$ grep -lwr "\-lm"
>>>         ltmain.sh.orig
>>>         ltmain.sh
>>>         src/libeggsmclient.la
>>>         src/libeggdesktopfile.la
>>>         m4/libtool.m4
>>>         libtool
>>>
>>> In addition to this, there are lots of system include and libraries
>>> littering the Makefile (which should be handled by --sysroot):
>>>
>>>         -L/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib
>>>         -I/mnt/output/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include
>>>
>>> After the pkgconf patch, the gmpc build directory more closely resembles
>>> building upstream gmpc - which doesn't seem to require `-lm`. So why does
>>> it in buildroot?
> 
> It is not buildroot specific, but toolchain/libc specific (some implement the math
> functions in libc itself, some in the extra libm)....
> 
>>>
>>> gmpc-11.8.16$ cat fedora.Dockerfile
>>> FROM fedora:30
>>> RUN dnf install -y @development-tools
>>> RUN dnf install -y \
>>>         gob2 \
>>>         harfbuzz \
>>>         harfbuzz-devel \
>>>         intltool \
>>>         libICE \
>>>         libICE-devel \
>>>         libmpd-devel \
>>>         libSM \
>>>         libSM-devel \
>>>         libsoup-devel \
>>>         libvala \
>>>         libvala-devel \
>>>         pkgconf \
>>>         unique-devel \
>>>         vala
>>> WORKDIR /mnt
>>> CMD "/bin/bash"
>>>
>>> $ docker build -t build-gmpc - < fedora.Dockerfile
>>> $ docker run -it -v$PWD:/mnt build-gmpc ./configure --disable-mmkeys --disable-unique
>>> $ docker run -it -v$PWD:/mnt build-gmpc make
>>> $ ls -l src/gmpc
>>> -rwxr-xr-x 1 root root 5818944 Nov 19 15:52 src/gmpc
>>>
>>> Seems to work, without a -lm in sight:
>>>
>>> $ grep -rw "\-lm"
>>> ltmain.sh:        # a FreeBSD bug that causes programs to crash when -lm is
>>> m4/libtool.m4:  AC_CHECK_LIB(m, cos, LIBM="$LIBM -lm")
>>> m4/libtool.m4:  AC_CHECK_LIB(m, cos, LIBM="-lm")
>>> libtool:          # a FreeBSD bug that causes programs to crash when -lm is
>>>
>>> So I don't understand two things:
>>> 1. Where did `-lm` in the .la files come from before the pkgconf patch?
>>> 2. Why does upsteam gmpc build without `-lm`?  
>> This one is easy: we're using the latest release of gmpc that is 8 years old.
>> In this release, Math.ceil is used in
>> https://github.com/DaveDavenport/gmpc/blob/release-11.8.16/src/Widgets/GmpcVolume.vala.
>> Upstream removed this file 6 years ago through
>> https://github.com/DaveDavenport/gmpc/commit/11a7d247757dd29b51c77fda7470921fd254aae8#diff-645d920fce926ffdadd85c93c2d2cda2.
>> I assume that current gmpc does not use any math functions anymore.
> 
> Maybe a workaround for the gmpc case, remains the libvl42/libatomc [1] case which is about
> using dependent *.la files vs. ignoring dependent *.la files while linking...
> 

The gmpc package appears to be fixed with the same kind of patch as libv4l:

	diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
	index 40b77eb189..9c725db39d 100644
	--- a/package/gmpc/gmpc.mk
	+++ b/package/gmpc/gmpc.mk
	@@ -6,7 +6,8 @@

	 GMPC_VERSION = 11.8.16
	 GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
	-GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
	+GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY) \
	+       PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
	 GMPC_CONF_OPTS = --disable-mmkeys --disable-unique
	 GMPC_LICENSE = GPL-2.0+
	 GMPC_LICENSE_FILES = COPYING

This is because this package uses libtool, which expects to find .la files
in the system library dir.

Another solution might be to configure the main pkg-config wrapper so that
it always includes the system lib dirs (for libtool), but not system include
dirs (which breaks -isystem ordering).
