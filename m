From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 15:10:35 +0200
Subject: [Buildroot] [PATCH] pciutils: convert to the autotools
 infrastructure
In-Reply-To: <78409DB4-3D71-4100-81B8-653F239F8E31@me.com>
References: <78409DB4-3D71-4100-81B8-653F239F8E31@me.com>
Message-ID: <20100414151035.66ce8e50@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for doing this! A couple of comments below.

On Tue, 13 Apr 2010 23:49:17 +0200
Thomas Brandstetter <thomas.brandstetter@me.com> wrote:

> +PCIUTILS_CONFIGURE_CMDS = echo ""

pciutils build system is not based on the autotools, therefore, you
should not be using the autotools infrastructure, but the generic
infrastructure (i.e GENTARGETS instead of AUTOTARGETS).

See http://buildroot.org/downloads/buildroot.html#generic-tutorial for
details.

> +$(PCIUTILS_HOOK_POST_EXTRACT):
>  	$(SED) 's/uname -s/echo Linux/' \
>  		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
> -		$(PCIUTILS_DIR)/lib/configure
> +		$(PCIUTILS_DIR)/lib/configure	

Could you use the new style hooks instead ? See again above link for
details.

> +$(PCIUTILS_HOOK_POST_INSTALL):
> +	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/lspci
> +	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/setpci

This is not needed, binaries in $(TARGET_DIR) are automatically
stripped.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
