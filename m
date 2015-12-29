From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 19:36:29 +0100
Subject: [Buildroot] [PATCHv5 1/2] pkg-generic: detect incorrectly used
 package
In-Reply-To: <1444382106-16019-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1444382106-16019-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151229193629.47b6dc3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Oct 2015 11:15:05 +0200, Thomas Petazzoni wrote:
> In Buildroot, the selection of a package from a Config.in level and
> from a Makefile level are completely disconnected. This can lead to
> issues where the build of a package is triggered at the Makefile level
> due to the package being listed in another package <pkg>_DEPENDENCIES
> variable, even if that package is not enabled in the configuration.
> 
> This has for example been the case recently with python-can having
> 'python' in its <pkg>_DEPENDENCIES, while python-can could be enabled
> when Python 3.x is used, in which case the 'python' package should not
> be built.
> 
> To detect such issues more easily, this patch adds a check in the
> package infrastructure. When the build process of a package is being
> triggered, we verify that the package is enabled in the
> configuration. We do this check in the "configure" step, since this
> step is the first common step between the normal download case and the
> "local site method" / "package override" case.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v4:
>  - Use $($(PKG)_KCONFIG_VAR) and $($(PKG)_TYPE) as suggested by Arnout.
>  - Split the "potential culprit" mechanism into a separate commit, as
>    suggested by Yann.

I've applied, after taking into account the comment from Yann (and
fixing a minor issue with it: $(1) cannot be used, it should have been
$($(PKG)_NAME)).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
