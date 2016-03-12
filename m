From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Mar 2016 10:27:40 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: preserve CXXFLAGS_FOR_TARGET
In-Reply-To: <1457657122-7283-2-git-send-email-jcmvbkbc@gmail.com>
References: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
 <1457657122-7283-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <56E3E10C.7080405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/16 01:45, Max Filippov wrote:
> gcc-4.8.x and gcc-4.9.x don't propagate CXXFLAGS_FOR_TARGET to CXXFLAGS

  It would have been good to mention explicitly that it's not done for 
deprecated gcc-4.7.x and that it's already fixed in gcc-5.x.

> for libstdc++ build. As a result libstdc++ is built without
> TARGET_CFLAGS and may fail to link with applications using it, see e.g.
>
>    http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/
>
> Instead of passing TARGET_ABI or TARGET_CFLAGS for libstdc++ in
> --enable-cxx-flags parameter backport the patch that fixes propagation
> of CXXFLAGS_FOR_TARGET to CXXFLAGS.
>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/gcc/4.8.5/130-pr43538.patch | 25 +++++++++++++++++++++++++
>   package/gcc/4.9.3/130-pr43538.patch | 25 +++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 package/gcc/4.8.5/130-pr43538.patch
>   create mode 100644 package/gcc/4.9.3/130-pr43538.patch
>
> diff --git a/package/gcc/4.8.5/130-pr43538.patch b/package/gcc/4.8.5/130-pr43538.patch
> new file mode 100644
> index 0000000..19e57bb
> --- /dev/null
> +++ b/package/gcc/4.8.5/130-pr43538.patch
> @@ -0,0 +1,25 @@
> +From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
> +From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 25 Apr 2014 08:03:08 +0000
> +Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
> +
> +	PR target/43538
> +	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> +---
> + config/mt-gnu    | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/mt-gnu b/config/mt-gnu
> +index 15bf417..5c696f5 100644
> +--- a/config/mt-gnu
> ++++ b/config/mt-gnu
> +@@ -1 +1 @@
> +-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
> ++CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
> +--
> +2.1.4
> +
> diff --git a/package/gcc/4.9.3/130-pr43538.patch b/package/gcc/4.9.3/130-pr43538.patch
> new file mode 100644
> index 0000000..19e57bb
> --- /dev/null
> +++ b/package/gcc/4.9.3/130-pr43538.patch
> @@ -0,0 +1,25 @@
> +From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
> +From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 25 Apr 2014 08:03:08 +0000
> +Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
> +
> +	PR target/43538
> +	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> +---
> + config/mt-gnu    | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/mt-gnu b/config/mt-gnu
> +index 15bf417..5c696f5 100644
> +--- a/config/mt-gnu
> ++++ b/config/mt-gnu
> +@@ -1 +1 @@
> +-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
> ++CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
> +--
> +2.1.4
> +
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
