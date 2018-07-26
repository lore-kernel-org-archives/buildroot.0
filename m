From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 11:26:51 +0200
Subject: [Buildroot] [PATCH 0/8] imx: update multimedia packages to
 4.9.88_2.0.0_ga
In-Reply-To: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
Message-ID: <7bddd977-45ca-5b84-6aca-842c6de86e7c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-18 17:01, Gary Bisson wrote:
> Hi,
> 
> This series updates the i.MX multimedia packages to be in line with the
> NXP 4.9.88-2.0.0_ga release [1].
> 
> The main benefit of this release is that it works for both 32-bit
> i.MX6/7 processors as well as 64-bit i.MX8MQ.
> 
> That means that new packages had to be added to support the i.MX8MQ VPU
> IP (from Hantro).
> 
> In Yocto, the imx-vpu package for the Chips&Media VPU present on i.MX6
> wasn't renamed. But packages such as imx-vpuwrap now depend on
> virtual/imxvpu which can either be provided by imx-vpu (Chips&Media) or
> imx-vpu-hantro (Hantro) [2][3].
> 
> As I thought it'd be confusing to have a virtual imxvpu virtual package
> with an imx-vpu provider, I renamed imx-vpu to imx-vpu-cnm and added an
> imx-vpu virtual package.

 I'm sorry for all the work that you did, but I don't really agree that this is
a good idea. The upstream package really is called imx-vpu, so we prefer to keep
that name. We changed the name for openssl because there really was no other
way, but I do prefer to avoid that.

 So I think it's just a matter of finding a better name for the virtual package.
What about imx-vpu-provider?


> Each patch for this imx-vpu change modifies several packages (those
> depending on it) so that it doesn't break the build in case someone
> bisects the tree.
> 
> Finally, I've verified those packages on both i.MX6Q and i.MX8MQ. But in
> the case of i.MX8MQ, the VPU testing was limited to the package unit
> tests since the open-source imx plugin doesn't support Hantro VPU (yet).
> Note that I don't plan on integrating NXP plugin since it implies
> changing all the standard plugins to be "NXP-compliant" [4].

 Hm, I thought that NXP had understood open source, but apparently there is
still a ways to go...

 Regards,
 Arnout

> 
> Let me know if you are ok with this approach. As usual, comments are
> welcome.
> 
> Regards,
> Gary
> 
> [1] https://community.nxp.com/docs/DOC-340805
> [2] https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/imx-vpu/imx-vpu_5.4.38.bb#L11
> [3] https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/imx-vpu-hantro/imx-vpu-hantro_1.6.0.bb#L9
> [4] https://github.com/Freescale/meta-freescale/tree/master/recipes-multimedia/gstreamer
> 
> Gary Bisson (8):
>   firmware-imx: bump to version 7.5
>   imx-vpu: rename package to imx-vpu-cnm
>   imx-vpu-cnm: bump version to 5.4.38
>   imx-vpu-hantro: new package
>   imx-vpu: new virtual package
>   imx-vpuwrap: bump version to 4.3.5
>   imx-codec: bump version to 4.3.5
>   imx-parser: bump version to 4.3.5
> 
>  package/freescale-imx/Config.in               |  5 ++-
>  .../firmware-imx/firmware-imx.hash            |  2 +-
>  .../firmware-imx/firmware-imx.mk              |  2 +-
>  .../freescale-imx/imx-codec/imx-codec.hash    |  3 +-
>  package/freescale-imx/imx-codec/imx-codec.mk  |  4 +-
>  .../freescale-imx/imx-parser/imx-parser.hash  |  3 +-
>  .../freescale-imx/imx-parser/imx-parser.mk    |  2 +-
>  package/freescale-imx/imx-vpu-cnm/Config.in   | 25 +++++++++++
>  .../imx-vpu-cnm/imx-vpu-cnm.hash              |  3 ++
>  .../freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk  | 39 ++++++++++++++++
>  ...on.h-header-inclusion-to-be-standard.patch | 44 +++++++++++++++++++
>  .../freescale-imx/imx-vpu-hantro/Config.in    | 23 ++++++++++
>  .../imx-vpu-hantro/imx-vpu-hantro.hash        |  2 +
>  .../imx-vpu-hantro/imx-vpu-hantro.mk          | 42 ++++++++++++++++++
>  package/freescale-imx/imx-vpu/Config.in       | 21 +++------
>  package/freescale-imx/imx-vpu/imx-vpu.hash    |  2 -
>  package/freescale-imx/imx-vpu/imx-vpu.mk      | 34 +-------------
>  package/freescale-imx/imx-vpuwrap/Config.in   | 11 +++--
>  .../imx-vpuwrap/imx-vpuwrap.hash              |  3 +-
>  .../freescale-imx/imx-vpuwrap/imx-vpuwrap.mk  |  2 +-
>  package/gstreamer/gst-fsl-plugins/Config.in   |  2 +-
>  .../gst-fsl-plugins/gst-fsl-plugins.mk        |  2 +-
>  package/libimxvpuapi/Config.in                |  7 ++-
>  23 files changed, 210 insertions(+), 73 deletions(-)
>  create mode 100644 package/freescale-imx/imx-vpu-cnm/Config.in
>  create mode 100644 package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash
>  create mode 100644 package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
>  create mode 100644 package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
>  create mode 100644 package/freescale-imx/imx-vpu-hantro/Config.in
>  create mode 100644 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
>  create mode 100644 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
>  delete mode 100644 package/freescale-imx/imx-vpu/imx-vpu.hash
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
