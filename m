From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 5 Mar 2012 15:56:25 +0100
Subject: [Buildroot] [PATCH 2/2] Add test infrastructure
In-Reply-To: <1330818307-22115-3-git-send-email-arnout@mind.be>
References: <1330818307-22115-1-git-send-email-arnout@mind.be>
 <1330818307-22115-3-git-send-email-arnout@mind.be>
Message-ID: <20120305145625.GE21255@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

	I like the idea of test but what is the target here?

	if it's build multiple config take a look on the MAKEALL of barebox

	or we could set a buildbot

Best Regards,
J.
On 00:45 Sun 04 Mar     , Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> The test infrastructure is a script and a list of tests to be run.
> Additional test configurations can be added later to the test directory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  test/runtests.sh |  106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  test/testspecs   |   24 ++++++++++++
>  2 files changed, 130 insertions(+), 0 deletions(-)
>  create mode 100755 test/runtests.sh
>  create mode 100644 test/testspecs
> 
> diff --git a/test/runtests.sh b/test/runtests.sh
> new file mode 100755
> index 0000000..2f547eb
> --- /dev/null
> +++ b/test/runtests.sh
> @@ -0,0 +1,106 @@
> +#! /bin/sh
> +# Run test builds of buildroot
> +# runtest.sh <testspec>...
> +#
> +# testspec:  <baseconfig>[=<type>,...]
> +#   A testspec is a config file name (relative to the buildroot top dir),
> +#   optionally followed by a comma-separated list of config types.
> +#   Config types are: def, rand, allyes, allno, randpackage, allyespackage,
> +#                     allnopackage
> +#   If config types are not given, it is taken from a line containing
> +#   CONFIGTYPES= in the baseconfig.  If that is also not present, def
> +#   and randpackage are tried.
> +#
> +# If no arguments are given, the testspecs are taken from the testspecs
> +# file in the current directory.  If that file doesn't exist, the testspecs
> +# file in the test directory is taken.
> +#
> +# The output goes into the current directory.
> +
> +testdir=$(dirname $0)
> +topdir=$(cd $testdir/..; pwd)
> +
> +configdir=$PWD/gen-config
> +brversion=$(make -C $topdir --no-print-directory print-version)
> +
> +echo "Running tests for $brversion"
> +
> +# Run build for config $1 with type $2
> +function runbuild() {
> +	baseconfig=$1
> +	configtype=$2
> +
> +	echo "Building $baseconfig ${configtype}config"
> +
> +	# Interprete baseconfig relative to topdir
> +	if [ "${baseconfig:0:1}" = / ]; then
> +		baseconfigfile=$baseconfig
> +	else
> +		baseconfigfile=${topdir}/${baseconfig}
> +	fi
> +
> +	if [ ! -r $baseconfigfile ]; then
> +		echo "  *** $baseconfig not found!"
> +		return 1
> +	fi
> +
> +	# Create the configtype from baseconfig
> +	configname=${brversion}-$(basename $baseconfig)
> +	hostdir=${PWD}/${configname}.hostdir
> +	mkdir -p $configdir
> +	cp $baseconfigfile $configdir/.config
> +	echo "BR2_HOST_DIR=\"${hostdir}\"" >> $configdir/.config
> +	make -C $topdir --no-print-directory O=$configdir ${configtype}config > /dev/null || {
> +		echo "  *** make ${configtype}config failed for $baseconfig"
> +		return 1
> +	}
> +
> +	# Add the sha of the config file to its name, so we can uniquely
> +	# identify it.  This allows us to remove duplicates, e.g. defconfig
> +	# and allnoconfig.
> +	fullconfigname=${configname}-$(sha1sum $configdir/.config | cut -c -40)
> +	if [ -e ${fullconfigname}.success ]; then
> +		echo "  ${fullconfigname} already built successfully; skipping"
> +		return 0
> +	fi
> +
> +	# Save the defconfig of this config for future reference.
> +	make -C $topdir --no-print-directory O=$configdir savedefconfig > /dev/null || {
> +		echo "  *** Failed savedefconfig for $fullconfigname"
> +		return 1
> +	}
> +	cp $configdir/defconfig $fullconfigname.defconfig
> +
> +	outdir=${PWD}/${fullconfigname}.output
> +	logfile=${fullconfigname}.log
> +	mkdir -p $outdir
> +	cp $configdir/.config $outdir
> +	make -C $topdir O=$outdir > $logfile 2>&1 || {
> +		echo "  *** Failed $fullconfigname - see log file for details"
> +		touch $fullconfigname.failed
> +		#rm -rf $outdir
> +		return 1
> +	}
> +
> +	echo "  Successfully built $baseconfig ${configtype}config"
> +	touch $fullconfigname.success
> +	rm -rf $outdir
> +	bzip2 $logfile
> +}
> +
> +
> +if [ "$1" ]; then
> +	testspecs="$*"
> +elif [ -r testspecs ]; then
> +	testspecs="$(cat testspecs)"
> +else
> +	testspecs="$(cat $testdir/testspecs)"
> +fi
> +
> +for testspec in $testspecs; do
> +	baseconfig=${testspec%=*}
> +	configtypes=${testspec#*=}
> +	for configtype in ${configtypes//,/ }; do
> +		runbuild $baseconfig $configtype
> +	done
> +done
> diff --git a/test/testspecs b/test/testspecs
> new file mode 100644
> index 0000000..2e3be3d
> --- /dev/null
> +++ b/test/testspecs
> @@ -0,0 +1,24 @@
> +configs/armadeus_apf9328_defconfig=def,randpackage
> +configs/at91rm9200df_defconfig=def,randpackage
> +configs/at91sam9260dfc_defconfig=def,randpackage
> +configs/at91sam9261ek_defconfig=def,randpackage
> +configs/at91sam9263ek_defconfig=def,randpackage
> +configs/at91sam9g20dfc_defconfig=def,randpackage
> +configs/atngw100_defconfig=def,randpackage
> +configs/atstk100x_defconfig=def,randpackage
> +configs/ea3250_defconfig=def,randpackage
> +configs/fdi3250_defconfig=def,randpackage
> +configs/integrator926_defconfig=def,randpackage
> +configs/kb9202_defconfig=def,randpackage
> +configs/mini2440_defconfig=def,randpackage
> +configs/mx53loco_defconfig=def,randpackage
> +configs/phy3250_defconfig=def,randpackage
> +configs/qemu_arm_versatile_defconfig=def,randpackage
> +configs/qemu_mips_malta_defconfig=def,randpackage
> +configs/qemu_mipsel_malta_defconfig=def,randpackage
> +configs/qemu_ppc_g3beige_defconfig=def,randpackage
> +configs/qemu_sh4_r2d_defconfig=def,randpackage
> +configs/qemu_sparc_ss10_defconfig=def,randpackage
> +configs/qemu_x86_64_defconfig=def,randpackage
> +configs/qemu_x86_defconfig=def,randpackage
> +configs/sheevaplug_defconfig=def,randpackage
> -- 
> 1.7.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
