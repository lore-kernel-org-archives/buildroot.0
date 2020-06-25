From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 13:04:57 +0200
Subject: [Buildroot] [RFC v9 02/10] cpe-info: id prefix/suffix
In-Reply-To: <20200616170341.45098-2-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-2-matthew.weber@rockwellcollins.com>
Message-ID: <20200625130457.44b04fcd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2020 12:03:33 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> +CPE_PREFIX_OS = cpe:2.3:o
> +CPE_PREFIX_APP = cpe:2.3:a
> +CPE_SUFFIX = *:*:*:*:*:*:*
> +
>  ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
>  NLS_OPTS = --enable-nls
>  TARGET_NLS_DEPENDENCIES = host-gettext
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1408845613..7d892ca1d6 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -976,11 +976,17 @@ $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
>  $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
>  $(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
>  
> +ifneq ($(filter linux linux-headers,$(1)),)
> +$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
> +else
> +$(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
> +endif

Shouldn't the CPE_ID be directly defined with those, i.e in PATCH
01/10, and the type be overridden by the packages which are not
"application" packages, i.e:

$(2)_CPE_TYPE ?= a
$(2)_CPE_ID ?= cpe:2.3:$$($(2)_CPE_TYPE):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):*:*:*:*:*:*:*

Of course, the linux package would have to set LINUX_CPE_TYPE = o.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
