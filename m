From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:42:35 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: fix static build with snappy
In-Reply-To: <20190528203230.24558-1-fontaine.fabrice@gmail.com>
References: <20190528203230.24558-1-fontaine.fabrice@gmail.com>
Message-ID: <20190528224235.7b5a2647@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 May 2019 22:32:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/419468f0d7d3c2b64d420513aa9505c6de097ed2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Set linker to CXX instead of adding -lstdc++ to LIBS

Is this really the right thing to do? Ideally a program written in C
should not have to know that a library it is using is written in C++.

We already had a similar situation in Buildroot, and so far we have
added -lstdc++. For example:

ifeq ($(BR2_PACKAGE_DIRECTFB),y)
LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
ifeq ($(BR2_STATIC_LIBS),y)
LINKS_CONF_ENV += LIBS=-lstdc++

and there's a few other examples in the tree. To be honest, I don't
know what is the most correct solution, I'm just trying to make sure we
solve a given problem in the same way everywhere.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
