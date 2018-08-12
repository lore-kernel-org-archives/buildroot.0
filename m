From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 17:01:38 +0200
Subject: [Buildroot] Analysis of defconfig build failures
Message-ID: <20180812170138.0b51be07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Today, I analyzed the defconfig build failures of
https://gitlab.com/buildroot.org/buildroot/pipelines/27617503. I fixed
a number of them, except two:

 - Problem of U-Boot failing to build due to a clash between the libfdt
   headers part of U-Boot, and the libfdt headers installed by our
   host-dtc package. We already made several changes in uboot.mk to try
   to fix this, but it still doesn't work properly.

   Does anybody has an idea ? Thomas DS, you already worked on this
   issue (you're the author of commit
   baae5156ce37e8b2775f04710f7d1c8e97e4114c). Any clue ?

   The problem is fixed in U-Boot 2018.01 but present in 2017.11.
   However, we have a number of vendor-provided U-Boot, and it's not
   necessarily easy to upgrade all defconfigs to use at least 2018.01.

 - Problem of recent U-Boot that needs host-bison to build kconfig.
   Yann posted a patch series to make bison and flex hard requirements
   of Buildroot. Do we want to go this way ?

Here is the detailed list of the defconfig build failures:

 - Filesystem too small

   raspberrypi2_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314938

   Fixed by
   https://git.buildroot.org/buildroot/commit/?id=272bf797c9c4d67154316619ff6fcadb63d38511

 - U-Boot FDT headers issues

   engicam_imx6qdl_icore_qt5_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314813

   at91sam9x5ek_mmc_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314788

   atmel_sama5d4_xplained_mmc_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314800

   atmel_sama5d27_som1_ek_mmc_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314789

   atmel_sama5d3_xplained_mmc_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314795

   atmel_sama5d4_xplained_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314798

   at91sam9x5ek_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314786

   atmel_sama5d3_xplained_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314793

   atmel_sama5d2_xplained_mmc_dev_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314791

   orangepi_zero_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314891

   olimex_a20_olinuxino_lime2_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314876

   freescale_imx6qsabreauto_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314820

   freescale_imx6sxsabresd_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314822

   freescale_imx6dlsabreauto_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314818

   freescale_imx8mqevk_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314824

   linksprite_pcduino_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314843

   atmel_sama5d3_xplained_mmc_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314794

   zynq_zybo_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314970

   freescale_imx7dsabresd_defconfig
   https://gitlab.com/buildroot.org/buildroot/pipelines/27617503/failures

   freescale_imx6qsabresd_defconfig
   https://gitlab.com/buildroot.org/buildroot/pipelines/27617503/failures

   amarula_vyasa_rk3288_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314767

   engicam_imx6qdl_icore_rqs_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314814

   freescale_imx6dlsabresd_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314819

   bananapro_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314804

   orangepi_pc_defconfig
   https://gitlab.com/buildroot.org/buildroot/pipelines/27617503/failures

   olimex_a20_olinuxino_lime_mali_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314878

   engicam_imx6ul_geam_defconfig
   https://gitlab.com/buildroot.org/buildroot/pipelines/27617503/failures

   olimex_a20_olinuxino_lime_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314877

   olimex_a10_olinuxino_lime_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314871

   nanopi_neo_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314855

   bananapi_m2_plus_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314802

   bananapi_m1_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314801

   engicam_imx6ul_isiot_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314816

   orangepi_one_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314884

   nanopi_m1_plus_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314853

   orangepi_plus_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314888

   engicam_imx6qdl_icore_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314812

   atmel_sama5d2_xplained_mmc_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314790

   zynq_zc706_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314968

   atmel_sama5d4_xplained_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314797

   olimex_a20_olinuxino_micro_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314879

   olimex_a13_olinuxino_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314873

   zynq_zed_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314969

   roseapplepi_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314944

   nanopi_m1_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314852

   atmel_sama5d3_xplained_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314792

   zynq_microzed_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314967

   atmel_sama5d4_xplained_mmc_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314799

   cubieboard2_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314811

   beagleboardx15_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314805

   at91sam9x5ek_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314785

   atmel_sama5d3xek_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314796

   orangepi_zero_plus2_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314892

   at91sam9x5ek_mmc_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314787

   nitrogen8m_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314866

   solidrun_macchiatobin_marvell_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314956

   arcturus_ucls1012a_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314768

   sheevaplug_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314946

 - ATF doesn't build

   arm_juno_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314771

   Fixed by
   https://git.buildroot.org/buildroot/commit/?id=395bc11dde5b4ef034118a9be568131f134daaa3.

 - Overlay doesn't exist

   snps_archs38_vdk_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314952

   Fixed in
   https://git.buildroot.org/buildroot/commit/?id=f9707ac5840df8bd707a3fad9894441c34c2cf79.

 - U-Boot needs Bison

   asus_tinker_rk3288_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314775

   The proposal from Yann in
   http://patchwork.ozlabs.org/project/buildroot/list/?series=59260 is
   to make flex and bison hard requirements of Buildroot. We need to
   take a decision on this.

 - Kernel needs OpenSSL

   imx6ulpico_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314839

   imx7dpico_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314841

   mx51evk_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314847

   orangepi_lite_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314883

   Fixed by
   https://git.buildroot.org/buildroot/commit/?id=6ee74275367d565ee988f92a93e64002e6f529ef.

 - Weird "ERROR: Invalid size suffix 'B' in '512B'" issue

   ts7680_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314963

   Fixed by
   https://git.buildroot.org/buildroot/commit/?id=f1bdb63ff4fddc53cdb43ad670dbf6f3401c19ca.

 - Failed because of Gitlab issues. I restarted them, but didn't wait
   for their new build to complete.

   lego_ev3_defconfig
   raspberrypi0w_defconfig
   orangepi_pc_plus_defconfig
   mx6cubox_defconfig
   qemu_mips32r2el_malta_defconfig
   armadeus_apf27_defconfig

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
