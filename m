From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 15 Sep 2015 14:34:24 -0500
Subject: [Buildroot] [PATCH 2/2] openssl: enable parallel build and
	installation
In-Reply-To: <55F84C5B.2080004@mind.be>
References: <1442289591-30376-1-git-send-email-ryanbarnett3@gmail.com>
 <1442289591-30376-3-git-send-email-ryanbarnett3@gmail.com>
 <55F84C5B.2080004@mind.be>
Message-ID: <CALq67GCTRkExTKSYDy-7eV=k0==L5m2SY53Puo6BJqHSo50csw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Sep 15, 2015 at 11:50 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 15-09-15 05:59, Ryan Barnett wrote:
>
>> diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>> index 93e2118..f54f2fa 100644
>> --- a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>> +++ b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>> @@ -1,19 +1,20 @@
>> -From 53980448064b362a58e4ab2aca6f38fec93c07c3 Mon Sep 17 00:00:00 2001
>> +From 12de3d3aa9525c551ebbd7fcff9d9d2b08e58aad Mon Sep 17 00:00:00 2001
>>  From: Mike Frysinger <vapier@gentoo.org>
>>  Date: Sat, 16 May 2015 18:53:51 +0200
>> -Subject: [PATCH 1/3] Dont waste time building manpages if we're not going to
>> +Subject: [PATCH 1/2] Dont waste time building manpages if we're not going to
>>   use em.
>>
>>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> +Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
>
>  You should probably have added your Sob in the first patch already. This is
> just useless churn.

Agreed. Will respin with this fixed.

>> diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
>> index 355be79..7e67737 100644
>> --- a/package/openssl/openssl.hash
>> +++ b/package/openssl/openssl.hash
>> @@ -1,2 +1,4 @@
>>  # From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
>>  sha256       671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8        openssl-1.0.2d.tar.gz
>> +# Locally computed
>> +sha256       deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f        openssl-1.0.2d-parallel-build.patch?revision=1.1
>> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
>> index 3d87919..c7459dd 100644
>> --- a/package/openssl/openssl.mk
>> +++ b/package/openssl/openssl.mk
>> @@ -13,6 +13,8 @@ OPENSSL_DEPENDENCIES = zlib
>>  HOST_OPENSSL_DEPENDENCIES = host-zlib
>>  OPENSSL_TARGET_ARCH = generic32
>>  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
>> +OPENSSL_PATCH = \
>> +     https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?revision=1.1
>>
>
>  Is there a non-https URL available by any chance?

I will be updating to utilize the latest patch available from Gentoo's
git repo as pointed out by Mike Frysinger. It doesn't appear that
gentoo's website is accessible from a non-https connection. The
updated path will be:

https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d

For more information on non-https site, I tired http:// request of the
url and am redirected to https:// address:

~$ wget http://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch
Proxy request sent, awaiting response... 301 Moved Permanently
Location: https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch
[following]
--2015-09-15 14:26:15--
https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch
Proxy request sent, awaiting response... 200 OK
Length: 9504 (9.3K) [text/x-diff]
Saving to: ?openssl-1.0.2d-parallel-build.patch?

100%[===================================================================================================================================================================>]
9,504       --.-K/s   in 0s

2015-09-15 14:26:16 (65.6 MB/s) -
?openssl-1.0.2d-parallel-build.patch? saved [9504/9504]

I will respin with your suggestions later tonight.

Thanks,
-Ryan
