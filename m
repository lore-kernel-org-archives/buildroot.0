From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 00:22:34 +0200
Subject: [Buildroot] [PATCH v3 1/1] easy-rsa: new package
In-Reply-To: <1496091819-27396-1-git-send-email-julien@vdg.name> (Julien Viard
 de Galbert's message of "Mon, 29 May 2017 23:03:39 +0200")
References: <1496091819-27396-1-git-send-email-julien@vdg.name>
Message-ID: <87d19h5ff9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Viard de Galbert <julien@vdg.name> writes:

 > Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
 > ---
 > Changes v1 -> v2
 >   - Install missing file 'openssl-1.0.cnf'
 >   - Add select BR2_PACKAGE_OPENSSL and update description (Thanks Romain Naour)
 >   - Updated INSTALL call (Thanks Romain Naour)

 > Changes v2 -> v3 after Thomas Petazzoni's review (Thanks!):
 >   - Moving package from Libraries->Crypto to Shell and utilities:Utilities
 >   - Indenting EASY_RSA_INSTALL_TARGET_CMDS with tabs (really don't know
 >     how I messed this up)
 >   - Update DEVELOPERS to track the easy-rsa package

 > Signed-off-by: Julien Viard de Galbert <julien@vdg.name>

 > +++ b/package/easy-rsa/Config.in
 > @@ -0,0 +1,14 @@
 > +config BR2_PACKAGE_EASY_RSA
 > +	bool "easy-rsa"
 > +	select BR2_PACKAGE_OPENSSL
 > +	select BR2_PACKAGE_OPENSSL_BIN

We normally add a # runtime comment to explain why this isn't added to
_DEPENDENCIES as well, so I've added that.

 > +EASY_RSA_VERSION = 3.0.1
 > +EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 > +EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/$(EASY_RSA_VERSION)

I have added license info as noted by Romain. I also added gpl-2.0.txt
(E.G. the full license text)

 > +define EASY_RSA_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin/easyrsa
 > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types
 > +	$(INSTALL) -D -m 0644 $(@D)/x509-types/* $(TARGET_DIR)/etc/easy-rsa/x509-types

install -D doesn't do the right thing with wildcards. install -t should
be used instead, so I reworked this line.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
