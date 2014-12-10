From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:52:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] mtr: bump to version 0.86 and use
 github call
In-Reply-To: <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
References: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
 <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <20141210215207.384d34ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

On Tue,  9 Dec 2014 18:13:57 -0800, Ivan Sergeev wrote:
> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> ---
>  package/mtr/mtr.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks, I've applied your patch, after removing the --without-glib
option that is no longer useful.

Also, if you have some time to work on mtr, it would be good to get rid
of the ugly:

# uClibc has res_ninit but not res_nmkquery
ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
define MTR_DISABLE_RES_NINIT
        $(SED) 's/#ifdef res_ninit/#if 0/' \
                $(@D)/dns.c
endef
endif

MTR_POST_PATCH_HOOKS += MTR_DISABLE_RES_NINIT

that we have in package/mtr/mtr.mk. To do this, some improvements to
configure.ac are needed to detect if the C library has res_ninit() and
res_nmkquery(). Feel free to work this out with upstream :-)

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
