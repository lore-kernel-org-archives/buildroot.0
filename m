From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 10:39:00 +0100
Subject: [Buildroot] [PATCH v4 1/2] rhash: new package
In-Reply-To: <20170509093204.lkmflcffn7nrbvq3@sapphire.tkos.co.il>
References: <20170509092817.61068-1-Vincent.Riera@imgtec.com>
 <20170509093204.lkmflcffn7nrbvq3@sapphire.tkos.co.il>
Message-ID: <73eae06b-1366-527c-7034-05da7d9e7631@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 09/05/17 10:32, Baruch Siach wrote:
> Hi Vicente,
> 
> On Tue, May 09, 2017 at 10:28:16AM +0100, Vicente Olivert Riera wrote:
>> +ifeq ($(BR2_PACKAGE_RHASH_BIN),y)
>> +# We also install the rhash console utility to the staging directory
>> +# since we want it to be a superset of the target directory.
> 
> And why is that?

http://lists.busybox.net/pipermail/buildroot/2017-April/189827.html

"And of course it doesn't matter if you install the program in staging
as well - in fact I prefer it, ideally staging is a superset of target."

Personally, since we are now doing the installation of the rhash console
utility manually via post-install-hooks, I wouldn't install it to
staging. But Arnout said that he prefer it to be installed to staging
because ideally is a superset of target. Nobody said the opposite so I
modified the patch following Arnout's advice.

Vincent

> 
>> +define RHASH_INSTALL_STAGING_RHASH_BIN
>> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>> +		DESTDIR="$(STAGING_DIR)" $(RHASH_MAKE_OPTS) install-shared
>> +endef
>> +RHASH_POST_INSTALL_STAGING_HOOKS += RHASH_INSTALL_STAGING_RHASH_BIN
>> +define RHASH_INSTALL_TARGET_RHASH_BIN
>> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>> +		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) install-shared
>> +endef
>> +RHASH_POST_INSTALL_TARGET_HOOKS += RHASH_INSTALL_TARGET_RHASH_BIN
>> +endif
> 
> baruch
> 
