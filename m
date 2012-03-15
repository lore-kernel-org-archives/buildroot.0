From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 11:45:57 +0100
Subject: [Buildroot] [PATCH resend] new package: zeromq
In-Reply-To: <7cbcbbf3191cf0d5fab5.1331743096@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 14 Mar 2012 17:38:16 +0100")
References: <7cbcbbf3191cf0d5fab5.1331743096@beantl019720>
Message-ID: <87k42mrvkq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas> I hope the ? symbol in Config.in is not a problem.

It doesn't render nicely in menuconfig here, but ok.

 Thomas>  package/Config.in        |   1 +
 Thomas>  package/zeromq/Config.in |  22 ++++++++++++++++++++++
 Thomas>  package/zeromq/zeromq.mk |  12 ++++++++++++
 Thomas>  3 files changed, 35 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -366,6 +366,7 @@ source "package/librsync/Config.in"
 Thomas>  source "package/libsoup/Config.in"
 Thomas>  source "package/libupnp/Config.in"
 Thomas>  source "package/libvncserver/Config.in"
 Thomas> +source "package/zeromq/Config.in"
 Thomas>  endmenu
 
 Thomas>  menu "Other"
 Thomas> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
 Thomas> new file mode 100644
 Thomas> --- /dev/null
 Thomas> +++ b/package/zeromq/Config.in
 Thomas> @@ -0,0 +1,22 @@
 Thomas> +comment "zeromq requires a toolchain with WCHAR support"
 Thomas> +	depends on !BR2_USE_WCHAR
 Thomas> +
 Thomas> +config BR2_PACKAGE_ZEROMQ
 Thomas> +	bool "zeromq"
 Thomas> +	depends on BR2_USE_WCHAR # util-linux

Util-linux also depends on LARGEFILE, so you need that as well.
Zeromq is written in C++, so you also need INSTALL_LIBSTDCPP.

 Thomas> +	select BR2_PACKAGE_UTIL_LINUX
 Thomas> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 Thomas> +	help
 Thomas> +	  ?MQ (ZeroMQ, 0MQ, zmq) looks like an embeddable networking library but
 Thomas> +	  acts like a concurrency framework. It gives you sockets that carry
 Thomas> +	  whole messages across various transports like in-process, inter-
 Thomas> +	  process, TCP, and multicast. You can connect sockets N-to-N with
 Thomas> +	  patterns like fanout, pub-sub, task distribution, and request-reply.
 Thomas> +	  It's fast enough to be the fabric for clustered products. Its
 Thomas> +	  asynchronous I/O model gives you scalable multicore applications,
 Thomas> +	  built as asynchronous message-processing tasks. It has a score of
 Thomas> +	  language APIs and runs on most operating systems.
 Thomas> +
 Thomas> +	  ?MQ is from iMatix and is LGPL open source.

I reformatted the help text to fit in menuconfig.

 Thomas> +
 Thomas> +	  http://www.zeromq.org/
 Thomas> diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
 Thomas> new file mode 100644
 Thomas> --- /dev/null
 Thomas> +++ b/package/zeromq/zeromq.mk
 Thomas> @@ -0,0 +1,12 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# zeromq
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +ZEROMQ_VERSION = 2.1.11
 Thomas> +ZEROMQ_SITE = http://download.zeromq.org/
 Thomas> +

ZEROMQ is a library, so you need to install into staging as well.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
