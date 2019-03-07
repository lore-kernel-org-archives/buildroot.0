From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 23:51:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongodb: needs host-python2
In-Reply-To: <20190214201358.28023-1-fontaine.fabrice@gmail.com>
References: <20190214201358.28023-1-fontaine.fabrice@gmail.com>
Message-ID: <fd3ddf44-2606-c3b3-7a42-cf3a2c5032e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 14/02/2019 21:13, Fabrice Fontaine wrote:
> mongodb (like gnuradio) needs host-python2 however there is no way to
> enforce this so add a dependency on !BR2_PACKAGE_PYTHON3.
> Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
> build and install host-python-typing for host-python3.

 We really should find a better solution, because this certainly sucks...

 However, IIUC, the problem is really that scons needs host-python2, not mongodb
itself. So I guess a better fix is to bump scons to 3.0.4 which supports python3.

> This issue was not raised in the previous version of mongodb as
> host-scons was the only dependency however we now have
> host-python-typing and host-python-pyyaml dependencies and it
> does not seem right to enforce python2 on those packages
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/693bdba2c01a1b69f56d6ee75094a6a0fc3f40b4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongodb/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
> index 969b8e062f..4ea62d9119 100644
> --- a/package/mongodb/Config.in
> +++ b/package/mongodb/Config.in
> @@ -1,6 +1,7 @@
>  # from https://docs.mongodb.com/manual/installation/#supported-platforms
>  config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
>  	bool
> +	depends on !BR2_PACKAGE_PYTHON3

 check-package complains here - the depends should be after the defaults.

 However, ARCH_SUPPORTS is supposed to be for architecture dependencies only.
So, this should be in the package itself and in the comment.

 Regards,
 Arnout

>  	# ARM needs LDREX/STREX, so ARMv6+
>  	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
>  	default y if BR2_aarch64 || BR2_powerpc64 || BR2_x86_64
> 
