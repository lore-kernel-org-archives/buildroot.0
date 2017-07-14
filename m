From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Jul 2017 10:41:31 +0200
Subject: [Buildroot] [PATCH] core/legal-info: use hash file from version
	sub-dir
In-Reply-To: <ebb72a4e-7e47-1d4a-9a69-1fe05a1e3ec8@lucaceresoli.net>
References: <20170713221924.12021-1-yann.morin.1998@free.fr>
 <c5635e76-c4fe-bf03-1215-a77cca5fa143@microchip.com>
 <ebb72a4e-7e47-1d4a-9a69-1fe05a1e3ec8@lucaceresoli.net>
Message-ID: <20170714084131.GB3373@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2017-07-14 09:39 +0200, Luca Ceresoli spake thusly:
> On 14/07/2017 01:32, Joshua Henderson wrote:
> > Yann,
> > 
> > On 07/13/2017 03:19 PM, Yann E. MORIN wrote:
> > 
> >> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> >> index accf48c464..f285395267 100644
> >> --- a/package/pkg-utils.mk
> >> +++ b/package/pkg-utils.mk
> >> @@ -86,9 +86,12 @@ endef
> >>  define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
> >>  	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
> >>  	{ \
> >> -		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
> >> -		ret=$${?}; \
> >> -		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
> >> +		if [ -d $(3)/$($(PKG)_VERSION) ]; then \
> >> +			support/download/check-hash $(3)/$($(PKG)_VERSION)/$(1).hash $(5) $(4); \
> >> +		else \
> >> +			support/download/check-hash $(3)/$(1).hash $(5) $(4); \
> >> +		fi; \
> >> +		case $${?} in (0|3) ;; (*) exit 1;; esac; \
> >>  	} && \
> >>  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
> >>  endef
> >>
> > 
> > I think this has unintended side effects.  If there is already a $(PKG)_VERSION directory for patches, 
> > it will look for the hash file there even if there are no hash file differences, which results in missing
> > license file hash.
> > 
> > I believe it would work if you test -f on the actual .hash file instead of just the directory.  But, do note
> > that if there are multiple license files per package, and only one of them is different, this still results
> > in putting all hashes including duplicate ones in separate hash files.
> 
> I agree with Josh here.
> 
> A cleaner solution would be to put only version-bound hashes in
> version-named subdirs, and leave all other hashes in the base directory.
> This would remove all duplication and avoid unintended disabling of all
> hashes when one <version>/*.hash file is created, which would happen
> only for those versions that actually have that file.

See my reply to Joshua: I would favour the opposite, in fact, to move
all hashes to the per-version directory, even if there is duplication.

> I think this can be achieved in a simple way by cat-ing together
> $(3)/$(1).hash and $(3)/$($(PKG)_VERSION)/$(1).hash in a temporary file
> and feed that to check-hash. Additionally if check-hash were able to
> read the hashes from stdin, no temporary file would be even needed, but
> this is not necessarily a good idea.

cat-ing to a temporary file will bneed that we arrange for a trickier
code, because we need a unique filename for when we want to support
TLPB.

As for stdin, this would be doable quite easily, we just need to
recognise '-' as stdin, like almost all of the rest of the world. ;-)

But still, my preference would be to move hashes to the per-version
directory. All hashes, not just license ones.

In the meantime, I've marked the patch as 'changes requested'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
