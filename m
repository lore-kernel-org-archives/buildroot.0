From: Michael Rommel <rommel@layer-7.net>
Date: Wed, 4 Sep 2013 22:50:42 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <52276202.6010508@mind.be>
References: <1378165788-7386-1-git-send-email-rommel@layer-7.net>
 <52276202.6010508@mind.be>
Message-ID: <028035D9-F009-4D2C-B63E-6D6BFD08D5B7@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sep 4, 2013, at 18:38 , Arnout Vandecappelle <arnout@mind.be> wrote:

> On 09/03/13 01:49, Michael Rommel wrote:
>> Automatic IPv6 Connectivity Configuration Utility for users of a
>> IPv6 tunnel broker, developed by sixxs.net
>> 
>> Signed-off-by: Michael Rommel <rommel@layer-7.net>
>> ---
>>  package/Config.in                                  |    1 +
>>  package/aiccu/Config.in                            |   21 ++++
>>  .../aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch |  104 ++++++++++++++++++++
>>  .../aiccu-0002-install-correct-init-script.patch   |   17 ++++
>>  package/aiccu/aiccu.mk                             |   26 +++++
>>  5 files changed, 169 insertions(+)
>>  create mode 100644 package/aiccu/Config.in
>>  create mode 100644 package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch
> 
> Did you upstream this patch?

yes, I have submitted the patch and the info about submission for inclusion into buildroot
upstream to info at sixxs.net but have not received an answer (yet).



>>   create mode 100644 package/aiccu/aiccu-0002-install-correct-init-script.patch
> [snip]
>> diff --git a/package/aiccu/aiccu-0002-install-correct-init-script.patch b/package/aiccu/aiccu-0002-install-correct-init-script.patch
>> new file mode 100644
>> index 0000000..15e9268
>> --- /dev/null
>> +++ b/package/aiccu/aiccu-0002-install-correct-init-script.patch
>> @@ -0,0 +1,17 @@
>> +Makefile: remove hardcoded .debian part from install command, debian
>> +	  version does not work under buildroot
>> +
>> +Signed-off-by: Michael Rommel <rommel@layer-7.net>
>> +
>> +diff -purN aiccu_20070115.orig/Makefile aiccu_20070115/Makefile
>> +--- aiccu_20070115.orig/Makefile	2007-01-11 01:29:33.000000000 +0100
>> ++++ aiccu_20070115/Makefile	2013-09-03 00:47:06.153662575 +0200
>> +@@ -86,7 +86,7 @@ ifeq ($(shell echo "A${RPM_BUILD_ROOT}")
>> + 	@cp doc/HOWTO  ${DESTDIR}${dirdoc}
>> + 	@echo "Installing Debian-style init.d"
>> + 	@mkdir -p ${DESTDIR}${diretc}init.d
>> +-	@cp doc/${PROJECT}.init.debian ${DESTDIR}${diretc}init.d/${PROJECT}
>> ++	@cp doc/${PROJECT}.init ${DESTDIR}${diretc}init.d/${PROJECT}
> 
> The init script should be called Sxxaiccu (replace xx by an appropriate number). And you can do the required chmod here as well. Or better yet, use 'install -D -m 0755' (which removes the need for mkdir as well).
> 
> However, I propose to instead install it manually from the .mk file (using the _INSTALL_INIT_SYSV variable) and to remove the incorrect init script in a post-install hook. Maybe there's even a target to install just the interesting bits and skip the howto and init scripts?
> 

Regarding the installation there are three versions on the table:

1. Using the recommended default way:

+define AICCU_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef

This needs then the Makefile patch and I certainly can patch more buildroot related things into it,
 like renaming and permissions.

2. Using only the sub-level Makefile unix-console, which has a target "install", that 
only installs the aiccu binary. That would be clean and easy but we would be missing 
the template for the configuration (which I always find helpful)

3. Skipping the patch for the Makefile altogether and using a better version of my first 
attempt:

define AICCU_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu $(TARGET_DIR)/usr/sbin
	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf $(TARGET_DIR)/etc
endef

define AICCU_INSTALL_INIT_SYSV
	[ -f $(TARGET_DIR)/etc/init.d/S60aiccu ] || \
		$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
		$(TARGET_DIR)/etc/init.d/S60aiccu
endef


Is there a recommendation about the Snn numbering of the init.d scripts? I have not found it in the manual.
It should run after all internet connectivity has been established and the time has been synchronized.

>> +
>> +AICCU_VERSION = 20070115
> 
> Ouch, that's old...

Yes... but it works without any problems for me since I got my first tunnel in 2005.

>> +
>> +define AICCU_PERMISSIONS
>> +	/etc/init.d/aiccu  f  4755  0  0  -  -  -  -  -
> 
> Does it really have to be setuid? That is very weird for an init script.

I got the permission setting wrong, it should be only 755, the 4 was a cut&paste error from the Buildroot Documentation, I will correct that, my mistake!

Thanks for your patience with me!

  Michael.

-- 
Michael Rommel, Erlangen, Germany

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130904/a067637d/attachment.html>
