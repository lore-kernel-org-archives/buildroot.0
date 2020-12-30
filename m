From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 15:43:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/gtest: host-gtest install like
 a normal cmake package
In-Reply-To: <20201216174404.47363-1-paul.soucy@sense.com>
References: <20201216174404.47363-1-paul.soucy@sense.com>
Message-ID: <20201230154358.46786e0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Paul,

On Wed, 16 Dec 2020 12:44:04 -0500
Paul Soucy <paul.soucy@sense.com> wrote:

> host-gtest does not actually build and install gtest libraries or header files, it just installs the gmock_gen stuff. This patch will now build and install gtest to the host like a normal cmake package.
> 
> Signed-off-by: Paul Soucy <paul.soucy@sense.com>

Thanks for your patch!

Could you give some details as to why you need gtest to be installed in
$(HOST_DIR) ?

> -define HOST_GTEST_INSTALL_CMDS
> +define HOST_GTEST_POST_INSTALL_PYTHON
>  	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>  		$(HOST_DIR)/bin/gmock_gen
>  	cp -rp $(@D)/googlemock/scripts/generator/cpp \
>  		$(HOST_GTEST_GMOCK_PYTHONPATH)
>  endef
>  
> +HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON

Is this thing still needed? I applied your patch, and I was able to
successfully build the target gtest+gmock, even without gmock_gen being
installed in $(HOST_DIR)/bin/ by host-gtest.

Am I missing something?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
