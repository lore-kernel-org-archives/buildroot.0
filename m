From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 21:21:17 +0100
Subject: [Buildroot] [PATCH] package: add knxweb
In-Reply-To: <5098C815.8080901@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351599843-24291-4-git-send-email-gregory.hermant@calao-systems.com>
 <20121030135544.6f6d0e40@skate> <5098C815.8080901@calao-systems.com>
Message-ID: <50A2ABBD.4030302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/12 09:19, Gr?gory Hermant wrote:
> Hi thomas,
>
> Le 30/10/2012 13:55, Thomas Petazzoni a ?crit :
>> Dear Gregory Hermant,
>>
>> On Tue, 30 Oct 2012 13:24:03 +0100, Gregory Hermant wrote:
>>> diff --git a/package/knxweb/knxweb.mk b/package/knxweb/knxweb.mk
>>> new file mode 100644
>>> index 0000000..5ca1760
>>> --- /dev/null
>>> +++ b/package/knxweb/knxweb.mk
>>> @@ -0,0 +1,20 @@
>>> +#############################################################
>>> +#
>>> +# knxweb
>>> +#
>>> +#############################################################
>>> +
>>> +KNXWEB_VERSION = 0.6.1
>>> +KNXWEB_SOURCE = knxweb-$(KNXWEB_VERSION).tar.gz
>>> +KNXWEB_SITE = http://sourceforge.net/projects/linknx/files/knxweb/knxweb-0.6.1/

  This URL doesn't work - it should be
http://downloads.sourceforge.net/project/linknx/knxweb/knxweb-0.6

  For this case, you better refactor
KNXWEB_VERSION_MAJOR = 0.6
KNXWEB_VERSION = $(KNXWEB_VERSION_MAJOR).1
KNXWEB_SITE = http://downloads.sourceforge.net/project/linknx/knxweb/knxweb-$(KNXWEB_VERSION_MAJOR)

  Note that you can remove KNXWEB_SOURCE, it is the default.

>>
>> The tarball has no license information, this is quite annoying.
>
> How can we manage this kind of package in buildroot ?

  There's no solution, it's just annoying. Or actually, it's more than annoying:
since no explicit permission is given to copy the code, any use beyond simply
downloading it is illegal... So I guess you should put:

KNXWEB_LICENSE = none (no permission is given)

>>
>>> +define KNXWEB_INSTALL_TARGET_CMDS
>>> +	mkdir -p $(TARGET_DIR)/var/www
>>> +	cp -rdpf $(@D)/* $(TARGET_DIR)/var/www
>>> +endef
>>> +
>>> +define KNXWEB__UNINSTALL_TARGET_CMDS
>>> +	rm -rf $(TARGET_DIR)/var/www/
>>> +endef
>>
>> Double _ here, so this doesn't work.
>>
>> However, how does this web interface works? I see a few PHP scripts,
>> but they don't seem to be essential for the operation of the Web
>> interface. There's a lot of JS though. Does it communicate with the
>> server somehow?
>>
> knxweb needs a web server with PHP support.
>
>> I'm surprised that no interpreter like PHP, Lua or Python is needed
>> here for the server side, that's why I'm asking.

  At the moment we can't select or depend on a web server. Selecting PHP is
possible, however, so I think you should add that to Config.in (not to the
.mk file because there is no build-time dependency)


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
