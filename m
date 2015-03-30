From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 23:21:07 +0200
Subject: [Buildroot] [PATCH 21/35] Makefile: simplify show-targets
In-Reply-To: <1427650429-9293-22-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150330212107.GF4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> show-targets is only used currently by the graph-depends script, which
> already recurses into the dependencies of the selected packages to
> build the dependency graph. Therefore, dumping the contents of
> $(PACKAGES) and $(ROOTFS_TARGETS) is sufficient: $(HOST_DEPS) and
> $(TARGET_HOST_DEPS) will contain packages that are dependencies of
> packages already listed in $(PACKAGES), which graph-depends will
> discover by itself.
> 
> This allows to remove one more usage of $(HOST_DEPS) and
> $(TARGET_HOST_DEPS), which is one more step towards their removal.

This means a lot of host packages no longer show up in show-targets.

See attached .config , and run show-targets before and after that patch
is applied:

    $ make show-targets |sed -r -e 's/ /\n/g' |sort >targets.before
    [apply patch]
    $ make show-targets |sed -r -e 's/ /\n/g' |sort >targets.after
    $ diff -du targets.before targets.after |diffstat
     targets.after |  110     0   110     0 ----------------------------------------------------------
     1 file changed, 110 deletions(-)
    $ diff -du targets.before targets.after
    --- targets.before2015-03-30 23:11:42.295462498 +0200
    +++ ta  rgets.after2015-03-30 23:11:51.587574784 +0200
    @@ -154,133 +154,23  @@
     hans
     harfbuzz
     /home/ymorin/dev/buildroot/buildroot
    -host-autoconf
    -host-autoconf
    -host-autoconf-archive
    -host-automake
    -host-automake
    -host-bdwgc
    [--SNIP--]
    -host-xutil_makedepend
    -host-xz
    -host-yasm
    -host-zic
    -host-zlib
    -host-zlib
     icu
     igmpproxy
     imagemagick

I've done the same check with all your series applied, and those host
packages do not reappear later...

That's unfortunate, because a side effect is that graph-depends is now
missing host packages (that do not have a Config.in entry).

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ab54dda..0709751 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -644,7 +644,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
>  	@rm -f $(LEGAL_WARNINGS)
>  
>  show-targets:
> -	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
> +	@echo $(PACKAGES) $(TARGETS_ROOTFS)
>  
>  graph-build: $(O)/build/build-time.log
>  	@install -d $(O)/graphs
> -- 
> 2.1.0
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
