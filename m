From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Thu, 2 Jul 2015 11:58:01 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: always build apps
In-Reply-To: <20150701111411.1dab82cc@free-electrons.com>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <1434711274-49716-2-git-send-email-benoit@wsystem.com>
 <20150701111411.1dab82cc@free-electrons.com>
Message-ID: <55950B29.9090200@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 1 Jul 2015 11:14, Thomas Petazzoni wrote:
> On Fri, 19 Jun 2015 12:54:34 +0200, Beno?t Th?baudeau wrote:
>> Now that building the openssl binary without MMU is supported, the only
>> reason left for not building apps if the openssl binary is disabled is
>> to save build time. Moreover, the commit
>> 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable apps for
>> NOMMU", which added this behavior, had a side effect: the scripts from
>> apps (CA.pl, CA.sh and tsget) and the default configuration file
>> (openssl.cnf) were no longer installed, which is not advertized by the
>> BR2_PACKAGE_OPENSSL_BIN option. CA.pl and CA.sh use the openssl binary,
>> so not installing them without the latter would make sense. But tsget
> 
> But that's exactly what you're doing here: CA.pl and CA.sh are now
> installed, even if the openssl binary is not. Also, all the c_*
> programs in /etc/ssl/misc/ are installed, they call the openssl tool,
> but the openssl tool is not installed.
> 
> tsget and CA.pl are perl scripts, so they cannot work if you don't have
> a perl interpreter on the target anyway.
> 
> So, maybe we need something like:
> 
> ifeq ($(BR2_PACKAGE_PERL),)
> define OPENSSL_REMOVE_PERL_SCRIPTS
> 	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
> endef
> OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_PERL_SCRIPTS
> endif
> 
> ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
> define OPENSSL_REMOVE_BIN
> 	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
> 	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{c_*,CA.pl,CA.sh}
> endef
> OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_BIN
> endif
> 
> No?

Yes. My intent was to keep the rules minimal, but I agree that it is better as
you suggest. I will send a v2.

I have a question about the management of the scripts depending on Perl, though.
Doing as you suggest hides this behavior in the .mk, so the users won't know
that they have a choice just by looking at the configuration. Do you think that
it does not really matter, or that a comment or a depends on / select should be
added to the Config.in?

Best regards,
Beno?t
