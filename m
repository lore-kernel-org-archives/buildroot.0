From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 09:13:40 +0200
Subject: [Buildroot] [PATCH 08/11] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <87k0ys16gw.fsf@dell.be.48ers.dk>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-9-thomas.petazzoni@bootlin.com>
 <20200501212318.GD15673@scaer> <20200724195331.GI2296@scaer>
 <87k0ys16gw.fsf@dell.be.48ers.dk>
Message-ID: <20200725071340.GL2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-07-25 07:58 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Thomas, All,
>  > On 2020-05-01 23:23 +0200, Yann E. MORIN spake thusly:
>  >> On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
>  > [--SNIP--]
>  >> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  >> > +# $(1): base directory to search in
>  >> > +# $(2): suffix of file (optional)
>  >> > +define pkg_detect_overwrite_before
>  >> > +	cd $(1); \
>  >> > +	LC_ALL=C find . -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5
> 
>  > Note that this is very slow: it spawns a new md5sum process for each
>  > file it encounters.
> 
>  > There is a better solution, though:
> 
>  >     find $(1) -type f -print0 |xargs -0 md5sum > $($(PKG)_DIR)/.files$(2).md5
> 
> And perhaps add -r / --no-run-if-empty to xargs for good measure, even

Yes.

> if it is unlikely to be completely empty.

It would be for the skeleton and the host skeleton.

>  > Your original code took 11s (the second time, with a hot VFS cache),
>  > while my proposal got it down to 2s (again, hot VFS cache).
> 
>  > We could also try to parallelise the job:
> 
>  >     find $(1) -type f -print0 |xargs -P $(PARALLEL_JOBS) -0 md5sum > $($(PKG)_DIR)/.files$(2).md5
> 
> Will that not scramble the order of the hashes in the list?

But do we even care ? The order returned by find is not even guaranteed,
as this depends on the order of the entries in the directory anyway,
so...

Also, note that xargs will not run an md5sum process for each file, but
will coalesce multiple calls into a single one.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
