From: Milton Soares Filho <milton.soares.filho@gmail.com>
Date: Sun, 18 Sep 2011 23:46:05 -0400
Subject: [Buildroot] [PATCH 1/1] external toolchain: slightly optimize
 the copy of the toolchain sysroot
In-Reply-To: <bf913e756e822eac217406309f3e423ca5dca580.1314826575.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826575.git.thomas.petazzoni@free-electrons.com>
 <bf913e756e822eac217406309f3e423ca5dca580.1314826575.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAPNngRNmyeCyFB_siN77pjAJwhuLWgYXuS-znGO8RQ9RORW3pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 August 2011 17:36, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The sysroot of an ARM CodeSourcery toolchain takes about 1.4 GB of
> space, but 1.1+ GB of this space consists in locale-related
> information which Buildroot doesn't use. By skipping the copy of those
> unused files, we save quite a bit of time while importing the
> toolchain sysroot.
> @@ -89,7 +92,7 @@ copy_toolchain_sysroot = \
> ? ? ? ?ARCH_SUBDIR="$(strip $3)"; \
> ? ? ? ?for i in etc lib sbin usr ; do \
> ? ? ? ? ? ? ? ?if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
> - ? ? ? ? ? ? ? ? ? ? ? cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
> + ? ? ? ? ? ? ? ? ? ? ? rsync -au --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
> ? ? ? ? ? ? ? ?fi ; \
> ? ? ? ?done ; \

I've been doing a similar thing to avoid copying unneeded stuff from a
"non-pure" toolchain (STLinux toolchain), but by using a blacklist
file and rsync's --exclude-from option.

Would it be interesting to anyone else (besides me) to have this
generic approach? It'd be a simple addition to this patch.

[]s, milton
