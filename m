From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:28:54 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: enable musl support
In-Reply-To: <20171127191541.8149-1-bernd.kuhls@t-online.de>
References: <20171127191541.8149-1-bernd.kuhls@t-online.de>
Message-ID: <20171127212854.2f106d1d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 20:15:41 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/0002-musl-getpwent_r.patch      | 79 ++++++++++++++++++++++++++
>  package/samba4/0003-musl-netdb-defines.patch   | 26 +++++++++
>  package/samba4/0004-musl-pthread_mutex_t.patch | 26 +++++++++
>  package/samba4/Config.in                       |  7 +--
>  4 files changed, 134 insertions(+), 4 deletions(-)
>  create mode 100644 package/samba4/0002-musl-getpwent_r.patch
>  create mode 100644 package/samba4/0003-musl-netdb-defines.patch
>  create mode 100644 package/samba4/0004-musl-pthread_mutex_t.patch

Thanks for this. However, since Samba is using Git as a version control
system, we want to use Git formatted patches.

Also, could you submit upstream those patches ?

See below for other comments/questions.

> diff --git a/package/samba4/0002-musl-getpwent_r.patch b/package/samba4/0002-musl-getpwent_r.patch
> new file mode 100644
> index 0000000000..e3cc734388
> --- /dev/null
> +++ b/package/samba4/0002-musl-getpwent_r.patch
> @@ -0,0 +1,79 @@
> +Musl fix for getpwent_r
> +
> +Downloaded from
> +https://git.alpinelinux.org/cgit/aports/tree/main/samba/getpwent_r.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff --git a/source4/torture/local/nss_tests.c b/source4/torture/local/nss_tests.c
> +index 2cd6122..04f13c6 100644
> +--- a/source4/torture/local/nss_tests.c
> ++++ b/source4/torture/local/nss_tests.c
> +@@ -333,6 +332,7 @@ static bool test_enum_passwd(struct torture_context *tctx,
> + 	return true;
> + }
> + 
> ++#if HAVE_GETPWENT_R
> + static bool test_enum_r_passwd(struct torture_context *tctx,
> + 			       struct passwd **pwd_array_p,
> + 			       size_t *num_pwd_p)
> +@@ -381,6 +381,7 @@ static bool test_enum_r_passwd(struct torture_context *tctx,
> + 
> + 	return true;
> + }
> ++#endif
> + 
> + static bool torture_assert_passwd_equal(struct torture_context *tctx,
> + 					const struct passwd *p1,
> +@@ -432,7 +433,7 @@ static bool test_passwd_r(struct torture_context *tctx)
> + 	struct passwd *pwd, pwd1, pwd2;
> + 	size_t num_pwd;
> + 
> +-	torture_assert(tctx, test_enum_r_passwd(tctx, &pwd, &num_pwd),
> ++	torture_assert(tctx, test_enum_passwd(tctx, &pwd, &num_pwd),
> + 						"failed to enumerate passwd");

This patch looks bogus, because is uses test_enum_passwd()
unconditionally, even if test_enum_r_passwd() is available.

Also, if Samba is using getpwent_r() instead of getpwent(), perhaps
there's a reason?


> diff --git a/package/samba4/0004-musl-pthread_mutex_t.patch b/package/samba4/0004-musl-pthread_mutex_t.patch
> new file mode 100644
> index 0000000000..eba05aac2a
> --- /dev/null
> +++ b/package/samba4/0004-musl-pthread_mutex_t.patch
> @@ -0,0 +1,26 @@
> +Fixes musl build error
> +
> +../ctdb/tests/src/test_mutex_raw.c: In function 'main':
> +../ctdb/tests/src/test_mutex_raw.c:170:28: error: 'pthread_mutex_t {aka struct <anonymous>}' has no member named '__data'
> +    printf("pid=%u\n", mutex->__data.__owner);
> +
> +Downloaded from
> +https://github.com/openembedded/meta-openembedded/blob/master/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +Index: samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
> +===================================================================
> +--- samba-4.6.2.orig/ctdb/tests/src/test_mutex_raw.c
> ++++ samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
> +@@ -166,8 +166,10 @@ int main(int argc, const char **argv)
> + 			if (ret == 0) {
> + 				pthread_mutex_unlock(mutex);
> + 			}
> ++#ifdef __GLIBC__
> + 		} else if (ret == EBUSY) {
> + 			printf("pid=%u\n", mutex->__data.__owner);
> ++#endif

So how is the ret == EBUSY case being handled ?

> + 		} else if (ret == 0) {
> + 			pthread_mutex_unlock(mutex);
> + 		}

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
