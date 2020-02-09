From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 9 Feb 2020 18:55:03 +0100
Subject: [Buildroot] [PATCH v3 2/4] configs/qemu_arm_vexpress_tz:
 Armv7-A emulation with TrustZone services
In-Reply-To: <CAN5uoS9DVEj=o1_Okv4UETimmwtB5dkraK4QGGRvR+6p_4zn_Q@mail.gmail.com>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
 <20190322095818.19914-2-etienne.carriere@linaro.org>
 <20191228123520.5e0c9e81@windsurf>
 <CAN5uoS9DVEj=o1_Okv4UETimmwtB5dkraK4QGGRvR+6p_4zn_Q@mail.gmail.com>
Message-ID: <505fdf48-a601-5627-ea08-0fd1b6e25af3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Etienne,

Le 07/01/2020 ? 08:56, Etienne Carriere a ?crit?:
> Hello Thomas and all,
> 
> My best wishes?for this new year to you and your beloved.
> 
> 
> On Sat, 28 Dec 2019 at 12:35, Thomas Petazzoni <thomas.petazzoni@bootlin.com
> <mailto:thomas.petazzoni@bootlin.com>> wrote:
> 
>     Hello Etienne,
> 
>     On Fri, 22 Mar 2019 10:58:16 +0100
>     Etienne Carriere <etienne.carriere@linaro.org
>     <mailto:etienne.carriere@linaro.org>> wrote:
> 
>     >? board/qemu/arm-vexpress-tz/linux.fragment |? ?3 +
>     >? board/qemu/arm-vexpress-tz/post-build.sh? |? 10 ++
>     >? board/qemu/arm-vexpress-tz/readme.txt? ? ?| 135 ++++++++++++++++++++++
>     >? board/qemu/arm-vexpress-tz/u-boot.config? |? ?7 ++
>     >? configs/qemu_arm_vexpress_tz_defconfig? ? |? 47 ++++++++
>     >? 5 files changed, 202 insertions(+)
> 
>     This defconfig causes a build failure, reported at
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/389451835, like this:
> 
>     486 Traceback (most recent call last):
>     487? ?File "scripts/pem_to_pub_c.py", line 61, in <module>
>     488? ? ?main()
>     489? ?File "scripts/pem_to_pub_c.py", line 24, in main
>     490? ? ?from Crypto.PublicKey import RSA
>     491 ImportError: No module named 'Crypto'
> 
>     Could you have a look ?
> 
> 
> This issue was reported by Romain [1] when I posted an upgrade from optee-3.5.0
> to 3.7.0 in BR.
> Actually, I'm still not sure?I really understand the issue since optee-os.mk
> <http://optee-os.mk> already specifies pycrypto as a dependency.
> 
> OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto host-python-pyelftools
> 
> Maybe it is an issue related to?python?versioning (2 vs 3)?
> I'll try to have a look in the coming... days, but I quite busy on some other
> topics.
> Will do my best :|

Indeed, this is an issue related to host-python dependencies.

Since optee-3.7.0 all scripts are python3 only [1] but the optee package still
depends on host-python (python2).

But even if we modify to use host-python3, we still need host-python3 modules
being build for python3 (host-python-pycrypto host-python-pyelftools). Since we
can't build host python modules for both python2 and python3, the issue appear
again when host-python (python2) is used as host python interpreter.

This is a similar issue that for mesa3d where host-python3-make package was
introduced to be able to build. We can fixes this issue by adding
host-python3-pycrypto host-python3-pyelftools package (and reverse dependencies
if any).

I guess we don't have the issue only if python3 and pycrypto pyelftools are
installed on the host.

[1]
https://github.com/OP-TEE/optee_os/commit/bbaeed4dc6258006e846543197b8aff95d80abbf

Best regards,
Romain

> 
> Regards,
> Etienne
> 
> [1]
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-5-boot-optee-os-bump-version-to-3-7-0-tp237817p239519.html
> 
> ?
> 
>     Best regards,
> 
>     Thomas
>     -- 
>     Thomas Petazzoni, CTO, Bootlin
>     Embedded Linux and Kernel engineering
>     https://bootlin.com
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
