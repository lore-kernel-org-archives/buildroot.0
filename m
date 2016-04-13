From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 17:37:43 +0200
Subject: [Buildroot] Cannot build Custom Kernel Module
In-Reply-To: <CAN34foxCgoP_i21MRzXiF2DWuT+R9XL9LvKR+NpDYjh1Mga7xw@mail.gmail.com>
References: <CAN34foz3HvhgeBsPKEc6vjsrzUWK-gsHoAVsvPSR7Def1gMKyA@mail.gmail.com>
 <570D638B.2040500@mind.be>
 <CAN34foxCgoP_i21MRzXiF2DWuT+R9XL9LvKR+NpDYjh1Mga7xw@mail.gmail.com>
Message-ID: <570E67C7.5020209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Stephen,

  Please don't top-post, but reply in-line like I do below. I realize that gmail 
doesn't make that easy :-)

On 04/13/16 16:38, Stephen Beckwith wrote:
> Arnout,
>     THANK YOU very much!  The problem wasn't so much an issue with the $eval,
> which for the life of me I don't remember where I copied that from but it was
> the "missing from external.mk" that solved it!!  Thanks for
> the pointer! (sometimes we forget these little steps. . .)
> So external.mk now has:
> # Does the Kernel Modules first:
> include $(sort $(wildcard $(BR2_EXTERNAL)/netapp/kmod*/*.mk))
> and the directory is now:  kmod_gpio - along with the associated "ripple effect" -
> The good news is:  Does the Rsync and starts off the build.
> I've reduced the kmod_gpio.mk to:
> KMOD_GPIO_VERSION = 0.1.0
> KMOD_GPIO_LICENSE = Public Domain
> KMOD_GPIO_SITE = $(BR2_EXTERNAL)/netapp/kmod_gpio
> KMOD_GPIO_SITE_METHOD = local

  As you have noticed, BR2_EXTERNAL is not exported so you can't refer to it 
from the package Makefile. The proper way is to add here:

KMOD_GPIO_MODULE_MAKE_OPTS = NETAPP_DIR=$(BR2_EXTERNAL)

>
> $(eval $(kernel-module))
> $(eval $(generic-package))
>
> And I have a Makefile in the directory that is:
>
> #inform the kernel that a module needs to be build
> obj-m :=gpio_module.o
>
> # Global Includes here
> GBL_INCLUDES = $(BR2_EXTERNAL)/netapp/include
> KNL_INCLUDES = $(BR2_EXTERNAL)/netapp/include/kernel

  And here you use GBL_INCLUDES=$(NETAPP_DIR)/include


  Regards,
  Arnout

>
> #Add here the CFLAGS to pass in to get the Defined Symbol
> CFLAGS_gpio_module.o := -DCONFIG_NETAPP_HWDD -I$(GBL_INCLUDES) -I$(KNL_INCLUDES)
>
> {fixed the bad,bad CFLAGS issue :) }
>
> However, I get a failure to build, due to missing headers, which are located in
> the GBL_INCLUDES path.  It seems for kernel modules, the $(BR2_EXTERNAL) is not
> being honored, as shown below.  Does this get passed through?  Is it OK to
> "reach back" to the source directory for the includes?
[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
