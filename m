From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Nov 2019 22:22:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix build not adding
 stack protector library
In-Reply-To: <20190920085314.7816-1-nolange79@gmail.com>
References: <20190920085314.7816-1-nolange79@gmail.com>
Message-ID: <20191108212212.GM3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2019-09-20 10:53 +0200, Norbert Lange spake thusly:
> the stack protector flag is added during compilation,
> but not when linking. A compiler not defaulting to ssp
> will complain about missing symbols
> 
> upstream PR #13599
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Sorry for the late reply, In the meantime, systemd has been bumped to a
version that incorporates your change, so I marked this patch as
superseded.

Thank you!

Regards,
Yann E. MORIN.

> ---
>  ...ompilers-with-default-stack-protecto.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/systemd/0005-fix-build-with-compilers-with-default-stack-protecto.patch
> 
> diff --git a/package/systemd/0005-fix-build-with-compilers-with-default-stack-protecto.patch b/package/systemd/0005-fix-build-with-compilers-with-default-stack-protecto.patch
> new file mode 100644
> index 0000000000..d233df90da
> --- /dev/null
> +++ b/package/systemd/0005-fix-build-with-compilers-with-default-stack-protecto.patch
> @@ -0,0 +1,31 @@
> +From e028863a2ed4b380e12a79479fc7fc13d7b3214a Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <nolange79@gmail.com>
> +Date: Thu, 19 Sep 2019 17:49:20 +0200
> +Subject: [PATCH] fix build with compilers with default stack-protector enabled
> +
> +building systemd fails with a compiler that supports
> +-fstack-protector but does not enable it by default.
> +(will miss several __stack_chk_* symbols).
> +
> +fix this by also adding the switch during linking.
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>
> +---
> + meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/meson.build b/meson.build
> +index e5ceb1e..4fc7dfa 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -382,6 +382,7 @@ possible_cc_flags = [
> + possible_link_flags = [
> +         '-Wl,-z,relro',
> +         '-Wl,-z,now',
> ++        '-fstack-protector',
> + ]
> +
> + if cc.get_id() == 'clang'
> +--
> +2.23.0
> +
> -- 
> 2.23.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
