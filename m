From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 04:18:53 -0600
Subject: [Buildroot] [PATCHv4] package/pugixml: add support for a
 limited set of configuration options
In-Reply-To: <20190204100613.25609-1-patrickdepinguin@gmail.com>
References: <20190204100613.25609-1-patrickdepinguin@gmail.com>
Message-ID: <CANQCQpan78Y_f2+EyjRB_W25U_4w97QZtgS5j9kxmbjHetWFQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De,

On Mon, Feb 4, 2019 at 4:06 AM Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
>
> From: Wouter Vermeiren <wouter.vermeiren@nokia.com>
>
> Add config options for a few pugixml configurables.
>
> - Xpath support is enabled by default but has a size impact. Disabling it
>   reduces the size significantly (it almost halves). Output of 'size' on the
>   library compiled for x86:
>   - Xpath support enabled
>  160374    1244      28  161646   2776e output/target/usr/lib/libpugixml.so.1.7
>   - Xpath support disabled
>   92754     880       8   93642   16dca usr/lib/libpugixml.so.1.7
>
> - Compact and header-only modes are not strictly needed for our use case, but we
>   did the work anyway and may be useful for someone else.
>
> Signed-off-by: Wouter Vermeiren <wouter.vermeiren@nokia.com>
> [ThomasDS:
> - align with Buildroot coding style
> - retain only feature options: xpath, compact mode, header-only]
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Did a build on aarch, adjusted kconfig options and verified build
completed with pugixml CMakeCache.txt showing
"BUILD_DEFINES:STRING=PUGIXML_NO_XPATH;PUGIXML_COMPACT;PUGIXML_HEADER_ONLY"

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/pugixml/Config.in  | 32 ++++++++++++++++++++++++++++++++
>  package/pugixml/pugixml.mk | 14 ++++++++++++++
>  2 files changed, 46 insertions(+)
>
> v4:
> - drop options for exceptions, stl, wchar
> - drop forced 'long long' support: enabled by C++11 anyway (gcc 4.8+).
> v3:
> - always enable 'long long' type (feedback Arnout Vandecappelle)
> - remove unnecessary 'strip' on PUGIXML_BUILD_DEFINES
> v2: (feedback Thomas Petazzoni)
> - change 'disable' options into 'enable' and reorder them to be first
> - rename 'has-long-long' option
>
>
> diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
> index c37b1df9e5..6b7d2e3259 100644
> --- a/package/pugixml/Config.in
> +++ b/package/pugixml/Config.in
> @@ -18,5 +18,37 @@ config BR2_PACKAGE_PUGIXML
>           http://pugixml.org/
>           https://github.com/zeux/pugixml
>
> +if BR2_PACKAGE_PUGIXML
> +
> +config BR2_PACKAGE_PUGIXML_XPATH_SUPPORT
> +       bool "Enable XPath support"
> +       default y
> +       help
> +         When disabled, both XPath interfaces and XPath implementation
> +         are excluded from compilation. This option is provided in case
> +         you do not need XPath functionality and need to save code
> +         space.
> +
> +config BR2_PACKAGE_PUGIXML_COMPACT
> +       bool "Enable compact mode"
> +       help
> +         Activates a different internal representation of document
> +         storage that is much more memory efficient for documents with
> +         a lot of markup (i.e.  nodes and attributes), but is slightly
> +         slower to parse and access.
> +
> +         http://pugixml.org/docs/manual.html#dom.memory.compact
> +
> +config BR2_PACKAGE_PUGIXML_HEADER_ONLY
> +       bool "Enable header-only version"
> +       help
> +         All source code for pugixml will be included in every
> +         translation unit that includes pugixml.hpp. This is how most
> +         of Boost and STL libraries work.
> +
> +         http://pugixml.org/docs/manual.html#install.building.header
> +
> +endif
> +
>  comment "pugixml needs a toolchain w/ C++"
>         depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
> index e5188e5f53..acf22604c4 100644
> --- a/package/pugixml/pugixml.mk
> +++ b/package/pugixml/pugixml.mk
> @@ -10,4 +10,18 @@ PUGIXML_LICENSE = MIT
>  PUGIXML_LICENSE_FILES = readme.txt
>  PUGIXML_INSTALL_STAGING = YES
>
> +ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
> +PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
> +endif
> +ifeq ($(BR2_PACKAGE_PUGIXML_COMPACT),y)
> +PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
> +endif
> +ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
> +PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
> +endif
> +
> +ifdef PUGIXML_BUILD_DEFINES
> +PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
> +endif
> +
>  $(eval $(cmake-package))
> --
> 2.19.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
