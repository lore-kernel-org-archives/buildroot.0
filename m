From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 24 Oct 2009 21:52:42 +0200
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
 toolchain
In-Reply-To: <87ljj0zlh6.fsf@macbook.be.48ers.dk>
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk>
Message-ID: <1256413962.28475.115.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 24 octobre 2009 ? 20:37 +0200, Peter Korsgaard a ?crit :
> >>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:
> 
>  Lionel> Some time ago, an external toolchain improvement patch added
>  Lionel> $(HOST_DIR)/bin and $(HOST_DIR)/usr/bin to the TARGET_PATH variable.
>  Lionel> This patch also removed $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin
>  Lionel> to TARGET_PATH which breaks the build of the WebKit package for
>  Lionel> example.
> 
>  Lionel> WebKit depends on the icu package, and when configuring the package,
>  Lionel> there is a need to run icu-config which is installed inside the
>  Lionel> staging directory.
> 
> I don't like this, as it mixes binaries/scripts for the host and the
> target - I think it's better for the icu package to install the host
> tool into host/usr/bin as well instead.
> 

First let me argue that when buildroot is not using an external
toolchain, the $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin paths are a
part of the TARGET_PATH variable.

But anyway, you're right, mixing binaries sucks.

Then, in this case, I don't think we can use the host script.

Let's right icu-config on my system :

djdeath at coalu:~$ icu-config --ldflags
 -lm   -L/usr/lib -licui18n -licuuc -licudata  -lm   

Same thing inside the staging directory :

djdeath at coalu:~/src/buildroot/buildroot_rebase$ ./output/staging/usr/bin/icu-config --ldflags
-lpthread -lm -L/home/djdeath/src/buildroot/buildroot_rebase/output/staging/usr/lib -licui18n -licuuc -licudata -lpthread -lm


The script returns paths relative to the host. This is going to be a
problem when linking the webkit binaries because the linker will have to
deal with host binaries... That's the same kind of problem we are fixing
with the libtool patch.

I'm wondering whether adding the following to package/webkit/webkit.mk
should fix the problem :

WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config

This way the configure script should use the pre-filled variable and not
try to detect the icu-config's path. And we don't need to add the
staging bin directories to the TARGET_PATH. 

A long term fix could be to use pkg-config instead of self made tool.
Patching/contributing to libicu is required.

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
