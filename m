From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 25 Jun 2018 16:26:07 -0700
Subject: [Buildroot] Build failure due to the new "cset existence" check in
 the GIT downloader
Message-ID: <CAGt4E5tqz2qVVvh26o1pz-S59QXBvw+zkPq2ujJ0e03CVcxVsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We have a handful of packages we added to Buildroot rootfs for our STB
platform. We've been using them like this since at least 2017.08. A
recent change to the GIT download helper is now causing a build
failure.

Here's an example makefile:

##############################################################
#
# brcm-pm
#
##############################################################

BRCM_PM_VERSION = master
BRCM_PM_SITE = ...
BRCM_PM_SOURCE = uclinux-rootfs.tar.gz
BRCM_PM_DIR = uclinux-rootfs
BRCM_PM_LICENSE = BSD-3-Clause

# Extract only what we need to save space.
define BRCM_PM_EXTRACT_CMDS
    $(call suitable-extractor,$(BRCM_PM_SOURCE)) \
        $(BRCM_PM_DL_DIR)/$(BRCM_PM_SOURCE) | \
        $(TAR) --strip-components=1 -C $(BRCM_PM_DIR) \
        --wildcards $(TAR_OPTIONS) - '*/user/brcm-pm'
endef

define BRCM_PM_BUILD_CMDS
    $(TARGET_MAKE_ENV) \
        $(MAKE) -C $(@D)/user/brcm-pm $(TARGET_CONFIGURE_OPTS)
endef

define BRCM_PM_INSTALL_TARGET_CMDS
    $(TARGET_MAKE_ENV) \
        $(MAKE) -C $(@D)/user/brcm-pm install DESTDIR=$(TARGET_DIR)
endef

$(eval $(generic-package))

As you can see, "version" is set to "master". This works just fine,
except that the download helper thinks that it doesn't. Specifically,
this test fails if $cset is "master":

# Check that the changeset does exist. If it does not, re-cloning from
# scratch won't help, so we don't want to trash the repository for a
# missing commit. We just exit without going through the ERR trap.
if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
    printf "Commit '%s' does not exist in this repository\n." "${cset}"
    exit 1
fi

We get this running the build:

[...]

Could not fetch special ref 'master'; assuming it is not special.
Commit 'master' does not exist in this repository
--2018-06-21 17:22:37--
http://sources.buildroot.net/brcm-pm/uclinux-rootfs-c38822d042bd729481f2cea6b2fd138b5e190fa8.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
104.27.166.48, 104.27.167.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-06-21 17:22:47 ERROR 404: Not Found.

[...]

package/pkg-generic.mk:135: recipe for target
'/var/lib/jenkins/workspace/buildroot-mmayer/output/arm/build/brcm-pm-master/.stamp_downloaded'
failed
make[1]: *** [/var/lib/jenkins/workspace/buildroot-mmayer/output/arm/build/brcm-pm-master/.stamp_downloaded]
Error 1
Makefile:18: recipe for target '_all' failed
make: *** [_all] Error 2

It clones the repo, finds that "master" is not special (which is
correct), checks if "master" exists (it doesn't -- yet), concludes
that means a checkout would fail (which is incorrect, origin/master
exists). It subsequently tries to download the package from various
servers, where it really doesn't exist. Ultimately, the build fails,
because it can't find the sources.

Of course GIT *could* check out "master" successfully, if it tried. It
never tries, because "git rev-parse" doesn't succeed for "master" and
the download helper bails, assuming that is the right thing to do.

If I am not mistaken, the problem is that the clone operation
Buildroot performs doesn't result in any checked out branches, hence
the local branch "master" does indeed not exist (origin/master does).
Of course, "master" it would automatically be created if one ran "git
checkout master", because GIT would automatically create the local
branch "master" to track "origin/master". The rev-parse check is
neglecting this fact. It assumes that something that doesn't exist now
would always result in a failed checkout. This is incorrect, as shown
here.

Would it make sense for the download helper to check if the passed in
"cset" exists as a branch once "rev-parse" returns an error? Or
perform its check in a different way, so branches are recognized? Or
try to check out the branch first after the clone operation? It seems
that the download helper should not artificially abort a build that
would actually succeed. Right now it's doing exactly that.

I am not sure what the best solution is, but I don't think the current
check is correct. What do you think?

Thanks,
-Markus
