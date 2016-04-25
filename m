From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:15:56 +0200
Subject: [Buildroot] [PATCH 4/5] toolchain-external: align library
 locations in target and staging dir
In-Reply-To: <56F843D0.2030202@mind.be>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-5-git-send-email-patrickdepinguin@gmail.com>
 <56F843D0.2030202@mind.be>
Message-ID: <20160425231556.46640d32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Mar 2016 22:34:24 +0200, Arnout Vandecappelle wrote:

> >   package/glibc/glibc.mk                             |  2 +-
> >   toolchain/helpers.mk                               | 57 ++--------------------
> >   toolchain/toolchain-external/toolchain-external.mk | 39 ++++-----------
> >   3 files changed, 15 insertions(+), 83 deletions(-)
> 
>   -65 net lines, that's the kind of patch I like!

Me too!


> > +	LIBPATHS=`find $(STAGING_DIR) -follow -name "$${LIB}" 2>/dev/null` ; \
> 
>   -follow is documented as depracated, use -L instead. But why do we need this? 

I've applied after changing -follow to -L. Note that the -L needs to be
*before* $(STAGING_DIR), since the difference between -follow and -L is
that -L only applies to the arguments that *follow* it. And since
$(STAGING_DIR) is a symbolic link, we need -L before it.

> I tried without it and it seems to work just the same. I also don't think the 
> error redirect is needed anymore (at least when the -follow is removed).

I've left it as-is for now, those can be handled later if needed.

> >   	for LIBPATH in $${LIBPATHS} ; do \
> > +		DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
> 
>   I would have written this as
> 
> DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/\(.*\)/[^/]*,\1,"` ; \
> 
> but perhaps I'm too much of a regexp lover :-)

Yeah, I think I find Thomas DS version easier to understand.

> > +		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
> >   		while true ; do \
> 
>   I wonder if the loop is still needed now. As far as I can see, the idea of 
> this loop was to make sure that the library pointed to was also copied. But 
> since we now copy everything even if it is not in the expected lib path, it 
> shouldn't be needed anymore. Except if the library pointed to doesn't match the 
> glob pattern we are searching for... Anyway, that's something for a separate patch.

The library pointed to doesn't always match the glob pattern. Let's
take the case of uClibc. The pattern for the C library itself is:

	libc.so.*

But for uClibc, we have:

	libc.so.1 -> libuClibc-1.0.12.so

and libuClibc-1.0.12.so doesn't match libc.so.*.


> > +	$(Q)if test -z "$(BR2_STATIC_LIBS)" ; then \
> 
>   This can now be converted into a make condition instead of a shell condition, 
> which simplifies the logic even more. Well, actually, it could have been a make 
> condition from the start because all of the above doesn't do anything except set 
> some variables...

Before the previous patch, the installation of gdbserver was done as
part of the same variable, so that's why a make condition was not used.
But I've converted it to a make condition, now that it is possible.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
