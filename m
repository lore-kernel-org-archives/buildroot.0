From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 20:09:51 +0200
Subject: [Buildroot] [PATCH 2/3] core/pkg-utils: check hashes of license
 files
In-Reply-To: <9cd75b50-7c0e-3adf-7573-d215ae5799e1@lucaceresoli.net>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
 <83d3e74a28e9d619d19dd2201dd4fbf9bebed743.1497772831.git.yann.morin.1998@free.fr>
 <9cd75b50-7c0e-3adf-7573-d215ae5799e1@lucaceresoli.net>
Message-ID: <20170625180951.GG3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2017-06-23 23:49 +0200, Luca Ceresoli spake thusly:
> On 18/06/2017 10:01, Yann E. MORIN wrote:
> > This will help catch a change of license even if the filename does
> > not change.
> > 
> > For now, a missing hash for the license files is not a fatal error, to
> > let people catch up and add them. When we switch to make it mandatory,
> > we can simplify the code by just removing the case statement.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  package/pkg-utils.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index e9ac56276f..accf48c464 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -85,5 +85,10 @@ endef
> >  
> >  define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
> >  	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
> > +	{ \
> > +		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
> > +		ret=$${?}; \
> > +		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
> > +	} && \
> 
> I generally agree with the idea, even more since the implementation is
> really a few-liner. But I have a few remarks.
> 
> The first is one of personal coding style taste. I don't like very much
> the weird check for values 0 and 3. It does not make any sense unless
> one opens check-hash and read the possible return values, which look a
> bit like a randomly-ordered enum.

Meh... It was not randomly ordered. At least, I tried to copme up with a
meaningful ordering, where the higher the error code, the more critical
the error...

> I'd rather prefer if we could call check-hash with a command line flag
> to ask that missing hashes generate a warning and return 0 instead of
> the default behavior. This would mean check-hash always returns 0 for
> "go" and non-zero for "abort".

Hmmm... Let's see...

> The second remark is about the output of 'make legal-info'. With this
> patch the output is:
> 
> $ make legal-info
> >>>   Collecting legal info
> WARNING: no hash file for COPYING
> WARNING: no hash file for COPYING
> WARNING: no hash file for COPYING3
> WARNING: no hash file for COPYING.LIB
> WARNING: no hash file for COPYING.LESSERv3
> WARNING: no hash file for COPYINGv2
> ...
> 
> There's no mention of the package involved, which doesn't help
> in fixing it. It should print the package name, e.g.:
> 
> $ make legal-info
> >>>   Collecting legal info
> WARNING: binutils: no hash file for COPYING
> WARNING: mpc:      no hash file for COPYING
> ...
> 
> To achieve this I guess we'll need to pass the package name to
> check-hash. It doesn't hurt if we add the package name unconditionally,
> even to currently existing messages where it is not needed.

Or just change legal-info to call MESSAGE, like so:

   838 $(1)-legal-info: PKG=$(2)
   839 $(1)-legal-info:
   840 ?   @$$(call MESSAGE,"Collecting legal info")

Which provides an output like:

    >>> busybox 1.26.2 Collecting legal info
    ERROR: No hash found for LICENSE

Would that be OK for you?

Note however that running legal-info from within a clean (configured but
not built) tree yields a lot of output, because the packages are
extrated and patched, and the warnings during legal-info are lost across
the whole mess and difficult to catch.

Regards,
Yann E. MORIN.

> -- 
> Luca

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
