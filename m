From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 12 Jan 2015 23:47:28 +0100
Subject: [Buildroot] [PATCHv2 4/4] Makefile: implement a size-stats
	target
In-Reply-To: <1417470100-32657-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470100-32657-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54B44F00.9060207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/12/2014 22:41, Thomas Petazzoni a ?crit :
> This commit implements a size-stats target that calls the script of
> the same name to generate the graph and CSV files related to package
> and file sizes.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index ad018c8..56b2b93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -677,6 +677,16 @@ graph-depends: graph-depends-requirements
>  	|tee $(BASE_DIR)/graphs/$(@).dot \
>  	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
>  
> +size-stats:
> +	@[ -f $(O)/build/packages-file-list.txt ] || \
> +		{ echo "ERROR: No package size information available, please rebuild with BR2_COLLECT_FILE_SIZE_STATS" ; exit 1; }
> +	@$(INSTALL) -d $(O)/graphs
> +	@cd "$(CONFIG_DIR)"; \
> +	$(TOPDIR)/support/scripts/graph-size --builddir $(O) \

graph-size -> size-stats ?

> +		--graph $(O)/graphs/graph-size.$(BR_GRAPH_OUT) \
> +		--file-size-csv $(O)/build/file-size-stats.csv \
> +		--package-size-csv $(O)/build/package-size-stats.csv
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  all: menuconfig
> @@ -889,6 +899,7 @@ endif
>  	@echo '  manual-epub            - build manual in ePub'
>  	@echo '  graph-build            - generate graphs of the build times'
>  	@echo '  graph-depends          - generate graph of the dependency tree'
> +	@echo '  size-stats             - generate stats of the filesystem size'
>  	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
> 

But with that fixed I get:
$ make O=test/xfsprogs/ size-stats
Traceback (most recent call last):
  File "/home/naourr/git/buildroot/support/scripts/size-stats", line 217, in <module>
    pkgdict = build_package_dict(args.builddir)
  File "/home/naourr/git/buildroot/support/scripts/size-stats", line 68, in build_package_dict
    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
IOError: [Errno 2] No such file or directory: 'test/xfsprogs/build/packages-file-list.txt'

But this file exist:
$ ls test/xfsprogs/build/packages-file-list.txt
test/xfsprogs/build/packages-file-list.txt

Also I noticed that the man pages (and headers) 
are taken into account in packages-file-list.txt:
[...]
tmux,./usr/bin/tmux
tmux,./usr/share/man/man1/tmux.1

Since they are removed at the end, I think we want to 
remove them from packages-file-list.txt during
TARGET_DIR cleanup ?

Best regards,
Romain
