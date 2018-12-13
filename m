From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 13 Dec 2018 10:55:39 -0600
Subject: [Buildroot] [PATCH 3/3] .gitlab-ci.yml: add trigger per job
In-Reply-To: <CANQCQpZH6b6n=6tJVjwPMfXDYx+4zgHkt6uxzBUj1XqnN2duTw@mail.gmail.com>
References: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
 <20181028235839.22472-4-ricardo.martincoski@gmail.com>
 <CANQCQpZH6b6n=6tJVjwPMfXDYx+4zgHkt6uxzBUj1XqnN2duTw@mail.gmail.com>
Message-ID: <CANQCQpYYN8GyXzx0EyrPzRes1TfgzRqczEur68tftip-AVLyiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo / Thomas / Yann,


On Mon, Dec 10, 2018 at 7:30 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Ricardo,
>
> On Sun, Oct 28, 2018 at 6:59 PM Ricardo Martincoski
> <ricardo.martincoski@gmail.com> wrote:
> >
> > Triggering a single defconfig or runtime test job can be handy:
> >  - when adding or changing a defconfig;
> >  - when adding or changing a runtime test case;
> >  - when fixing some bug on a use case tested by a runtime test case.
>
> Thank you for adding this!  I have been thinking about how to better
> monitor my defconfigs I'm maintaining.  Now I'll setup some jobs
> against my fork.
>
> >
> > Currently there are 3 subsets of jobs that can easily be triggered by
> > pushing a temporary branch with specific suffix:
> >  - to trigger only the check-* jobs:
> >    $ git push gitlab HEAD:<name>                   # currently   4 jobs
> >  - to trigger all defconfigs and all check-* jobs:
> >    $ git push gitlab HEAD:<name>-defconfigs        # currently 192 jobs
> >  - to trigger all runtime tests and all check-* jobs:
> >    $ git push gitlab HEAD:<name>-runtime-tests     # currently  72 jobs
> >

I was thinking about adding a section in the manual describing how to
setup a gitlab fork and the cronjobs to trigger runtime and defconfig
cases.  Then a person submitting new defconfigs and test cases could
setup their own CI to monitor and track failures.

Is that a direction that makes sense to promote as possibly a way to
get more visibility to CI failures?

