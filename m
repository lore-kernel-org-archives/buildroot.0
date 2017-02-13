From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 14 Feb 2017 00:23:03 +0100
Subject: [Buildroot] [PATCH v3] Add gitlab-CI support
Message-ID: <20170213232303.7053-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot repository is now mirrored on
https://gitlab.com/buildroot.org/buildroot so we can use Gitlab-CI to
test Buildroot. Gitlab-CI is controlled by a .gitlab-ci.yml file
that exists in the repository.

For now, the only test is building all defconfigs (inspired on
https://travis-ci.org/buildroot/buildroot-defconfig-testing/). Since
all the defconfigs have to be specified in the .gitlab-ci.yml file,
we generate the file based on .gitlab-ci.yml.in. The generated
.gitlab-ci.yml file has to be committed into the repository, though,
otherwise Gitlab-CI doesn't see it. So there is also a test to verify
that .gitlab-ci.yml is up-to-date.

Building all the defconfigs takes a long time. Gitlab-CI will do that
every time it pulls from git.buildroot.org, which is once per hour.
That is way too often. Therefore, the defconfigs are not built on pull,
but only on explicit trigger through the API or when a tag is added.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: - check-gitlab-ci.yml: make sure .gitlab-ci.yml doesn't exist, so it
      is really regenerated.
    - Factor defconfig_script in a separate anchor, for easy testing of
      a limited set of defconfigs.
    - fix typo (Marcus)
    - install packages with --no-install-recommends (Marcus)
    - explicitly add ca-certificates, rsync and file packages (Marcus)

v2: Remove the custom before-script for check-gitlab-ci.yml.
    'make' is needed, so most of the rest of the before script is
    needed as well, so it's not so useful to avoid it.

I pushed to my private buildroot clone on gitlab and triggered a build.
See https://gitlab.com/arnout/buildroot/pipelines/6435620

I think it would be useful to still apply this to master.
---
 .gitlab-ci.yml    | 193 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml.in |  52 +++++++++++++++
 Makefile          |   3 +
 3 files changed, 248 insertions(+)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 .gitlab-ci.yml.in

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 0000000000..1e73867498
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,193 @@
+# Configuration for Gitlab-CI.
+# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
+# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
+# It needs to be regenerated every time a defconfig is added, using
+# "make .gitlab-ci.yml".
+
+image: debian:stable
+
+before_script:
+    - dpkg --add-architecture i386
+    # The container has not package lists, so need to update first
+    - apt-get update -qq
+    - apt-get install -y -qq --no-install-recommends
+        build-essential locales bc ca-certificates file rsync
+        git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
+    # To be able to generate a toolchain with locales, enable one UTF-8 locale
+    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
+    - /usr/sbin/locale-gen
+
+.defconfig_script: &defconfig_script
+    - echo 'Configure Buildroot'
+    - make ${CI_BUILD_NAME}
+    - echo 'Build buildroot'
+    - |
+        make > >(tee build.log |grep '>>>') 2>&1 || {
+            echo 'Failed build last output'
+            tail -200 build.log
+            exit 1
+        }
+
+check-gitlab-ci.yml:
+    script:
+        - mv .gitlab-ci.yml .gitlab-ci.yml.orig
+        - make .gitlab-ci.yml
+        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
+
+.defconfig: &defconfig
+    # Running the defconfigs for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
+    script: *defconfig_script
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - build.log
+            - output/images/
+            - output/build/build-time.log
+            - output/build/packages-file-list.txt
+
+acmesystems_aria_g25_128mb_defconfig: *defconfig
+acmesystems_aria_g25_256mb_defconfig: *defconfig
+acmesystems_arietta_g25_128mb_defconfig: *defconfig
+acmesystems_arietta_g25_256mb_defconfig: *defconfig
+altera_socdk_defconfig: *defconfig
+altera_sockit_defconfig: *defconfig
+arcturus_ucp1020_defconfig: *defconfig
+arm_foundationv8_defconfig: *defconfig
+arm_juno_defconfig: *defconfig
+armadeus_apf27_defconfig: *defconfig
+armadeus_apf28_defconfig: *defconfig
+armadeus_apf51_defconfig: *defconfig
+armadeus_apf9328_defconfig: *defconfig
+at91sam9260eknf_defconfig: *defconfig
+at91sam9g20dfc_defconfig: *defconfig
+at91sam9g45m10ek_defconfig: *defconfig
+at91sam9rlek_defconfig: *defconfig
+at91sam9x5ek_defconfig: *defconfig
+atmel_sama5d2_xplained_mmc_defconfig: *defconfig
+atmel_sama5d2_xplained_mmc_dev_defconfig: *defconfig
+atmel_sama5d3_xplained_defconfig: *defconfig
+atmel_sama5d3_xplained_dev_defconfig: *defconfig
+atmel_sama5d3_xplained_mmc_defconfig: *defconfig
+atmel_sama5d3_xplained_mmc_dev_defconfig: *defconfig
+atmel_sama5d3xek_defconfig: *defconfig
+atmel_sama5d4_xplained_defconfig: *defconfig
+atmel_sama5d4_xplained_dev_defconfig: *defconfig
+atmel_sama5d4_xplained_mmc_defconfig: *defconfig
+atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
+beagleboardx15_defconfig: *defconfig
+beaglebone_defconfig: *defconfig
+beaglebone_qt5_defconfig: *defconfig
+chromebook_snow_defconfig: *defconfig
+ci20_defconfig: *defconfig
+cubieboard2_defconfig: *defconfig
+firefly_rk3288_defconfig: *defconfig
+firefly_rk3288_demo_defconfig: *defconfig
+freescale_imx28evk_defconfig: *defconfig
+freescale_imx31_3stack_defconfig: *defconfig
+freescale_imx6dlsabreauto_defconfig: *defconfig
+freescale_imx6dlsabresd_defconfig: *defconfig
+freescale_imx6qsabreauto_defconfig: *defconfig
+freescale_imx6qsabresd_defconfig: *defconfig
+freescale_imx6sololiteevk_defconfig: *defconfig
+freescale_imx6sxsabresd_defconfig: *defconfig
+freescale_imx6ulevk_defconfig: *defconfig
+freescale_imx7dsabresd_defconfig: *defconfig
+freescale_mpc8315erdb_defconfig: *defconfig
+freescale_p1010rdb_pa_defconfig: *defconfig
+galileo_defconfig: *defconfig
+gdb_bfin_bf512_defconfig: *defconfig
+grinn_chiliboard_defconfig: *defconfig
+grinn_liteboard_defconfig: *defconfig
+imx23evk_defconfig: *defconfig
+imx6q-sabresd_defconfig: *defconfig
+imx6ulpico_defconfig: *defconfig
+lego_ev3_defconfig: *defconfig
+linksprite_pcduino_defconfig: *defconfig
+minnowboard_defconfig: *defconfig
+minnowboard_max-graphical_defconfig: *defconfig
+minnowboard_max_defconfig: *defconfig
+mx25pdk_defconfig: *defconfig
+mx51evk_defconfig: *defconfig
+mx53loco_defconfig: *defconfig
+mx6cubox_defconfig: *defconfig
+mx6sx_udoo_neo_defconfig: *defconfig
+mx6udoo_defconfig: *defconfig
+nanopi_neo_defconfig: *defconfig
+nitrogen6sx_defconfig: *defconfig
+nitrogen6x_defconfig: *defconfig
+nitrogen7_defconfig: *defconfig
+odroidc2_defconfig: *defconfig
+olimex_a20_olinuxino_lime2_defconfig: *defconfig
+olimex_a20_olinuxino_lime_defconfig: *defconfig
+olimex_a20_olinuxino_lime_mali_defconfig: *defconfig
+olimex_a20_olinuxino_micro_defconfig: *defconfig
+olimex_imx233_olinuxino_defconfig: *defconfig
+openblocks_a6_defconfig: *defconfig
+orangepi_one_defconfig: *defconfig
+orangepi_pc_defconfig: *defconfig
+pandaboard_defconfig: *defconfig
+pc_x86_64_bios_defconfig: *defconfig
+pc_x86_64_efi_defconfig: *defconfig
+qemu_aarch64_virt_defconfig: *defconfig
+qemu_arm_versatile_defconfig: *defconfig
+qemu_arm_versatile_nommu_defconfig: *defconfig
+qemu_arm_vexpress_defconfig: *defconfig
+qemu_m68k_mcf5208_defconfig: *defconfig
+qemu_m68k_q800_defconfig: *defconfig
+qemu_microblazebe_mmu_defconfig: *defconfig
+qemu_microblazeel_mmu_defconfig: *defconfig
+qemu_mips32r2_malta_defconfig: *defconfig
+qemu_mips32r2el_malta_defconfig: *defconfig
+qemu_mips32r6_malta_defconfig: *defconfig
+qemu_mips32r6el_malta_defconfig: *defconfig
+qemu_mips64_malta_defconfig: *defconfig
+qemu_mips64el_malta_defconfig: *defconfig
+qemu_mips64r6_malta_defconfig: *defconfig
+qemu_mips64r6el_malta_defconfig: *defconfig
+qemu_nios2_10m50_defconfig: *defconfig
+qemu_or1k_defconfig: *defconfig
+qemu_ppc64_pseries_defconfig: *defconfig
+qemu_ppc_g3beige_defconfig: *defconfig
+qemu_ppc_mpc8544ds_defconfig: *defconfig
+qemu_ppc_virtex_ml507_defconfig: *defconfig
+qemu_sh4_r2d_defconfig: *defconfig
+qemu_sh4eb_r2d_defconfig: *defconfig
+qemu_sparc64_sun4u_defconfig: *defconfig
+qemu_sparc_ss10_defconfig: *defconfig
+qemu_x86_64_defconfig: *defconfig
+qemu_x86_defconfig: *defconfig
+qemu_xtensa_lx60_defconfig: *defconfig
+qemu_xtensa_lx60_nommu_defconfig: *defconfig
+raspberrypi0_defconfig: *defconfig
+raspberrypi2_defconfig: *defconfig
+raspberrypi3_defconfig: *defconfig
+raspberrypi_defconfig: *defconfig
+riotboard_defconfig: *defconfig
+roseapplepi_defconfig: *defconfig
+s6lx9_microboard_defconfig: *defconfig
+sheevaplug_defconfig: *defconfig
+snps_aarch64_vdk_defconfig: *defconfig
+snps_archs38_vdk_defconfig: *defconfig
+snps_archs38_zebu_defconfig: *defconfig
+snps_axs101_defconfig: *defconfig
+snps_axs103_defconfig: *defconfig
+stm32f429_disco_defconfig: *defconfig
+stm32f469_disco_defconfig: *defconfig
+telit_evk_pro3_defconfig: *defconfig
+toradex_apalis_imx6_defconfig: *defconfig
+ts4800_defconfig: *defconfig
+ts4900_defconfig: *defconfig
+ts5x00_defconfig: *defconfig
+via_imx6_vab820_defconfig: *defconfig
+wandboard_defconfig: *defconfig
+warp7_defconfig: *defconfig
+warpboard_defconfig: *defconfig
+zynq_microzed_defconfig: *defconfig
+zynq_zc706_defconfig: *defconfig
+zynq_zed_defconfig: *defconfig
+zynq_zybo_defconfig: *defconfig
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
new file mode 100644
index 0000000000..4d7e8024be
--- /dev/null
+++ b/.gitlab-ci.yml.in
@@ -0,0 +1,52 @@
+# Configuration for Gitlab-CI.
+# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
+# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
+# It needs to be regenerated every time a defconfig is added, using
+# "make .gitlab-ci.yml".
+
+image: debian:stable
+
+before_script:
+    - dpkg --add-architecture i386
+    # The container has not package lists, so need to update first
+    - apt-get update -qq
+    - apt-get install -y -qq --no-install-recommends
+        build-essential locales bc ca-certificates file rsync
+        git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
+    # To be able to generate a toolchain with locales, enable one UTF-8 locale
+    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
+    - /usr/sbin/locale-gen
+
+.defconfig_script: &defconfig_script
+    - echo 'Configure Buildroot'
+    - make ${CI_BUILD_NAME}
+    - echo 'Build buildroot'
+    - |
+        make > >(tee build.log |grep '>>>') 2>&1 || {
+            echo 'Failed build last output'
+            tail -200 build.log
+            exit 1
+        }
+
+check-gitlab-ci.yml:
+    script:
+        - mv .gitlab-ci.yml .gitlab-ci.yml.orig
+        - make .gitlab-ci.yml
+        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
+
+.defconfig: &defconfig
+    # Running the defconfigs for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
+    script: *defconfig_script
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - build.log
+            - output/images/
+            - output/build/build-time.log
+            - output/build/packages-file-list.txt
+
diff --git a/Makefile b/Makefile
index dcda8fe024..bf653a587c 100644
--- a/Makefile
+++ b/Makefile
@@ -1066,6 +1066,9 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
+	(cd configs; ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@
+
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)
 
-- 
2.11.0
