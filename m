From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 09:42:49 +0100
Subject: [Buildroot] [PATCH next v2 1/2] package/apr-util: fix build
 with per-package folders
In-Reply-To: <20181120200944.GF2601@scaer>
References: <20181120163853.5040-1-thomas.petazzoni@bootlin.com>
 <20181120163853.5040-2-thomas.petazzoni@bootlin.com>
 <20181120200944.GF2601@scaer>
Message-ID: <20181121094249.065020c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 21:09:44 +0100, Yann E. MORIN wrote:

> > +define APR_UTIL_FIX_RULES_MK_LIBTOOL
> > +	$(SED) 's,$(PER_PACKAGE_DIR)/apr/,$(PER_PACKAGE_DIR)/apr-util/,g' $(@D)/build/rules.mk
> > +	$(SED) 's,$(PER_PACKAGE_DIR)/apr/,$(PER_PACKAGE_DIR)/apr-util/,g' \  
> 
> I know we do not have a strong policy on this, but can you use '@' as
> the separator, instead of the comma ',' as we are sure that the build
> directory will not contain any '@':
>     https://git.buildroot.org/buildroot/commit/Makefile?id=7007dc2bc99ad191c418c468707cdc3980273cda

ACK.

> > +		$(STAGING_DIR)/usr/build-1/libtool  
> 
> So, you're patching a file in STAGING_DIR in a post-configure hook?

Yes. With per-package folder, we are preparing the target and host
(including staging) folders with the package dependencies during the
configure step. It is what we copy that contains references to other
per-package folders that should be fixed up before the build. Hence,
this needs to be done during the configure step.

> Also, PER_PACKAGE_DIR does yet exist in master (or next, for that
> matters), so this patch will have to leave in your branch for a little
> while still, I'm afraid.. :-/

Perhaps I should include this logic inside a BR2_PER_PACKAGE_FOLDERS
condition.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
