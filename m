From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Wed, 16 Mar 2016 09:00:52 +0100
Subject: [Buildroot] [PATCH 2/2] xorriso: Add host variant
In-Reply-To: <20160315213537.GD5053@free.fr>
References: <1458050877-24342-1-git-send-email-benoit.allard@greenbone.net>
 <1458050877-24342-3-git-send-email-benoit.allard@greenbone.net>
 <20160315213537.GD5053@free.fr>
Message-ID: <20160316090052.4053f356@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Mar 2016 22:35:37 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
> > index e8bb5cb..9e9ec8a 100644
> > --- a/package/xorriso/xorriso.mk
> > +++ b/package/xorriso/xorriso.mk
> > @@ -8,6 +8,7 @@ XORRISO_VERSION = 1.4.2
> >  XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
> >  XORRISO_LICENSE = GPLv3+
> >  XORRISO_LICENSE_FILES = COPYING COPYRIGHT
> > +HOST_XORRISO_DEPENDENCIES =
> 
> Well, that part I am not so sure. Yes, it does build correectly, but
> it is highly dependent on the set of libraries (and their -dev files)
> being installed on your host distro.
> 
> So, either we set the dependency list to empty, but then we explicitly
> disable all optional features:
> 
>     HOST_XORRISO_DEPENDENCIES =
>     HOST_XORRISO_CONF_OPTS = \
>         --disable-libcdio \
>         --disable-libreadline \
>         --disable-libacl \
>         and so on...
> 
> or we enable all those for which we do have a host package and for
> which it makes sense (probably just acl, zlib and bzip2):
> 
>     HOST_XORRISO_DEPENDENCIES = host-acl host-zlib host-bzip2
>     HOST_XORRISO_CONF_OPTS = \
>         --enable-libacl \
>         --enable-zlib \
>         --enable-bzip2 \
>         --disable-libcdio
>         --disable-libreadline \
>         ...
> 
> Both are equally easy I guess. However, I think the latter is more
> interesting.

That makes sense of course ! I'll repost that patch with these options
and extend the CONF_OPTS with all the necessary disables, hopefully,
the needed features will still be included. I believe it makes sense to
`select` the correct packages in the Config.in.host as well, right ?

Regards,
Ben
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160316/b0cb1fae/attachment.asc>
