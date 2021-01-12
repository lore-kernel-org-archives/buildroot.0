From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2021 11:50:47 +0100
Subject: [Buildroot] [PATCH] package/coremark-pro: clean up package
In-Reply-To: <20210112090840.20230-1-judge.packham@gmail.com>
References: <20210112090840.20230-1-judge.packham@gmail.com>
Message-ID: <54423b66-3e63-a3f9-0f07-cb2cbadc3ce6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/01/2021 10:08, Chris Packham wrote:
> - Use the COREMARK_PRO_MARKS definition from the build recipe to
>   generate the coremark-pro.sh
> - Use %x:%X as the date stamp in the results file.
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/coremark-pro/coremark-pro.mk                       | 3 ++-
>  .../coremark-pro/{coremark-pro.sh => coremark-pro.sh.in}   | 7 +++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename package/coremark-pro/{coremark-pro.sh => coremark-pro.sh.in} (85%)
> 
> diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
> index d3e99fcdfd..fdcfda33e8 100644
> --- a/package/coremark-pro/coremark-pro.mk
> +++ b/package/coremark-pro/coremark-pro.mk
> @@ -36,7 +36,8 @@ define COREMARK_PRO_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/builds/linux$(if $(BR2_ARCH_IS_64),64)/gcc$(if $(BR2_ARCH_IS_64),64)/data/libbmp/Rose256.bmp $(TARGET_DIR)/usr/share/coremark-pro/Rose256.bmp
>  	$(foreach s,$(COREMARK_PRO_SCRIPTS),\
>  		$(INSTALL) -D $(@D)/util/perl/$(s) $(TARGET_DIR)/usr/share/coremark-pro/util/perl/$(s)$(sep))
> -	$(Q)cp package/coremark-pro/coremark-pro.sh $(TARGET_DIR)/usr/bin/
> +	$(Q)sed "s/@COREMARK_PRO_MARKS@/$(COREMARK_PRO_MARKS)/" \
> +		package/coremark-pro/coremark-pro.sh.in >$(TARGET_DIR)/usr/bin/coremark-pro.sh
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/coremark-pro/coremark-pro.sh b/package/coremark-pro/coremark-pro.sh.in
> similarity index 85%
> rename from package/coremark-pro/coremark-pro.sh
> rename to package/coremark-pro/coremark-pro.sh.in
> index 65ad9df645..8b370b7c75 100755
> --- a/package/coremark-pro/coremark-pro.sh
> +++ b/package/coremark-pro/coremark-pro.sh.in
> @@ -1,8 +1,7 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: Apache-2.0
>  
> -workloads="cjpeg-rose7-preset core linear_alg-mid-100x100-sp \
> -    loops-all-mid-10k-sp nnet_test parser-125k radix2-big-64k sha-test zip-test"
> +workloads="@COREMARK_PRO_MARKS@"
>  
>  rm -rf /tmp/coremark-pro
>  mkdir -p /tmp/coremark-pro
> @@ -16,11 +15,11 @@ for contype in single best; do
>      for wld in $workloads; do
>          [ "$contype" = "single" ] && XCMD="-c1 -w1"
>          [ "$contype" = "best" ] && XCMD="-c$(nproc) -w$(nproc)"
> -        echo "#Results for verification run started at $(date +%y%j:%H:%M:%S) XCMD=$XCMD" >$wld-$contype-result.log
> +        echo "#Results for verification run started at $(date +%x:%X) XCMD=$XCMD" >$wld-$contype-result.log
>          echo "Verification run for $wld"
>          $wld $XCMD -v1 > $wld.run.log
>          LC_ALL=C perl /usr/share/coremark-pro/util/perl/results_parser.pl $wld-$contype-result.log $wld.run.log
> -        echo "#Results for performance runs started at $(date +%y%j:%H:%M:%S) XCMD=$XCMD" >>$wld-$contype-result.log
> +        echo "#Results for performance runs started at $(date +%x:%X) XCMD=$XCMD" >>$wld-$contype-result.log
>          echo "Performance run for $wld"
>          for i in 1 2 3; do
>              $wld $XCMD -v0 > $wld.run.log
> 
