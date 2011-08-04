From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 5 Aug 2011 01:05:34 +0200
Subject: [Buildroot] [PATCH 2/5] manual: provide make targets to build
	the documentation
In-Reply-To: <ab98242259a83d1329c12ef548b33d0c2ce41200.1312492948.git.thomas.petazzoni@free-electrons.com>
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
 <ab98242259a83d1329c12ef548b33d0c2ce41200.1312492948.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201108050105.34334.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 04 August 2011 23:23:20 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile |   40 +++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 39 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 02a1659..5face9f 100644
> --- a/Makefile
> +++ b/Makefile
[--SNIP--]
> @@ -679,5 +687,35 @@ release: OUT=buildroot-$(BR2_VERSION)
>  release:
>  	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
>  
> +manual: manual-html manual-splitted-html manual-pdf manual-txt
> +
> +manual-html:
> +	@echo "HTML manual..."
> +	@(cd docs/manual; 				\
> +		cp ../images/logo.png .; 		\
> +		asciidoc -b xhtml11 -d book manual.txt; \

Does not work for out-of-tree builds.

Where is the doc output supposed to be: in the source tree, or in the
build dir? If the later, I tested the above doesn't work. If the former,
it'd be weird to have generated files in the source tree. Especially
if it is shared by more than one build instannce...

> +		rm logo.png)

Don't remove the logo, it is needed later for viewing the HTML doc.
But see below...

> +manual-splitted-html:
> +	@echo "Splited HTML manual..."
> +	@(cd docs/manual; 				\
> +		cp ../images/logo.png .; 		\
> +		a2x -f chunked -d book -L manual.txt; 	\
> +		rm logo.png)
> +
> +manual-pdf:
> +	@echo "PDF manual..."
> +	@(cd docs/manual; 				\
> +		cp ../images/logo.png .; 		\
> +		a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L manual.txt ; \
> +		rm logo.png)
> +
> +manual-txt:
> +	@echo "Text manual..."
> +	@(cd docs/manual; 				\
> +		cp ../images/logo.png .; 		\
> +		a2x -f text -d book -L manual.txt; 	\
> +		rm logo.png)
> +
>  .PHONY: $(noconfig_targets)

I find the copy-then-remove a little bit uggly. Maybe somthing along the
lines of (Makefile totally untested, asciidoc commands manually tested):

---8<---
MANUAL_SOURCES = $(wildcard docs/manual/*.txt)

$(O)/docs/manual/logo.png: docs/images/logo.png
	$(Q)mkdir -p $(@D)
	$(Q)cp $< $@

manual: manual-html manual-splitted-html [...]

manual-%: $(MANUAL_SOURCES) $(O)/docs/manual/logo.png

manual-html: 
	@echo "HTML manual..."
	$(Q)asciidoc -b xhtml11 -d book docs/manual/manual.txt \
	             -o $(O)/docs/manual/manual.html

manual-splitted-html:
	@echo "Splited HTML manual..."
	$(Q)a2x -f chunked -d book -L docs/manual/manual.txt \
	        -r docs/images                               \
	        -D $(O)/docs/manual
# And so on...
---8<---

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
