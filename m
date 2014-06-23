From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 07:28:52 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <20140620205532.GA26745@free.fr>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
 <20140620205532.GA26745@free.fr>
Message-ID: <53A7BB14.4060804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 22:55, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-06-19 00:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> The graph-depends commands cd into the CONFIG_DIR and run the script
>> from there. However, this means that when $(O) is a relative path, it
>> will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Suddenly I realised that something must be wrong with this patch.
> $(O) is always expected to be relative the buildroot tree, not the
> current directory:
>     http://nightly.buildroot.org/#_building_out_of_tree
> 
>     ---8<---
>     Note: the O path can be either an absolute or a relative path, but
>     if it?s passed as a relative path, it is important to note that it is
>     interpreted relative to the main Buildroot source directory, not the
>     current working directory.
>     ---8<---
> 
> So I fail to see what case this patch is supposed to fix.
> 
> I tried with thisscript, and did not notice any difference between the
> two runs, one with master, the second with the patch applied:
> 
>     #!/bin/sh
>     set -e
> 
>     BR="${HOME}/cache/upstream/buildroot"
>     rm -rf br*
> 
>     do_prep() {
>         local dir="${1}"
>         (
>             git clone "${BR}" "${dir}"
>             cd "${dir}"
>             git pwam 361761   # Comment-out to use master
>         )
>     }
> 
>     echo '======== In-tree'
>     do_prep br-1
>     cd br-1
>     make defconfig
>     make graph-depends
>     cd ..
> 
>     echo '======== Out-of-tree, called out of top-dir, relative'
>     do_prep br-2
>     mkdir br.build-2
>     make -C br-2 O=../br.build-2 defconfig
>     make -C br-2 O=../br.build-2 graph-depends
> 
>     echo '======== Out-of-tree, called from top-dir, relative'
>     do_prep br-3
>     mkdir br.build-3
>     cd br-3
>     make O=../br.build-3 defconfig
>     make O=../br.build-3 graph-depends
>     cd ..
> 
>     echo '======== Out-of-tree, called from O-dir, absolute'
>     do_prep br-4
>     mkdir br.build-4
>     cd br.build-4
>     make -C ../br-4 O=$(pwd) defconfig
>     make graph-depends
>     cd ..
> 
>     echo '======== Out-of-tree, called out of top-dir, absolute '
>     do_prep br-5
>     mkdir br.build-5
>     make -C br-4 O=$(pwd)/br.build-5 defconfig
>     make -C br-4 O=$(pwd)/br.build-5 graph-depends
> 
>     echo '======== Out-of-tree, called fromother dir, absolute-relative'
>     do_prep br-6
>     mkdir br.build-6.1
>     mkdir br.build-6.2
>     cd br.build-6.1
>     make -C ../br-6 O=$(pwd)/../br.build-6.2 defconfig
>     make -C ../br-6 O=$(pwd)/../br.build-6.2 graph-depends
>     cd ..
> 
> In both cases (with or without the patch), cases 1, 3 and 4 succeed,
> while cases 2, 5 and 6 fail.
> 
> What case(s) did I miss?

 First of all, for me all these cases succeed both with and without the patch.

 Unfortunately, the example you took happens to work by accident:

$ make -n O=../br.build graph-depends
dot -? >/dev/null 2>&1 || \
        (echo "ERROR: The 'dot' program from Graphviz is needed for
graph-depends" >&2; exit 1)
/usr/bin/install -d ../br.build/graphs
cd "../br.build"; \
/home/arnout/src/buildroot/support/scripts/graph-depends  \
|tee ../br.build/graphs/graph-depends.dot \
|dot  -Tpdf -o ../br.build/graphs/graph-depends.pdf


 Since we cd into ../br.build and then resolve $(O) as ../br.build, it just
happens to be the same directory. Using any other combination of . and .. a $(O)
triggers the problem. So try

do_prep br-7
make -C br-7 O=./br.build-7 defconfig
make -C br-7 O=./br.build-7 graph-depends

 The graph-depends will fail with:

tee: br.build-7/graphs/graph-depends.dot: No such file or directory
Getting targets
Getting dependencies for ['host-binutils', 'host-gmp', 'host-mpc', 'host-mpfr',
'uclibc', 'host-fakeroot', 'host-gcc-final', 'host-makedevs',
'toolchain-buildroot', 'toolchain', 'busybox', 'rootfs-tar']
Getting dependencies for ['host-m4', 'linux-headers', 'host-gcc-initial']
br.build-7/graphs/graph-depends.pdf: No such file or directory
Makefile:677: recipe for target 'graph-depends' failed
make: *** [graph-depends] Error 1



 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  Makefile | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 5c82355..dd350b6 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -676,8 +676,8 @@ graph-depends:
>>  	@$(INSTALL) -d $(O)/graphs
>>  	@cd "$(CONFIG_DIR)"; \
>>  	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
>> -	|tee $(O)/graphs/$(@).dot \
>> -	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
>> +	|tee $(BASE_DIR)/graphs/$(@).dot \
>> +	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
>>  
>>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>>  
>> -- 
>> 2.0.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
