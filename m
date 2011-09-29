From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 29 Sep 2011 23:53:49 +0200
Subject: [Buildroot] [PATCH 2/4] manual: provide make targets to build
	the documentation
In-Reply-To: <41d440a0142e3bb0e20ad8524aeca52fe94e8404.1317326629.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317326629.git.thomas.petazzoni@free-electrons.com>
 <41d440a0142e3bb0e20ad8524aeca52fe94e8404.1317326629.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201109292353.50188.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 29 September 2011 22:05:59 Thomas Petazzoni wrote:
> Special thanks for Yann E. Morin for giving input and suggestions to
> implement this.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile |   46 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 45 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a20d3e2..278a3a0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -665,10 +665,18 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
>  	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>  endif
>  	@echo
> +	@echo 'Documentation:'
> +	@echo '  manual                 - build manual in HTML, split HTML, PDF and txt'
> +	@echo '  manual-html            - build manual in HTML'
> +	@echo '  manual-split-html      - build manual in split HTML'
> +	@echo '  manual-pdf             - build manual in PDF'
> +	@echo '  manual-txt             - build manual in txt'

manual-epub missing. Fixed after IRC discussion.

> +	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
>  	@echo '  source-check           - check all packages for valid download URLs'
>  	@echo '  external-deps          - list external packages used'
> +	@echo '  manual			- build the Buildroot manual'

Tabs are used after 'manual', which yields an improperly-aligned line.
After IRC discussion, a tab remains just after 'manual'.

>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
> @@ -676,7 +684,7 @@ endif
>  	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
>  	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
>  	@echo
> -	@echo 'See docs/README and docs/buildroot.html for further details'
> +	@echo 'See docs/README and the Buildroot manual for further details'

Where is the "Buildroot manual"? Yes, I know, that the purpose of this
patch, but it is confusing. What about something like:

  See docs/README, or generate the Buildroot manual for further details

>  	@echo
>  
>  release: OUT=buildroot-$(BR2_VERSION)
> @@ -684,5 +692,41 @@ release: OUT=buildroot-$(BR2_VERSION)
>  release:
>  	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
>  
> +MANUAL_SOURCES = $(wildcard docs/manual/*.txt)
> +
> +manual: manual-html manual-split-html manual-pdf manual-txt manual-epub
> +
> +manual-html: $(MANUAL_SOURCES)
> +	@echo "HTML manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)cp -f docs/images/logo.png $(O)/docs/manual/
> +	$(Q)asciidoc -b xhtml11 -d book -o $(O)/docs/manual/manual.html \
> +		docs/manual/manual.txt

man asciidoc (8.5.2) says:
  The _book_ document type is only supported by the _docbook_ backend.

But here, you are using the _xhmtl11_ backend.

Also, I would also use a2x instead of asciidoc. I find the output better.
For one, it has the table of content, which the output by asciidoc lacks.

    $(Q)a2x -f xhtml -d book -L -r docs/images -D $(O)/docs/manual/ \
            docs/manual/manual.txt

Then, if you use a2x, there's no need to manually copy the logo.png.
Much cleaner, IMHO.

> +
> +manual-split-html: $(MANUAL_SOURCES)
> +	@echo "Split HTML manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f chunked -d book -L docs/manual/manual.txt -r docs/images \
> +		-D $(O)/docs/manual/

I was very confused as to what the argument to -L was. -L does not take any
argument, so the ordering above is confusing.

Would it be feasible to reorder the arguments, so that the input is last in
the line:

    $(Q)a2x -f chunked -d book -L -r docs/images -D $(O)/docs/manual/ \
	docs/manual/manual.txt

And ditto for the following calls?

> +
> +manual-pdf: $(MANUAL_SOURCES)
> +	@echo "PDF manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L docs/manual/manual.txt \
> +		-D $(O)/docs/manual/
> +
> +manual-txt: $(MANUAL_SOURCES)
> +	@echo "Text manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f text -d book -L docs/manual/manual.txt \
> +		-D $(O)/docs/manual
> +
> +manual-epub: $(MANUAL_SOURCES)
> +	@echo "EPUB manual..."
> +	$(Q)mkdir -p $(O)/docs/manual
> +	$(Q)a2x -f epub -d book -L docs/manual/manual.txt \
> +		-r docs/images/	\
> +		-D $(O)/docs/manual
> +
>  .PHONY: $(noconfig_targets)

Otherwise, looks good! :-)

If you fix the above, you can add my:
  Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
  Tested-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
