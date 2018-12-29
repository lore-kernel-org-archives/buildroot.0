From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Dec 2018 13:48:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: backport meson cpp fix
In-Reply-To: <1546084152-27181-1-git-send-email-james.hilliard1@gmail.com>
References: <1546084152-27181-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181229124824.GA14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-29 19:49 +0800, james.hilliard1 at gmail.com spake thusly:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> This is needed so that systemd can be built without a cpp toolchain.

I think a better commit title and commit log would be:

    package/systemd: fix build on toolchain without C++

    This is a backport from upstream.

    Signed-off-by: You

BTW, "cpp" means "C pre-processor", not "C++".

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-use-cross-compilation-compatible-c-check.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
> 
> diff --git a/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
> new file mode 100644
> index 0000000..f6eea34
> --- /dev/null
> +++ b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
> @@ -0,0 +1,40 @@
> +From de8eab973f4d4b0f1f1eb8169165be524aefa306 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Thu, 27 Dec 2018 09:16:20 +0800
> +Subject: [PATCH 1/1] meson: use cross compilation compatible c++ check

This is not the commit that was applied upstream. Please, really do a
backport, i.e.:

  - get a local clone of systemd

  - git format-patch -1 46e63a2a3ed46ce97430ce38e4cc0798c57900eb

Then edit 0001-meson-use-cross-compilation-compatible-c-check.patch and
add the backport information:

    [james.hilliard1 at gmail.com: backport from upstream]
    Signed-off-by: You

And then add this patch to Buildroot.

Note: the sha1 that is being backported is already present in the
generated patch, so no need to repeat it.

Regards,
Yann E. MORIN.

> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +---
> + meson.build             | 1 -
> + src/systemd/meson.build | 3 +--
> + 2 files changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 337e014..4f1b3f9 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -289,7 +289,6 @@ install_tests = get_option('install-tests')
> + 
> + if add_languages('cpp', required : fuzzer_build)
> +         #  Used only for tests
> +-        add_languages('cpp')
> +         cxx_cmd = ' '.join(meson.get_compiler('cpp').cmd_array())
> + else
> +         cxx_cmd = ''
> +diff --git a/src/systemd/meson.build b/src/systemd/meson.build
> +index e0c967e..75c48b0 100644
> +--- a/src/systemd/meson.build
> ++++ b/src/systemd/meson.build
> +@@ -52,8 +52,7 @@ if cc.has_argument('-std=iso9899:2017')
> +         opts += [['c', '-std=iso9899:2017']]
> + endif
> + 
> +-cxx = find_program('c++', required : false)
> +-if cxx.found()
> ++if add_languages('cpp', required : false)
> +         opts += [['c++'],
> +                  ['c++', '-std=c++98'],
> +                  ['c++', '-std=c++11']]
> +-- 
> +2.7.4
> +
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
