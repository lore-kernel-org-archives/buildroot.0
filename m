From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Sep 2014 00:11:31 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-infra: make timing of steps optional
In-Reply-To: <1410578043-10682-2-git-send-email-danomimanchego123@gmail.com>
References: <1410578043-10682-1-git-send-email-danomimanchego123@gmail.com>
 <1410578043-10682-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140914221131.GF21222@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-09-12 23:14 -0400, Danomi Manchego spake thusly:
> Commit 17d4eb1e0261793a9f89e4a2253602c7ab926d2e added a hook to log timing
> of steps to a build-time.log file, which provides data for the "graph-build"
> target for examining build time stats.  If one uses buildroot on a daily
> basis as part of a build system, then its conceivable that there might be
> long periods of time between "make clean" ops.  So the log file continues
> to grow.  This patch makes the accumulation of the timing data optional, to
> avoid having a silent endlessly growing log in the build directory.

Well, it is ever growing, indeed, but its size is not that much, when
compared to the other generated artifacts:

    $ du -hs output
    1.7G    .
    $ ls -lh output/build/build-time.log
    -rw-rw-r-- 1 ymorin ymorin 33K Sep 14 23:55 output/build/build-time.log

But OK on principle. See a comment below...

[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 4b6d818..5f0256e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -48,12 +48,14 @@ endef
>  # Actual steps hooks
>  
>  # Time steps
> +ifneq ($(BR2_GATHER_BUILD_TIME_STATS),)

Please use positive logic:

    ifeq ($(BR2_GATHER_BUILD_TIME_STATS),y)

Regards,
Yann E. MORIN.

>  define step_time
>  	printf "%s:%-5.5s:%-20.20s: %s\n"           \
>  	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
>  	       >>"$(BUILD_DIR)/build-time.log"
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
> +endif
>  
>  # User-supplied script
>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
> -- 
> 1.9.1
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
