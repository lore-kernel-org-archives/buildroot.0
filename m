From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 15:33:10 +0200
Subject: [Buildroot] [PATCH 1/1] board/beaglebone: skip bonegreen.dtb if
 not built
In-Reply-To: <1502450173-3058-1-git-send-email-lothar.felten@gmail.com>
References: <1502450173-3058-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <fa5edd86-21a9-3ac9-0b34-df27ea644115@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Lothar,

On 11-08-17 13:16, Lothar Felten wrote:
> The beaglebone_qt5_defconfig does not provide a dtb for the beaglebone green.
> This patch removes the am335x-bonegreen.dtb from the genimage config if it was
> not built.

 Weird that Thomas didn't notice this when he created 028eb673c8f (which removes
the build of bonegreen from beaglebone_qt5_defconfig).


> +#the 4.1 kernel does not provide a dtb for beaglebone green
> +#remove it from the genimage config if am335x-bonegreen.dtb is not built:
> +if [[ ! -e ${BINARIES_DIR}/am335x-bonegreen.dtb ]]
> +then
> +	sed -i '/am335x-bonegreen.dtb/d' ${BOARD_DIR}/genimage.cfg

 This is not OK, you can't modify files in the Buildroot directory while
building. The only proper way to do this is to make it a template file and
generate the real genimage.cfg as part of the post-build script. But perhaps an
easier solution is to use a different genimage.cfg for beaglebone_qt5. When the
kernel finally gets bumped, that can be removed again.

 Regards,
 Arnout

> +	echo "removed am335x-bonegreen.dtb from genimage.cfg"
> +fi
> +
>  GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
>  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
