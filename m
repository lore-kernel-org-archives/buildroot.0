From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Jun 2019 15:58:10 +0200
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: support external TA SDK
In-Reply-To: <20190601153041.6855248e@windsurf>
References: <20190517084556.12242-1-etienne.carriere@linaro.org>
 <20190601153041.6855248e@windsurf>
Message-ID: <20190601135810.GH3407@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Etienne, All,

On 2019-06-01 15:30 +0200, Thomas Petazzoni spake thusly:
> On Fri, 17 May 2019 10:45:53 +0200
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
> 
> > It happens that Buildroot is used to generate the embedded filesystem
> > not not the boot images that which are built from another environment(s).
> > In such case OP-TEE SDK get built outside of Buildroot. This SDK is
> > needed by other OP-TEE packages in Buildroot to generate .ta files.
> > 
> > This change introduces BR2_TARGET_OPTEE_OS_SDK_PATH for configuration
> > to provide the path of an external OP-TEE SDK.
> > 
> > This configuration is mandated when neither BR2_TARGET_OPTEE_OS_CORE
> > nor BR2_TARGET_OPTEE_OS_SDK are enable while BR2_TARGET_OPTEE_OS=y.
> > 
> > When BR2_TARGET_OPTEE_OS_SDK_PATH is defined, the build stage of
> > optee-os copies the SDK file tree into optee-os build tree, for these
> > to be installed during target/staging install.
> > 
> > With this change BR2_TARGET_OPTEE_OS_SERVICES no more selects
> > BR2_TARGET_OPTEE_OS_CORE as .ta files can be build from external SDK.
> > 
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> 
> To be honest, I am not convinced we want to support such a special use
> case. It makes the whole OP-TEE packaging more complicated. I don't
> think we need to support use cases where some random part of the system
> gets built by Buildroot, and another part is built externally.
> 
> So unless you can convince me that the use case is really important, I
> would be tempted to not accepted this patch series. I'm Cc'ing a bunch
> of other folks so that they can share their opinion.

Well, and even if the case is "important", and we decide to add support
for it, then why don't we allow for the same situation with other
packages, where parts of them are built out-side of Buildroot and then
shoe-horned at force into the Buildroot-built system?

If people really want to support such a corner case, then they are gfree
to implement their hacks in a br2-external tree.

Of course, the hack becomes pretty ugly once this is touching a package
already in Buildroot...

One in-between solution, would be to introduce a new package,
optee-os-custom-sdk, a very trivial package, which goal is to grab the
SDK files from "somewhere", potentially downloading etc... and storing
them where optee-os can use them from. Something like:

    boot/optee-os/optee-os.mk:
        OPTEE_OS_DEPENDENCIES += $(if $(BR2_TARGET_OPTEE_OS_CUSTOM_SDK),optee-os-custom-sdk)

    boot/optee-os-custom-sdk/config.in:
        config BR2_TARGET_OPTEE_OS_CUSTOM_SDK
            bool "optee-os-custom-sdk"
            depends on BR2_TARGET_OPTEE_OS
            help
              Blabla SDK files from outter space...

        config BR2_TARGET_OPTEE_OS_CUSTOM_SDK_URI
            bool "URI to SDK files"
            depends on BR2_TARGET_OPTEE_OS_CUSTOM_SDK_URI
            help
              Blaba where to find them (dir, tarball, git...)

And I'll lt your imagination come up with the content of
optee-os-custom-sdk.mk to handle that.

Note however how the Kconfig option BR2_TARGET_OPTEE_OS_CUSTOM_SDK
depends on BR2_TARGET_OPTEE_OS, but at build time the dependency is
inverted... This is not very nice, though...

I would be OKish if we were to introduce such a package, though.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
