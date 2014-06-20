From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Jun 2014 22:55:32 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <1403129424-27129-1-git-send-email-arnout@mind.be>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
Message-ID: <20140620205532.GA26745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-19 00:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The graph-depends commands cd into the CONFIG_DIR and run the script
> from there. However, this means that when $(O) is a relative path, it
> will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Suddenly I realised that something must be wrong with this patch.
$(O) is always expected to be relative the buildroot tree, not the
current directory:
    http://nightly.buildroot.org/#_building_out_of_tree

    ---8<---
    Note: the O path can be either an absolute or a relative path, but
    if it?s passed as a relative path, it is important to note that it is
    interpreted relative to the main Buildroot source directory, not the
    current working directory.
    ---8<---

So I fail to see what case this patch is supposed to fix.

I tried with thisscript, and did not notice any difference between the
two runs, one with master, the second with the patch applied:

    #!/bin/sh
    set -e

    BR="${HOME}/cache/upstream/buildroot"
    rm -rf br*

    do_prep() {
        local dir="${1}"
        (
            git clone "${BR}" "${dir}"
            cd "${dir}"
            git pwam 361761   # Comment-out to use master
        )
    }

    echo '======== In-tree'
    do_prep br-1
    cd br-1
    make defconfig
    make graph-depends
    cd ..

    echo '======== Out-of-tree, called out of top-dir, relative'
    do_prep br-2
    mkdir br.build-2
    make -C br-2 O=../br.build-2 defconfig
    make -C br-2 O=../br.build-2 graph-depends

    echo '======== Out-of-tree, called from top-dir, relative'
    do_prep br-3
    mkdir br.build-3
    cd br-3
    make O=../br.build-3 defconfig
    make O=../br.build-3 graph-depends
    cd ..

    echo '======== Out-of-tree, called from O-dir, absolute'
    do_prep br-4
    mkdir br.build-4
    cd br.build-4
    make -C ../br-4 O=$(pwd) defconfig
    make graph-depends
    cd ..

    echo '======== Out-of-tree, called out of top-dir, absolute '
    do_prep br-5
    mkdir br.build-5
    make -C br-4 O=$(pwd)/br.build-5 defconfig
    make -C br-4 O=$(pwd)/br.build-5 graph-depends

    echo '======== Out-of-tree, called fromother dir, absolute-relative'
    do_prep br-6
    mkdir br.build-6.1
    mkdir br.build-6.2
    cd br.build-6.1
    make -C ../br-6 O=$(pwd)/../br.build-6.2 defconfig
    make -C ../br-6 O=$(pwd)/../br.build-6.2 graph-depends
    cd ..

In both cases (with or without the patch), cases 1, 3 and 4 succeed,
while cases 2, 5 and 6 fail.

What case(s) did I miss?

Regards,
Yann E. MORIN.

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5c82355..dd350b6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -676,8 +676,8 @@ graph-depends:
>  	@$(INSTALL) -d $(O)/graphs
>  	@cd "$(CONFIG_DIR)"; \
>  	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
> -	|tee $(O)/graphs/$(@).dot \
> -	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
> +	|tee $(BASE_DIR)/graphs/$(@).dot \
> +	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
>  
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
> -- 
> 2.0.0
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