> > When the user wants to trigger a single defconfig or runtime test job,
> > hand-editing the .gitlab-ci.yml and creating a temporary commit are
> > currently needed.
> >
> > Add 2 more subsets that can be triggered based on the name of the
> > branch pushed.
> >  - to trigger one defconfig and all check-* jobs:
> >    $ git push gitlab HEAD:<name>-<defconfig name>  # currently   5 jobs
> >  - to trigger one runtime test and all check-* jobs:
> >    $ git push gitlab HEAD:<name>-<test case name>  # currently   5 jobs
> >
> > The check-* jobs are fast, so there is no need to either add a per job
> > trigger for them or remove them from the trigger for a specific
> > defconfig or runtime test case.
> >
> > While adding those new triggers, use the full name of the job as suffix.
> > This leads to large branch names:
> > $ git push gitlab HEAD:test1-tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc
> > $ git push gitlab HEAD:test2-olimex_a20_olinuxino_lime_legacy_defconfig
> > But those branches are temporary, and this way the user don't need to
> > think much, just copy and paste the job name as suffix.
> >
> > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> > NOTE: I am almost sure that those 2 awk to extract the 'only' key could
> > be merged, but my experience in awk is limited.
> > ---
> >  .gitlab-ci.yml                         | 2048 +++++++++++++++++++++---
> >  support/scripts/generate-gitlab-ci-yml |   21 +-
> >  2 files changed, 1811 insertions(+), 258 deletions(-)
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index d84c283dbc..c6fc755c9b 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -81,259 +81,1795 @@ check-package:
> >              - test-output/*.log
> >              - test-output/*/.config
> >              - test-output/*/images/*
> > -acmesystems_aria_g25_128mb_defconfig: *defconfig
> > -acmesystems_aria_g25_256mb_defconfig: *defconfig
> > -acmesystems_arietta_g25_128mb_defconfig: *defconfig
> > -acmesystems_arietta_g25_256mb_defconfig: *defconfig
> > -amarula_vyasa_rk3288_defconfig: *defconfig
> > -arcturus_ucls1012a_defconfig: *defconfig
> > -arcturus_ucp1020_defconfig: *defconfig
> > -arm_foundationv8_defconfig: *defconfig
> > -arm_juno_defconfig: *defconfig
> > -armadeus_apf27_defconfig: *defconfig
> > -armadeus_apf28_defconfig: *defconfig
> > -armadeus_apf51_defconfig: *defconfig
> > -asus_tinker_rk3288_defconfig: *defconfig
> > -at91sam9260eknf_defconfig: *defconfig
> > -at91sam9g20dfc_defconfig: *defconfig
> > -at91sam9g45m10ek_defconfig: *defconfig
> > -at91sam9rlek_defconfig: *defconfig
> > -at91sam9x5ek_defconfig: *defconfig
> > -at91sam9x5ek_dev_defconfig: *defconfig
> > -at91sam9x5ek_mmc_defconfig: *defconfig
> > -at91sam9x5ek_mmc_dev_defconfig: *defconfig
> > -atmel_sama5d27_som1_ek_mmc_dev_defconfig: *defconfig
> > -atmel_sama5d2_xplained_mmc_defconfig: *defconfig
> > -atmel_sama5d2_xplained_mmc_dev_defconfig: *defconfig
> > -atmel_sama5d3_xplained_defconfig: *defconfig
> > -atmel_sama5d3_xplained_dev_defconfig: *defconfig
> > -atmel_sama5d3_xplained_mmc_defconfig: *defconfig
> > -atmel_sama5d3_xplained_mmc_dev_defconfig: *defconfig
> > -atmel_sama5d3xek_defconfig: *defconfig
> > -atmel_sama5d4_xplained_defconfig: *defconfig
> > -atmel_sama5d4_xplained_dev_defconfig: *defconfig
> > -atmel_sama5d4_xplained_mmc_defconfig: *defconfig
> > -atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
> > -bananapi_m1_defconfig: *defconfig
> > -bananapi_m2_plus_defconfig: *defconfig
> > -bananapi_m2_ultra_defconfig: *defconfig
> > -bananapi_m64_defconfig: *defconfig
> > -bananapro_defconfig: *defconfig
> > -beagleboardx15_defconfig: *defconfig
> > -beaglebone_defconfig: *defconfig
> > -beaglebone_qt5_defconfig: *defconfig
> > -chromebook_snow_defconfig: *defconfig
> > -ci20_defconfig: *defconfig
> > -csky_gx6605s_defconfig: *defconfig
> > -cubieboard2_defconfig: *defconfig
> > -engicam_imx6qdl_icore_defconfig: *defconfig
> > -engicam_imx6qdl_icore_qt5_defconfig: *defconfig
> > -engicam_imx6qdl_icore_rqs_defconfig: *defconfig
> > -engicam_imx6ul_geam_defconfig: *defconfig
> > -engicam_imx6ul_isiot_defconfig: *defconfig
> > -freescale_imx28evk_defconfig: *defconfig
> > -freescale_imx6dlsabreauto_defconfig: *defconfig
> > -freescale_imx6dlsabresd_defconfig: *defconfig
> > -freescale_imx6qsabreauto_defconfig: *defconfig
> > -freescale_imx6qsabresd_defconfig: *defconfig
> > -freescale_imx6sxsabresd_defconfig: *defconfig
> > -freescale_imx7dsabresd_defconfig: *defconfig
> > -freescale_imx8mqevk_defconfig: *defconfig
> > -freescale_p1025twr_defconfig: *defconfig
> > -freescale_t1040d4rdb_defconfig: *defconfig
> > -friendlyarm_nanopi_a64_defconfig: *defconfig
> > -friendlyarm_nanopi_neo2_defconfig: *defconfig
> > -galileo_defconfig: *defconfig
> > -grinn_chiliboard_defconfig: *defconfig
> > -grinn_liteboard_defconfig: *defconfig
> > -imx23evk_defconfig: *defconfig
> > -imx6-sabreauto_defconfig: *defconfig
> > -imx6-sabresd_defconfig: *defconfig
> > -imx6-sabresd_qt5_defconfig: *defconfig
> > -imx6slevk_defconfig: *defconfig
> > -imx6sx-sdb_defconfig: *defconfig
> > -imx6ulevk_defconfig: *defconfig
> > -imx6ulpico_defconfig: *defconfig
> > -imx7d-sdb_defconfig: *defconfig
> > -imx7dpico_defconfig: *defconfig
> > -lego_ev3_defconfig: *defconfig
> > -linksprite_pcduino_defconfig: *defconfig
> > -minnowboard_max-graphical_defconfig: *defconfig
> > -minnowboard_max_defconfig: *defconfig
> > -mx25pdk_defconfig: *defconfig
> > -mx51evk_defconfig: *defconfig
> > -mx53loco_defconfig: *defconfig
> > -mx6cubox_defconfig: *defconfig
> > -mx6sx_udoo_neo_defconfig: *defconfig
> > -mx6udoo_defconfig: *defconfig
> > -nanopi_m1_defconfig: *defconfig
> > -nanopi_m1_plus_defconfig: *defconfig
> > -nanopi_neo_defconfig: *defconfig
> > -nexbox_a95x_defconfig: *defconfig
> > -nitrogen6sx_defconfig: *defconfig
> > -nitrogen6x_defconfig: *defconfig
> > -nitrogen7_defconfig: *defconfig
> > -nitrogen8m_defconfig: *defconfig
> > -odroidc2_defconfig: *defconfig
> > -odroidxu4_defconfig: *defconfig
> > -olimex_a10_olinuxino_lime_defconfig: *defconfig
> > -olimex_a13_olinuxino_defconfig: *defconfig
> > -olimex_a20_olinuxino_lime2_defconfig: *defconfig
> > -olimex_a20_olinuxino_lime_defconfig: *defconfig
> > -olimex_a20_olinuxino_lime_legacy_defconfig: *defconfig
> > -olimex_a20_olinuxino_micro_defconfig: *defconfig
> > -olimex_a64_olinuxino_defconfig: *defconfig
> > -olimex_imx233_olinuxino_defconfig: *defconfig
> > -openblocks_a6_defconfig: *defconfig
> > -orangepi_lite_defconfig: *defconfig
> > -orangepi_one_defconfig: *defconfig
> > -orangepi_pc2_defconfig: *defconfig
> > -orangepi_pc_defconfig: *defconfig
> > -orangepi_pc_plus_defconfig: *defconfig
> > -orangepi_plus_defconfig: *defconfig
> > -orangepi_prime_defconfig: *defconfig
> > -orangepi_win_defconfig: *defconfig
> > -orangepi_zero_defconfig: *defconfig
> > -orangepi_zero_plus2_defconfig: *defconfig
> > -pandaboard_defconfig: *defconfig
> > -pc_x86_64_bios_defconfig: *defconfig
> > -pc_x86_64_efi_defconfig: *defconfig
> > -pine64_defconfig: *defconfig
> > -pine64_sopine_defconfig: *defconfig
> > -qemu_aarch64_virt_defconfig: *defconfig
> > -qemu_arm_versatile_defconfig: *defconfig
> > -qemu_arm_versatile_nommu_defconfig: *defconfig
> > -qemu_arm_vexpress_defconfig: *defconfig
> > -qemu_m68k_mcf5208_defconfig: *defconfig
> > -qemu_m68k_q800_defconfig: *defconfig
> > -qemu_microblazebe_mmu_defconfig: *defconfig
> > -qemu_microblazeel_mmu_defconfig: *defconfig
> > -qemu_mips32r2_malta_defconfig: *defconfig
> > -qemu_mips32r2el_malta_defconfig: *defconfig
> > -qemu_mips32r6_malta_defconfig: *defconfig
> > -qemu_mips32r6el_malta_defconfig: *defconfig
> > -qemu_mips64_malta_defconfig: *defconfig
> > -qemu_mips64el_malta_defconfig: *defconfig
> > -qemu_mips64r6_malta_defconfig: *defconfig
> > -qemu_mips64r6el_malta_defconfig: *defconfig
> > -qemu_nios2_10m50_defconfig: *defconfig
> > -qemu_or1k_defconfig: *defconfig
> > -qemu_ppc64_e5500_defconfig: *defconfig
> > -qemu_ppc64_pseries_defconfig: *defconfig
> > -qemu_ppc64le_pseries_defconfig: *defconfig
> > -qemu_ppc_g3beige_defconfig: *defconfig
> > -qemu_ppc_mpc8544ds_defconfig: *defconfig
> > -qemu_ppc_virtex_ml507_defconfig: *defconfig
> > -qemu_riscv64_virt_defconfig: *defconfig
> > -qemu_sh4_r2d_defconfig: *defconfig
> > -qemu_sh4eb_r2d_defconfig: *defconfig
> > -qemu_sparc64_sun4u_defconfig: *defconfig
> > -qemu_sparc_ss10_defconfig: *defconfig
> > -qemu_x86_64_defconfig: *defconfig
> > -qemu_x86_defconfig: *defconfig
> > -qemu_xtensa_lx60_defconfig: *defconfig
> > -qemu_xtensa_lx60_nommu_defconfig: *defconfig
> > -raspberrypi0_defconfig: *defconfig
> > -raspberrypi0w_defconfig: *defconfig
> > -raspberrypi2_defconfig: *defconfig
> > -raspberrypi3_64_defconfig: *defconfig
> > -raspberrypi3_defconfig: *defconfig
> > -raspberrypi3_qt5we_defconfig: *defconfig
> > -raspberrypi_defconfig: *defconfig
> > -riotboard_defconfig: *defconfig
> > -roseapplepi_defconfig: *defconfig
> > -s6lx9_microboard_defconfig: *defconfig
> > -sheevaplug_defconfig: *defconfig
> > -snps_aarch64_vdk_defconfig: *defconfig
> > -snps_arc700_axs101_defconfig: *defconfig
> > -snps_archs38_axs103_defconfig: *defconfig
> > -snps_archs38_haps_defconfig: *defconfig
> > -snps_archs38_hsdk_defconfig: *defconfig
> > -snps_archs38_vdk_defconfig: *defconfig
> > -socrates_cyclone5_defconfig: *defconfig
> > -solidrun_clearfog_defconfig: *defconfig
> > -solidrun_macchiatobin_mainline_defconfig: *defconfig
> > -solidrun_macchiatobin_marvell_defconfig: *defconfig
> > -stm32f429_disco_defconfig: *defconfig
> > -stm32f469_disco_defconfig: *defconfig
> > -toradex_apalis_imx6_defconfig: *defconfig
> > -ts4800_defconfig: *defconfig
> > -ts4900_defconfig: *defconfig
> > -ts5500_defconfig: *defconfig
> > -ts7680_defconfig: *defconfig
> > -wandboard_defconfig: *defconfig
> > -warp7_defconfig: *defconfig
> > -warpboard_defconfig: *defconfig
> > -zynq_microzed_defconfig: *defconfig
> > -zynq_zc706_defconfig: *defconfig
> > -zynq_zed_defconfig: *defconfig
> > -zynq_zybo_defconfig: *defconfig
> > -zynqmp_zcu106_defconfig: *defconfig
> > -tests.boot.test_atf.TestATFAllwinner: *runtime_test
> > -tests.boot.test_atf.TestATFMarvell: *runtime_test
> > -tests.boot.test_atf.TestATFVexpress: *runtime_test
> > -tests.core.test_file_capabilities.TestFileCapabilities: *runtime_test
> > -tests.core.test_hardening.TestFortifyConserv: *runtime_test
> > -tests.core.test_hardening.TestFortifyNone: *runtime_test
> > -tests.core.test_hardening.TestRelro: *runtime_test
> > -tests.core.test_hardening.TestRelroPartial: *runtime_test
> > -tests.core.test_hardening.TestSspNone: *runtime_test
> > -tests.core.test_hardening.TestSspStrong: *runtime_test
> > -tests.core.test_post_scripts.TestPostScripts: *runtime_test
> > -tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
> > -tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
> > -tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
> > -tests.core.test_timezone.TestNoTimezone: *runtime_test
> > -tests.fs.test_ext.TestExt2: *runtime_test
> > -tests.fs.test_ext.TestExt2r1: *runtime_test
> > -tests.fs.test_ext.TestExt3: *runtime_test
> > -tests.fs.test_ext.TestExt4: *runtime_test
> > -tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
> > -tests.fs.test_iso9660.TestIso9660Grub2ExternalCompress: *runtime_test
> > -tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
> > -tests.fs.test_iso9660.TestIso9660SyslinuxExternal: *runtime_test
> > -tests.fs.test_iso9660.TestIso9660SyslinuxExternalCompress: *runtime_test
> > -tests.fs.test_iso9660.TestIso9660SyslinuxInternal: *runtime_test
> > -tests.fs.test_jffs2.TestJffs2: *runtime_test
> > -tests.fs.test_squashfs.TestSquashfs: *runtime_test
> > -tests.fs.test_ubi.TestUbi: *runtime_test
> > -tests.fs.test_yaffs2.TestYaffs2: *runtime_test
> > -tests.init.test_busybox.TestInitSystemBusyboxRo: *runtime_test
> > -tests.init.test_busybox.TestInitSystemBusyboxRoNet: *runtime_test
> > -tests.init.test_busybox.TestInitSystemBusyboxRw: *runtime_test
> > -tests.init.test_busybox.TestInitSystemBusyboxRwNet: *runtime_test
> > -tests.init.test_none.TestInitSystemNone: *runtime_test
> > -tests.init.test_systemd.TestInitSystemSystemdRoFull: *runtime_test
> > -tests.init.test_systemd.TestInitSystemSystemdRoIfupdown: *runtime_test
> > -tests.init.test_systemd.TestInitSystemSystemdRoNetworkd: *runtime_test
> > -tests.init.test_systemd.TestInitSystemSystemdRwFull: *runtime_test
> > -tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: *runtime_test
> > -tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: *runtime_test
> > -tests.package.test_dropbear.TestDropbear: *runtime_test
> > -tests.package.test_ipython.TestIPythonPy2: *runtime_test
> > -tests.package.test_ipython.TestIPythonPy3: *runtime_test
> > -tests.package.test_python.TestPython2: *runtime_test
> > -tests.package.test_python.TestPython3: *runtime_test
> > -tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
> > -tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
> > -tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
> > -tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
> > -tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
> > -tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
> > -tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
> > -tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
> > -tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
> > -tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
> > -tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
> > -tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: *runtime_test
> > -tests.package.test_rust.TestRust: *runtime_test
> > -tests.package.test_rust.TestRustBin: *runtime_test
> > -tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainCtngMusl: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: *runtime_test
> > -tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: *runtime_test
> > +acmesystems_aria_g25_128mb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-acmesystems_aria_g25_128mb_defconfig$/
> > +acmesystems_aria_g25_256mb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-acmesystems_aria_g25_256mb_defconfig$/
> > +acmesystems_arietta_g25_128mb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-acmesystems_arietta_g25_128mb_defconfig$/
> > +acmesystems_arietta_g25_256mb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-acmesystems_arietta_g25_256mb_defconfig$/
> > +amarula_vyasa_rk3288_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-amarula_vyasa_rk3288_defconfig$/
> > +arcturus_ucls1012a_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-arcturus_ucls1012a_defconfig$/
> > +arcturus_ucp1020_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-arcturus_ucp1020_defconfig$/
> > +arm_foundationv8_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-arm_foundationv8_defconfig$/
> > +arm_juno_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-arm_juno_defconfig$/
> > +armadeus_apf27_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-armadeus_apf27_defconfig$/
> > +armadeus_apf28_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-armadeus_apf28_defconfig$/
> > +armadeus_apf51_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-armadeus_apf51_defconfig$/
> > +asus_tinker_rk3288_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-asus_tinker_rk3288_defconfig$/
> > +at91sam9260eknf_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9260eknf_defconfig$/
> > +at91sam9g20dfc_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9g20dfc_defconfig$/
> > +at91sam9g45m10ek_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9g45m10ek_defconfig$/
> > +at91sam9rlek_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9rlek_defconfig$/
> > +at91sam9x5ek_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9x5ek_defconfig$/
> > +at91sam9x5ek_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9x5ek_dev_defconfig$/
> > +at91sam9x5ek_mmc_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9x5ek_mmc_defconfig$/
> > +at91sam9x5ek_mmc_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-at91sam9x5ek_mmc_dev_defconfig$/
> > +atmel_sama5d27_som1_ek_mmc_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d27_som1_ek_mmc_dev_defconfig$/
> > +atmel_sama5d2_xplained_mmc_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d2_xplained_mmc_defconfig$/
> > +atmel_sama5d2_xplained_mmc_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d2_xplained_mmc_dev_defconfig$/
> > +atmel_sama5d3_xplained_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d3_xplained_defconfig$/
> > +atmel_sama5d3_xplained_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d3_xplained_dev_defconfig$/
> > +atmel_sama5d3_xplained_mmc_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d3_xplained_mmc_defconfig$/
> > +atmel_sama5d3_xplained_mmc_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d3_xplained_mmc_dev_defconfig$/
> > +atmel_sama5d3xek_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d3xek_defconfig$/
> > +atmel_sama5d4_xplained_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d4_xplained_defconfig$/
> > +atmel_sama5d4_xplained_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d4_xplained_dev_defconfig$/
> > +atmel_sama5d4_xplained_mmc_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d4_xplained_mmc_defconfig$/
> > +atmel_sama5d4_xplained_mmc_dev_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-atmel_sama5d4_xplained_mmc_dev_defconfig$/
> > +bananapi_m1_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-bananapi_m1_defconfig$/
> > +bananapi_m2_plus_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-bananapi_m2_plus_defconfig$/
> > +bananapi_m2_ultra_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-bananapi_m2_ultra_defconfig$/
> > +bananapi_m64_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-bananapi_m64_defconfig$/
> > +bananapro_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-bananapro_defconfig$/
> > +beagleboardx15_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-beagleboardx15_defconfig$/
> > +beaglebone_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-beaglebone_defconfig$/
> > +beaglebone_qt5_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-beaglebone_qt5_defconfig$/
> > +chromebook_snow_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-chromebook_snow_defconfig$/
> > +ci20_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-ci20_defconfig$/
> > +csky_gx6605s_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-csky_gx6605s_defconfig$/
> > +cubieboard2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-cubieboard2_defconfig$/
> > +engicam_imx6qdl_icore_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-engicam_imx6qdl_icore_defconfig$/
> > +engicam_imx6qdl_icore_qt5_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-engicam_imx6qdl_icore_qt5_defconfig$/
> > +engicam_imx6qdl_icore_rqs_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-engicam_imx6qdl_icore_rqs_defconfig$/
> > +engicam_imx6ul_geam_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-engicam_imx6ul_geam_defconfig$/
> > +engicam_imx6ul_isiot_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-engicam_imx6ul_isiot_defconfig$/
> > +freescale_imx28evk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx28evk_defconfig$/
> > +freescale_imx6dlsabreauto_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx6dlsabreauto_defconfig$/
> > +freescale_imx6dlsabresd_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx6dlsabresd_defconfig$/
> > +freescale_imx6qsabreauto_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx6qsabreauto_defconfig$/
> > +freescale_imx6qsabresd_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx6qsabresd_defconfig$/
> > +freescale_imx6sxsabresd_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx6sxsabresd_defconfig$/
> > +freescale_imx7dsabresd_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx7dsabresd_defconfig$/
> > +freescale_imx8mqevk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_imx8mqevk_defconfig$/
> > +freescale_p1025twr_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_p1025twr_defconfig$/
> > +freescale_t1040d4rdb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-freescale_t1040d4rdb_defconfig$/
> > +friendlyarm_nanopi_a64_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-friendlyarm_nanopi_a64_defconfig$/
> > +friendlyarm_nanopi_neo2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-friendlyarm_nanopi_neo2_defconfig$/
> > +galileo_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-galileo_defconfig$/
> > +grinn_chiliboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-grinn_chiliboard_defconfig$/
> > +grinn_liteboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-grinn_liteboard_defconfig$/
> > +imx23evk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx23evk_defconfig$/
> > +imx6-sabreauto_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6-sabreauto_defconfig$/
> > +imx6-sabresd_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6-sabresd_defconfig$/
> > +imx6-sabresd_qt5_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6-sabresd_qt5_defconfig$/
> > +imx6slevk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6slevk_defconfig$/
> > +imx6sx-sdb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6sx-sdb_defconfig$/
> > +imx6ulevk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6ulevk_defconfig$/
> > +imx6ulpico_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx6ulpico_defconfig$/
> > +imx7d-sdb_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx7d-sdb_defconfig$/
> > +imx7dpico_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-imx7dpico_defconfig$/
> > +lego_ev3_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-lego_ev3_defconfig$/
> > +linksprite_pcduino_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-linksprite_pcduino_defconfig$/
> > +minnowboard_max-graphical_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-minnowboard_max-graphical_defconfig$/
> > +minnowboard_max_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-minnowboard_max_defconfig$/
> > +mx25pdk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-mx25pdk_defconfig$/
> > +mx51evk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-mx51evk_defconfig$/
> > +mx53loco_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-mx53loco_defconfig$/
> > +mx6cubox_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-mx6cubox_defconfig$/
> > +mx6sx_udoo_neo_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-mx6sx_udoo_neo_defconfig$/
> > +mx6udoo_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-mx6udoo_defconfig$/
> > +nanopi_m1_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nanopi_m1_defconfig$/
> > +nanopi_m1_plus_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nanopi_m1_plus_defconfig$/
> > +nanopi_neo_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nanopi_neo_defconfig$/
> > +nexbox_a95x_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nexbox_a95x_defconfig$/
> > +nitrogen6sx_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nitrogen6sx_defconfig$/
> > +nitrogen6x_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nitrogen6x_defconfig$/
> > +nitrogen7_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nitrogen7_defconfig$/
> > +nitrogen8m_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-nitrogen8m_defconfig$/
> > +odroidc2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-odroidc2_defconfig$/
> > +odroidxu4_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-odroidxu4_defconfig$/
> > +olimex_a10_olinuxino_lime_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a10_olinuxino_lime_defconfig$/
> > +olimex_a13_olinuxino_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a13_olinuxino_defconfig$/
> > +olimex_a20_olinuxino_lime2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a20_olinuxino_lime2_defconfig$/
> > +olimex_a20_olinuxino_lime_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a20_olinuxino_lime_defconfig$/
> > +olimex_a20_olinuxino_lime_legacy_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a20_olinuxino_lime_legacy_defconfig$/
> > +olimex_a20_olinuxino_micro_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a20_olinuxino_micro_defconfig$/
> > +olimex_a64_olinuxino_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_a64_olinuxino_defconfig$/
> > +olimex_imx233_olinuxino_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-olimex_imx233_olinuxino_defconfig$/
> > +openblocks_a6_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-openblocks_a6_defconfig$/
> > +orangepi_lite_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_lite_defconfig$/
> > +orangepi_one_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_one_defconfig$/
> > +orangepi_pc2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_pc2_defconfig$/
> > +orangepi_pc_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_pc_defconfig$/
> > +orangepi_pc_plus_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_pc_plus_defconfig$/
> > +orangepi_plus_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_plus_defconfig$/
> > +orangepi_prime_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_prime_defconfig$/
> > +orangepi_win_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_win_defconfig$/
> > +orangepi_zero_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_zero_defconfig$/
> > +orangepi_zero_plus2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-orangepi_zero_plus2_defconfig$/
> > +pandaboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-pandaboard_defconfig$/
> > +pc_x86_64_bios_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-pc_x86_64_bios_defconfig$/
> > +pc_x86_64_efi_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-pc_x86_64_efi_defconfig$/
> > +pine64_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-pine64_defconfig$/
> > +pine64_sopine_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-pine64_sopine_defconfig$/
> > +qemu_aarch64_virt_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_aarch64_virt_defconfig$/
> > +qemu_arm_versatile_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_arm_versatile_defconfig$/
> > +qemu_arm_versatile_nommu_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_arm_versatile_nommu_defconfig$/
> > +qemu_arm_vexpress_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_arm_vexpress_defconfig$/
> > +qemu_m68k_mcf5208_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_m68k_mcf5208_defconfig$/
> > +qemu_m68k_q800_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_m68k_q800_defconfig$/
> > +qemu_microblazebe_mmu_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_microblazebe_mmu_defconfig$/
> > +qemu_microblazeel_mmu_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_microblazeel_mmu_defconfig$/
> > +qemu_mips32r2_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips32r2_malta_defconfig$/
> > +qemu_mips32r2el_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips32r2el_malta_defconfig$/
> > +qemu_mips32r6_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips32r6_malta_defconfig$/
> > +qemu_mips32r6el_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips32r6el_malta_defconfig$/
> > +qemu_mips64_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips64_malta_defconfig$/
> > +qemu_mips64el_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips64el_malta_defconfig$/
> > +qemu_mips64r6_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips64r6_malta_defconfig$/
> > +qemu_mips64r6el_malta_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_mips64r6el_malta_defconfig$/
> > +qemu_nios2_10m50_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_nios2_10m50_defconfig$/
> > +qemu_or1k_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_or1k_defconfig$/
> > +qemu_ppc64_e5500_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_ppc64_e5500_defconfig$/
> > +qemu_ppc64_pseries_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_ppc64_pseries_defconfig$/
> > +qemu_ppc64le_pseries_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_ppc64le_pseries_defconfig$/
> > +qemu_ppc_g3beige_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_ppc_g3beige_defconfig$/
> > +qemu_ppc_mpc8544ds_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_ppc_mpc8544ds_defconfig$/
> > +qemu_ppc_virtex_ml507_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_ppc_virtex_ml507_defconfig$/
> > +qemu_riscv64_virt_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_riscv64_virt_defconfig$/
> > +qemu_sh4_r2d_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_sh4_r2d_defconfig$/
> > +qemu_sh4eb_r2d_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_sh4eb_r2d_defconfig$/
> > +qemu_sparc64_sun4u_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_sparc64_sun4u_defconfig$/
> > +qemu_sparc_ss10_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_sparc_ss10_defconfig$/
> > +qemu_x86_64_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_x86_64_defconfig$/
> > +qemu_x86_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_x86_defconfig$/
> > +qemu_xtensa_lx60_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_xtensa_lx60_defconfig$/
> > +qemu_xtensa_lx60_nommu_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-qemu_xtensa_lx60_nommu_defconfig$/
> > +raspberrypi0_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi0_defconfig$/
> > +raspberrypi0w_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi0w_defconfig$/
> > +raspberrypi2_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi2_defconfig$/
> > +raspberrypi3_64_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi3_64_defconfig$/
> > +raspberrypi3_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi3_defconfig$/
> > +raspberrypi3_qt5we_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi3_qt5we_defconfig$/
> > +raspberrypi_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-raspberrypi_defconfig$/
> > +riotboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-riotboard_defconfig$/
> > +roseapplepi_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-roseapplepi_defconfig$/
> > +s6lx9_microboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-s6lx9_microboard_defconfig$/
> > +sheevaplug_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-sheevaplug_defconfig$/
> > +snps_aarch64_vdk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-snps_aarch64_vdk_defconfig$/
> > +snps_arc700_axs101_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-snps_arc700_axs101_defconfig$/
> > +snps_archs38_axs103_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-snps_archs38_axs103_defconfig$/
> > +snps_archs38_haps_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-snps_archs38_haps_defconfig$/
> > +snps_archs38_hsdk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-snps_archs38_hsdk_defconfig$/
> > +snps_archs38_vdk_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-snps_archs38_vdk_defconfig$/
> > +socrates_cyclone5_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-socrates_cyclone5_defconfig$/
> > +solidrun_clearfog_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-solidrun_clearfog_defconfig$/
> > +solidrun_macchiatobin_mainline_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-solidrun_macchiatobin_mainline_defconfig$/
> > +solidrun_macchiatobin_marvell_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-solidrun_macchiatobin_marvell_defconfig$/
> > +stm32f429_disco_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-stm32f429_disco_defconfig$/
> > +stm32f469_disco_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-stm32f469_disco_defconfig$/
> > +toradex_apalis_imx6_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-toradex_apalis_imx6_defconfig$/
> > +ts4800_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-ts4800_defconfig$/
> > +ts4900_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-ts4900_defconfig$/
> > +ts5500_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-ts5500_defconfig$/
> > +ts7680_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-ts7680_defconfig$/
> > +wandboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-wandboard_defconfig$/
> > +warp7_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-warp7_defconfig$/
> > +warpboard_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-warpboard_defconfig$/
> > +zynq_microzed_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-zynq_microzed_defconfig$/
> > +zynq_zc706_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-zynq_zc706_defconfig$/
> > +zynq_zed_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-zynq_zed_defconfig$/
> > +zynq_zybo_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-zynq_zybo_defconfig$/
> > +zynqmp_zcu106_defconfig:
> > +    <<: *defconfig
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-defconfigs$/
> > +        - /-zynqmp_zcu106_defconfig$/
> > +tests.boot.test_atf.TestATFAllwinner:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.boot\.test_atf\.TestATFAllwinner$/
> > +tests.boot.test_atf.TestATFMarvell:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.boot\.test_atf\.TestATFMarvell$/
> > +tests.boot.test_atf.TestATFVexpress:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.boot\.test_atf\.TestATFVexpress$/
> > +tests.core.test_file_capabilities.TestFileCapabilities:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_file_capabilities\.TestFileCapabilities$/
> > +tests.core.test_hardening.TestFortifyConserv:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_hardening\.TestFortifyConserv$/
> > +tests.core.test_hardening.TestFortifyNone:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_hardening\.TestFortifyNone$/
> > +tests.core.test_hardening.TestRelro:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_hardening\.TestRelro$/
> > +tests.core.test_hardening.TestRelroPartial:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_hardening\.TestRelroPartial$/
> > +tests.core.test_hardening.TestSspNone:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_hardening\.TestSspNone$/
> > +tests.core.test_hardening.TestSspStrong:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_hardening\.TestSspStrong$/
> > +tests.core.test_post_scripts.TestPostScripts:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_post_scripts\.TestPostScripts$/
> > +tests.core.test_rootfs_overlay.TestRootfsOverlay:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_rootfs_overlay\.TestRootfsOverlay$/
> > +tests.core.test_timezone.TestGlibcAllTimezone:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_timezone\.TestGlibcAllTimezone$/
> > +tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_timezone\.TestGlibcNonDefaultLimitedTimezone$/
> > +tests.core.test_timezone.TestNoTimezone:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.core\.test_timezone\.TestNoTimezone$/
> > +tests.fs.test_ext.TestExt2:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_ext\.TestExt2$/
> > +tests.fs.test_ext.TestExt2r1:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_ext\.TestExt2r1$/
> > +tests.fs.test_ext.TestExt3:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_ext\.TestExt3$/
> > +tests.fs.test_ext.TestExt4:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_ext\.TestExt4$/
> > +tests.fs.test_iso9660.TestIso9660Grub2External:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_iso9660\.TestIso9660Grub2External$/
> > +tests.fs.test_iso9660.TestIso9660Grub2ExternalCompress:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_iso9660\.TestIso9660Grub2ExternalCompress$/
> > +tests.fs.test_iso9660.TestIso9660Grub2Internal:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_iso9660\.TestIso9660Grub2Internal$/
> > +tests.fs.test_iso9660.TestIso9660SyslinuxExternal:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_iso9660\.TestIso9660SyslinuxExternal$/
> > +tests.fs.test_iso9660.TestIso9660SyslinuxExternalCompress:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_iso9660\.TestIso9660SyslinuxExternalCompress$/
> > +tests.fs.test_iso9660.TestIso9660SyslinuxInternal:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_iso9660\.TestIso9660SyslinuxInternal$/
> > +tests.fs.test_jffs2.TestJffs2:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_jffs2\.TestJffs2$/
> > +tests.fs.test_squashfs.TestSquashfs:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_squashfs\.TestSquashfs$/
> > +tests.fs.test_ubi.TestUbi:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_ubi\.TestUbi$/
> > +tests.fs.test_yaffs2.TestYaffs2:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.fs\.test_yaffs2\.TestYaffs2$/
> > +tests.init.test_busybox.TestInitSystemBusyboxRo:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_busybox\.TestInitSystemBusyboxRo$/
> > +tests.init.test_busybox.TestInitSystemBusyboxRoNet:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_busybox\.TestInitSystemBusyboxRoNet$/
> > +tests.init.test_busybox.TestInitSystemBusyboxRw:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_busybox\.TestInitSystemBusyboxRw$/
> > +tests.init.test_busybox.TestInitSystemBusyboxRwNet:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_busybox\.TestInitSystemBusyboxRwNet$/
> > +tests.init.test_none.TestInitSystemNone:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_none\.TestInitSystemNone$/
> > +tests.init.test_systemd.TestInitSystemSystemdRoFull:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_systemd\.TestInitSystemSystemdRoFull$/
> > +tests.init.test_systemd.TestInitSystemSystemdRoIfupdown:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_systemd\.TestInitSystemSystemdRoIfupdown$/
> > +tests.init.test_systemd.TestInitSystemSystemdRoNetworkd:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_systemd\.TestInitSystemSystemdRoNetworkd$/
> > +tests.init.test_systemd.TestInitSystemSystemdRwFull:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_systemd\.TestInitSystemSystemdRwFull$/
> > +tests.init.test_systemd.TestInitSystemSystemdRwIfupdown:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_systemd\.TestInitSystemSystemdRwIfupdown$/
> > +tests.init.test_systemd.TestInitSystemSystemdRwNetworkd:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.init\.test_systemd\.TestInitSystemSystemdRwNetworkd$/
> > +tests.package.test_dropbear.TestDropbear:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_dropbear\.TestDropbear$/
> > +tests.package.test_ipython.TestIPythonPy2:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_ipython\.TestIPythonPy2$/
> > +tests.package.test_ipython.TestIPythonPy3:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_ipython\.TestIPythonPy3$/
> > +tests.package.test_python.TestPython2:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python\.TestPython2$/
> > +tests.package.test_python.TestPython3:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python\.TestPython3$/
> > +tests.package.test_python_autobahn.TestPythonPy2Autobahn:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_autobahn\.TestPythonPy2Autobahn$/
> > +tests.package.test_python_autobahn.TestPythonPy3Autobahn:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_autobahn\.TestPythonPy3Autobahn$/
> > +tests.package.test_python_cryptography.TestPythonPy2Cryptography:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_cryptography\.TestPythonPy2Cryptography$/
> > +tests.package.test_python_cryptography.TestPythonPy3Cryptography:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_cryptography\.TestPythonPy3Cryptography$/
> > +tests.package.test_python_incremental.TestPythonPy2Incremental:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_incremental\.TestPythonPy2Incremental$/
> > +tests.package.test_python_incremental.TestPythonPy3Incremental:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_incremental\.TestPythonPy3Incremental$/
> > +tests.package.test_python_twisted.TestPythonPy2Twisted:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_twisted\.TestPythonPy2Twisted$/
> > +tests.package.test_python_twisted.TestPythonPy3Twisted:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_twisted\.TestPythonPy3Twisted$/
> > +tests.package.test_python_txaio.TestPythonPy2Txaio:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_txaio\.TestPythonPy2Txaio$/
> > +tests.package.test_python_txaio.TestPythonPy3Txaio:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_txaio\.TestPythonPy3Txaio$/
> > +tests.package.test_python_txtorcon.TestPythonPy2Txtorcon:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_txtorcon\.TestPythonPy2Txtorcon$/
> > +tests.package.test_python_txtorcon.TestPythonPy3Txtorcon:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_python_txtorcon\.TestPythonPy3Txtorcon$/
> > +tests.package.test_rust.TestRust:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_rust\.TestRust$/
> > +tests.package.test_rust.TestRustBin:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_rust\.TestRustBin$/
> > +tests.package.test_syslog_ng.TestSyslogNg:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.package\.test_syslog_ng\.TestSyslogNg$/
> > +tests.toolchain.test_external.TestExternalToolchainBuildrootMusl:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainBuildrootMusl$/
> > +tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainBuildrootuClibc$/
> > +tests.toolchain.test_external.TestExternalToolchainCCache:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainCCache$/
> > +tests.toolchain.test_external.TestExternalToolchainCtngMusl:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainCtngMusl$/
> > +tests.toolchain.test_external.TestExternalToolchainLinaroArm:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainLinaroArm$/
> > +tests.toolchain.test_external.TestExternalToolchainSourceryArmv4:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainSourceryArmv4$/
> > +tests.toolchain.test_external.TestExternalToolchainSourceryArmv5:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainSourceryArmv5$/
> > +tests.toolchain.test_external.TestExternalToolchainSourceryArmv7:
> > +    <<: *runtime_test
> > +    only:
> > +        - triggers
> > +        - tags
> > +        - /-runtime-tests$/
> > +        - /-tests\.toolchain\.test_external\.TestExternalToolchainSourceryArmv7$/
> > diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> > index d824f669b5..9efa775f88 100755
> > --- a/support/scripts/generate-gitlab-ci-yml
> > +++ b/support/scripts/generate-gitlab-ci-yml
> > @@ -7,14 +7,31 @@ output="${2}"
> >
> >  cp "${input}" "${output}"
> >
> > +d_only_in=$(
> > +    awk '/^\.defconfig:/{x=1;next}/^[^ ]/{x=0}x' "${input}" \
> > +        | awk '/^    only/{x=1;next}/^    [^ ]/{x=0}x'
> > +)
> > +d_only=$( \
> > +    printf ":\n    <<: *defconfig\n    only:\n%s\n        - /-" "$d_only_in"
> > +)
> > +
> >  (
> >      cd configs
> >      LC_ALL=C ls -1 *_defconfig
> >  ) \
> > -    | sed 's/$/: *defconfig/' \
> > +    | awk -v o="$d_only" '{i=$0; gsub(/\./,"\\.",i); print $0 o i "$/"}' \
> >      >> "${output}"
> >
> > +r_only_in=$(
> > +    awk '/^\.runtime_test:/{x=1;next}/^[^ ]/{x=0}x' "${input}" \
> > +        | awk '/^    only/{x=1;next}/^    [^ ]/{x=0}x'
> > +)
> > +r_only=$(
> > +    printf ":\n    <<: *runtime_test\n    only:\n%s\n        - /-" "$r_only_in"
> > +)
> > +
> >  ./support/testing/run-tests -l 2>&1 \
> > -    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' \
> > +    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
> >      | LC_ALL=C sort \
> > +    | awk -v o="$r_only" '{i=$0; gsub(/\./,"\\.",i); print $0 o i "$/"}' \
> >      >> "${output}"
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
>
> Matthew Weber | Pr. Software Engineer | Commercial Avionics
>
> COLLINS AEROSPACE
>
> 400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
>
> Tel: +1 319 295 7349 | FAX: +1 319 263 6099
>
> matthew.weber at collins.com | collinsaerospace.com
>
>
>
> CONFIDENTIALITY WARNING: This message may contain proprietary and/or
> privileged information of Collins Aerospace and its affiliated
> companies. If you are not the intended recipient, please 1) Do not
> disclose, copy, distribute or use this message or its contents. 2)
> Advise the sender by return email. 3) Delete all copies (including all
> attachments) from your computer. Your cooperation is greatly
> appreciated.



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
