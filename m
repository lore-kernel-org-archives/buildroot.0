From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:40:01 +0200
Subject: [Buildroot] [PATCH 1/1] boost: add fiber module
In-Reply-To: <ef41afeb-7d33-5647-987e-1ce87fc3c5df@mind.be>
References: <20171023184824.14896-1-aduskett@gmail.com>
 <ef41afeb-7d33-5647-987e-1ce87fc3c5df@mind.be>
Message-ID: <c1e23a2c-816e-73db-18c4-6aac4514ad74@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 21:21, Arnout Vandecappelle wrote:
>  Sorry, I reviewed the wrong version of the patch...
> 
>  But the good thing is: there are no reverse dependencies on fiber so no need to
> propagate :-)
> 
> On 23-10-17 20:48, Adam Duskett wrote:
>> requires NPTL which was causing the following build errors:
>> http://autobuild.buildroot.net/results/029/0298038fc126d15733d81c54e0bb7cb00be48b92/build-end.log
>> http://autobuild.buildroot.net/results/6f3/6f3a218c47204e431100799482a3ed0ec159fa15/build-end.log
>> http://autobuild.buildroot.net/results/63e/63e5569a90d3ace97cb6102509cbd04aeab6f5f7/build-end.log
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>> ---
>>  package/boost/Config.in | 6 ++++++
>>  package/boost/boost.mk  | 1 +
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/package/boost/Config.in b/package/boost/Config.in
>> index 3b3c89b8c1..fab31a2e8f 100644
>> --- a/package/boost/Config.in
>> +++ b/package/boost/Config.in
>> @@ -79,6 +79,12 @@ config BR2_PACKAGE_BOOST_DATE_TIME
>>  config BR2_PACKAGE_BOOST_EXCEPTION
>>  	bool "boost-exception"
>>  
>> +config BR2_PACKAGE_BOOST_FIBER
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>> +	bool "boost-fiber"
>> +
>> +comment "boost-fiber needs a toolchain w/ NPTL"
>> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>  config BR2_PACKAGE_BOOST_FILESYSTEM
> 
>  There should be an empty line between the comment and the next config.
> 
>  But I'll fix that and apply (just doing a test build now).

 Right, the test build failed because I was doing it in static - cfr.

http://autobuild.buildroot.net/results/692/692ffad93a7bd867ecc7ccbfc8c6280735d29435/build-end.log

Could you take a look at that as well? I guess there's a new stacktrace module
that depends on !STATIC.

 Note that there is also a new PolyCollection module, don't know if it's
header-only or not.

 You can look at http://www.boost.org/doc/libs/1_65_1/ and search for "1.65" to
find out the new modules.

 Regards,
 Arnout

> 
>  Regards,
>  Arnout
> 
>>  	bool "boost-filesystem"
>>  
>> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
>> index 598ffbe10e..0fd6c4d0de 100644
>> --- a/package/boost/boost.mk
>> +++ b/package/boost/boost.mk
>> @@ -26,6 +26,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
>>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
>>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
>>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
>> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber)
>>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
>>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
>>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
