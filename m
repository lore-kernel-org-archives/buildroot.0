From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Dec 2011 07:54:28 +0100
Subject: [Buildroot] [PATCH v3 2/2] New package: python-dpkt
In-Reply-To: <1323877116-31436-1-git-send-email-yegorslists@googlemail.com>
References: <1323877116-31436-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <201112210754.28934.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 December 2011 16:38:36 yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-dpkt-setup.patch removes dpkt inclusion in setup.py
> and stores package metadata directly in setup.py. This avoids
> unneeded host-python dependencies like zlib
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/python-dpkt/python-dpkt-setup.patch b/package/python-dpkt/python-dpkt-setup.patch
> new file mode 100644
> index 0000000..a025272
> --- /dev/null
> +++ b/package/python-dpkt/python-dpkt-setup.patch
> @@ -0,0 +1,27 @@
> +remove dpkt inclusion in setup.py to avoid unneeded dependencies
> +like zlib
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + setup.py |    7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +Index: b/setup.py
> +===================================================================
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1,11 +1,10 @@
> + #!/usr/bin/env python
> +
> + from distutils.core import setup
> +-import dpkt
> +
> + setup(name='dpkt',
> +-      version=dpkt.__version__,
> +-      author=dpkt.__author__,
> +-      url=dpkt.__url__,
> ++      version='1.7',
> ++      author='Dug Song <dugsong@monkey.org>',
> ++      url='http://dpkt.googlecode.com/',
 Good idea, but it makes life more difficult for version bumpers.  There
should at least be a comment in the .mk file to point the version bumper
to this patch, explaining the version should be incremented here as well.
Alternatively, the information could be passed in environment variables
which are set in the .mk file.

> +       description='dumb packet module',
> +       packages=[ 'dpkt' ])
> diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
> new file mode 100644
> index 0000000..7ac873c
> --- /dev/null
> +++ b/package/python-dpkt/python-dpkt.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# python-dpkt
> +#
> +#############################################################
> +
> +PYTHON_DPKT_VERSION = 1.7
> +PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
> +PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
> +
> +PYTHON_DPKT_DEPENDENCIES = python
> +
> +define PYTHON_DPKT_BUILD_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> +endef
> +
> +define PYTHON_DPKT_INSTALL_TARGET_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(call GENTARGETS))
> +
> 

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
