From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Oct 2011 22:57:10 +0200
Subject: [Buildroot] [PATCH 2/4] manual: provide make targets to build
	the documentation
In-Reply-To: <4c4e92ec3e04435af43b079aeaea1dcf2181d58e.1318236261.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318236261.git.thomas.petazzoni@free-electrons.com>
 <4c4e92ec3e04435af43b079aeaea1dcf2181d58e.1318236261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110112257.11996.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 10 October 2011 10:46:40, Thomas Petazzoni wrote:
> Special thanks for Yann E. Morin for giving input and suggestions to
> implement this.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

 Unfortunately not-yet-Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  Makefile |   45 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 44 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 8525b7d..d0f947d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -672,10 +672,19 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
>  	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>  endif
>  	@echo
> +	@echo 'Documentation:'
> +	@echo '  manual                 - build manual in HTML, split HTML, PDF and txt'
> +	@echo '  manual-html            - build manual in HTML'
> +	@echo '  manual-split-html      - build manual in split HTML'
> +	@echo '  manual-pdf             - build manual in PDF'
> +	@echo '  manual-txt             - build manual in txt'
> +	@echo '  manual-epub            - build manual in ePub'
> +	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
>  	@echo '  source-check           - check all packages for valid download URLs'
>  	@echo '  external-deps          - list external packages used'
> +	@echo '  manual	                - build the Buildroot manual'
>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
> @@ -683,7 +692,7 @@ endif
>  	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
>  	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
>  	@echo
> -	@echo 'See docs/README and docs/buildroot.html for further details'
> +	@echo 'See docs/README, or generate the Buildroot manual for further details'
>  	@echo
>  
>  release: OUT=buildroot-$(BR2_VERSION)
> @@ -691,5 +700,39 @@ release: OUT=buildroot-$(BR2_VERSION)
>  release:
>  	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
>  
> +MANUAL_SOURCES = $(wildcard docs/manual/*.txt)

MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)

 although only logo.png is actually used.

> +
> +manual: manual-html manual-split-html manual-pdf manual-txt manual-epub

 All of these should be added to .PHONY, line 390.

> +
> +manual-html: $(MANUAL_SOURCES)

 Does this dependency make sense?  manual-html is a phony target so will 
always be rebuilt.

 It would make more sense to have something like:

manual-html: $(O)/docs/manual/manual.html

$(O)/docs/manual/manual.html: $(MANUAL_SOURCES)
	...

 [This may have been discussed before, but I lost my mail from before Sep 20 
and I'm too lazy to go to gmane...]

> +	@echo "HTML manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f xhtml -d book -L -r docs/images -D $(O)/docs/manual/ \
> +		docs/manual/manual.txt

 This doesn't work for me (a2x 8.6.5), it needs an absolute path for the 
resource.  The following works:
$(Q)a2x -f xhtml -d book -L -r $(TOPDIR)/docs/images -D $(O)/docs/manual/ \
        docs/manual/manual.txt

> +
> +manual-split-html: $(MANUAL_SOURCES)
> +	@echo "Split HTML manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f chunked -d book -L -r docs/images -D $(O)/docs/manual/ \
> +		docs/manual/manual.txt

 Idem.

> +
> +manual-pdf: $(MANUAL_SOURCES)
> +	@echo "PDF manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L -D $(O)/docs/manual/ \
> +		docs/manual/manual.txt
> +
> +manual-txt: $(MANUAL_SOURCES)
> +	@echo "Text manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f text -d book -L -D $(O)/docs/manual/ \
> +		docs/manual/manual.txt
> +
> +manual-epub: $(MANUAL_SOURCES)
> +	@echo "EPUB manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f epub -d book -L -r docs/images/ -D $(O)/docs/manual/ \
> +		docs/manual/manual.txt

 Idem.

> +
>  .PHONY: $(noconfig_targets)
>  
> 

 In addition to the above comments, I would like to see a clean target for
the manual as well.

 Just for the heck of it I've implemented a patch with all of these comments.
It will be posted as a follow-up to this mail.

 Oh, and except for the absolute directory for the -r parameter, you can get
my Acked-by even without all of these changes.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
