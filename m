From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 16:09:23 +0200
Subject: [Buildroot] [PATCHv3 4/5] Makefile: implement a size-stats
	target
In-Reply-To: <1423171200-24583-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423171200-24583-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55229393.5040808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/15 22:19, Thomas Petazzoni wrote:
> This commit implements a size-stats target that calls the script of
> the same name to generate the graph and CSV files related to package
> and file sizes.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 6d4ae38..faa2e38 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -680,6 +680,17 @@ graph-depends: graph-depends-requirements
>  	|tee $(BASE_DIR)/graphs/$(@).dot \
>  	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
>  
> +size-stats:
> +	@[ -f $(O)/build/packages-file-list.txt ] || \
> +		{ echo "ERROR: No package size information available, please rebuild with BR2_COLLECT_FILE_SIZE_STATS" ; exit 1; }

 BR2_COLLECT_FILE_SIZE_STATS=y

 Also the line is too long. And perhaps instead of "rebuild" it should say "do a
clean build", otherwise stupid people will just do another make with the option
enabled but nothing will actually be done.


> +	@$(INSTALL) -d $(GRAPHS_DIR)

 graph-depends is the only one that uses install -d, all the others use mkdir
-p. So let's stick to that.

> +	@cd "$(CONFIG_DIR)"; \

 Why is this needed? In fact, it's wrong, because TARGET_SKELETON will be
relative to TOPDIR if it's given as a relative path. All the other paths are
absolute paths, so there's no reason to cd AFAICS.

 Also, I'd prefer $(Q) instead of @.


 Regards,
 Arnout


> +	$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
> +		--graph $(BASE_DIR)/graphs/graph-size.$(BR_GRAPH_OUT) \
> +		--file-size-csv $(BASE_DIR)/build/file-size-stats.csv \
> +		--package-size-csv $(BASE_DIR)/build/package-size-stats.csv \
> +		--skeleton-path $(TARGET_SKELETON)
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  all: menuconfig
> @@ -896,6 +907,7 @@ endif
>  	@echo '  manual-epub            - build manual in ePub'
>  	@echo '  graph-build            - generate graphs of the build times'
>  	@echo '  graph-depends          - generate graph of the dependency tree'
> +	@echo '  size-stats             - generate stats of the filesystem size'
>  	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
