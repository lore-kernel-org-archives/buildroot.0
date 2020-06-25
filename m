From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 13:00:55 +0200
Subject: [Buildroot] [RFC v9 01/10] cpe-info: new make target
In-Reply-To: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200625130055.5062a0a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Tue, 16 Jun 2020 12:03:32 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Similar to make legal-info, produce a csv delimited file containing
> all selected packages CPE identification.
> 
> By default, support the pkg infra defining a set of CPE_ID_* defaults
> using the package name for the vendor and name as most CPE IDs seem
> to align with that assumption. Plus initially, use the pkg version as
> the CPE ID's version field.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This patch really does two things:

 - Add some CPE_* variables into the package infrastructure

 - Add a cpe-info make target

These are two separate things, should be two separate patches. However,
see below.

> +.PHONY: cpe-info-clean
> +cpe-info-clean:
> +	@rm -f $(CPE_MANIFEST_CSV)
> +
> +.PHONY: cpe-info-prepare
> +cpe-info-prepare:
> +	@$(call MESSAGE,"Gathering CPE info")
> +	@$(call cpe-manifest,CPE ID,CVE PATCHED,PACKAGE,VERSION,SOURCE SITE)
> +
> +.PHONY: cpe-info
> +cpe-info: cpe-info-clean cpe-info-prepare $(foreach p,$(PACKAGES),$(p)-cpe-info)
> +	@echo "CPE info produced in $(CPE_MANIFEST_CSV)"

I don't think we need/want an additional make target. We have "make
show-info" already, it outputs a JSON blurb, which we can extend with
additional information from the packages.

> +$(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
> +$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
> +$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
> +$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)

These variables should be documented in the Buildroot manual.

I see you set some default values for those CPE_ID values, but I am
wondering if that's how we want to do this. Indeed a big question,
which was discussed in a thread earlier this year between Michael
Walle, Akshay Bhat and me is that how do we then distinguish packages
for which the CPE information in Buildroot has been verified and is
known to be correct, from packages that have the CPE information not
verified, and even further from packages that don't have any CPE
information because this specific package is not known in the NVD
database.

So I'd like to see a proposal that clarifies how we are going to handle
this. One way is to *not* have any default value for those CPE
variables, and add them to packages progressively, so that we know that
when the CPE information is there, it _has_ been verified.

It's not great because it means adding gazillions of CPE_ID information
in packages. But is there any other option ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
