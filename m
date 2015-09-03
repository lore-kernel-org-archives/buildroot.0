From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Sep 2015 17:30:43 +0300
Subject: [Buildroot] [PATCH] pkg-generic: fix <pkg>-legal-info target
In-Reply-To: <55E85556.4030103@lucaceresoli.net>
References: <217433bd5ec057444b036dd8b72778f078f0926e.1441213919.git.baruch@tkos.co.il>
 <55E85556.4030103@lucaceresoli.net>
Message-ID: <20150903143043.GJ18583@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Thu, Sep 03, 2015 at 04:12:38PM +0200, Luca Ceresoli wrote:
> Baruch Siach wrote:
> >When making the <pkg>-legal-info target before the main legal-info target, the
> >following error shows:
> >
> >/bin/sh: /home/baruch/git/buildroot/output/legal-info/licenses.txt: No such file or directory
> >package/freescale-imx/imx-vpu/imx-vpu.mk:39: recipe for target 'imx-vpu-legal-info' failed
> >make: *** [imx-vpu-legal-info] Error 1
> >
> >Make <pkg>-legal-info depend on legal-info-prepare to ensure that
> >$(LEGAL_INFO_DIR) exists when generating licenses.txt.
> >
> >Cc: Luca Ceresoli <luca@lucaceresoli.net>
> >Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >---
> >  package/pkg-generic.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >index 6a7d97efdf02..24b473b13ff2 100644
> >--- a/package/pkg-generic.mk
> >+++ b/package/pkg-generic.mk
> >@@ -715,7 +715,7 @@ endif
> >  endif
> >
> >  # legal-info: produce legally relevant info.
> >-$(1)-legal-info:
> >+$(1)-legal-info: legal-info-prepare
> 
> Very weird, I can reproduce the bug, but only for packages under
> package/freescale/, like imx-vpu. I tested a dozen other packages, and
> they all work fine. My test command is:
> 
>   git clean -xdf && make defconfig && \
>     make BR2_DL_DIR=~/src ${PKG}-legal-info
> 
> Any idea of why these packages are special?

Which target creates the legal-info/ directory in the successful (non 
freescale) case?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
