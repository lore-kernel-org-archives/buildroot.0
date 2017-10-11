From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 23:38:51 +0200
Subject: [Buildroot] [RFC 0/3] Adding software stacks
In-Reply-To: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <60e44779-04da-d7d4-9589-cfef09d1a226@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

On 10-10-17 22:43, Angelo Compagnucci wrote:
> Software stacks are a way to define a group of options that should be used together and they are orthogonal to configs: a software stack can indeed be shared among several configs.

 Wow, you always come with the innovative ideas, don't you?

 We discussed such a feature before, but never came up with an elegant way to do
it, and that was better than just calling merge_config.sh.

> Having a stack system like the one envisioned in this patch series make possible to do something like this:
> 
> make imx6-sabresd_defconfig; make mesa3d-etnaviv_stack qt5-fb_stack qt5-demos_stack; make

 So yeah, is this really better than

./utils/merge_config.sh configs/imx6-sabresd_defconfig
stacks/mesa3d-etnaviv_stack stacks/qt5-fb_stack stacks/qt5-demos_stack; make

? Yes, it is significantly shorter, but you can at least use tab-completion.

 That said, I'm not absolutely opposed to the idea. But I'm not convinced either.

 Adding stacks, on the other hand, seems like a worthwhile endeavour.


> In this way we can declutter redundant configs (ex: imx6-sabresd_qt5_defconfig) and decouple software packages side releated symbols from hardware related defconfigs.

 Not the best example, because imx6-sabresd_qt5_defconfig contains quite a few
board-specific adaptions: a kconfig fragment and a rootfs overlay. And of course
increasing the ext2 rootfs size.

 A better example would be atmel_sama5d4_xplained_dev_defconfig which is purely
a collection of packages.


 Regards,
 Arnout


> 
> 
> Angelo Compagnucci (3):
>   support/kconfig/merge_config.sh: merge also buildroot config files
>   Makefile: add handling of software stacks
>   stacks: add a bunch of stacks
> 
>  Makefile                        | 40 ++++++++++++++++++++++++++++++++++++++--
>  stacks/lamp_stack               | 10 ++++++++++
>  stacks/mesa3d-etnaviv_stack     |  7 +++++++
>  stacks/qt5-demos_stack          |  7 +++++++
>  stacks/qt5-fb_stack             | 11 +++++++++++
>  support/kconfig/merge_config.sh | 16 +++++++++++++++-
>  6 files changed, 88 insertions(+), 3 deletions(-)
>  create mode 100644 stacks/lamp_stack
>  create mode 100644 stacks/mesa3d-etnaviv_stack
>  create mode 100644 stacks/qt5-demos_stack
>  create mode 100644 stacks/qt5-fb_stack
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
