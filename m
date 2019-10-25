From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:47:31 +0200
Subject: [Buildroot] [PATCH] web-legal-info: Generate html site for
 minimal legal info
In-Reply-To: <20191025123421.366017-1-mickael.tansorier@smile.fr>
References: <20191025123421.366017-1-mickael.tansorier@smile.fr>
Message-ID: <20191025164731.30bb8294@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micka?l,

On Fri, 25 Oct 2019 14:34:21 +0200
Micka?l Tansorier <mickael.tansorier@smile.fr> wrote:

> web-legal-info use legal-info output to generate html web page with some
> informations:
>  - buildroot config
>  - target packages: package name, version, licenses and soures
>  - host packages: package name, version, licenses and soures
> Output is `index.html` in legal-info subdirectory. This page need file
> `buildroot.config`, directory `host-sources` and `sources`.
> So only packages used to build image from config are listed.

Thanks for your patch. There was some debate at the Buildroot
Developers Meeting as to whether we want something like this or not.
Some argued that Buildroot provide the base information in the CSV
files, and very often companies will want to produce/format their legal
information details in a very specific/custom way, which would make any
"generic" solution provided by Buildroot kind of useless.

But others agreed that there was some value to having some
generic/simple HTML output. It may not suit the needs of everyone, but
it can be convenient anyway, and doesn't prevent users with more
specific needs to write their own parsing of the CSV.

So overall, I think we are interested in having some basic HTML
legal-info output.

However, let's go to the implementation details.

> +.PHONY: web-legal-info
> +web-legal-info: asciidoc-check-dependencies legal-info
> +	@$(call MESSAGE,"Collecting web legal info")
> +	@awk -F"\"" '{ print "\""$$2"\",\""$$4"\",\""$$6"\",\"link:sources/"$$2"-"$$4"["$$2"-"$$4"]\"" }' $(LEGAL_MANIFEST_CSV_TARGET) | tail -n +2 > $(WEB_LEGAL_MANIFEST_CSV_TARGET)
> +	@awk -F"\"" '{ print "\""$$2"\",\""$$4"\",\""$$6"\",\"link:host-sources/"$$2"-"$$4"["$$2"-"$$4"]\"" }' $(LEGAL_MANIFEST_CSV_HOST) | tail -n +2 > $(WEB_LEGAL_MANIFEST_CSV_HOST)
> +	@cp support/web-legal-info/web-legal-info-skeleton.txt $(LEGAL_INFO_DIR)
> +	@$(call MESSAGE,"Generate html page")
> +	@asciidoc -o $(LEGAL_INFO_DIR)/index.html $(LEGAL_INFO_DIR)/web-legal-info-skeleton.txt
> +	@rm $(WEB_LEGAL_MANIFEST_CSV_TARGET) $(WEB_LEGAL_MANIFEST_CSV_HOST) $(LEGAL_INFO_DIR)/web-legal-info-skeleton.txt
> +	@echo "Web legal info produced in $(LEGAL_INFO_DIR)"

The awk invocations are kind of ugly, and the need for the asciidoc
dependency is a bit annoying. What about writing a small Python script
in support/scripts/, that takes the CSV as input and generates a nice
HTML page. Then instead of having a separate web-legal-info target, we
could simply always call this Python script from the existing "make
legal-info" target.

What do you think? Would you be willing to implement that?

Finally, a small nit: your commit log lacked a Signed-off-by line with
your name and e-mail.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
