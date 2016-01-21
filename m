From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2016 22:32:47 +0100
Subject: [Buildroot] [PATCH] ifupdown: bump to version 0.8.8
In-Reply-To: <20160121221324.62c48f5e@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 21 Jan 2016 22:13:24 +0100")
References: <1453401915-7117-1-git-send-email-gustavo@zacarias.com.ar>
 <20160121221324.62c48f5e@free-electrons.com>
Message-ID: <87bn8esjnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Gustavo,
 > On Thu, 21 Jan 2016 15:45:15 -0300, Gustavo Zacarias wrote:

 >> -IFUPDOWN_VERSION = 0.8.2
 >> +IFUPDOWN_VERSION = 0.8.8
 >> IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
 >> -IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20151205T042642Z/pool/main/i/ifupdown
 >> +IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160113T035819Z/pool/main/i/ifupdown
 >> IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 >> IFUPDOWN_LICENSE = GPLv2+
 >> IFUPDOWN_LICENSE_FILES = COPYING
 >> @@ -23,4 +23,13 @@ define IFUPDOWN_INSTALL_TARGET_CMDS
 >> $(TARGET_MAKE_ENV) $(MAKE) BASEDIR=$(TARGET_DIR) -C $(@D) install
 >> endef
 >> 
 >> +# We need to switch from /bin/ip to /sbin/ip
 >> +IFUPDOWN_DEFN_FILES = can inet inet6 ipx link meta
 >> +define IFUPDOWN_MAKE_IP_IN_SBIN
 >> +	for f in $(IFUPDOWN_DEFN_FILES) ; do \
 >> +		$(SED) 's,/bin/ip,/sbin/ip,' $(@D)/$$f.defn ; \
 >> +	done
 >> +endef
 >> +IFUPDOWN_POST_PATCH_HOOKS += IFUPDOWN_MAKE_IP_IN_SBIN

 > For this kind of things, I think my personal preference would be to
 > have a real patch rather than a post patch hook.

I also generally dislike the combination of patches AND sed
replacements, but like Gustavoz says it's a bit painful to patch as
there's so many instances of it.

And I guess we won't be able to upstream such as patch as Debian has
/bin/ip (and a /sbin/ip symlink) because of bug reports like this:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=134812

And if busybox would change to /bin/ip, a bunch of scripts would
probably break, so that's not going to happen either.

So I'm not sure what the best option really is :/ Perhaps just the sed.

-- 
Venlig hilsen,
Peter Korsgaard 
