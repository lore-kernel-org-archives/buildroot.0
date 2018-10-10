From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Oct 2018 23:05:02 +0200
Subject: [Buildroot] [PATCH v2,1/8] libselinux: bump to version 2.8
In-Reply-To: <20181010213528.4805f9e6@windsurf>
References: <20180921205013.21829-1-fontaine.fabrice@gmail.com>
 <20181010213528.4805f9e6@windsurf>
Message-ID: <CAPi7W80jBdoLui_B0UxRO1gB8mqoEi8pBbd78drTXk_8sn1EXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le mer. 10 oct. 2018 ? 21:35, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fabrice,
>
> On Fri, 21 Sep 2018 22:50:06 +0200, Fabrice Fontaine wrote:
>
> > - Use DESTDIR=$(HOST_DIR) instead of PREFIX=$(HOST_DIR) to install host
> >   variant
>
> Why do you do this ?

I will take the example of host-libsepol (this is the same for
host-libselinux)
Without this update, build of host-libsepol fails on:
install -m 755 libsepol.so.1 /lib
install: cannot create regular file '/lib/libsepol.so.1': Permission denied

It seems that 0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
and
https://github.com/SELinuxProject/selinux/commit/f8532f17731c82df9956aa1c92f7fb08bd65bf05
are not exactly the same.
Especially, it seems that LIBINSTALL = $(DESTDIR)$(LIBDIR) has not been
added in upstream.
upstream directly uses DESTDIR which is why I got a failure: install -m 755
$(LIBSO) $(DESTDIR)$(SHLIBDIR)
I don't know why there is such a difference but perhaps Marcus knows?
If Marcus confirms that this is a mistake, I can always add a patch to fix
this and send it upstream.

> Setting prefix to $(HOST_DIR) is the right thing
> to do for host packages, at least in the normal semantic of prefix and
> destdir, as defined by the autotools. I think Marcus patched the
> SELinux build system to restore a semantic of PREFIX and DESTDIR that
> matched the one of the autotools, but you're now going backward with
> doing DESTDIR=$(HOST_DIR).
>
> If the semantic of DESTDIR and PREFIX is standard, then:
>
>  - Target packages should use PREFIX=/usr DESTDIR=$(TARGET_DIR)
>
>  - Host packages should use PREFIX=$(HOST_DIR) and no DESTDIR at all
>
> Of course, this question applies to all SELinux packages in this series.
>
> > - Remove libselinux.so symbolic link for host variant (not needed)
>
> Is this removal really related to the bump ? Why is it unneeded ?
> Because the new 2.8 version creates this symlink properly at
> installation time ?
>
Indeed, I should remove this modification from this patch's serie.
This symlink was added by commit
https://git.buildroot.net/buildroot/commit/package/libsepol/libsepol.mk?id=12a9fb947c7b642b418c2615530207883a246ac3
on version 2.6.
However, the symlink is correctly done since version 2.7 (as
0002-revert-ln-relative.patch is already patching it).

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181010/76641c80/attachment.html>
