From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 16:57:22 +0200
Subject: [Buildroot] [PATCH v2,1/8] libselinux: bump to version 2.8
In-Reply-To: <CAPi7W80x4B9KVOBZnfw93XZVvzebaU2-fWb29vQ8D0e=h+=JGQ@mail.gmail.com>
References: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
 <20181010213528.4805f9e6@windsurf>
 <CAPi7W80jBdoLui_B0UxRO1gB8mqoEi8pBbd78drTXk_8sn1EXg@mail.gmail.com>
 <20181011095758.7beb2566@windsurf>
 <CAPi7W80x4B9KVOBZnfw93XZVvzebaU2-fWb29vQ8D0e=h+=JGQ@mail.gmail.com>
Message-ID: <20181011165722.0423fcff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 16:33:49 +0200, Fabrice Fontaine wrote:

> If I don't override SHLIBDIR, the shared library will be installed in
> SHLIBDIR (lib), headers in usr/include (INCDIR), man pages in
> usr/share/man/man3 (MAN3DIR) and static library in usr/lib (LIBDIR).
> 
> Then, the issue is how to remove --relative from the symbolic link
> creation in 0002-revert-ln-relative.patch:
> $(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO)
> $(DESTDIR)$(LIBDIR)/$(TARGET)
> 
> I can use a relative path but this seems a terrible solution:
> cd $(DESTDIR)$(LIBDIR) && ln -sf ../../lib/$(LIBSO) $(TARGET)

It's not too terrible. But it's also not horrible to have the libraries
in /usr/lib.

So, OK, let's settle for SHLIBDIR=/usr/lib, with a comment that
explains why.

> Removing this link is not an option as pkgconfig file publishes that
> libdir is equal to LIBDIR, not SHLIBDIR.
> So, it seems better to me to set SHLIBDIR to /usr/lib and take the
> assumption that LIBDIR=SHLIBDIR.

Yeah, OK, let's do this.

> But if you prefer to have relative paths, I can update the patch.
> As a side note, I do not understand why upstream want to have a
> different installation path for shared and static libraries, is it a
> common practice?

Yes, I think it is fairly common. The reason why they install the
SELinux libraries in /lib is because those libraries are typically used
by "core" programs installed in /bin and /sbin. Normally, programs
installed in /bin and /sbin should only use libraries in /lib, and /usr
may not (yet?) be available. This is for libraries needed at runtime,
i.e shared libraries.

However, static libraries are only needed during development, and
there's no need to have them in /lib.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
