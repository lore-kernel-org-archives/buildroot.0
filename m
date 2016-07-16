From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:55:23 +0200
Subject: [Buildroot] [PATCH 1/4] package/audit: Allow Host compilation.
In-Reply-To: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
References: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160716155523.386a8d92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 13:47:01 -0400, Adam Duskett wrote:
> Policycoreutils requires audit as a host package.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Please use lower-case in the commit title:

	package/audit: allow host compilation

or better:

	package/audit: add support for host variant

> +HOST_AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> +HOST_AUDIT_DEPENDENCIES += host-libcap-ng

This is just plain wrong, and I already explained why.
BR2_PACKAGE_LIBCAP_NG indicates if the *target* variant of libcap-ng is
enabled or not. It doesn't say anything about whether you should or not
use the host variant.

So basically, you should choose if host-audit should unconditionally
use host-libcap-ng, or if it should not use it at all.

Unless there is a link between the availability of libcap-ng on the
target and the need to have libcap-ng support in host-audit. But in
this case, a big comment in the .mk file is needed to explain this link.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
