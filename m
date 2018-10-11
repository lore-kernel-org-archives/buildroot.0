From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:57:58 +0200
Subject: [Buildroot] [PATCH v2,1/8] libselinux: bump to version 2.8
In-Reply-To: <CAPi7W80jBdoLui_B0UxRO1gB8mqoEi8pBbd78drTXk_8sn1EXg@mail.gmail.com>
References: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
 <20181010213528.4805f9e6@windsurf>
 <CAPi7W80jBdoLui_B0UxRO1gB8mqoEi8pBbd78drTXk_8sn1EXg@mail.gmail.com>
Message-ID: <20181011095758.7beb2566@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 10 Oct 2018 23:05:02 +0200, Fabrice Fontaine wrote:

> I will take the example of host-libsepol (this is the same for
> host-libselinux)
> Without this update, build of host-libsepol fails on:
> install -m 755 libsepol.so.1 /lib
> install: cannot create regular file '/lib/libsepol.so.1': Permission denied
> 
> It seems that 0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
> and
> https://github.com/SELinuxProject/selinux/commit/f8532f17731c82df9956aa1c92f7fb08bd65bf05
> are not exactly the same.
> Especially, it seems that LIBINSTALL = $(DESTDIR)$(LIBDIR) has not been
> added in upstream.
> upstream directly uses DESTDIR which is why I got a failure: install -m 755
> $(LIBSO) $(DESTDIR)$(SHLIBDIR)
> I don't know why there is such a difference but perhaps Marcus knows?
> If Marcus confirms that this is a mistake, I can always add a patch to fix
> this and send it upstream.

OK, I see. They want to install the libraries to /lib and not /usr/lib,
which is why they don't prefix SHLIBDIR with $(PREFIX).

So, for the host installation, I would recommend to do this:

	PREFIX=$(HOST_DIR) SHLIBDIR=$(HOST_DIR)/lib

It is I believe semantically more correct than passing DESTDIR, even if
in practice it does exactly the same thing.

Also, for the target installation, why are you overriding SHLIBDIR to
be /usr/lib ? Any issue with keeping the libraries in /lib, like
upstream wants ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
