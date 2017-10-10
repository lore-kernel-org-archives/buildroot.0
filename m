From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 02:15:50 +0200
Subject: [Buildroot] [PATCH 5/8] policycoreutils: bump to 2.7
In-Reply-To: <20171009222731.15119-5-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <20171009222731.15119-5-Adamduskett@outlook.com>
Message-ID: <99ad2cf9-3a7e-ec36-fe37-d68460bd1da0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 10-10-17 00:27, Adam Duskett wrote:
> Policycoreutils was broken up into several packages, as such several
> changes needed to happen for this patch to work:
> 
> - Remove patches 3, 4, and 5 as they no longer apply.
> - Refresh patches 1 and 2 to work with version 2.7
> - Remove semodule_${deps,expand,link,package} and sestatus from the makedirs
>   in the mk file.
> - Remove restorecond from the make and config file. (Seperate package)
> - Remove Audit2allow from the make and config file. (In a different package)

 Like for sepolgen, you'll need to create Config.in.legacy entries for those two.

 Obviously that implies that the order of the patches should be different as
well: selinux-python and restorecond must come before this one.

> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  ...IR-to-all-paths-that-use-an-absolute-path.patch | 121 ++-----------
>  .../0002-Add-PREFIX-to-host-paths.patch            | 200 ++++-----------------
>  .../0003-Remove-hardcoded-arch-variable.patch      |  43 -----
>  ...licy-python-install-arguments-to-be-a-var.patch |  42 -----
>  .../0005-Check-to-see-if-DBUS-is-enabled.patch     |  56 ------
>  package/policycoreutils/Config.in                  |  43 -----
>  package/policycoreutils/policycoreutils.hash       |   2 +-
>  package/policycoreutils/policycoreutils.mk         |  35 +---
>  8 files changed, 51 insertions(+), 491 deletions(-)
>  delete mode 100644 package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
>  delete mode 100644 package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
>  delete mode 100644 package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
> 
> diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> index bbd6895e7f..3c1610f7a2 100644
> --- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> +++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> @@ -1,3 +1,8 @@
> +From 85763549c53b2907dab094163f1404b2233f8029 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Adamduskett@outlook.com>
> +Date: Mon, 9 Oct 2017 16:51:20 -0400
> +Subject: [PATCH] Add DESTDIR to setfiles
> +
>  The addition of this patch makes the use of DESTDIR
>  mandatory as there are conditional checks which would fail if it's not
>  defined.
> @@ -9,123 +14,25 @@ Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>  Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
>  Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
>  Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +refresh for 2.7

 We normally format this like so:

[Adam: refresh for 2.7]

 However, since you're already the author of this patch, it's not required.
Also, there is no need to repeat your Sob 3 times, just one is sufficient.

> +Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>  ---
> - policycoreutils/Makefile             | 2 +-
> - policycoreutils/newrole/Makefile     | 4 ++--
> - policycoreutils/restorecond/Makefile | 5 +++--
> - policycoreutils/run_init/Makefile    | 4 ++--
> - policycoreutils/sepolicy/Makefile    | 2 +-
> - policycoreutils/sestatus/Makefile    | 2 +-

 So they fixed things in all these other Makefiles? Great!

> - policycoreutils/setfiles/Makefile    | 4 ++--
> - 7 files changed, 12 insertions(+), 11 deletions(-)
> + setfiles/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
[snip]
> diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
> index 56aae74ba0..440923dd58 100644
> --- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
> +++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
> @@ -1,6 +1,6 @@
> -From 7f99a727cdb8160d49bb0d0554fc88787980c971 Mon Sep 17 00:00:00 2001
> -From: Adam Duskett <Aduskett@gmail.com>
> -Date: Thu, 14 Jul 2016 13:16:03 -0400
> +From a221304344b3f9db7e86d928cf97d77542bcf456 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Adamduskett@outlook.com>
> +Date: Mon, 9 Oct 2017 16:47:19 -0400
>  Subject: [PATCH] Add PREFIX to host paths
>  
>  Updates the remaining hardcoded host paths used in the build to be
> @@ -11,201 +11,61 @@ Updated to work with version 2.5
>  Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>  Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
>  Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
> -Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +refresh for 2.7
> +Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

 Same comments here, of course.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
