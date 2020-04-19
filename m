From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 21:41:07 +0200
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: new package
In-Reply-To: <1578064617-24787-1-git-send-email-philippe.reynes@softathome.com>
References: <1578064617-24787-1-git-send-email-philippe.reynes@softathome.com>
Message-ID: <20200419214107.507a7179@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Philippe,

Sorry for the slow feedback. I have applied your patch, after doing a
number of changes, see below.

On Fri,  3 Jan 2020 16:16:57 +0100
Philippe Reynes <philippe.reynes@softathome.com> wrote:

> This project is an implementation of the TCG TPM 2.0
> specification. It is based on the TPM specification
> Parts 3 and 4 source code donated by Microsoft, with
> additional files to complete the implementation.
> 
> Signed-off-by: Philippe Reynes <philippe.reynes@softathome.com>
> ---
>  package/Config.in                    |  1 +
>  package/ibm-sw-tpm2/Config.in        | 15 +++++++++++++++
>  package/ibm-sw-tpm2/ibm-sw-tpm2.hash |  5 +++++
>  package/ibm-sw-tpm2/ibm-sw-tpm2.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 43 insertions(+)

Every package should have an entry in the DEVELOPERS file, so I've
added one under your name.

> diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
> new file mode 100644
> index 0000000..cfe75fe
> --- /dev/null
> +++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
> @@ -0,0 +1,5 @@
> +# from https://sourceforge.net/projects/ibmswtpm2/files
> +sha1   a2a5335024a2edc1739f08b99e716fa355be627d                          ibmtpm1563.tar.gz
> +md5    13013612b3a13dc935fefe1a5684179c                                  ibmtpm1563.tar.gz
> +# Locally computed:
> +sha256 fc3a17f8315c1f47670764f2384943afc0d3ba1e9a0422dacb08d455733bd1e9  ibmtpm1563.tar.gz

We want the hash of the license file here. Also we've updated our
coding style to normalize on two spaces as a separator between the
fields in the hash file.

> diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
> new file mode 100644
> index 0000000..1524b8c
> --- /dev/null
> +++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# ibm-sw-tpm2
> +#
> +################################################################################
> +
> +IBM_SW_TPM2_VERSION = 1563
> +IBM_SW_TPM2_SOURCE = ibmtpm$(IBM_SW_TPM2_VERSION).tar.gz
> +IBM_SW_TPM2_SITE = https://sourceforge.net/projects/ibmswtpm2/files
> +IBM_SW_TPM2_LICENSE = BSD

This is not a valid SPDX tag, I've changed to BSD-3-Clause.

> +IBM_SW_TPM2_LICENSE_FILES = LICENSE
> +IBM_SW_TPM2_DEPENDENCIES = openssl
> +
> +define IBM_SW_TPM2_BUILD_CMDS
> +	$(MAKE) -C $(@D)/src $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)

TARGET_MAKE_ENV is supposed to be in the make environment, i.e on the
left hand-side of make.

> +endef
> +
> +define IBM_SW_TPM2_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D)/src $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) install DESTDIR=$(TARGET_DIR)

Ditto.

As said above, I fixed those issues and applied. Thanks for your
contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
