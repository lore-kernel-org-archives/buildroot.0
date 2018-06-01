From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 1 Jun 2018 12:14:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/expect: download tarball
 instead of cvs
In-Reply-To: <20180601110915.39e20638@windsurf>
References: <20180531070520.24242-1-arnout@mind.be>
 <20180531070520.24242-2-arnout@mind.be> <20180601110915.39e20638@windsurf>
Message-ID: <3344e256-f19a-457d-d4e7-9daf6d82a714@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/06/2018 ? 11:09, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Thu, 31 May 2018 09:05:20 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> diff --git a/package/expect/expect.hash b/package/expect/expect.hash
>> new file mode 100644
>> index 0000000000..c89f323906
>> --- /dev/null
>> +++ b/package/expect/expect.hash
>> @@ -0,0 +1,4 @@
>> +# From https://sourceforge.net/projects/expect/files/Expect/5.45.3/expect5.45.3.tar.gz.SHA256
>> +sha256  c520717b7195944a69ce1492ec82ca0ac3f3baf060804e6c5ee6d505ea512be9  expect5.45.3.tar.gz
>> +# Locally calculated
>> +sha256  b2415b17dc8d9a287f4509047ef5ac3436baef7ba7c50faef5222dcdf61a2bab  README
>> diff --git a/package/expect/expect.mk b/package/expect/expect.mk
>> index d78ff6c208..ccde33a71b 100644
>> --- a/package/expect/expect.mk
>> +++ b/package/expect/expect.mk
>> @@ -4,12 +4,13 @@
>>  #
>>  ################################################################################
>>  
>> -# Version 5.45.3
>> -EXPECT_VERSION = 2014-05-02
>> -EXPECT_SITE = cvs://expect.cvs.sourceforge.net:/cvsroot/expect
>> +EXPECT_VERSION = 5.45.3
>> +EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
>> +EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
>>  EXPECT_LICENSE = Public domain
>>  EXPECT_LICENSE_FILES = README
> 
> Romain's autobuiler is not happy with this:
> 
>   http://autobuild.buildroot.net/results/dd2/dd29953f28577674070717cbb5feba8e12aad8e3/build-end.log
> 
> it downloads some html file. But the same URL downloaded here provides
> the correct tarball.

$ sha256sum instance-?/dl/expect-*
2b1833202a2371812e9faf67eb0127871b9bd53720e52460552e165534fbde88
instance-1/dl/expect-2014-05-02.tar.gz
48c7a5d2a2081384fb42aaac5eedbec6b5511aa02398611b4d4f6754053990e9
instance-2/dl/expect-2014-05-02.tar.gz

$ ls -lt instance-?/dl/expect-2014-05-02.tar.gz
-rw-r--r--. 2 naourr naourr 635868 25 mai   01:12
instance-1/dl/expect-2014-05-02.tar.gz
-rw-r--r--. 1 naourr naourr 636242 25 avril 11:44
instance-2/dl/expect-2014-05-02.tar.gz

So, it seems Buildroot generated an archive named expect-2014-05-02.tar.gz after
downloading from cvs. Unfortunately, it's the same as the new upstream archive...

Note: tar --version
tar (GNU tar) 1.30

I'll remove the wrong (old) archive.

Best regards,
Romain

> 
> Thomas
> 
