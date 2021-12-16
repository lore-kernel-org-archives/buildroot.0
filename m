Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DDCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 08:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7320D416E5;
	Thu, 16 Dec 2021 08:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AG0RDgCA-qO6; Thu, 16 Dec 2021 08:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02C4416E0;
	Thu, 16 Dec 2021 08:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB191BF2B4
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 08:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B393416E0
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 08:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ip-OLJ9AIyD for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 08:51:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3A69416DC
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 08:51:13 +0000 (UTC)
Received: from [192.168.178.25] (ipb21a9ae5.dynamic.kabel-deutschland.de
 [178.26.154.229])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id 7255D5241AA8;
 Thu, 16 Dec 2021 09:51:10 +0100 (CET)
To: Peter Seiderer <ps.report@gmx.net>,
 Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
References: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
 <20211215232839.22ae07a9@gmx.net>
From: Andreas Naumann <dev@andin.de>
Message-ID: <470a2867-7ecf-c0e8-5f60-27e8581d6377@andin.de>
Date: Thu, 16 Dec 2021 09:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215232839.22ae07a9@gmx.net>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Naumann Andreas <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 15.12.21 23:28, Peter Seiderer wrote:
> Hello Florent,
> 
> On Tue, 14 Dec 2021 08:51:33 +0100, Florent AUMAITRE <florent.aumaitre@medianesysteme.com> wrote:
> 
>> Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
>> ---
>>   package/pkg-qmake.mk           | 22 +++++++++++++++++++++-
>>   package/qt5/qt5.mk             |  4 +++-
>>   package/qt5/qt5base/qt5base.mk | 13 +++++++++++++
>>   3 files changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
>> index deb033c1d6..55b3594f32 100644
>> --- a/package/pkg-qmake.mk
>> +++ b/package/pkg-qmake.mk
>> @@ -20,6 +20,23 @@
>>   #
>>   ################################################################################
>>
>> +# When per-package is enabled, and qmake project is configured to generate
>> +# pkg-config compatible package, absolute path are generated for "prefix" field
>> +# of .pc files. In order to keep per-package isolation with sysroot'in, it is
>> +# needed to remove those absolute path. Same apply for mkspecs files.
>> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>> +define PKG_QMAKE_FIXUP_ABSOLUTE_PATH
>> +	$(Q)find $(STAGING_DIR)/ -name "*.pc" \
>> +	| xargs --no-run-if-empty \
>> +	$(SED) "s:$(STAGING_DIR)::g"
>> +
>> +	$(Q)find $(HOST_DIR)/ -name "*.pri" \
>> +		| xargs --no-run-if-empty \
>> +		$(SED) "s:$(STAGING_DIR):\$$\$$\[QT_SYSROOT\]:g"
>> +endef
>> +endif
>> +
>> +
>>   #
>>   # Hook to sync Qt headers
>>   #
>> @@ -89,6 +106,8 @@ define $(2)_INSTALL_STAGING_CMDS
>>   endef
>>   endif
>>
>> +$(2)_POST_INSTALL_STAGING_HOOKS += PKG_QMAKE_FIXUP_ABSOLUTE_PATH
>> +
>>   #
>>   # Target installation step. Only define it if not already defined by
>>   # the package .mk file.
>> @@ -103,9 +122,10 @@ endif
>>   # We subsequently rsync only the files from the temporary staging dir and that
>>   # way exclude files for the build host from target.
>>   #
>> +# Qt Package (declarative at least) does not install in parallel due to improper make rules
>>   ifndef $(2)_INSTALL_TARGET_CMDS
>>   define $(2)_INSTALL_TARGET_CMDS
>> -	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)
>> +	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE1) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)
> 
> Which failure? Does it happen with per-package enabled or without (would
> like to avoid the forced MAKE1 for all qt packages install) too? In case it
> happens with per-package disabled it should go to an extra patch...
> 
> One qt5declarative failure for parallel install was fixed by 'package/qt5/qt5declarative:
> fix parallel install' ([1]) some time back...
> 
> Regards,
> Peter
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=a96277a93d36a1828de87b011022ae389a549cbd

I have the same question, which exact failure?
 From my experience, since "qt5: Fix sporadic build failure during 
top-level parallel build" [2], I have not observed any build failures.

Not saying that the assembled .pc or .pri files in the resulting SDK all 
have correct pathes. But wouldnt this be a more general problem for all 
pkg-config packages not just qt?

[2] 
https://git.buildroot.net/buildroot/commit/?id=8132216e0ecb1cd115ec9d1a211b967e5bda3054

regards,
Andreas

> 
>>   	rsync -arv $$($(2)_BUILDDIR)tmp-target-install$$(STAGING_DIR)/ $$(TARGET_DIR)/
>>   endef
>>   endif
>> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
>> index 3ffb7b0063..eced7e2564 100644
>> --- a/package/qt5/qt5.mk
>> +++ b/package/qt5/qt5.mk
>> @@ -27,4 +27,6 @@ endef
>>   endif
>>
>>   # Variable for other Qt applications to use
>> -QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
>> +QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
>> +	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
>> +	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index ba2971dc08..3750d4547e 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -334,4 +334,17 @@ endef
>>
>>   QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
>>
>> +# CMake config files generated by Qt5 might break per-package isolation because
>> +# of absolute path generated.
>> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>> +define QT5BASE_CMAKECONFIG_FIXUP
>> +	$(Q)find $(STAGING_DIR)/ -name "*.cmake" \
>> +		| xargs --no-run-if-empty \
>> +		$(SED) "s:$(STAGING_DIR)::g"
>> +endef
>> +endif
>> +
>> +QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_CMAKECONFIG_FIXUP
>> +
>> +
>>   $(eval $(qmake-package))
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
