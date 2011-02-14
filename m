From: Martin Hicks <mort@bork.org>
Date: Mon, 14 Feb 2011 09:37:36 -0500
Subject: [Buildroot] [PATCH] V2: Add package bonnie++
In-Reply-To: <20110208214219.GA17440@darwin.bork.org>
References: <20110201220238.2c218fcd@surf>
	<1297096132-5433-1-git-send-email-mort@bork.org>
	<87sjvzvk85.fsf@macbook.be.48ers.dk>
	<20110208214219.GA17440@darwin.bork.org>
Message-ID: <AANLkTinuNbEqqV9xo_BfNa4A_DzVXPSxh-u+ZkdWKjLX@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Were any other changes needed for this patch?

Thanks,
mh

On Tue, Feb 8, 2011 at 4:42 PM, Martin Hicks <mort@bork.org> wrote:
>
> On Mon, Feb 07, 2011 at 06:16:10PM +0100, Peter Korsgaard wrote:
>> >>>>> "Martin" == Martin Hicks <mort@bork.org> writes:
>>
>> ?Martin> A good filesystem performance benchmark program.
>> ?Martin> Fixed up a few things requested by reviewers.
>>
>> Bonnie++ is implemented in C++, right? If so, you need to depend on
>> LIBSTDCPP (and add a comment statement if it isn't available) - See
>> E.G. package/iperf/Config.in for an example.
>
> Okay. ?here's the updated patch:
>
>
> From 6b6e22d5a981069019db09fa68df5a7de0c892f4 Mon Sep 17 00:00:00 2001
> From: Martin Hicks <mort@bork.org>
> Date: Mon, 31 Jan 2011 15:32:06 -0500
> Subject: [PATCH] Add package bonnie++
>
> A good filesystem performance benchmark program
>
> Signed-off-by: Martin Hicks <mort@bork.org>
> ---
> ?package/Config.in ? ? ? ?| ? ?1 +
> ?package/bonnie/Config.in | ? 10 ++++++++++
> ?package/bonnie/bonnie.mk | ? 17 +++++++++++++++++
> ?3 files changed, 28 insertions(+), 0 deletions(-)
> ?create mode 100644 package/bonnie/Config.in
> ?create mode 100644 package/bonnie/bonnie.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 631bb80..49859b1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -17,6 +17,7 @@ source "package/xz/Config.in"
> ?endmenu
>
> ?menu "Debugging, profiling and benchmark"
> +source "package/bonnie/Config.in"
> ?source "package/dhrystone/Config.in"
> ?source "package/dmalloc/Config.in"
> ?source "package/kexec/Config.in"
> diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
> new file mode 100644
> index 0000000..926d917
> --- /dev/null
> +++ b/package/bonnie/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_BONNIE
> + ? ? ? bool "bonnie++"
> + ? ? ? depends on BR2_INSTALL_LIBSTDCPP
> + ? ? ? help
> + ? ? ? ? Filesystem tester
> +
> + ? ? ? ? http://www.coker.com.au/bonnie++/
> +
> +comment "bonnie requires a toolchain with C++ support enabled"
> + ? ? ? depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
> new file mode 100644
> index 0000000..87f5fbc
> --- /dev/null
> +++ b/package/bonnie/bonnie.mk
> @@ -0,0 +1,17 @@
> +#
> +# bonnie++
> +#
> +BONNIE_VERSION = 1.03e
> +BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
> +BONNIE_SITE = http://www.coker.com.au/bonnie++/
> +
> +define BONNIE_INSTALL_TARGET_CMDS
> + ? ? ? install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
> + ? ? ? install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
> +endef
> +
> +define BONNIE_UNINSTALL_TARGET_CMDS
> + ? ? ? rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
> +endef
> +
> +$(eval $(call AUTOTARGETS,package,bonnie))
> --
> 1.5.6.5
>
>
> --
> Martin Hicks P.Eng. ? ?| ? ? ?mort at bork.org
> Bork Consulting Inc. ? | ?+1 (613) 266-2296
>



-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
