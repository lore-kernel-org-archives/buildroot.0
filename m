From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:39:50 +0200
Subject: [Buildroot] [PATCH 1/1] eja: new package
In-Reply-To: <1462052481-9005-1-git-send-email-ubaldo@eja.it>
References: <1462052481-9005-1-git-send-email-ubaldo@eja.it>
Message-ID: <20160501233950.30d36de6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! See below for some comments.

On Sat, 30 Apr 2016 21:41:21 +0000, Ubaldo Porcheddu wrote:

> as the new version is approaching I would like to add "eja" which is a

Such personal/contextual message should not be part of the commit log.
Remember that the commit log gets preserved forever in the Git history
of the project, so we don't want to see something like "as the new
version is approaching...". Which makes sense today, but won't make any
sense a few months from now when someone will look at the Git history
of Buildroot.

Instead, such personal/contextual messages should be part of a cover
letter (i.e a separate e-mail that introduces your patch series), or be
put below the "---" mark that follows your Signed-off-by line (anything
after the --- is not preserved when the patch is applied).

> Any feedback is of course welcome :)

This is also a 'personal' message, which shouldn't be in the commit log.

>  if BR2_PACKAGE_ERLANG
> diff --git a/package/eja/Config.in b/package/eja/Config.in
> new file mode 100644
> index 0000000..5833a78
> --- /dev/null
> +++ b/package/eja/Config.in
> @@ -0,0 +1,4 @@
> +    config BR2_PACKAGE_EJA

This line should not be intended.

> +    bool "eja"
> +    help

Those lines should be intended with one tab.

> +            eja micro web server

And this one with one tab + two spaces. Also, a better description
(such as the one from your commit log) would be better. And you also
need to finish the description with an empty line followed by the URL
of the upstream project homepage.

See the Buildroot documentation for more details on those conventions,
as well as other packages in Buildroot.

> diff --git a/package/eja/eja.mk b/package/eja/eja.mk
> new file mode 100644
> index 0000000..8e170f6
> --- /dev/null
> +++ b/package/eja/eja.mk
> @@ -0,0 +1,14 @@

This file lacks the comment header that we like every package to have.
Look at other packages.

> +EJA_VERSION:= 9.4.22

Use = sign only, and with a space before and after.

> +EJA_SOURCE:= $(EJA_VERSION).tar.gz

Ditto.

> +EJA_SITE:= https://github.com/ubaldus/eja/archive

Ditto.

Also, please add a hash file (refer to the Buildroot manual and other
packages for details).

> +EJA_INSTALL_TARGET:=YES

This line is not useful, as it is the default.

> +
> +define EJA_BUILD_CMDS
> +        $(MAKE) CC="$(TARGET_CC)" -C $(@D) static

Can you try:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) static

Also, why do you build the static variant?

> +define EJA_INSTALL_TARGET_CMDS
> +        $(INSTALL) -D -m 0755 $(@D)/eja $(TARGET_DIR)/usr/bin/

Please use a full destination path, i.e $(TARGET_DIR)/usr/bin/eja

Could you rework your patch to take into account those comments and
send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
