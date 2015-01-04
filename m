From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jan 2015 16:09:58 +0100
Subject: [Buildroot] [PATCH v2] package/dvb-app: handle static/shared
 only build
In-Reply-To: <1420375526-8806-1-git-send-email-romain.naour@openwide.fr>
References: <1420375526-8806-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150104150958.GB4137@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-01-04 13:45 +0100, Romain Naour spake thusly:
> Also remove tests since they require static libraries.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: remove tests (ThomasP)
>     rework static/shared handling logic
> ---
>  .../0003-handle-static-shared-only-build.patch     | 35 ++++++++++++++++++++++
>  .../dvb-apps/0003-support-static-only-build.patch  | 20 -------------
>  package/dvb-apps/0004-Makefile-remove-test.patch   | 27 +++++++++++++++++
>  package/dvb-apps/dvb-apps.mk                       |  4 ++-
>  4 files changed, 65 insertions(+), 21 deletions(-)
>  create mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
>  delete mode 100644 package/dvb-apps/0003-support-static-only-build.patch
>  create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch
> 
> diff --git a/package/dvb-apps/0003-handle-static-shared-only-build.patch b/package/dvb-apps/0003-handle-static-shared-only-build.patch
> new file mode 100644
> index 0000000..7a7d59a
> --- /dev/null
> +++ b/package/dvb-apps/0003-handle-static-shared-only-build.patch
> @@ -0,0 +1,35 @@
> +From f461e831f8c0ee9a59c9f194c0306eb73298396b Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Thu, 25 Dec 2014 19:22:16 +0100
> +Subject: [PATCH] Make.rules: Handle static/shared only build
> +
> +Do not build .a library when disable_static is set
> +Do not build .so library when disable_shared is set
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + Make.rules | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/Make.rules b/Make.rules
> +index 3410d7b..4add272 100644
> +--- a/Make.rules
> ++++ b/Make.rules
> +@@ -9,7 +9,13 @@ ifneq ($(lib_name),)
> + CFLAGS_LIB ?= -fPIC
> + CFLAGS += $(CFLAGS_LIB)
> + 
> +-libraries = $(lib_name).so $(lib_name).a
> ++ifeq ($(disable_static),)
> ++libraries = $(lib_name).a
> ++endif
> ++
> ++ifeq ($(disable_shared),)
> ++libraries += $(lib_name).so
> ++endif

I find it weird that one would need to _disable_stuff. I really prefer
we use positive logic whenever possible, it is much easier to understand.

What about:

    ifneq ($(enable_static),no)
    libraries += $(lib_name).a
    endif

    ifneq ($(enable_shared),no)
    libraries += $(lib_name).so
    endif

Ok, so this is negative logic _in_ the Makefile. It is still positive
from the caller::
  - by default both are built
  - it is possible to selectively disable each by passing enable_foo=no,
    which is not unlike the traditional way it is handled in autotools

[--SNIP--]
> diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
> index 892af63..a5037af 100644
> --- a/package/dvb-apps/dvb-apps.mk
> +++ b/package/dvb-apps/dvb-apps.mk
> @@ -16,7 +16,9 @@ DVB_APPS_LDLIBS += -liconv
>  endif
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> -DVB_APPS_MAKE_OPTS += static=1
> +DVB_APPS_MAKE_OPTS += disable_shared=1
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +DVB_APPS_MAKE_OPTS += disable_static=1
>  endif

So you'd get:

    ifeq ($(BR2_STATIC_LIBS),y)
    DVB_APPS_MAKE_OPTS += enable_shared=no
    endif
    ifeq ($(BR2_SHARED_LIBS),y)
    DVB_APPS_MAKE_OPTS += enable_static=no
    endif

Granted, it is very, very similar to what you're doing, but I really
prefer options to have positive logic, rather than negative. Also, I
believe this might be more easily upstreamable.

Note: I read Thomas' comment on the previous iteration, and it does
not seem like he said he would want disable_XXX variables instead of
enable_XXX. Thomas, what's your opinion?

Regards,
Yann E. MORIN.

>  DVB_APPS_INSTALL_STAGING = YES
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
