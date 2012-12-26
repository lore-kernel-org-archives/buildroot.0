From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Dec 2012 00:00:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: new package
In-Reply-To: <87d2xw78m1.fsf@dell.be.48ers.dk>
References: <cover.1356343037.git.yann.morin.1998@free.fr>
 <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
 <87d2xw78m1.fsf@dell.be.48ers.dk>
Message-ID: <201212270000.31554.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Wednesday 26 December 2012 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
>  Yann> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
>  Yann> new file mode 100644
>  Yann> index 0000000..679ca13
>  Yann> --- /dev/null
>  Yann> +++ b/package/tvheadend/Config.in
>  Yann> @@ -0,0 +1,20 @@
>  Yann> +comment "tvheadend requires a toolchain with WCHAR"
> 
> We normally add ' support' - E.G. WCHAR support.

OK.

> It also needs largefile support unless you override CFLAGS in the
> Makefile:
> 
> Makefile:CFLAGS  += -D_FILE_OFFSET_BITS=64

LARGE_FILES that will be, then. ;-)

>  Yann> diff --git a/package/tvheadend/tvheadend.init b/package/tvheadend/tvheadend.init
>  Yann> new file mode 100644
>  Yann> index 0000000..b05ec81
>  Yann> --- /dev/null
>  Yann> +++ b/package/tvheadend/tvheadend.init
>  Yann> @@ -0,0 +1,54 @@
>  Yann> +#! /bin/sh
>  Yann> +# Startup script inspired by the one in the package
> 
> It would be good to mention 'tvheadend' here.

OK.

>  Yann> +++ b/package/tvheadend/tvheadend.mk
[--SNIP--]
>  Yann> +#----------------------------------------------------------------------------
>  Yann> +# To run tvheadend, we need:
>  Yann> +#  - a non-root user to be safe, with its owned ${HOME}
>  Yann> +#  - a startup script, and its config file
>  Yann> +#  - a default DB with a tvheadend admin
>  Yann> +TVHEADEND_MKUSER = TARGET_DIR=$(TARGET_DIR) INSTALL=$(INSTALL) package/tvheadend/tvheadend.mkuser
>  Yann> +define TVHEADEND_CREATE_USER
>  Yann> +	$(TVHEADEND_MKUSER) mk_user
>  Yann> +	$(INSTALL) -D package/tvheadend/tvheadend.config  $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
>  Yann> +endef
>  Yann> +TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_CREATE_USER
>  Yann> +
>  Yann> +define TVHEADEND_PERMISSIONS
>  Yann> +	/home/tvheadend                                d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
>  Yann> +	/home/tvheadend/.hts                           d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
>  Yann> +	/home/tvheadend/.hts/tvheadend                 d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
>  Yann> +	/home/tvheadend/.hts/tvheadend/accesscontrol   d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
>  Yann> +	/home/tvheadend/.hts/tvheadend/accesscontrol/1 f 0600 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
>  Yann> +endef
> 
> I'm not really happy about the user handling here. I think we should
> either just add a static tvheadend user to system/skeleton/etc/passwd
> like we've done for ssh/hal/dbus/..

That will make for an ever-increasing list of users, most will probably
never, ever be usefull. I do not like that... :-(

I agree however that the solution above is less than ideal.

> , or come up with some generic
> infrastructure to handle it per package (like _PERMISSIONS) instead of
> something tvheadend specific.

Yes, that's something I'm thinking about...

Basically, I'd expect something like:

TVHEADEND_USER = tvheadend -1 -1 /home/tvheadend /bin/sh
FOO_USER = USERNAME UID GID HOME SHELL

  - if UID (GID) is -1, then a uid (gid) will be choosen arbitrarily.
  - if UID (GID) is >=0 and conflicts with an other entry, the build fails
  - if HOME is 'none', no home is created for that user
  - if SHELL is 'none', then the shell will be set to /bin/false

Then:
  - an entry is created in /etc/passwd, and the home is created before the
    package is configured (except if home=='none')
  - the home is chowned (except if home=='none') using a generated
    _PERMISSIONS variable

> We also normally don't touch /home. Can't tvheadend run as system daemon
> (still as a seperate user) instead?

It still needs a place where to store:
  - its runtime configuration (that is done through the web interface and
    creates new files)
  - the recordings

>  Yann> +
>  Yann> +define TVHEADEND_INSTALL_SYSV_STARTUP_FILES
>  Yann> +	$(INSTALL) -D package/tvheadend/tvheadend.default $(TARGET_DIR)/etc/default/tvheadend
>  Yann> +	$(INSTALL) -D package/tvheadend/tvheadend.init    $(TARGET_DIR)/etc/init.d/S99tvheadend
> 
> I personally prefer to keep the same names both in package/ and
> output/target (so S99tvheadend). Makes it easier to find the
> corresponding source files.

OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
