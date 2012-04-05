From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Apr 2012 19:50:31 +0200
Subject: [Buildroot] [PATCH resend] Added protobuf package
In-Reply-To: <CAHt8ZCMdK6Stia58eSVenoUqJHBDQ0Aptx_yWedvGRD-F8O8XQ@mail.gmail.com>
 (Simon Dawson's message of "Thu, 15 Mar 2012 08:51:27 +0000")
References: <CAHt8ZCMdK6Stia58eSVenoUqJHBDQ0Aptx_yWedvGRD-F8O8XQ@mail.gmail.com>
Message-ID: <878viarrtk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 Simon> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 Simon> ---
 Simon>  package/Config.in            |    1 +
 Simon>  package/protobuf/Config.in   |    7 +++++++
 Simon>  package/protobuf/protobuf.mk |   17 +++++++++++++++++
 Simon>  3 files changed, 25 insertions(+), 0 deletions(-)
 Simon>  create mode 100644 package/protobuf/Config.in
 Simon>  create mode 100644 package/protobuf/protobuf.mk

 Simon> diff --git a/package/Config.in b/package/Config.in
 Simon> index 36a221c..575373a 100644
 Simon> --- a/package/Config.in
 Simon> +++ b/package/Config.in
 Simon> @@ -388,6 +388,7 @@ source "package/liburcu/Config.in"
 Simon>  source "package/lttng-libust/Config.in"
 Simon>  source "package/orc/Config.in"
 Simon>  source "package/poco/Config.in"
 Simon> +source "package/protobuf/Config.in"
 Simon>  source "package/startup-notification/Config.in"
 Simon>  endmenu

 Simon> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
 Simon> new file mode 100644
 Simon> index 0000000..1b0085b
 Simon> --- /dev/null
 Simon> +++ b/package/protobuf/Config.in
 Simon> @@ -0,0 +1,7 @@
 Simon> +config BR2_PACKAGE_PROTOBUF
 Simon> +       bool "protobuf"
 Simon> +       help
 Simon> +         Protocol buffers are Google's language-neutral, platform-neutral,

These lines should be indented with <tab> and not spaces (help lines
with <tab><space><space>)

Protobuf is implemented in C++, so it should depend on
BR2_INSTALL_LIBSTDCPP.

 Simon> +# N.B. Need to use host protoc during cross compilation.
 Simon> +PROTOBUF_DEPENDENCIES = host-protobuf
 Simon> +PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 Simon> +
 Simon> +PROTOBUF_INSTALL_STAGING = YES
 Simon> +

protobuf can use zlib, so we need to ensure it gets built after it if
enabled.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
