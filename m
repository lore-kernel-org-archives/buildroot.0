From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 08:24:49 +0100
Subject: [Buildroot] [PATCH 3/7] eigen: fix install rules
In-Reply-To: <20131111233358.58088a11@skate>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
 <1384203613-17871-4-git-send-email-s.martin49@gmail.com>
 <20131111233358.58088a11@skate>
Message-ID: <5281D7C1.8080900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/13 23:33, Thomas Petazzoni wrote:
> Dear Samuel Martin,
>
> On Mon, 11 Nov 2013 22:00:09 +0100, Samuel Martin wrote:
>
>> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
>> index 5abd464..63e21e9 100644
>> --- a/package/eigen/eigen.mk
>> +++ b/package/eigen/eigen.mk
>> @@ -16,8 +16,14 @@ EIGEN_INSTALL_TARGET = NO
>>   # This package only consists of headers that need to be
>>   # copied over to the sysroot for compile time use
>>   define EIGEN_INSTALL_STAGING_CMDS
>> -	$(RM) -r $(STAGING_DIR)/usr/include/Eigen
>> -	cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
>> +	for d in Eigen unsupported ; do \
>> +		$(RM) -r $(STAGING_DIR)/usr/include/$${d} ; \
>
> Isn't it a bit "rude" to remove
> $(STAGING_DIR)/usr/include/unsupported ? I mean, this directory name
> doesn't seem very Eigen specific. Even though it's unlikely, there
> might be other things installed in there.
>
>> +		rsync -ar --exclude=CMakeLists.txt \
>> +			--exclude=test \
>> +			--exclude=bench \
>> +			--exclude=doc \
>> +			$(@D)/$${d} $(STAGING_DIR)/usr/include/ ; \
>> +	done
>
> I must say I'm not overly enthusiastic about this solution. No way to
> have a proper make install, or cmake stuff working for this package?

  I had a quick look, and it looks like the cmake infra should work for 
this package. I guess Matt Weber originally didn't use it because nothing 
needs to be compiled anyway, and you don't want to compile the tests.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
