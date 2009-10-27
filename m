From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2009 08:44:28 +0100
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
 toolchain
In-Reply-To: <87ljj0zlh6.fsf@macbook.be.48ers.dk>
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk>
Message-ID: <20091027084428.6132b429@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 24 Oct 2009 20:37:57 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Lionel> Some time ago, an external toolchain improvement patch added
>  Lionel> $(HOST_DIR)/bin and $(HOST_DIR)/usr/bin to the TARGET_PATH
>  Lionel> variable. This patch also removed $(STAGING_DIR)/bin and
>  Lionel> $(STAGING_DIR)/usr/bin to TARGET_PATH which breaks the build
>  Lionel> of the WebKit package for example.
> 
>  Lionel> WebKit depends on the icu package, and when configuring the
>  Lionel> package, there is a need to run icu-config which is
>  Lionel> installed inside the staging directory.
> 
> I don't like this, as it mixes binaries/scripts for the host and the
> target - I think it's better for the icu package to install the host
> tool into host/usr/bin as well instead.

As part of my work on the package infrastructure, I converted icu over
to the new format.

At first, I'd agree with you that icu-config, being executed on the
host, should theorically be installed in $(HOST_DIR). However, this
raises an issue : icu is compiled twice, once for the host, once for
the target.

In the current package/icu/icu.mk, the host icu is not installed at
all, but my package infrastructure work converts it to a more normal
package where the host icu is installed in $(HOST_DIR). Therefore, the
host icu installs its own icu-config in $(HOST_DIR)/usr/bin.

Then, we build the target icu, which also installs its own icu-config,
in $(STAGING_DIR)/usr/bin. It is not possible to install this
icu-config into $(HOST_DIR)/usr/bin, otherwise it would overwrite the
host-icu one.

Therefore, I think we have no other choice than leaving the *-config
stuff into $(STAGING_DIR)/usr/bin and then finding some trick to get
them executed even if $(STAGING_DIR)/usr/bin is not in the PATH.

What do you think about this ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
