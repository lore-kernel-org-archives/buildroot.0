From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 21 Aug 2014 18:42:45 +0800
Subject: [Buildroot] [PATCH v4] bandwidthd: Version bump to fix
 autobuilder errors
In-Reply-To: <20140821103421.GG2405@tarshish>
References: <1408616695-22000-1-git-send-email-nroach44@gmail.com>
 <20140821103421.GG2405@tarshish>
Message-ID: <53F5CD25.2030300@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/08/14 18:34, Baruch Siach wrote:
> Hi Nathaniel,
> 
> On Thu, Aug 21, 2014 at 06:24:55PM +0800, Nathaniel Roach wrote:
>> Thanks to Romain Naour, we've found that certain tests
>> in configure fail if their dependencies aren't tested for
>> beforehand.
>>  	depends on BR2_USE_MMU # fork()
>> +	select BR2_PACKAGE_ZLIB
> 
> Is bandwidthd using libz directly? If not, libpng already selects 
> BR2_PACKAGE_ZLIB so this may not actually be needed?

You are correct, it's only through libpng that zlib is used. I put it in
there as a safeguard because bandwidthd's configure script does test for
it's existence, as the libpng tests can fail without first testing for zlib.

The above issue should be covered by libpng anyway. I don't see any harm
in it being there, but if you think it should be removed I'll undo the
changes.

> 
>> -BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
>> +BANDWIDTHD_DEPENDENCIES = gd libpng libpcap zlib
> 
> Same here.
> 
> baruch
> 
>>  
>>  BANDWIDTHD_AUTORECONF = YES
>>  
>> -BANDWIDTHD_CONF_OPT += --without-x
>> -
>>  ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
>>  BANDWIDTHD_DEPENDENCIES += postgresql
>>  BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
> 


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140821/e613a9cf/attachment.asc>
