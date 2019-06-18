From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jun 2019 11:31:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/taglib: add upstream patch to
 fix taglib-config
In-Reply-To: <15e6479684371e8406659c0f54c8bbc1eb5dc428.camel@embedded.rocks>
References: <20190610212023.9483-1-joerg.krause@embedded.rocks>
 <20190610212023.9483-2-joerg.krause@embedded.rocks>
 <3a548d14-a85d-76c7-18c0-1037ac1ad5a9@mind.be>
 <15e6479684371e8406659c0f54c8bbc1eb5dc428.camel@embedded.rocks>
Message-ID: <effb44bc-af64-a179-5757-7d933015ed0f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/06/2019 15:24, J?rg Krause wrote:
> Hi Arnout,
> 
> thanks for your review!
> 
> On Tue, 2019-06-11 at 00:25 +0200, Arnout Vandecappelle wrote:
>>
>> On 10/06/2019 23:20, J?rg Krause wrote:
>>> +-prefix=${CMAKE_INSTALL_PREFIX}
>>> +-exec_prefix=${CMAKE_INSTALL_PREFIX}
>>> +-libdir=${LIB_INSTALL_DIR}
>>> +-includedir=${INCLUDE_INSTALL_DIR}
>>> ++prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
>>> ++exec_prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
>>
>>  I believe it is wrong to include CMAKE_SYSROOT here. In general, this is not
>> necessarily the place where the package will be installed. We happen to do that
>> now, but for example both OpenWrt and OpenEmbedded install with a different
>> DESTDIR, and dependent packages see a different sysroot.
> 
> I see! The upstream patch was sent by me, so I will find a better
> solution.
> 
>>  We have the TAGLIB_CONFIG_SCRIPT infra to handle this situation. It will add
>> the appropriate sysroot to the _prefix variables.
> 
> I've checked and used TAGLIB_CONFIG_SCRIPTS instead of applying the
> patch. The current sed commands to fix the package configuration file
> does not work for taglib-config:
> 
> ```
> # ./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/taglib-config --libs
> -L/usr/lib -ltag
> ```
> 
> To get taglib-config work with our CONFIG_SCRIPTS, it needs to be fixed
> the way the patch does, just without using CMAKE_SYSROOT.

 Yes, that was actually what I intended to say. Sorry for not being clearer.

 Regards,
 Arnout
