From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:33:45 +0200
Subject: [Buildroot] [PATCH 00/13] Turn OpenSSL into a virtual package
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171021213345.3e20e080@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 22:32:27 -0400, Adam Duskett wrote:

> Adam Duskett (13):
>   openssl: new virtual package
>   softether: depend on libopenssl
>   hostapd: add libressl-support.patch
>   ffmpeg: add libressl suport patch
>   mosquitto: add libressl support patch
>   opusfile: add libressl support patch
>   openldap: add libressl support patch
>   heirloom-mailx: add libressl support patch
>   libevent: add libressl support patch
>   wpa_supplicant: add libressl support patch
>   ca-certificates: fix installation against libressl
>   mosquitto: fix building against libressl
>   openssl: add libressl to virtual package

So, we finally applied this series, but with quite a few changes:

 - We were not happy with carrying all those patches to make those
   packages compatible with LibreSSL, so instead we made them depend on
   libopenssl only.

 - For heirloom-mailx, we kept the patch because it looks acceptable
   upstream. Could you submit it upstream, please?

 - For softether, switching to a "depends on" was not acceptable, as it
   would break existing defconfigs. So instead, we introduced a
   BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL hidden boolean that tells the
   openssl virtual package that only libopenssl is acceptable as a
   provider.

 - With your series, ca-certificates would not build, because it needs
   host-openssl, which would be host-libressl, which doesn't exist.
   However, using host-libressl would mean that all packages that
   depend on host-openssl would have to be checked. So instead, we
   defined BR2_PACKAGE_PROVIDES_HOST_OPENSSL to host-libopenssl, which
   forces host-openssl to always point to host-libopenssl.

With those changes, series applied. Now, it would be helpful to update
utils/genrandconfig to randomly enable libressl instead of openssl to
get this situation tested by the autobuilders.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
