From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Sep 2010 23:35:37 +0200
Subject: [Buildroot] [PATCH 40/74] dmraid: remove useless strip and use
	correct step override method
In-Reply-To: <020e028108d53c14ae257c8a643aa2d22ac00f4a.1284312638.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 12 Sep 2010 19:42:26 +0200")
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
	<cover.1284312638.git.thomas.petazzoni@free-electrons.com>
	<020e028108d53c14ae257c8a643aa2d22ac00f4a.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aanmk5li.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For the target installation step, do not rely on the package being
 Thomas> installed in the staging directory, as it may not be true. So the
 Thomas> dmraid binary is directly taken from the build directory.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/dmraid/dmraid.mk |   24 +++++++-----------------
 Thomas>  1 files changed, 7 insertions(+), 17 deletions(-)

 Thomas> diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
 Thomas> index 93d6561..ccd6a36 100644
 Thomas> --- a/package/dmraid/dmraid.mk
 Thomas> +++ b/package/dmraid/dmraid.mk
 Thomas> @@ -12,23 +12,13 @@ DMRAID_MAKE = $(MAKE1)
 Thomas>  DMRAID_DEPENDENCIES:=lvm2
 Thomas>  DMRAID_INSTALL_STAGING:=yes
 
 Thomas> -$(eval $(call AUTOTARGETS,package,dmraid))
 Thomas> -
 Thomas> -$(DMRAID_TARGET_INSTALL_TARGET): $(DMRAID_TARGET_INSTALL_STAGING)
 Thomas> -	$(call MESSAGE,"Installing to target")
 Thomas> -	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/sbin/dmraid $(TARGET_DIR)/usr/sbin
 Thomas> +define DMRAID_INSTALL_TARGET_CMDS
 Thomas> +	$(INSTALL) -m 0755 $(@D)/$(DMRAID_SUBDIR)/tools/dmraid $(TARGET_DIR)/usr/sbin
 Thomas>  	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid

Again - Not your fault, but the init scripts need so be named S??dmraid
for the default rcS handler to find it. The init script furthermore
expects dmraid to be installed in /sbin but we're installing into
/usr/sbin.

Care to fix this up while you're at it?

-- 
Bye, Peter Korsgaard
