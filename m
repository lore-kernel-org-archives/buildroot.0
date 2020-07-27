From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 17:15:42 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/docker-engine: needs some
 kernel options
In-Reply-To: <20200621080000.180089-4-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 21 Jun 2020 09:59:56 +0200")
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-4-francois.perrad@gadz.org>
Message-ID: <87ft9dugyp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > according to https://wiki.gentoo.org/wiki/Docker#Kernel

A better source is docker-engine/contrib/check-config.sh. See below for
the suggestions from it.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/docker-engine/docker-engine.mk | 67 ++++++++++++++++++++++++++
 >  1 file changed, 67 insertions(+)

 > diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
 > index 78f6c1261..41600486c 100644
 > --- a/package/docker-engine/docker-engine.mk
 > +++ b/package/docker-engine/docker-engine.mk
 > @@ -79,4 +79,71 @@ define DOCKER_ENGINE_USERS
 >  	- - docker -1 * - - - Docker Application Container Framework
 >  endef
 
 > +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 > +define DOCKER_ENGINE_DRIVER_BTRFS_LINUX_CONFIG_FIXUPS
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS)

check-config.sh also mentions xattr support for btrfs, so I've added:

  $(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS_POSIX_ACL)

 > +endef
 > +endif
 > +
 > +define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG_SWAP)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_CGROUP)

MEMCG_SWAP and BLK_CGROUP are optional (E.G. you may be running from an
initramfs or without swap). I've dropped them.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_FAIR_GROUP_SCHED)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFS_BANDWIDTH)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_RT_GROUP_SCHED)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)

Same for these.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_PID_CPUSET)

And this.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PERF)

This is afaik not used by docker.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)

User namespace is optional.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_BLOCK)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_THROTTLING)

Same for BLK_CGROUP.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)

check-config.sh also mentions CONFIG_NETFILTER_XT_MATCH_IPVS. This
depends on IPVS support in the kernel to get used. I've added
_XT_MATCH_IPVS so it gets enabled if IPVS support is turned on.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_NETMAP)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REDIRECT)

These are (afaik) not needed.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCHED)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_CGROUP)

Optional.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_L3_MASTER_DEV)

(afaik) not used.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_NET_PRIO)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_NETCLASSID)

Optional.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_MD)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_DM)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_MD_THIN_PROVISIONING)

These are only needed for the non-default devicemapper support, so I
moved them to a DOCKER_ENGINE_DRIVER_DM_LINUX_CONFIG_FIXUPS conditional.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_PERSISTENT_KEYRINGS)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_ENCRYPTED_KEYS)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)

These are (afaik) not used, so dropped.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
