From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Oct 2018 16:33:49 +0200
Subject: [Buildroot] [PATCH v2,1/8] libselinux: bump to version 2.8
In-Reply-To: <20181011095758.7beb2566@windsurf>
References: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
 <20181010213528.4805f9e6@windsurf>
 <CAPi7W80jBdoLui_B0UxRO1gB8mqoEi8pBbd78drTXk_8sn1EXg@mail.gmail.com>
 <20181011095758.7beb2566@windsurf>
Message-ID: <CAPi7W80x4B9KVOBZnfw93XZVvzebaU2-fWb29vQ8D0e=h+=JGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le jeu. 11 oct. 2018 ? 09:58, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Wed, 10 Oct 2018 23:05:02 +0200, Fabrice Fontaine wrote:
>
> > I will take the example of host-libsepol (this is the same for
> > host-libselinux)
> > Without this update, build of host-libsepol fails on:
> > install -m 755 libsepol.so.1 /lib
> > install: cannot create regular file '/lib/libsepol.so.1': Permission denied
> >
> > It seems that 0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
> > and
> > https://github.com/SELinuxProject/selinux/commit/f8532f17731c82df9956aa1c92f7fb08bd65bf05
> > are not exactly the same.
> > Especially, it seems that LIBINSTALL = $(DESTDIR)$(LIBDIR) has not been
> > added in upstream.
> > upstream directly uses DESTDIR which is why I got a failure: install -m 755
> > $(LIBSO) $(DESTDIR)$(SHLIBDIR)
> > I don't know why there is such a difference but perhaps Marcus knows?
> > If Marcus confirms that this is a mistake, I can always add a patch to fix
> > this and send it upstream.
>
> OK, I see. They want to install the libraries to /lib and not /usr/lib,
> which is why they don't prefix SHLIBDIR with $(PREFIX).
>
> So, for the host installation, I would recommend to do this:
>
>         PREFIX=$(HOST_DIR) SHLIBDIR=$(HOST_DIR)/lib
>
> It is I believe semantically more correct than passing DESTDIR, even if
> in practice it does exactly the same thing.
>
> Also, for the target installation, why are you overriding SHLIBDIR to
> be /usr/lib ? Any issue with keeping the libraries in /lib, like
> upstream wants ?
If I don't override SHLIBDIR, the shared library will be installed in
SHLIBDIR (lib), headers in usr/include (INCDIR), man pages in
usr/share/man/man3 (MAN3DIR) and static library in usr/lib (LIBDIR).

Then, the issue is how to remove --relative from the symbolic link
creation in 0002-revert-ln-relative.patch:
$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO)
$(DESTDIR)$(LIBDIR)/$(TARGET)

I can use a relative path but this seems a terrible solution:
cd $(DESTDIR)$(LIBDIR) && ln -sf ../../lib/$(LIBSO) $(TARGET)

Removing this link is not an option as pkgconfig file publishes that
libdir is equal to LIBDIR, not SHLIBDIR.
So, it seems better to me to set SHLIBDIR to /usr/lib and take the
assumption that LIBDIR=SHLIBDIR.
But if you prefer to have relative paths, I can update the patch.
As a side note, I do not understand why upstream want to have a
different installation path for shared and static libraries, is it a
common practice?
>
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
