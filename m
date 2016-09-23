From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Sep 2016 23:18:07 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging
 dir
In-Reply-To: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
References: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <0b8205ef-ee98-a652-455c-f4717b294939@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-16 16:06, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> On debian (and maybe other distribs), there is a package named libi2c-dev
> that install a useful header from i2c-tools (for the one wanting to write
> I2C applications). See https://packages.debian.org/fr/wheezy/libi2c-dev.
> Do the same in Buildroot. Note that "install" target in i2c-tools Makefile
> would do the job, but BR installs i2c-tools's stuff manualy.

 Have you considered commit 41711cfdeda6f5fd9b2531f538f3643854d7d3ea?

    Revert "i2c-tools: Add i2c-dev.h to staging directory for userspace i2c
drivers."

    This reverts commit ff673f9a22b1467878f1a117f2c6198e9683d5c7, as the
    modified i2c-dev.h from i2c-tools has some definitions that conflict
    with the i2c.h from the kernel headers. This means that a userspace
    program or library that includes both will fail to build, as is the
    case with libsoc.

If the issue has been fixed now, please mention it in the commit log.


 Also, I would prefer to use the install target. The manual install was there
from the very first commit in 2008, I don't think it's still relevant. Peter?
Anyway, for staging the install target can definitely be used.


 Regards,
 Arnout


> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/i2c-tools/i2c-tools.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
> index e16b940..5e095f3 100644
> --- a/package/i2c-tools/i2c-tools.mk
> +++ b/package/i2c-tools/i2c-tools.mk
> @@ -8,6 +8,7 @@ I2C_TOOLS_VERSION = v3.1.2
>  I2C_TOOLS_SITE = git://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git
>  I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
>  I2C_TOOLS_LICENSE_FILES = COPYING
> +I2C_TOOLS_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  I2C_TOOLS_DEPENDENCIES += python
> @@ -50,6 +51,10 @@ define I2C_TOOLS_BUILD_CMDS
>  	$(I2C_TOOLS_BUILD_PYSMBUS)
>  endef
>  
> +define I2C_TOOLS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -m 644 -D $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux
> +endef
> +
>  define I2C_TOOLS_INSTALL_TARGET_CMDS
>  	for i in i2cdump i2cget i2cset i2cdetect; \
>  	do \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
