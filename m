From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 23:31:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] taskd: new package
In-Reply-To: <1457577520-11211-1-git-send-email-mathstuf@gmail.com>
References: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
 <1457577520-11211-1-git-send-email-mathstuf@gmail.com>
Message-ID: <56E1F5CB.2010504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/16 03:38, Ben Boeckel wrote:
> Taskwarrior is a task management suite of tools. Taskd is the
> synchronization server for it.
>
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> ---
>   package/Config.in       |  1 +
>   package/taskd/Config.in | 11 +++++++++++
>   package/taskd/taskd.mk  | 14 ++++++++++++++
>   3 files changed, 26 insertions(+)
>   create mode 100644 package/taskd/Config.in
>   create mode 100644 package/taskd/taskd.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d916154..35a24ba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1489,6 +1489,7 @@ endif
>   	source "package/sshpass/Config.in"
>   	source "package/strongswan/Config.in"
>   	source "package/stunnel/Config.in"
> +	source "package/taskd/Config.in"

  I don't think networking tools is the appropriate location. Miscellaneous maybe.

>   	source "package/tcpdump/Config.in"
>   	source "package/tcping/Config.in"
>   	source "package/tcpreplay/Config.in"
> diff --git a/package/taskd/Config.in b/package/taskd/Config.in
> new file mode 100644
> index 0000000..5b357f5
> --- /dev/null
> +++ b/package/taskd/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_TASKD
> +	bool "taskd"
> +	select BR2_PACKAGE_GNUTLS
> +	select BR2_USE_MMU
> +	select BR2_USE_WCHAR

  You cannot select MMU and WCHAR, you need to depend on it. See 
https://buildroot.org/downloads/manual/manual.html#depends-on-vs-select
The depends lines should come immediately after bool "taskd". There should also 
be a comment at the end of the file that tells the user that taskd is only 
available with wchar.

  In addition to these two, it also needs C++11. So definitely 
BR2_INSTALL_LIBSTDCPP, and probably also some minimal gcc version. Try with the 
Arago ARMv7 2011.09 if 4.5 works; if it does, add 
BR2_TOOLCHAIN_GCC_AT_LEAST_4_5, and so on until you find the minimal version.


> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	help
> +	  Task management synchronization daemon.
> +
> +	  http://taskwarrior.org/
> diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
> new file mode 100644
> index 0000000..0bdf81d
> --- /dev/null
> +++ b/package/taskd/taskd.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# taskd
> +#
> +################################################################################
> +
> +TASKD_VERSION = 1.1.0
> +TASKD_SOURCE = taskd-$(TASKD_VERSION).tar.gz

  This is the default, not needed.

> +TASKD_SITE = http://taskwarrior.org/download
> +TASKD_LICENSE = MIT
> +TASKD_LICENSE_FILES = COPYING LICENSE

  AFAICS both files are identical, so specifying only one of them (COPYING) is 
sufficient.

  Regards,
  Arnout


> +TASKD_DEPENDENCIES = gnutls util-linux
> +
> +$(eval $(cmake-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
