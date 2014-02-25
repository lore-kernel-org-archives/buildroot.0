From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 18:24:37 +0100
Subject: [Buildroot] [PATCH 0/13 v2] Add dependency on kernel headers
In-Reply-To: <cover.1393198603.git.yann.morin.1998@free.fr>
References: <cover.1393198603.git.yann.morin.1998@free.fr>
Message-ID: <530CD1D5.1010301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 24/02/14 00:40, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Hello All!
> 
> This series introduces infrastructure for packages to depend on the
> required version of kernel headers.
> 
> It follows the proposal made on the list:
>     http://lists.busybox.net/pipermail/buildroot/2014-February/088924.html
> 
> The basic idea is to add a symbol for each kernel header version, and
> have toolchains select the appropriate symbol, and packages depend on the
> appropriate symbol.

 With all the additional symbols that are introduced by this series, some
of which the user has to select from a huge choice (at least, it will be
huge when we reach 3.45 five years from now), I wonder if it wouldn't be
easier to add support for int comparisons in Kconfig expressions. I have
taken a quick look and it doesn't seem impossible at first sight...


 Regards,
 Arnout

> 
> In this series:
> 
>   - such symbols are added for all kernel headers >= 3.0;
> 
>   - the internal toochain backend selects the appropriate symbol, without
>     user-visible changes for known kernel headers versions, and with a new
>     choice for manually-specified kernel headers version;
> 
>   - the predefined external toolchains select the appropriate symbols
>     without user-visible changes; those using kernel headers older than
>     3.0, select nothing, and a comment is added to state so;
> 
>   - for the custom external toolchain, a new choice is shown to the
>     user, to select the appropriate kernel headers version;
> 
>   - five packages are converted to take advantage of this.
> 
> For example:
> 
>   - BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 selects
>     BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
> 
>   - dvb-apps depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
> 
> 
> Changes v1 -> v2:
>   - typo and asciidoc syntax in the manual  (Samuel, Thomas DS)
>   - add choice for custom kernel headers  (Arnout)
>   - add check to strictly enforce selection  (Thomas, Arnout)
>   - add help to choice  (Thomas DS)
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (13):
>       package/linux-headers: remove 2.6 snapshot
>       toolchain/common: add minimum kernel headers options
>       manual: document minimal kernel headers dependency
>       toolchain/external/predefined: add choice to select 'AT_LEAST_XXX' header version
>       toolchain/external/custom: add choice to select 'AT_LEAST_XXX' header version
>       package/linux-headers: select appropriate 'AT_LEAST_XXX' header version
>       toolchain/external: check kernel headers version for custom toolchain
>       toolchain/internal: check kernel headers version for manually-specified version
>       package/dvb-apps: requires kernel headers >= 3.3
>       package/w_scan: requires kernel headers >= 3.0
>       package/weston: requires kernel headers >= 3.0
>       package/tvheadend: requires kernel headers >= 3.2
>       package/mmc-utils: requires kernel headers >= 3.0
> 
>  docs/manual/adding-packages-directory.txt          |   6 ++
>  package/dvb-apps/Config.in                         |   5 +-
>  package/linux-headers/Config.in.host               |  86 +++++++++++++++-
>  package/linux-headers/linux-headers.mk             |   9 ++
>  package/mmc-utils/Config.in                        |   5 +-
>  package/tvheadend/Config.in                        |   5 +-
>  package/w_scan/Config.in                           |   4 +
>  package/weston/Config.in                           |   5 +-
>  support/scripts/check-kernel-headers.sh            |  22 ++++
>  toolchain/helpers.mk                               |  13 +++
>  toolchain/toolchain-common.in                      |  79 +++++++++++++++
>  toolchain/toolchain-external/Config.in             | 111 +++++++++++++++++++++
>  toolchain/toolchain-external/toolchain-external.mk |   7 +-
>  13 files changed, 344 insertions(+), 13 deletions(-)
>  create mode 100755 support/scripts/check-kernel-headers.sh
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
