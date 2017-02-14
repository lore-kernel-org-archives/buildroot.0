From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 22:39:38 +0100
Subject: [Buildroot] [PATCH v3 1/5] package: refactor listing of
 extractor dependencies
In-Reply-To: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
Message-ID: <20170214223938.5dc7c382@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 22:15:38 +0200, Baruch Siach wrote:
> Don't special case $(XZCAT) when constructing DL_TOOLS_DEPENDENCIES. The next
> commit will introduce another extractor that automatically builds when not
> installed. Introduce EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS that lists
> archive extensions for which the extractor is already checked in
> support/dependencies/check-host-foo.mk. Use this in the newly introduced
> extractor-dependency to populate DL_TOOLS_DEPENDENCIES.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I thought this patch series would be material for the next branch, as
to me it was just an improvement/cleanup.

But in fact, it is actually a fix: all packages that depend on
host-lzip today are broken. Take ddrescue for example (but ed and ocrad
are doing the same):

DDRESCUE_DEPENDENCIES = host-lzip

define DDRESCUE_EXTRACT_CMDS
        $(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(DDRESCUE_SOURCE) | \
                tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
endef

So they put host-lzip in <pkg>_DEPENDENCIES, and use
$(HOST_DIR)/usr/bin/lzip in the extract step.

The problem is that the dependencies in <pkg>_DEPENDENCIES are only
guaranteed to be available before the *configure* step of the package,
not before the extract step. So if you run:

$ make ddrescue-patch

You currently get:

/home/thomas/projets/buildroot/output/host/usr/bin/lzip -d -c /home/thomas/dl/ddrescue-1.22.tar.lz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/ddrescue-1.22  -xf -
/bin/bash: /home/thomas/projets/buildroot/output/host/usr/bin/lzip: No such file or directory
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

So I believe this patch series should be applied on master, because it
adds host-lzip to DEPENDENCIES_HOST_PREREQ, which is the only solution
to guarantee it will be available to extract packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
