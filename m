From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Apr 2021 23:54:11 +0200
Subject: [Buildroot] [PATCH 1/3] package/qpid-proton: fix build without
 threads
In-Reply-To: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
References: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
Message-ID: <20210402215411.GL24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-02 18:33 +0200, Fabrice Fontaine spake thusly:
> Build of qpid-proton is broken since bump to version 0.33.0 in commit
> d4c0fde91da0d79204a21ed8de1bd410efa1c4d6 because epoll proactor
> unconditonally uses pthread
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ec34da16a11f0600ecfbbbc4039e8210aea0498c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
> index b73ab8d6da..bbf953c472 100644
> --- a/package/qpid-proton/qpid-proton.mk
> +++ b/package/qpid-proton/qpid-proton.mk
> @@ -31,6 +31,14 @@ QPID_PROTON_CONF_OPTS = \
>  	-DENABLE_WARNING_ERROR=OFF \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
>  
> +# epoll proactor unconditionally uses pthread and cpp binding unconditionally
> +# uses proactor

I added a small clarification that 'CPP' in this context means C++, not
cpp. Ain't it confusing? ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> +QPID_PROTON_CONF_OPTS += \
> +	-DBUILD_CPP=OFF \
> +	-DPROACTOR=none
> +endif
> +
>  ifeq ($(BR2_PACKAGE_JSONCPP),y)
>  QPID_PROTON_DEPENDENCIES += jsoncpp
>  QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=ON
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
