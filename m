From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 04 Mar 2014 07:54:52 +0800
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <20140303234654.GD14940@free.fr>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.918265.958087681541.2.gpush@pablo>
 <20140303234654.GD14940@free.fr>
Message-ID: <5315164C.7090302@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> On 2014-01-16 16:52 +0800, Jeremy Kerr spake thusly:
> [--SNIP--]
>> index 68c3b71a..4a7327b7 100644
>> --- a/package/dropbear/Config.in
>> +++ b/package/dropbear/Config.in
>> @@ -8,6 +8,18 @@ config BR2_PACKAGE_DROPBEAR
>>  
>>  if BR2_PACKAGE_DROPBEAR
>>  
>> +config BR2_PACKAGE_DROPBEAR_SERVER
>> +	bool "dropbear ssh server"
>> +	default y
>> +	help
>> +	  Enable the dropbear ssh server, run from init
>> +
>> +config BR2_PACKAGE_DROPBEAR_CLIENT
>> +	bool "dropbear ssh client"
>> +	default y
>> +	help
>> +	  Enable the dropbear ssh client, scp and utilities
> 
> What if none is selected?

Then neither the client nor server is installed; is that an issue?

We could just have a comment (when !_CLIENT && !_SERVER) to notify the
user that it's not a sensible configuration...

>> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
>> index 3ef6c8da..a1cc5691 100644
>> --- a/package/dropbear/dropbear.mk
>> +++ b/package/dropbear/dropbear.mk
>> @@ -7,7 +7,7 @@
>>  DROPBEAR_VERSION = 2013.62
>>  DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
>>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>> -DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
>> +DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert
>>  DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
>>  		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
> 		                   ^^^^^^^^
> Should we not disable dbclient if it is not selected?

We should. I'll sort this out in my next series.

Thanks for the review!


Jeremy
