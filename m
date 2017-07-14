From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Jul 2017 10:38:01 +0200
Subject: [Buildroot] [PATCH] core/legal-info: use hash file from version
	sub-dir
In-Reply-To: <c5635e76-c4fe-bf03-1215-a77cca5fa143@microchip.com>
References: <20170713221924.12021-1-yann.morin.1998@free.fr>
 <c5635e76-c4fe-bf03-1215-a77cca5fa143@microchip.com>
Message-ID: <20170714083801.GA3373@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2017-07-13 16:32 -0700, Joshua Henderson spake thusly:
> On 07/13/2017 03:19 PM, Yann E. MORIN wrote:
> 
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index accf48c464..f285395267 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -86,9 +86,12 @@ endef
> >  define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
> >  	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
> >  	{ \
> > -		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
> > -		ret=$${?}; \
> > -		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
> > +		if [ -d $(3)/$($(PKG)_VERSION) ]; then \
> > +			support/download/check-hash $(3)/$($(PKG)_VERSION)/$(1).hash $(5) $(4); \
> > +		else \
> > +			support/download/check-hash $(3)/$(1).hash $(5) $(4); \
> > +		fi; \
> > +		case $${?} in (0|3) ;; (*) exit 1;; esac; \
> >  	} && \
> >  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
> >  endef
> > 
> 
> I think this has unintended side effects.  If there is already a $(PKG)_VERSION directory for patches, 
> it will look for the hash file there even if there are no hash file differences, which results in missing
> license file hash.

This is the intended behaviour, yes: if there is a version choice, then
we _want_ the license hashes to be per version, even if they are the
same across versions. We do not want them in the 'main' hash file.

Yes, this means duplicated entries.

I was also wondering if we should also move the hashes for the
downlaoded files to be per-version as well, to keep things together.

Ie., we would have something like:

    package/qt5/qt5base/Config.in
    package/qt5/qt5base/qt5base.mk
    package/qt5/qt5base/5.6.2/*.patch
    package/qt5/qt5base/5.6.2/qt5base.hash
    package/qt5/qt5base/5.8.0/*.patch
    package/qt5/qt5base/5.8.0/qt5base.hash



> I believe it would work if you test -f on the actual .hash file instead of just the directory.

Again, if the directory exists, I intended that the main hash file was
not used at all.

>  But, do note
> that if there are multiple license files per package, and only one of them is different, this still results
> in putting all hashes including duplicate ones in separate hash files.

Yes, this is what I had in mind in this case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
