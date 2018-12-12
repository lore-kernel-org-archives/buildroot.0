From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 12 Dec 2018 10:27:56 +0100
Subject: [Buildroot] [PATCH v2 2/5] optee-client: new package
In-Reply-To: <20181210225722.01b691cb@windsurf>
References: <1542990817-28362-1-git-send-email-etienne.carriere@linaro.org>
 <1542990817-28362-2-git-send-email-etienne.carriere@linaro.org>
 <20181210225722.01b691cb@windsurf>
Message-ID: <CAN5uoS8KgHtsfY3jiUKRoqSQiT9EcUzT+2EgRdqQnbXPHqSD4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas for the feedback.
I will address your comments in a V3, I see no point to argue.

Regards,
etienne
On Mon, 10 Dec 2018 at 22:57, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> On Fri, 23 Nov 2018 17:33:34 +0100, Etienne Carriere wrote:
>
> > diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> > new file mode 100644
> > index 0000000..cff452b
> > --- /dev/null
> > +++ b/package/optee-client/Config.in
> > @@ -0,0 +1,73 @@
> > +config BR2_PACKAGE_OPTEE_CLIENT
> > +     bool "Embed OP-TEE client"
>
> Just:
>
>         bool "optee-client"
>
> > +     help
> > +       Enable the OP-TEE client package that brings non-secure
> > +       client application resources for OP-TEE support. OP-TEE
> > +       client is a component delivered by the OP-TEE project.
> > +
> > +       https://github.com/OP-TEE/optee_client
>
> Please move this at the very end of the Config.in help text, i.e...
>
> > +
> > +       The client API library allows application to invoke
> > +       trusted applications hosted in the OP-TEE OS secure world.
> > +       The supplicant provides services hosted by the non-secure
> > +       world and invoked by the secure world.
>
> ... here.
>
> > +
> > +if BR2_PACKAGE_OPTEE_CLIENT
> > +
> > +choice
> > +     prompt "OP-TEE client version"
>
>         prompt "version"
>
> > +     default BR2_PACKAGE_OPTEE_CLIENT_LATEST
> > +     help
> > +       Select the version of OP-TEE client you want to use
> > +
> > +config BR2_PACKAGE_OPTEE_CLIENT_LATEST
> > +     bool "sync with latest registered release tag"
>
>         bool "3.3.0"
>
> > +     help
> > +       Sync on latest release tag. This currently fetches the
>
> Don't say "latest", because it won't always be the latest.
>
> > +       latest registered release tag from the OP-TEE official
> > +       Git repository.
> > +
> > +config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
> > +     bool "sync with a specific Git"
>
>         bool "Custom Git repository"
>
> > +     help
> > +       Sync with a specific OP-TEE Git repository.
>
> Is there actually a need to specify a custom version for this client
> library ? For the OS part, which is platform-specific, I understand,
> but for optee-client, is this really needed ?
>
> > +endchoice
> > +
> > +config BR2_PACKAGE_OPTEE_CLIENT_SYNCED_VERSION
> > +     bool "use same version ref for OP-TEE components"
>
> I don't understand why you have this here. If you really want to do
> that, what about adding a third choice above:
>
>         bool "use same version as optee-os"
>
> > +     depends on BR2_PACKAGE_OPTEE_CLIENT_LATEST
> > +     default true
>
> default true doesn't mean anything, "default y" does. And it should
> depend on BR2_TARGET_OPTEE_OS being selected.
>
> But how can this make sense ? If the version for optee-os is a Git
> commit hash, how can optee-client use the same version, given that they
> are stored in two separate Git repositories, and that therefore it's
> impossible/unlikely that optee-os/optee-client will have the same Git
> commit hash. Or maybe this is only intended to work with Git tags? In
> this case, it should be clearly explained.
>
> > +     help
> > +       When enabled, OP-TEE client version must match the version
> > +       set for the other OP-TEE components.
> > +
> > +config BR2_PACKAGE_OPTEE_CLIENT_VERSION
> > +     string
> > +     default BR2_TARGET_OPTEE_OS_VERSION \
> > +                     if BR2_PACKAGE_OPTEE_CLIENT_SYNCED_VERSION && \
> > +                        BR2_TARGET_OPTEE_OS
>
> The dependency on BR2_TARGET_OPTEE_OS should not come here, but be on
> the BR2_PACKAGE_OPTEE_CLIENT_SYNCED_VERSION option.
>
> > +     default "3.3.0" if BR2_PACKAGE_OPTEE_CLIENT_LATEST
> > +     default BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_VERSION \
> > +                     if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
> > +     help
> > +       Reference in the target Git repository to sync with.
> > +
> > +if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT
> > +
> > +config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_URL
> > +     string "Git repository site"
>
>         string "URL of custom repository"
>
> > +     help
> > +       Specific location of the reference source tree Git
> > +       repository.
> > +
> > +config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_VERSION
> > +     string "target reference to pull in the Git repository"
>
>         string "Custom repository version"
>
> > +     help
> > +       Package version reference to sync with. As source file
>
> Don't use "sync", you don't sync with Git.
>
> > +       reference is a Git repository, the version reference can
> > +       be any Git reference as a tag or a sha1.
> > +
> > +endif
> > +
> > +endif #BR2_PACKAGE_OPTEE_CLIENT
> > diff --git a/package/optee-client/S30optee b/package/optee-client/S30optee
> > new file mode 100644
> > index 0000000..c893243
> > --- /dev/null
> > +++ b/package/optee-client/S30optee
> > @@ -0,0 +1,26 @@
> > +#!/bin/sh
> > +#
> > +# /etc/init.d/optee
>
> Drop this comment, it is useless, and in fact wrong: the file will not
> have this name in a Buildroot filesystem.
>
> > +#
> > +# Start/stop tee-supplicant (OP-TEE normal world daemon)
> > +#
> > +case "$1" in
> > +    start)
> > +     if [ -e /usr/sbin/tee-supplicant -a -e /dev/teepriv0 ]; then
>
> Drop this test, just start tee-supplicatn.
>
> > +             echo "Starting tee-supplicant..."
> > +             /usr/sbin/tee-supplicant &
>
> Please use start-stop-daemon. See
> https://patchwork.ozlabs.org/patch/994013/ for the "right" way of
> writing an init script.
>
> > +             exit 0
> > +     else
> > +             echo "tee-supplicant or TEE device not found"
> > +             exit 1
> > +     fi
> > +
> > +        ;;
> > +    stop)
> > +     killall tee-supplicant
>
> Please use start-stop-daemon.
>
> > +     ;;
> > +    status)
> > +     cat /dev/teepriv0 2>&1 | grep -q "Device or resource busy" || not="not "
> > +     echo "tee-supplicant is ${not}active"
>
> We don't provide a "status" target in other init scripts.
>
> > +     ;;
> > +esac
> > diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
> > new file mode 100644
> > index 0000000..ed7bf4e
> > --- /dev/null
> > +++ b/package/optee-client/optee-client.hash
> > @@ -0,0 +1,4 @@
> > +# From https://github.com/OP-TEE/optee_client/archive/3.3.0.tar.gz
> > +sha256 63af1567fdcdbe28b45be274266a89aa81bef3d0fd8ec5a6eb680046a92e1177  optee-client-3.3.0.tar.gz
> > +# Locally computed
> > +sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
>
> Move the license hash in package/optee-client/3.3.0/optee-client.hash,
> as it is specific to this version.
>
> > diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> > new file mode 100644
> > index 0000000..ccc5d12
> > --- /dev/null
> > +++ b/package/optee-client/optee-client.mk
> > @@ -0,0 +1,30 @@
> > +################################################################################
> > +#
> > +# optee-client
> > +#
> > +################################################################################
> > +
> > +OPTEE_CLIENT_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_VERSION))
> > +OPTEE_CLIENT_LICENSE = BSD-3-Clause
>
> The license text contains a BSD-2-Clause license.
>
> > +OPTEE_CLIENT_LICENSE_FILES = LICENSE
> > +
> > +ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_GIT),y)
> > +OPTEE_CLIENT_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_REPO_URL))
> > +OPTEE_CLIENT_SITE_METHOD = git
> > +BR_NO_CHECK_HASH_FOR += $(OPTEE_CLIENT_SOURCE)
> > +else
> > +OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
> > +endif
> > +
> > +define OPTEE_CLIENT_INSTALL_SUPPLICANT_SCRIPT
> > +     $(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
> > +             $(TARGET_DIR)/etc/init.d/S30optee
> > +endef
> > +
> > +define OPTEE_CLIENT_INSTALL_INIT_SYSV
> > +     $(OPTEE_CLIENT_INSTALL_SUPPLICANT_SCRIPT)
>
> Please do the $(INSTALL) right here, there is no reason to have an
> indirection through the OPTEE_CLIENT_INSTALL_SUPPLICANT_SCRIPT
> variable.
>
> > +OPTEE_CLIENT_INSTALL_STAGING = YES
>
> Please move this a bit above in the .mk file. We generally have such
> statements before the build/installation commands.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
