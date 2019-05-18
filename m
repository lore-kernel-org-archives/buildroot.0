From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:13:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/tzdata and package/zic: bump to
 version 2019a
In-Reply-To: <20190517174019.65050-1-aduskett@gmail.com>
References: <20190517174019.65050-1-aduskett@gmail.com>
Message-ID: <20190518211320.3c2b6bf3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Fri, 17 May 2019 13:40:19 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Also add TZDATA_LICENSE_FILES and ZIC_LICENSE_FILES, and hashes for those
> files.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---

Nit: the commit title would be better formatted as:

	package/{tzdata,zic}: bump to version 2019a

> -TZDATA_VERSION = 2018e
> +TZDATA_VERSION = 2019a
>  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>  TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
>  TZDATA_STRIP_COMPONENTS = 0
>  TZDATA_DEPENDENCIES = host-tzdata
>  HOST_TZDATA_DEPENDENCIES = host-zic
>  TZDATA_LICENSE = Public domain
> +TZDATA_LICENSE_FILES = LICENSE

Unfortunately, this breaks "make legal-info":

>>> tzdata 2019a Collecting legal info
sha512sum: /home/thomas/projets/buildroot/output/build/tzdata-2019a/LICENSE: No such file or directory
ERROR: LICENSE has wrong sha512 hash:
ERROR: expected: 9fe102f8894714cd0bd7d72a92e5ca29e4f75ff3f802d6fc363d5349b83345251b1d572a35321bd487cc70485da337b90df0cd37f896b6343f6f4c29cba7a295
ERROR: got     : 
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make[1]: *** [package/tzdata/tzdata.mk:65: tzdata-legal-info] Error 1

This is due to the fact that tzdata for the target is not extracted
(TZDATA_EXTRACT_CMDS is empty).

So either we need to extract at least the LICENSE file, or perhaps we
could extract it normally, it's just 4.5 MB of data anyway.

In any case, when you add license information to a package, it would be
good to test with "make legal-info" before submitting the patch :/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
