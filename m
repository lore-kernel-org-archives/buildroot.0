From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:38:39 +0200
Subject: [Buildroot] [PATCH v2] package/xmlsec1: new package
In-Reply-To: <CACHoAdpicM=WcFLCgcPoose_qx8Kcig-_sD6fN8uMTJmWuLCtg@mail.gmail.com>
References: <20190210151207.18441-1-bastian.breit.buildroot@gmail.com>
 <CACHoAdpicM=WcFLCgcPoose_qx8Kcig-_sD6fN8uMTJmWuLCtg@mail.gmail.com>
Message-ID: <20190413223839.65cd4e0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bastian,

On Tue, 12 Feb 2019 17:13:08 +0100
Bastian Breit <bastian.breit.buildroot@gmail.com> wrote:

> I would summit options with later commits for the dependencies like
> gnutls which is currently deactivated for this package. Should that be
> mentioned in the help text? It should be clear by reading the current
> dependencies.

We don't typically document all possible dependencies of packages in
the help text, it would be annoying to maintain. Handling them in
the .mk file is enough.

> Does anyone prefer gnutls over openssl for non licencing
> reasons? I am not sure how to handle licence changing by selecting
> different dependencies (gnutls vs openssl)

Why would the license change ? The license of libxmlsec1 itself remains
MIT.

I guess that openssl/gnutls/libgcrypt is actually a choice, i.e one
would use one of the three, correct ?

If so, then you can do:

	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_LIBGCRYPT

in the Config.in file, and:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBXMLSEC1_DEPENDENCIES += openssl
LIBXMLSEC1_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
else ifeq ($(BR2_PACKAGE_GNUTLS),y)
...
else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
...
endif

You could also do the same to support libxslt as an optional
dependency. All of this can be done as part of the initial libxmlsec1
submission, or as follow-up patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
