From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 20:01:04 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/clamav: New package
References: <1412459327-14020-1-git-send-email-bernd.kuhls@t-online.de>
 <87vbnprlcl.fsf@dell.be.48ers.dk>
Message-ID: <XnsA3C5CBA1C3ABDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi,

Peter Korsgaard <jacmet@uclibc.org> wrote in
news:87vbnprlcl.fsf at dell.be.48ers.dk: 

> > +Ptch submitted upstream:
> > https://bugzilla.clamav.net/show_bug.cgi?id=11132 
> 
> s/Ptch/Patch. I don't seem to have access to view that patch, even after
> creating an account :/

fixed typo. Regarding the bug report I even can not add you to the CC list
of the bug, their bugtracker is pretty restrictive when it comes to
accessing someone else's bugs... Shall I remove the bug reference from the
patch? 

> > +CLAMAV_LICENSE = GPLv2
> > +CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file
> > COPYING.getopt \ +     COPYING.LGPL COPYING.llvm COPYING.lzma
> > COPYING.regex COPYING.sha256 \ +     COPYING.unrar COPYING.zlib
> 
> While the entire clamav is indeed GPLv2, all these COPYING files are a
> fairly strong indication that the situation is more complicated than
> that, especially as it links with openssl.

Regarding OpenSSL I found this:
https://github.com/vrtadmin/clamav-devel/commit/5628bc85006c0efd4035ee2025c
b83e093d91237 

Could you please give me an advice on what
CLAMAV_LICENSE/CLAMAV_LICENSE_FILES should contain? 

> > +CLAMAV_AUTORECONF = YES
> 
> We normally add a comment about why this is done - E.G. something like:
> 
> # clamav-0002-static-linking.patch touches configure.ac

Done.

> > +CLAMAV_CONF_OPTS = \
> > +     --sysconfdir=/etc \
> 
> The autotools infrastructure already handles this, so it can be dropped.

Done.

> > +     --with-dbdir=/var/lib/clamav \
> > +     --with-openssl=$(STAGING_DIR)/usr \
> > +     --with-zlib=$(STAGING_DIR)/usr \
> > +     --disable-rpath \
> 
> Is openssl really a required dependency?

Yes:
https://github.com/vrtadmin/clamav-devel/blob/master/m4/reorganization/libs
/openssl.m4#L22 

> Doesn't clamav need a virus definition database to do anything? Where is
> that?

Clamav includes a binary, freshclam, which fetches the database:
https://raw.githubusercontent.com/vrtadmin/clamav-devel/master/docs/man/fre
shclam.1.in 

Regards, Bernd
